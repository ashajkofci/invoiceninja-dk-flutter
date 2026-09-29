import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:invoiceninja_flutter/data/web_client.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:invoiceninja_flutter/ui/marketing/marketing_screen.dart';

class MarketingSettingsScreen extends StatelessWidget {
  const MarketingSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) => StoreBuilder<AppState>(
        builder: (context, store) => _MarketingSettingsWorkspace(
          key: ValueKey(store.state.company.id),
          state: store.state,
        ),
      );
}

class _MarketingSettingsWorkspace extends StatefulWidget {
  const _MarketingSettingsWorkspace({super.key, required this.state});
  final AppState state;

  @override
  State<_MarketingSettingsWorkspace> createState() =>
      _MarketingSettingsWorkspaceState();
}

class _MarketingSettingsWorkspaceState
    extends State<_MarketingSettingsWorkspace> {
  static const sectionFields = <String, List<String>>{
    'quote': [
      'auto_create_quotes',
      'quote_stage_id',
      'quote_followup_mode',
      'auto_enroll_quotes',
      'offer_sequence_en',
      'offer_sequence_fr',
      'offer_sequence_de'
    ],
    'sending': [
      'automatic',
      'default_locale',
      'timezone',
      'send_hour_start',
      'send_hour_end',
      'weekdays_only',
      'daily_limit',
      'min_interval_hours',
      'require_consent',
      'footer'
    ],
  };
  static const sectionCollections = <String, List<String>>{
    'stages': ['stages'],
    'templates': ['templates'],
    'sequences': ['sequences'],
    'campaigns': ['campaigns', 'sources'],
  };
  Map<String, dynamic>? bootstrap;
  Map<String, dynamic>? config;
  String section = 'quote',
      locale = 'all',
      error = '',
      notice = '',
      language = '',
      addedId = '';
  int revision = 0, formGeneration = 0;
  bool busy = false, dirty = false;

  String text(String key) => bootstrap?['labels'][key]?.toString() ?? key;

  Future<dynamic> api(String method, String path, [dynamic data]) {
    final credentials = widget.state.credentials;
    final url = '${credentials.url}/marketing/$path';
    const client = WebClient();
    return method == 'GET'
        ? client.get(url, credentials.token)
        : client.put(url, credentials.token, data: jsonEncode(data));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final nextLanguage = Localizations.localeOf(context).languageCode;
    if (nextLanguage != language) {
      language = nextLanguage;
      _load();
    }
  }

  Future<void> _load() async {
    setState(() {
      busy = true;
      error = '';
    });
    try {
      final result = await api('GET', 'bootstrap?language=$language');
      if (!mounted) {
        return;
      }
      setState(() {
        bootstrap = Map<String, dynamic>.from(result['data']);
        config = Map<String, dynamic>.from(
            jsonDecode(jsonEncode(bootstrap!['config'])));
        revision = bootstrap!['revision'] as int;
        dirty = false;
        formGeneration++;
        busy = false;
      });
    } catch (e) {
      if (mounted)
        setState(() {
          error = e.toString();
          busy = false;
        });
    }
  }

  void change(Map<String, dynamic> updated) => setState(() {
        config = updated;
        dirty = true;
        notice = '';
      });

  void discard() {
    if (bootstrap == null) {
      return;
    }
    setState(() {
      config = Map<String, dynamic>.from(
          jsonDecode(jsonEncode(bootstrap!['config'])));
      revision = bootstrap!['revision'] as int;
      dirty = false;
      formGeneration++;
      error = '';
    });
  }

  Future<void> save() async {
    if (!dirty || config == null) {
      return;
    }
    setState(() {
      busy = true;
      error = '';
    });
    try {
      final result = await api(
          'PUT', 'settings', {'revision': revision, 'config': config});
      if (!mounted) {
        return;
      }
      setState(() {
        revision = result['data']['revision'] as int;
        dirty = false;
        busy = false;
        notice = text('settings_saved');
      });
      await _load();
    } catch (e) {
      if (mounted)
        setState(() {
          error = e.toString();
          busy = false;
        });
    }
  }

  Map<String, dynamic> newRecord(String name, List<dynamic> fields) {
    final defaults = <String, dynamic>{
      'id': 'custom_${DateTime.now().microsecondsSinceEpoch}',
      'name': '',
    };
    if (name == 'stages')
      defaults.addAll({'outcome': 'open', 'probability': 0});
    if (name == 'templates')
      defaults.addAll({
        'locale': locale == 'all' ? config!['default_locale'] : locale,
        'purpose': 'marketing',
      });
    if (name == 'campaigns')
      defaults['currency_id'] =
          (bootstrap!['options']['currencies'] as List).first['id'];
    if (name == 'sequences')
      defaults['steps'] = [
        {'title': '', 'days': 0, 'kind': 'task', 'template_id': ''}
      ];
    return marketingInitial(fields, defaults);
  }

  Widget collection(String name) {
    final fields = bootstrap!['fields']['collections'][name] as List<dynamic>;
    final records = config![name] as List<dynamic>;
    final visible = <int>[
      for (int index = 0; index < records.length; index++)
        if (name != 'templates' ||
            locale == 'all' ||
            records[index]['locale'] == locale)
          index,
    ];
    return Card.outlined(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 12,
              runSpacing: 8,
              children: [
                Text('${text(name)} (${records.length})',
                    style: Theme.of(context).textTheme.titleMedium),
                FilledButton.tonalIcon(
                  onPressed: busy
                      ? null
                      : () {
                          final record = newRecord(name, fields);
                          addedId = record['id'];
                          change({
                            ...config!,
                            name: [...records, record]
                          });
                        },
                  icon: const Icon(Icons.add),
                  label: Text('${text('add')} ${text(name)}'),
                ),
              ]),
          if (name == 'templates') ...[
            const SizedBox(height: 12),
            Text(text('tokens'), style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 8),
            Wrap(
                spacing: 8,
                children: ['all', 'en', 'fr', 'de']
                    .map((value) => ChoiceChip(
                        label: Text(text(value)),
                        selected: locale == value,
                        onSelected: (_) => setState(() => locale = value)))
                    .toList()),
          ],
          const SizedBox(height: 12),
          for (final index in visible)
            Card.filled(
              child: ExpansionTile(
                key: ValueKey('${records[index]['id']}-$index'),
                initiallyExpanded: records[index]['id'] == addedId,
                title: Text(
                    (records[index]['name'] as String?)?.isNotEmpty == true
                        ? records[index]['name']
                        : text('new')),
                subtitle: name == 'templates'
                    ? Text((records[index]['locale'] ?? '')
                        .toString()
                        .toUpperCase())
                    : null,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MarketingFields(
                            key: ValueKey(
                                'form-$formGeneration-${records[index]['id']}'),
                            fields: fields
                                .where((field) => field['name'] != 'id')
                                .toList(),
                            values: Map<String, dynamic>.from(records[index]),
                            bootstrap: bootstrap!,
                            config: config!,
                            onChanged: (updated) {
                              final next = [...records];
                              next[index] = updated;
                              change({...config!, name: next});
                            },
                          ),
                          TextButton.icon(
                            onPressed: busy
                                ? null
                                : () {
                                    final next = [...records]..removeAt(index);
                                    change({...config!, name: next});
                                  },
                            icon: const Icon(Icons.delete_outline),
                            label: Text(text('remove')),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final sections = [...sectionFields.keys, ...sectionCollections.keys];
    final ready = bootstrap != null && config != null;
    return Scaffold(
      appBar: AppBar(title: Text(marketingTitle(context)), actions: [
        IconButton(
            tooltip: text('refresh'),
            onPressed: busy || dirty ? null : _load,
            icon: const Icon(Icons.refresh)),
      ]),
      body: !ready
          ? Center(
              child: busy ? const CircularProgressIndicator() : Text(error))
          : bootstrap!['permissions']['configure'] != true
              ? const Center(child: Text('403'))
              : ListView(padding: const EdgeInsets.all(16), children: [
                  Text(text('marketing_settings_intro'),
                      style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 16),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: sections
                              .map((value) => Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: ChoiceChip(
                                        label: Text(text('settings_$value')),
                                        selected: section == value,
                                        onSelected: (_) =>
                                            setState(() => section = value)),
                                  ))
                              .toList())),
                  const SizedBox(height: 16),
                  Text(text('settings_${section}_help'),
                      style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(height: 12),
                  if (sectionFields.containsKey(section))
                    Card.outlined(
                        child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: MarketingFields(
                              key: ValueKey('form-$formGeneration-$section'),
                              fields: (bootstrap!['fields']['settings']
                                      as List<dynamic>)
                                  .where((field) => sectionFields[section]!
                                      .contains(field['name']))
                                  .toList(),
                              values: config!,
                              bootstrap: bootstrap!,
                              config: config!,
                              onChanged: change,
                            ))),
                  if (sectionCollections.containsKey(section))
                    for (final name in sectionCollections[section]!)
                      collection(name),
                  if (error.isNotEmpty)
                    Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Text(error,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.error))),
                  if (notice.isNotEmpty)
                    Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Text(notice,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary))),
                  const SizedBox(height: 24),
                ]),
      bottomNavigationBar:
          ready && bootstrap!['permissions']['configure'] == true
              ? SafeArea(
                  child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(children: [
                    FilledButton.icon(
                        onPressed: busy || !dirty ? null : save,
                        icon: const Icon(Icons.save_outlined),
                        label: Text(text('save'))),
                    const SizedBox(width: 12),
                    TextButton(
                        onPressed: busy || !dirty ? null : discard,
                        child: Text(text('cancel'))),
                    if (dirty)
                      Flexible(
                          child: Text(text('unsaved_changes'),
                              overflow: TextOverflow.ellipsis)),
                  ]),
                ))
              : null,
    );
  }
}
