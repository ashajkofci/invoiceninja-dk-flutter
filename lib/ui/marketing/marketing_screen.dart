import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:invoiceninja_flutter/constants.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/data/web_client.dart';
import 'package:invoiceninja_flutter/redux/app/app_actions.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:invoiceninja_flutter/redux/client/client_actions.dart';
import 'package:invoiceninja_flutter/redux/quote/quote_actions.dart';
import 'package:invoiceninja_flutter/redux/settings/settings_actions.dart';
import 'package:invoiceninja_flutter/ui/marketing/marketing_widgets.dart';

String marketingTitle(BuildContext context) =>
    {
      'en': 'Marketing & Sales',
      'fr': 'Marketing et ventes',
      'de': 'Marketing & Vertrieb',
    }[Localizations.localeOf(context).languageCode] ??
    'Marketing & Sales';

Map<String, dynamic> marketingInitial(
  List<dynamic> fields, [
  Map<String, dynamic> defaults = const {},
]) =>
    {
      for (final field in fields)
        field['name'] as String: defaults[field['name']] ??
            (field['type'] == 'boolean'
                ? false
                : field['type'] == 'number'
                    ? 0
                    : field['type'] == 'list'
                        ? <dynamic>[]
                        : ''),
    };
Map<String, dynamic> marketingUpdate(
  Map<String, dynamic> values,
  String name,
  dynamic value,
) =>
    {
      ...values,
      name: value,
      if (name == 'client_id') ...{
        'contact_id': '',
        'quote_id': '',
        'consent': false,
        'consent_source': '',
      },
      if (name == 'contact_id') ...{'consent': false, 'consent_source': ''},
      if (name == 'kind' && value != 'email') 'template_id': '',
    };

String marketingQuoteLabel(
  Map<String, dynamic> quote,
  Map<String, dynamic> bootstrap,
) {
  final clients = {
    for (final client in bootstrap['options']['clients'] as List<dynamic>)
      client['id']: client['name'],
  };
  final client = clients[quote['client_id']]?.toString() ?? '';
  return client.isEmpty
      ? quote['name'].toString()
      : '${quote['name']} · $client';
}

List<Map<String, dynamic>> marketingQuoteOptions(
  Map<String, dynamic> bootstrap, {
  String search = '',
  String clientId = '',
}) {
  final query = search.trim().toLowerCase();
  final quotes = (bootstrap['options']['quotes'] as List<dynamic>)
      .map((quote) => Map<String, dynamic>.from(quote))
      .toList()
      .reversed;
  return quotes
      .where(
        (quote) =>
            (clientId.isEmpty || quote['client_id'] == clientId) &&
            (query.isEmpty ||
                marketingQuoteLabel(quote, bootstrap)
                    .toLowerCase()
                    .contains(query)),
      )
      .toList();
}

class MarketingQuotePicker extends StatefulWidget {
  const MarketingQuotePicker({
    super.key,
    required this.bootstrap,
    required this.selectedId,
    required this.label,
    required this.emptyLabel,
    required this.onChanged,
    this.clientId = '',
    this.enabled = true,
  });

  final Map<String, dynamic> bootstrap;
  final String selectedId;
  final String clientId;
  final String label;
  final String emptyLabel;
  final bool enabled;
  final ValueChanged<String> onChanged;

  @override
  State<MarketingQuotePicker> createState() => _MarketingQuotePickerState();
}

class _MarketingQuotePickerState extends State<MarketingQuotePicker> {
  final SearchController _controller = SearchController();
  String _selectedId = '';

  Map<String, dynamic>? get _selectedQuote {
    for (final quote in marketingQuoteOptions(
      widget.bootstrap,
      clientId: widget.clientId,
    )) {
      if (quote['id'].toString() == _selectedId) {
        return quote;
      }
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    _syncSelection();
  }

  @override
  void didUpdateWidget(covariant MarketingQuotePicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedId != _selectedId ||
        widget.bootstrap != oldWidget.bootstrap ||
        widget.clientId != oldWidget.clientId) {
      _syncSelection();
    }
  }

  void _syncSelection() {
    _selectedId = widget.selectedId;
    final selected = _selectedQuote;
    _controller.text =
        selected == null ? '' : marketingQuoteLabel(selected, widget.bootstrap);
  }

  void _clear() {
    _selectedId = '';
    _controller.clear();
    widget.onChanged('');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SearchAnchor.bar(
        searchController: _controller,
        enabled: widget.enabled,
        barHintText: widget.label,
        viewHintText: widget.label,
        barLeading: const Icon(Icons.request_quote_outlined),
        barTrailing: [
          IconButton(
            tooltip: MaterialLocalizations.of(context).cancelButtonLabel,
            onPressed: widget.enabled ? _clear : null,
            icon: const Icon(Icons.clear),
          ),
        ],
        barElevation: const WidgetStatePropertyAll(0),
        barBackgroundColor: WidgetStatePropertyAll(
          Theme.of(context).colorScheme.surface,
        ),
        barSide: WidgetStatePropertyAll(
          BorderSide(color: Theme.of(context).colorScheme.outline),
        ),
        barShape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        onChanged: (value) {
          final selected = _selectedQuote;
          if (selected != null &&
              value != marketingQuoteLabel(selected, widget.bootstrap)) {
            _selectedId = '';
            widget.onChanged('');
          }
        },
        suggestionsBuilder: (context, controller) {
          final quotes = marketingQuoteOptions(
            widget.bootstrap,
            search: controller.text,
            clientId: widget.clientId,
          );
          if (quotes.isEmpty) {
            return [
              ListTile(
                enabled: false,
                leading: const Icon(Icons.search_off_outlined),
                title: Text(widget.emptyLabel),
              ),
            ];
          }
          return quotes.map((quote) {
            final name = quote['name'].toString();
            final label = marketingQuoteLabel(quote, widget.bootstrap);
            final client =
                label == name ? '' : label.substring(name.length + 3);
            return ListTile(
              leading: const Icon(Icons.request_quote_outlined),
              title: Text(name),
              subtitle: client.isEmpty ? null : Text(client),
              selected: quote['id'].toString() == _selectedId,
              onTap: () {
                final id = quote['id'].toString();
                _selectedId = id;
                controller.closeView(label);
                widget.onChanged(id);
              },
            );
          });
        },
      );
}

String marketingQuoteActionTitle(BuildContext context) =>
    {
      'en': 'Track opportunity',
      'fr': 'Suivre l’opportunité',
      'de': 'Verkaufschance verfolgen',
    }[Localizations.localeOf(context).languageCode] ??
    'Track opportunity';

List<dynamic> marketingFilterOpportunities(
  List<dynamic> rows,
  Map<String, dynamic> bootstrap, {
  String search = '',
  String stage = '',
  bool archived = false,
  String opportunity = '',
  String worklist = '',
}) {
  final query = search.trim().toLowerCase();
  final clients = {
    for (final c in bootstrap['options']['clients']) c['id']: c['name'],
  };
  final quotes = {
    for (final q in bootstrap['options']['quotes']) q['id']: q['name'],
  };
  final stages = {
    for (final s in bootstrap['config']['stages']) s['id']: s['outcome'],
  };
  return rows
      .where(
        (r) =>
            (r['archived'] == true) == archived &&
            (stage.isEmpty || r['stage_id'] == stage) &&
            (opportunity.isEmpty || r['id'] == opportunity) &&
            (worklist != 'needs_followup' ||
                (r['next_activity'] == null &&
                    stages[r['stage_id']] == 'open')) &&
            (query.isEmpty ||
                [
                  r['title'],
                  clients[r['client_id']],
                  quotes[r['quote_id']],
                ].any(
                  (v) => (v ?? '').toString().toLowerCase().contains(query),
                )),
      )
      .toList()
    ..sort(
      (a, b) =>
          (DateTime.tryParse(b['updated_at'] ?? '')?.millisecondsSinceEpoch ??
                  0)
              .compareTo(
        DateTime.tryParse(
              a['updated_at'] ?? '',
            )?.millisecondsSinceEpoch ??
            0,
      ),
    );
}

class MarketingScreen extends StatelessWidget {
  const MarketingScreen(
      {super.key, this.quoteId, this.webClient = const WebClient()});
  final String? quoteId;
  final WebClient webClient;
  static const route = '/marketing';
  @override
  Widget build(BuildContext context) => StoreBuilder<AppState>(
        builder: (context, store) => _MarketingWorkspace(
          key: ValueKey('${store.state.company.id}-$quoteId'),
          quoteId: quoteId,
          state: store.state,
          webClient: webClient,
        ),
      );
}

class _MarketingWorkspace extends StatefulWidget {
  const _MarketingWorkspace(
      {super.key, required this.state, required this.webClient, this.quoteId});
  final String? quoteId;
  final AppState state;
  final WebClient webClient;
  @override
  State<_MarketingWorkspace> createState() => _MarketingWorkspaceState();
}

class _MarketingWorkspaceState extends State<_MarketingWorkspace> {
  Map<String, dynamic>? _bootstrap;
  List<dynamic> _records = [];
  List<dynamic>? _allOpportunities;
  bool _board = true, _cacheDirty = false, _viewInitialized = false;
  String _tab = 'opportunities',
      _activityView = 'future',
      _search = '',
      _filter = '',
      _opportunity = '',
      _error = '';
  bool _busy = false, _archived = false;
  int _page = 1, _lastPage = 1, _generation = 0;
  String _language = '', _worklist = '';
  final _searchController = TextEditingController();
  Timer? _searchDebounce;
  @override
  void dispose() {
    _searchDebounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  bool _openedQuote = false;
  final Set<String> _selected = {};
  String text(String key) {
    final label = _bootstrap?['labels'][key]?.toString();
    if (label != null) {
      return label;
    }
    return {
          'en': {
            'future': 'Future activities',
            'logs': 'Activity log',
          },
          'fr': {
            'future': 'Activités à venir',
            'logs': 'Journal des activités',
          },
          'de': {
            'future': 'Künftige Aktivitäten',
            'logs': 'Aktivitätsprotokoll',
          },
        }[_language]?[key] ??
        key;
  }

  bool allowed(String key) => _bootstrap?['permissions'][key] == true;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_viewInitialized) {
      _board = MediaQuery.sizeOf(context).width >= 700;
      _viewInitialized = true;
    }
    final language = Localizations.localeOf(context).languageCode;
    if (language != _language) {
      _language = language;
      _cacheDirty = true;
      _load().then((_) {
        if (mounted &&
            !_openedQuote &&
            widget.quoteId != null &&
            _bootstrap != null) {
          _openedQuote = true;
          _fromQuote(widget.quoteId!);
        }
      });
    }
  }

  Future<dynamic> api(String method, String path, [dynamic data]) {
    final credentials = widget.state.credentials;
    final url = '${credentials.url}/marketing/$path';
    final client = widget.webClient;
    if (method == 'GET') {
      return client.get(url, credentials.token);
    }
    _cacheDirty = true;
    if (method == 'PUT')
      return client.put(url, credentials.token, data: jsonEncode(data));
    if (method == 'DELETE')
      return client.delete(url, credentials.token, data: jsonEncode(data));
    return client.post(url, credentials.token, data: jsonEncode(data));
  }

  String _activityQuery({required int page, String? state}) =>
      Uri(queryParameters: {
        'page': '$page',
        if (_worklist.isNotEmpty) 'worklist': _worklist,
        'q': _search,
        if (_opportunity.isNotEmpty) 'opportunity_id': _opportunity,
        if (state != null) 'state': state,
      }).query;

  Future<List<dynamic>> _allActivitiesForState(String state) async {
    final activities = <dynamic>[];
    var page = 1;
    var lastPage = 1;
    do {
      final result = await api(
        'GET',
        'activities?${_activityQuery(page: page, state: state)}',
      );
      activities.addAll(result['data'] as List<dynamic>);
      lastPage = result['last_page'] as int? ?? 1;
      page++;
    } while (page <= lastPage);
    return activities;
  }

  Future<Map<String, dynamic>> _loadActivities() async {
    if (_activityView == 'future') {
      return await api(
        'GET',
        'activities?${_activityQuery(page: _page, state: 'pending')}',
      );
    }

    if (_filter.isNotEmpty) {
      return await api(
        'GET',
        'activities?${_activityQuery(page: _page, state: _filter)}',
      );
    }

    final groups = await Future.wait([
      for (final state in ['sent', 'failed', 'sending', 'done', 'cancelled'])
        _allActivitiesForState(state),
    ]);
    final activities = groups.expand((group) => group).toList()
      ..sort((a, b) {
        final aDate = DateTime.tryParse(
              a['updated_at']?.toString() ?? '',
            )?.millisecondsSinceEpoch ??
            0;
        final bDate = DateTime.tryParse(
              b['updated_at']?.toString() ?? '',
            )?.millisecondsSinceEpoch ??
            0;
        return bDate.compareTo(aDate);
      });
    final lastPage = ((activities.length + 49) ~/ 50).clamp(1, 1000000);
    return {
      'data': activities.skip((_page - 1) * 50).take(50).toList(),
      'last_page': lastPage,
    };
  }

  Future<void> _load({bool refresh = false}) async {
    refresh = refresh || _cacheDirty;
    final generation = ++_generation;
    if (mounted) {
      setState(() => _busy = true);
    }
    try {
      final bootstrap = _bootstrap == null || refresh
          ? await api('GET', 'bootstrap?language=$_language')
          : {'data': _bootstrap};
      List<dynamic>? pipeline = _allOpportunities;
      if (pipeline == null || refresh) {
        final byId = <String, dynamic>{};
        int page = 1, last = 1;
        do {
          final result = await api(
            'GET',
            'opportunities?archived=all&page=$page',
          );
          for (final row in result['data']) {
            byId[row['id']] = row;
          }
          last = result['last_page'];
        } while (++page <= last);
        pipeline = byId.values.toList();
      }
      final filtered = marketingFilterOpportunities(
        pipeline,
        Map<String, dynamic>.from(bootstrap['data']),
        search: _search,
        stage: _filter,
        archived: _archived,
        opportunity: _opportunity,
        worklist: _worklist,
      );
      final lastPage = ((filtered.length + 49) ~/ 50).clamp(1, 1000000);
      final page = _page.clamp(1, lastPage);
      final records = _tab == 'opportunities'
          ? {
              'data': _board
                  ? filtered
                  : filtered.skip((page - 1) * 50).take(50).toList(),
              'last_page': _board ? 1 : lastPage,
            }
          : await _loadActivities();
      if (mounted && generation == _generation)
        setState(() {
          _bootstrap = Map<String, dynamic>.from(bootstrap['data']);
          _allOpportunities = pipeline;
          _cacheDirty = false;
          _records = records['data'];
          _lastPage = records['last_page'];
          if (_tab == 'opportunities') {
            _page = _board ? 1 : page;
          }
          _selected.removeWhere((id) => !_records.any((r) => r['id'] == id));
          _error = '';
        });
    } catch (e) {
      if (mounted && generation == _generation)
        setState(() => _error = e.toString());
    } finally {
      if (mounted && generation == _generation) {
        setState(() => _busy = false);
      }
    }
  }

  Future<void> _fromQuote(String id) async {
    setState(() => _busy = true);
    try {
      final result = await api('POST', 'from_quote/$id');
      if (!mounted) {
        return;
      }
      final record = Map<String, dynamic>.from(result['data']);
      setState(() {
        _tab = 'opportunities';
        _opportunity = '';
        _archived = record['archived'];
        _filter = '';
        _search = '';
        _searchController.clear();
        _worklist = '';
        _page = 1;
      });
      await _load();
      if (mounted && _bootstrap != null) {
        await _edit(record);
      }
    } catch (e) {
      if (mounted) {
        setState(() => _error = e.toString());
      }
    } finally {
      if (mounted) {
        setState(() => _busy = false);
      }
    }
  }

  void _showWork(String value) {
    _searchDebounce?.cancel();
    setState(() {
      _tab = value == 'due' ? 'activities' : 'opportunities';
      if (value == 'due') {
        _activityView = 'future';
      }
      _worklist = _worklist == value ? '' : value;
      _opportunity = '';
      _filter = '';
      _search = '';
      _searchController.clear();
      _archived = false;
      _page = 1;
      _selected.clear();
    });
    _load();
  }

  Future<void> _quickFollowup(Map<String, dynamic> record) async {
    await _edit(null, resource: 'activities', defaults: {
      'opportunity_id': record['id'],
      'kind': 'call',
    });
  }

  Future<void> _action(
    Map<String, dynamic> record,
    String action, [
    String? previewVersion,
  ]) async {
    setState(() => _busy = true);
    try {
      await api('POST', 'activities/${record['id']}/$action', {
        'revision': record['revision'],
        if (previewVersion != null) 'preview_version': previewVersion,
      });
      await _load();
    } catch (e) {
      if (mounted) {
        setState(() => _error = e.toString());
      }
    } finally {
      if (mounted) {
        setState(() => _busy = false);
      }
    }
  }

  Future<void> _edit(Map<String, dynamic>? record,
      {String? resource, Map<String, dynamic> defaults = const {}}) async {
    final target = resource ?? _tab;
    final fields = _bootstrap!['fields'][target] as List<dynamic>;
    final values = record ??
        marketingInitial(fields, {
          ...Map<String, dynamic>.from(_bootstrap!['defaults']),
          'opportunity_id': _opportunity,
          'kind': 'task',
          if (target == 'activities') 'title': text('add_followup'),
          'due_at': DateTime.now().toUtc().toIso8601String().substring(0, 16),
          ...defaults,
        });
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => _MarketingEditor(
        title: '${text(record == null ? 'new' : 'edit')} · ${text(target)}',
        resource: target,
        fields: fields,
        values: values,
        bootstrap: _bootstrap!,
        save: (updated) => api(
          record == null ? 'POST' : 'PUT',
          '$target${record == null ? '' : '/${record['id']}'}',
          updated,
        ),
      ),
    );
    if (mounted) {
      await _load();
    }
  }

  void _settings() => StoreProvider.of<AppState>(context).dispatch(
        ViewSettings(
          section: kSettingsMarketing,
          company: widget.state.company,
          user: widget.state.user,
        ),
      );

  Future<void> _enroll(Map<String, dynamic>? record) async {
    String selected =
        record != null && (record['quote_id'] ?? '').toString().isNotEmpty
            ? _bootstrap!['config']['offer_sequence_${record['locale']}'] ?? ''
            : '';
    final sequences = _bootstrap!['config']['sequences'] as List;
    if (!sequences.any((s) => s['id'] == selected)) {
      selected = '';
    }
    final enrolledIds = _selected.toList();
    String error = '';
    bool busy = false;
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => StatefulBuilder(
        builder: (context, setLocal) => PopScope(
          canPop: !busy,
          child: AlertDialog(
            title: Text(text('enroll')),
            content: SizedBox(
                width: 560,
                child: SingleChildScrollView(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(record == null
                        ? '${text('selected')}: ${enrolledIds.length}'
                        : record['title']),
                    const SizedBox(height: 12),
                    Text(marketingUxText(context, 'sequence_help')),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<String>(
                      isExpanded: true,
                      decoration: InputDecoration(labelText: text('sequence')),
                      initialValue: selected,
                      items: [
                        const DropdownMenuItem(value: '', child: Text('—')),
                        ...sequences.map(
                          (s) => DropdownMenuItem<String>(
                            value: s['id'],
                            child: Text(s['name']),
                          ),
                        ),
                      ],
                      onChanged: busy
                          ? null
                          : (v) => setLocal(() => selected = v ?? ''),
                    ),
                    for (final sequence
                        in sequences.where((s) => s['id'] == selected)) ...[
                      const SizedBox(height: 12),
                      for (final step in sequence['steps'])
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(step['title']),
                          subtitle: Text(
                              '${text(step['kind'])} · +${step['days']} ${marketingUxText(context, 'day_offset')}'),
                        ),
                      Text(marketingUxText(
                          context,
                          _bootstrap!['config']['automatic'] == true &&
                                  (record == null ||
                                      record['automatic'] == true)
                              ? 'automatic_sequence_help'
                              : 'manual_sequence_help')),
                    ],
                    if (error.isNotEmpty) Text(error),
                  ],
                ))),
            actions: [
              TextButton(
                onPressed: busy ? null : () => Navigator.pop(context),
                child: Text(text('cancel')),
              ),
              FilledButton(
                onPressed: busy || selected.isEmpty
                    ? null
                    : () async {
                        setLocal(() => busy = true);
                        try {
                          await api(
                            'POST',
                            record == null
                                ? 'bulk_enroll'
                                : 'opportunities/${record['id']}/enroll',
                            {
                              'sequence': selected,
                              if (record == null) 'ids': enrolledIds,
                            },
                          );
                          if (context.mounted) {
                            Navigator.pop(context);
                          }
                        } catch (e) {
                          if (context.mounted)
                            setLocal(() {
                              busy = false;
                              error = e.toString();
                            });
                        }
                      },
                child: Text(text('enroll')),
              ),
            ],
          ),
        ),
      ),
    );
    if (mounted) {
      await _load();
    }
  }

  Future<void> _preview(Map<String, dynamic> record) async {
    setState(() => _busy = true);
    try {
      final result = await api('POST', 'activities/${record['id']}/preview');
      if (!mounted) {
        return;
      }
      final preview = result['data'];
      final send = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(preview['subject']),
          content: SizedBox(
            width: 700,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${text('recipient')}: ${preview['to']}'),
                  const SizedBox(height: 16),
                  SelectableText(preview['body']),
                  if (allowed('edit') && record['state'] == 'pending')
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(text('send_confirm')),
                    ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(text('cancel')),
            ),
            if (allowed('edit') && record['state'] == 'pending')
              FilledButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text(text('send')),
              ),
          ],
        ),
      );
      if (send == true && mounted) {
        await _action(record, 'send', preview['version']);
      }
    } catch (e) {
      if (mounted) {
        setState(() => _error = e.toString());
      }
    } finally {
      if (mounted) {
        setState(() => _busy = false);
      }
    }
  }

  String optionName(String source, dynamic id) {
    final options =
        _bootstrap!['config'][source] ?? _bootstrap!['options'][source] ?? [];
    for (final item in options) {
      if ('${item['id']}' == '$id') {
        return item['name'].toString();
      }
    }
    return id?.toString() ?? '';
  }

  Map<String, dynamic>? _opportunityForActivity(Map<String, dynamic> record) {
    final opportunityId = record['opportunity_id']?.toString();
    for (final raw in _allOpportunities ?? const <dynamic>[]) {
      final opportunity = Map<String, dynamic>.from(raw);
      if (opportunity['id']?.toString() == opportunityId) {
        return opportunity;
      }
    }
    return null;
  }

  Widget _activityDetails(Map<String, dynamic> record) {
    final opportunity = _opportunityForActivity(record);
    if (opportunity == null) {
      return const SizedBox.shrink();
    }
    final quoteId = opportunity['quote_id']?.toString() ?? '';
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            opportunity['title']?.toString() ?? '',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(optionName('clients', opportunity['client_id'])),
          if (quoteId.isNotEmpty) Text(optionName('quotes', quoteId)),
        ],
      ),
    );
  }

  Widget _nextAction(dynamic next) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            next == null
                ? Icons.notification_important_outlined
                : Icons.event_outlined,
            size: 18,
            color: next == null
                ? Theme.of(context).colorScheme.error
                : Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: next == null
                ? Text(text('needs_followup'))
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text(next['title'],
                            maxLines: 2, overflow: TextOverflow.ellipsis),
                        MarketingDueLabel(value: next['due_at']),
                      ]),
          ),
        ],
      );

  Future<void> _openQuoteRecord(Map<String, dynamic> record) async {
    try {
      final store = StoreProvider.of<AppState>(context);
      if ('${record['quote_id'] ?? ''}'.isEmpty) {
        if (store.state.clientState.map[record['client_id']]?.isLoaded !=
            true) {
          final completer = Completer<void>();
          store.dispatch(
              LoadClient(clientId: record['client_id'], completer: completer));
          await completer.future;
        }
        if (mounted)
          createEntity(
              entity: InvoiceEntity(
            state: store.state,
            client: store.state.clientState.map[record['client_id']],
            entityType: EntityType.quote,
          ));
        return;
      }
      if (store.state.quoteState.map[record['quote_id']]?.isLoaded != true) {
        final completer = Completer<void>();
        store.dispatch(
          LoadQuote(quoteId: record['quote_id'], completer: completer),
        );
        await completer.future;
      }
      if (mounted) {
        viewEntityById(
          entityId: record['quote_id'],
          entityType: EntityType.quote,
          force: true,
        );
      }
    } catch (e) {
      if (mounted) {
        setState(() => _error = e.toString());
      }
    }
  }

  Future<void> _moveStage(Map<String, dynamic> record, String stage) async {
    if (_busy || record['stage_id'] == stage) {
      return;
    }
    final closes = (_bootstrap!['config']['stages'] as List)
        .any((s) => s['id'] == stage && s['outcome'] != 'open');
    if (_isOpen(record) && closes) {
      final confirmed = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(optionName('stages', stage)),
                content: Text(marketingUxText(context, 'close_stage_confirm')),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: Text(text('cancel'))),
                  FilledButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: Text(marketingUxText(context, 'move_stage'))),
                ],
              ));
      if (confirmed != true || !mounted) {
        return;
      }
    }
    setState(() => _busy = true);
    try {
      await api('PUT', 'opportunities/${record['id']}', {
        ...record,
        'stage_id': stage,
      });
      await _load();
    } catch (e) {
      if (mounted) {
        setState(() => _error = e.toString());
      }
    } finally {
      if (mounted) {
        setState(() => _busy = false);
      }
    }
  }

  Future<void> _removeFromMarketing(Map<String, dynamic> record) async {
    final hasQuote = (record['quote_id'] ?? '').toString().isNotEmpty;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        icon: const Icon(Icons.remove_circle_outline),
        title: Text(text('remove_from_marketing')),
        content: Text(
          text(
            hasQuote
                ? 'remove_marketing_confirm'
                : 'remove_opportunity_confirm',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(text('cancel')),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: Text(text('remove_from_marketing')),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) {
      return;
    }
    setState(() => _busy = true);
    try {
      await api('DELETE', 'opportunities/${record['id']}', {
        'revision': record['revision'],
      });
      if (!mounted) {
        return;
      }
      setState(() {
        _selected.clear();
        _opportunity = '';
        _page = 1;
      });
      await _load();
    } catch (e) {
      if (mounted) {
        setState(() => _error = e.toString());
      }
    } finally {
      if (mounted) {
        setState(() => _busy = false);
      }
    }
  }

  bool _isOpen(Map<String, dynamic> record) =>
      record['archived'] != true &&
      (_bootstrap!['config']['stages'] as List)
          .any((s) => s['id'] == record['stage_id'] && s['outcome'] == 'open');

  void _resetFilters() {
    _searchDebounce?.cancel();
    setState(() {
      _worklist = '';
      _opportunity = '';
      _filter = '';
      _search = '';
      _searchController.clear();
      _archived = false;
      _page = 1;
      _selected.clear();
    });
    _load();
  }

  void _changeSearch(String value) {
    _searchDebounce?.cancel();
    setState(() {
      _search = value;
      _page = 1;
      _selected.clear();
    });
    _searchDebounce = Timer(const Duration(milliseconds: 300), _load);
  }

  void _showFutureActivities(Map<String, dynamic> record) {
    _searchDebounce?.cancel();
    setState(() {
      _tab = 'activities';
      _activityView = 'future';
      _filter = '';
      _worklist = '';
      _search = '';
      _searchController.clear();
      _opportunity = record['id'];
      _page = 1;
      _selected.clear();
    });
    _load();
  }

  void _showHistory(Map<String, dynamic> record) {
    _searchDebounce?.cancel();
    setState(() {
      _tab = 'activities';
      _activityView = 'logs';
      _filter = '';
      _worklist = '';
      _search = '';
      _searchController.clear();
      _opportunity = record['id'];
      _page = 1;
      _selected.clear();
    });
    _load();
  }

  Future<void> _chooseStage(Map<String, dynamic> record) async {
    final stage = await showDialog<String>(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text(marketingUxText(context, 'move_stage')),
        children: [
          for (final stage in _bootstrap!['config']['stages'])
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, stage['id']),
              child: ListTile(
                title: Text(stage['name']),
                trailing: stage['id'] == record['stage_id']
                    ? const Icon(Icons.check)
                    : null,
              ),
            ),
        ],
      ),
    );
    if (stage != null && mounted) {
      await _moveStage(record, stage);
    }
  }

  Widget _opportunityCard(Map<String, dynamic> record, {bool list = false}) {
    final open = _isOpen(record);
    final hasQuote = '${record['quote_id'] ?? ''}'.isNotEmpty;
    return Card.outlined(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            if (list && allowed('edit') && open)
              Checkbox(
                value: _selected.contains(record['id']),
                onChanged: _busy
                    ? null
                    : (selected) => setState(() {
                          if (selected == true) {
                            _selected.add(record['id']);
                          } else {
                            _selected.remove(record['id']);
                          }
                        }),
              ),
            Expanded(
                child: Text(record['title'],
                    style: Theme.of(context).textTheme.titleMedium)),
            PopupMenuButton<String>(
              tooltip: marketingUxText(context, 'more_actions'),
              enabled: !_busy,
              onSelected: (action) {
                switch (action) {
                  case 'edit':
                    _edit(record);
                    break;
                  case 'stage':
                    _chooseStage(record);
                    break;
                  case 'history':
                    _showHistory(record);
                    break;
                  case 'enroll':
                    _enroll(record);
                    break;
                  case 'remove':
                    _removeFromMarketing(record);
                    break;
                }
              },
              itemBuilder: (_) => [
                if (allowed('edit'))
                  PopupMenuItem(value: 'edit', child: Text(text('edit'))),
                if (allowed('edit'))
                  PopupMenuItem(
                      value: 'stage',
                      child: Text(marketingUxText(context, 'move_stage'))),
                PopupMenuItem(value: 'history', child: Text(text('history'))),
                if (allowed('edit') && open)
                  PopupMenuItem(value: 'enroll', child: Text(text('enroll'))),
                if (allowed('edit')) ...[
                  const PopupMenuDivider(),
                  PopupMenuItem(
                      value: 'remove',
                      child: Text(text('remove_from_marketing'),
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.error))),
                ],
              ],
            ),
          ]),
          Text(optionName('clients', record['client_id']),
              style: Theme.of(context).textTheme.bodyMedium),
          if (list)
            Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(optionName('stages', record['stage_id']),
                    style: Theme.of(context).textTheme.labelMedium)),
          const SizedBox(height: 10),
          Text(
              '${marketingAmount(context, record['amount'])} ${optionName('currencies', record['currency_id'])}',
              style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 10),
          if ('${record['expected_close'] ?? ''}'.isNotEmpty) ...[
            Text('${text('expected_close')}: ${record['expected_close']}'),
            const SizedBox(height: 8),
          ],
          if (open)
            InkWell(
              onTap: _busy || record['next_activity'] == null
                  ? null
                  : () {
                      if (allowed('edit')) {
                        _edit(
                            Map<String, dynamic>.from(record['next_activity']),
                            resource: 'activities');
                      } else {
                        _showFutureActivities(record);
                      }
                    },
              child: _nextAction(record['next_activity']),
            )
          else
            Text(
                record['archived'] == true
                    ? text('archived')
                    : marketingUxText(context, 'closed'),
                style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 8),
          Wrap(spacing: 4, runSpacing: 4, children: [
            if (allowed('create') && open)
              TextButton.icon(
                onPressed: _busy ? null : () => _quickFollowup(record),
                icon: const Icon(Icons.add, size: 18),
                label: Text(text('add_followup')),
              ),
            if (hasQuote || allowed('create'))
              TextButton.icon(
                onPressed: _busy ? null : () => _openQuoteRecord(record),
                icon: const Icon(Icons.description_outlined, size: 18),
                label: Text(text(hasQuote ? 'view_quote' : 'create_quote')),
              ),
          ]),
        ]),
      ),
    );
  }

  Widget _activityCard(Map<String, dynamic> record) {
    final pending = record['state'] == 'pending';
    return Card.outlined(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
          padding: const EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(record['title'],
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 4),
            _activityDetails(record),
            const SizedBox(height: 8),
            Wrap(spacing: 12, runSpacing: 4, children: [
              Text('${text(record['kind'])} · ${text(record['state'])}'),
              MarketingDueLabel(value: record['due_at'], pending: pending),
            ]),
            if ('${record['notes'] ?? ''}'.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(record['notes']),
            ],
            if ('${record['error'] ?? ''}'.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(record['error'],
                  style: TextStyle(color: Theme.of(context).colorScheme.error)),
            ],
            const SizedBox(height: 8),
            Wrap(spacing: 8, runSpacing: 4, children: [
              if (record['kind'] == 'email')
                FilledButton.tonalIcon(
                  onPressed: _busy ? null : () => _preview(record),
                  icon: const Icon(Icons.mail_outline, size: 18),
                  label: Text(text('preview')),
                ),
              if (allowed('edit') && pending) ...[
                if (record['kind'] != 'email')
                  FilledButton.tonalIcon(
                    onPressed: _busy ? null : () => _action(record, 'complete'),
                    icon: const Icon(Icons.check, size: 18),
                    label: Text(text('complete')),
                  ),
                TextButton(
                    onPressed: _busy ? null : () => _edit(record),
                    child: Text(text('edit'))),
                TextButton(
                    onPressed: _busy ? null : () => _cancelActivity(record),
                    child: Text(text('cancel'))),
              ],
            ]),
          ])),
    );
  }

  Future<void> _cancelActivity(Map<String, dynamic> record) async {
    final cancel = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(marketingUxText(context, 'cancel_activity_confirm')),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: Text(marketingUxText(context, 'keep_editing'))),
                FilledButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: Text(text('cancel'))),
              ],
            ));
    if (cancel == true && mounted) {
      await _action(record, 'cancel');
    }
  }

  Widget _kanban() => SizedBox(
        height: (MediaQuery.sizeOf(context).height * .65).clamp(360.0, 760.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final rawStage in (_bootstrap!['config']['stages'] as List)
                  .where((s) => _filter.isEmpty || s['id'] == _filter))
                Builder(
                  builder: (context) {
                    final stage = Map<String, dynamic>.from(rawStage);
                    final cards = _records
                        .where((r) => r['stage_id'] == stage['id'])
                        .toList();
                    return DragTarget<Map<String, dynamic>>(
                      onWillAcceptWithDetails: (_) => allowed('edit') && !_busy,
                      onAcceptWithDetails: (details) =>
                          _moveStage(details.data, stage['id']),
                      builder: (context, candidates, rejected) => Container(
                        width: MediaQuery.sizeOf(context).width < 400
                            ? MediaQuery.sizeOf(context).width - 56
                            : 310,
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).colorScheme.surfaceContainerLow,
                          border: Border.all(
                            color: candidates.isEmpty
                                ? Theme.of(context).dividerColor
                                : Theme.of(context).colorScheme.primary,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    stage['name'],
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ),
                                Badge(
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    textColor: Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer,
                                    label: Text('${cards.length}')),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Expanded(
                              child: ListView(
                                children: [
                                  if (cards.isEmpty)
                                    Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Text(text('empty'))),
                                  for (final raw in cards)
                                    Builder(
                                      builder: (context) {
                                        final record =
                                            Map<String, dynamic>.from(
                                          raw,
                                        );
                                        final card = _opportunityCard(record);
                                        if (!allowed('edit') || _busy) {
                                          return card;
                                        }
                                        return LongPressDraggable<
                                            Map<String, dynamic>>(
                                          data: record,
                                          feedback: Material(
                                            elevation: 6,
                                            child: SizedBox(
                                              width: 280,
                                              child: Text(record['title']),
                                            ),
                                          ),
                                          childWhenDragging: Opacity(
                                            opacity: 0.4,
                                            child: card,
                                          ),
                                          child: card,
                                        );
                                      },
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      );

  Future<void> _startFromQuote() async {
    var choice = '';
    final id = await showDialog<String>(
        context: context,
        builder: (context) => StatefulBuilder(
            builder: (context, setLocal) => AlertDialog(
                  title: Text(text('from_quote')),
                  content: SizedBox(
                      width: 560,
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(text('quote_start_help')),
                            const SizedBox(height: 16),
                            MarketingOptionField(
                              key: ValueKey(choice),
                              label: text('quote_id'),
                              value: choice,
                              options: [
                                for (final quote
                                    in marketingQuoteOptions(_bootstrap!))
                                  {
                                    ...quote,
                                    'name':
                                        marketingQuoteLabel(quote, _bootstrap!)
                                  }
                              ],
                              onChanged: (v) => setLocal(() => choice = v),
                            ),
                          ])),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(text('cancel'))),
                    FilledButton(
                        onPressed: choice.isEmpty
                            ? null
                            : () => Navigator.pop(context, choice),
                        child: Text(text('track_opportunity'))),
                  ],
                )));
    if (id != null && mounted) {
      await _fromQuote(id);
    }
  }

  Widget _filters() => LayoutBuilder(builder: (context, constraints) {
        final wide = constraints.maxWidth >= 720;
        return Wrap(
            spacing: 16,
            runSpacing: 12,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              SizedBox(
                  width: wide
                      ? (constraints.maxWidth - 160) * .6
                      : constraints.maxWidth,
                  child: TextField(
                    controller: _searchController,
                    onChanged: _changeSearch,
                    decoration: InputDecoration(
                      labelText: text('search'),
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: _search.isEmpty
                          ? null
                          : IconButton(
                              tooltip:
                                  marketingUxText(context, 'clear_filters'),
                              onPressed: () {
                                _searchController.clear();
                                _changeSearch('');
                              },
                              icon: const Icon(Icons.clear)),
                    ),
                    onSubmitted: (value) {
                      _searchDebounce?.cancel();
                      _search = value;
                      _page = 1;
                      _selected.clear();
                      _load();
                    },
                  )),
              if (_tab == 'opportunities' || _activityView == 'logs')
                SizedBox(
                    width: wide
                        ? (constraints.maxWidth - 160) * .4
                        : constraints.maxWidth,
                    child: DropdownButtonFormField<String>(
                      key: ValueKey('$_tab-$_activityView-$_filter-filter'),
                      isExpanded: true,
                      initialValue: _filter,
                      decoration: InputDecoration(
                          labelText: text(
                              _tab == 'opportunities' ? 'stage_id' : 'state')),
                      items: [
                        DropdownMenuItem(value: '', child: Text(text('all'))),
                        if (_tab == 'opportunities')
                          for (final stage in _bootstrap!['config']['stages'])
                            DropdownMenuItem(
                                value: '${stage['id']}',
                                child: Text(stage['name']))
                        else
                          for (final state in [
                            'sent',
                            'failed',
                            'sending',
                            'done',
                            'cancelled'
                          ])
                            DropdownMenuItem(
                                value: state, child: Text(text(state))),
                      ],
                      onChanged: _busy
                          ? null
                          : (value) {
                              setState(() {
                                _filter = value ?? '';
                                _page = 1;
                                _selected.clear();
                              });
                              _load();
                            },
                    )),
              if (_tab == 'opportunities')
                FilterChip(
                    label: Text(text('archived')),
                    selected: _archived,
                    onSelected: _busy
                        ? null
                        : (value) {
                            setState(() {
                              _archived = value;
                              _page = 1;
                              _selected.clear();
                            });
                            _load();
                          }),
              if (_tab == 'activities')
                SizedBox(
                    width: wide ? 380 : constraints.maxWidth,
                    child: MarketingOptionField(
                      key: ValueKey('opportunity-$_opportunity'),
                      label: text('opportunity_id'),
                      value: _opportunity,
                      emptyLabel: text('all'),
                      options: _bootstrap!['options']['opportunities'],
                      onChanged: _busy
                          ? null
                          : (value) {
                              setState(() {
                                _opportunity = value;
                                _page = 1;
                              });
                              _load();
                            },
                    )),
            ]);
      });

  @override
  Widget build(BuildContext context) {
    if (widget.state.company.enabledModules & kModuleMarketing == 0) {
      return Scaffold(
          appBar: AppBar(title: Text(marketingTitle(context))),
          body: const Center(child: Text('403')));
    }
    final bootstrap = _bootstrap;
    final filtered = _search.isNotEmpty ||
        _filter.isNotEmpty ||
        _opportunity.isNotEmpty ||
        _archived;
    return Scaffold(
      appBar: AppBar(title: Text(marketingTitle(context)), actions: [
        IconButton(
            tooltip: text('refresh'),
            onPressed: _busy ? null : () => _load(refresh: true),
            icon: const Icon(Icons.refresh)),
        if (allowed('configure'))
          IconButton(
              tooltip: text('settings'),
              onPressed: _busy ? null : _settings,
              icon: const Icon(Icons.settings)),
      ]),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        if (_busy) const LinearProgressIndicator(),
        if (_error.isNotEmpty)
          Card(
              color: Theme.of(context).colorScheme.errorContainer,
              child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SelectableText(_error,
                      style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onErrorContainer)))),
        if (bootstrap != null) ...[
          Wrap(
              spacing: 16,
              runSpacing: 12,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SegmentedButton<String>(
                        segments: [
                          ButtonSegment(
                              value: 'opportunities',
                              icon: const Icon(Icons.view_kanban_outlined),
                              label: Text(text('opportunities'))),
                          ButtonSegment(
                              value: 'activities',
                              icon: const Icon(Icons.event_note_outlined),
                              label: Text(text('activities'))),
                        ],
                        selected: {
                          _tab
                        },
                        onSelectionChanged: _busy
                            ? null
                            : (values) {
                                setState(() {
                                  _tab = values.first;
                                  _activityView = 'future';
                                });
                                _resetFilters();
                              })),
                if (allowed('create')) ...[
                  if (_tab == 'opportunities')
                    FilledButton.icon(
                        onPressed: _busy ? null : _startFromQuote,
                        icon: const Icon(Icons.description_outlined),
                        label: Text(text('from_quote'))),
                  OutlinedButton.icon(
                      onPressed: _busy ? null : () => _edit(null),
                      icon: const Icon(Icons.add),
                      label: Text(_tab == 'activities'
                          ? text('add_followup')
                          : '${text('new')} · ${text('opportunity_id')}')),
                ],
              ]),
          const SizedBox(height: 16),
          if (_tab == 'activities') ...[
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerLeft,
              child: SegmentedButton<String>(
                segments: [
                  ButtonSegment(
                    value: 'future',
                    icon: const Icon(Icons.upcoming_outlined),
                    label: Text(text('future')),
                  ),
                  ButtonSegment(
                    value: 'logs',
                    icon: const Icon(Icons.receipt_long_outlined),
                    label: Text(text('logs')),
                  ),
                ],
                selected: {_activityView},
                onSelectionChanged: _busy
                    ? null
                    : (values) {
                        setState(() {
                          _activityView = values.first;
                          _filter = '';
                          _worklist = '';
                          _page = 1;
                        });
                        _load();
                      },
              ),
            ),
          ],
          Wrap(spacing: 8, runSpacing: 8, children: [
            FilterChip(
                label: Text(
                    '${text('due_work')} · ${bootstrap['workload']?['due'] ?? 0}'),
                selected: _worklist == 'due',
                onSelected: _busy ? null : (_) => _showWork('due')),
            FilterChip(
                label: Text(
                    '${text('needs_followup')} · ${bootstrap['workload']?['needs_followup'] ?? 0}'),
                selected: _worklist == 'needs_followup',
                onSelected: _busy ? null : (_) => _showWork('needs_followup')),
            if (_worklist.isNotEmpty || filtered)
              ActionChip(
                  label: Text(marketingUxText(context, 'clear_filters')),
                  onPressed: _busy ? null : _resetFilters),
          ]),
          const SizedBox(height: 16),
          _filters(),
          if (_tab == 'activities')
            Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(marketingUxText(context, 'local_time'),
                    style: Theme.of(context).textTheme.bodySmall)),
          const SizedBox(height: 16),
          if (_tab == 'opportunities')
            Wrap(
                spacing: 16,
                runSpacing: 8,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  SegmentedButton<bool>(
                      segments: [
                        ButtonSegment(
                            value: true,
                            icon: const Icon(Icons.view_kanban_outlined),
                            label: Text(text('board'))),
                        ButtonSegment(
                            value: false,
                            icon: const Icon(Icons.view_list_outlined),
                            label: Text(text('list'))),
                      ],
                      selected: {
                        _board
                      },
                      onSelectionChanged: _busy
                          ? null
                          : (values) {
                              setState(() {
                                _board = values.first;
                                _page = 1;
                                _selected.clear();
                              });
                              _load();
                            }),
                  if (!_board && _selected.isNotEmpty)
                    Wrap(
                        spacing: 8,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text('${text('selected')}: ${_selected.length}'),
                          FilledButton.tonal(
                              onPressed: _busy ? null : () => _enroll(null),
                              child: Text(text('enroll'))),
                          TextButton(
                              onPressed: _busy
                                  ? null
                                  : () => setState(() => _selected.clear()),
                              child: Text(text('cancel'))),
                        ]),
                ]),
          const SizedBox(height: 16),
          if (_records.isEmpty && !_busy)
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Column(children: [
                  Icon(Icons.inbox_outlined,
                      size: 40, color: Theme.of(context).colorScheme.outline),
                  const SizedBox(height: 12),
                  Text(
                      filtered
                          ? marketingUxText(context, 'no_results')
                          : text('empty'),
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  if (!filtered)
                    Text(
                        marketingUxText(
                            context,
                            _worklist == 'due'
                                ? 'due_empty_help'
                                : _worklist == 'needs_followup'
                                    ? 'followup_empty_help'
                                    : _tab == 'opportunities'
                                        ? 'pipeline_empty_help'
                                        : 'due_empty_help'),
                        textAlign: TextAlign.center),
                  if (filtered || _worklist.isNotEmpty)
                    TextButton(
                        onPressed: _resetFilters,
                        child: Text(text('show_all'))),
                ])),
          if (_tab == 'opportunities' && _board && _records.isNotEmpty)
            _kanban(),
          if (_tab != 'opportunities' || !_board)
            for (final raw in _records)
              _tab == 'opportunities'
                  ? _opportunityCard(Map<String, dynamic>.from(raw), list: true)
                  : _activityCard(Map<String, dynamic>.from(raw)),
          if ((_tab != 'opportunities' || !_board) && _lastPage > 1)
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              TextButton(
                  onPressed: _busy || _page == 1
                      ? null
                      : () {
                          _page--;
                          _selected.clear();
                          _load();
                        },
                  child: Text(text('previous'))),
              Text('${text('page')} $_page / $_lastPage'),
              TextButton(
                  onPressed: _busy || _page >= _lastPage
                      ? null
                      : () {
                          _page++;
                          _selected.clear();
                          _load();
                        },
                  child: Text(text('next'))),
            ]),
          if (_tab == 'opportunities') ...[
            const SizedBox(height: 16),
            Card.outlined(
                child: ExpansionTile(
              title: Text(text('forecast')),
              leading: const Icon(Icons.insights_outlined),
              children: [
                for (final f in bootstrap['forecast'])
                  ListTile(
                      title: Text(optionName('currencies', f['currency_id'])),
                      subtitle: Text(
                          '${text('open')}: ${marketingAmount(context, f['open'])} · '
                          '${text('forecast')}: ${marketingAmount(context, f['weighted'])}\n'
                          '${text('won')}: ${marketingAmount(context, f['won'])} · '
                          '${text('lost')}: ${marketingAmount(context, f['lost'])}')),
              ],
            )),
          ],
        ],
      ]),
    );
  }
}

class _MarketingEditor extends StatefulWidget {
  const _MarketingEditor({
    required this.title,
    required this.resource,
    required this.fields,
    required this.values,
    required this.bootstrap,
    required this.save,
  });
  final String title, resource;
  final List<dynamic> fields;
  final Map<String, dynamic> values, bootstrap;
  final Future<dynamic> Function(Map<String, dynamic>) save;
  @override
  State<_MarketingEditor> createState() => _MarketingEditorState();
}

class _MarketingEditorState extends State<_MarketingEditor> {
  late Map<String, dynamic> values = Map<String, dynamic>.from(
    jsonDecode(jsonEncode(widget.values)),
  );
  String error = '';
  bool busy = false;
  final formKey = GlobalKey<FormState>();
  String text(String key) => widget.bootstrap['labels'][key]?.toString() ?? key;

  Future<void> close() async {
    if (busy) {
      return;
    }
    if (jsonEncode(values) != jsonEncode(widget.values)) {
      final discard = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(marketingUxText(context, 'discard_changes')),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(marketingUxText(context, 'keep_editing')),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(marketingUxText(context, 'discard')),
            ),
          ],
        ),
      );
      if (discard != true) {
        return;
      }
    }
    if (mounted) {
      Navigator.pop(context);
    }
  }

  Future<void> save() async {
    if (!formKey.currentState!.validate()) {
      setState(() => error = marketingUxText(context, 'check_fields'));
      return;
    }
    if (widget.resource == 'opportunities' && widget.values['id'] != null) {
      final stages = widget.bootstrap['config']['stages'] as List;
      final wasOpen = widget.values['archived'] != true &&
          stages.any((s) =>
              s['id'] == widget.values['stage_id'] && s['outcome'] == 'open');
      final closes = values['archived'] == true ||
          stages.any(
              (s) => s['id'] == values['stage_id'] && s['outcome'] != 'open');
      if (wasOpen && closes) {
        final confirmed = await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
                  content:
                      Text(marketingUxText(context, 'close_stage_confirm')),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: Text(text('cancel'))),
                    FilledButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: Text(text('save'))),
                  ],
                ));
        if (confirmed != true || !mounted) {
          return;
        }
      }
    }
    setState(() {
      busy = true;
      error = '';
    });
    try {
      await widget.save(values);
      if (mounted) {
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted)
        setState(() {
          error = e.toString();
          busy = false;
        });
    }
  }

  @override
  Widget build(BuildContext context) => PopScope<void>(
        canPop: !busy && jsonEncode(values) == jsonEncode(widget.values),
        onPopInvokedWithResult: (didPop, _) {
          if (!didPop && !busy) {
            close();
          }
        },
        child: AlertDialog(
          insetPadding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width < 600 ? 12 : 40,
              vertical: 24),
          title: Text(widget.title),
          content: SizedBox(
            width: 800,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AbsorbPointer(
                    absorbing: busy,
                    child: Form(
                      key: formKey,
                      child: MarketingEditorForm(
                        resource: widget.resource,
                        fields: widget.fields,
                        values: values,
                        bootstrap: widget.bootstrap,
                        onChanged: (v) => setState(() => values = v),
                      ),
                    ),
                  ),
                  if (error.isNotEmpty)
                    Text(
                      error,
                      style:
                          TextStyle(color: Theme.of(context).colorScheme.error),
                    ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: busy ? null : close,
              child: Text(text('cancel')),
            ),
            FilledButton(
              onPressed: busy ? null : save,
              child: busy
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2))
                  : Text(text('save')),
            ),
          ],
        ),
      );
}

/// Group optional opportunity fields while keeping the daily workflow visible.
class MarketingEditorForm extends StatelessWidget {
  const MarketingEditorForm(
      {super.key,
      required this.resource,
      required this.fields,
      required this.values,
      required this.bootstrap,
      required this.onChanged});
  final String resource;
  final List<dynamic> fields;
  final Map<String, dynamic> values, bootstrap;
  final ValueChanged<Map<String, dynamic>> onChanged;

  @override
  Widget build(BuildContext context) {
    final config = Map<String, dynamic>.from(bootstrap['config']);
    final opportunity = resource == 'opportunities';
    final requiredFields = opportunity
        ? {
            'title',
            'client_id',
            'contact_id',
            'owner_id',
            'stage_id',
            'amount',
            'currency_id',
            'locale'
          }
        : {
            'opportunity_id',
            'title',
            'kind',
            'due_at',
            if (values['kind'] == 'email') 'template_id'
          };
    const planning = {
      'expected_close',
      'source',
      'campaign_id',
      'notes',
      'lost_reason'
    };
    const sending = {'consent', 'consent_source', 'automatic', 'archived'};
    final lost = (config['stages'] as List)
        .any((s) => s['id'] == values['stage_id'] && s['outcome'] == 'lost');
    bool visible(dynamic field) {
      final name = field['name'];
      if (name == 'template_id') {
        return values['kind'] == 'email';
      }
      if (name == 'lost_reason')
        return lost || '${values[name] ?? ''}'.isNotEmpty;
      if (name == 'consent_source') {
        return values['consent'] == true;
      }
      if (name == 'archived') {
        return values['id'] != null;
      }
      return true;
    }

    Widget group(Iterable<dynamic> selected) => MarketingFields(
          fields: selected.where(visible).toList(),
          values: values,
          bootstrap: bootstrap,
          config: config,
          onChanged: onChanged,
          requiredFields: {
            ...requiredFields,
            if (values['consent'] == true) 'consent_source'
          },
          responsive: true,
        );
    if (!opportunity) {
      return group(fields);
    }
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      group(fields.where((f) =>
          !planning.contains(f['name']) && !sending.contains(f['name']))),
      ExpansionTile(
        key: const PageStorageKey('marketing-planning'),
        tilePadding: EdgeInsets.zero,
        title: Text(marketingUxText(context, 'planning')),
        initiallyExpanded: lost,
        maintainState: true,
        children: [group(fields.where((f) => planning.contains(f['name'])))],
      ),
      ExpansionTile(
        key: const PageStorageKey('marketing-sending'),
        tilePadding: EdgeInsets.zero,
        title: Text(marketingUxText(context, 'sending_preferences')),
        initiallyExpanded: values['consent'] == true,
        maintainState: true,
        children: [
          Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text('${bootstrap['labels']['automatic_help'] ?? ''}',
                  style: Theme.of(context).textTheme.bodySmall)),
          if (config['automatic'] != true)
            Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(marketingUxText(context, 'company_automatic_off'))),
          group(fields.where((f) => sending.contains(f['name']))),
        ],
      ),
    ]);
  }
}

class MarketingFields extends StatelessWidget {
  const MarketingFields({
    super.key,
    required this.fields,
    required this.values,
    required this.bootstrap,
    required this.config,
    required this.onChanged,
    this.requiredFields = const {},
    this.responsive = false,
  });
  final List<dynamic> fields;
  final Map<String, dynamic> values, bootstrap, config;
  final ValueChanged<Map<String, dynamic>> onChanged;
  final Set<String> requiredFields;
  final bool responsive;
  String text(String key) => bootstrap['labels'][key]?.toString() ?? key;
  @override
  Widget build(BuildContext context) =>
      LayoutBuilder(builder: (context, constraints) {
        return Wrap(
            spacing: 16,
            children: fields.map<Widget>((field) {
              final name = field['name'] as String;
              final type = field['type'];
              final value = values[name];
              final required = requiredFields.contains(name);
              final label = name == 'due_at'
                  ? marketingUxText(context, 'local_due_at')
                  : text(name);
              String? validate(String? next) {
                if (required && (next ?? '').trim().isEmpty) {
                  return marketingUxText(context, 'required');
                }
                if (required && name == 'amount') {
                  final amount =
                      num.tryParse((next ?? '').replaceAll(',', '.'));
                  if (amount == null || !amount.isFinite || amount < 0) {
                    return marketingUxText(context, 'invalid_number');
                  }
                }
                return null;
              }

              InputDecoration decoration({Widget? suffixIcon}) =>
                  InputDecoration(
                    labelText: '$label${required ? ' *' : ''}',
                    helperText: type == 'datetime-local'
                        ? marketingUxText(context, 'local_time')
                        : null,
                    suffixIcon: suffixIcon,
                  );
              void update(dynamic next) =>
                  onChanged(marketingUpdate(values, name, next));
              Widget child;
              if (type == 'boolean') {
                child = SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(text(name)),
                  value: value == true,
                  onChanged: update,
                );
              } else if (type == 'list') {
                final items = (value as List?) ?? [];
                child = ExpansionTile(
                  key: ValueKey(name),
                  title: Text('${text(name)} (${items.length})'),
                  children: [
                    for (int index = 0; index < items.length; index++)
                      Card(
                        child: ExpansionTile(
                          key: ValueKey('$name-$index-${items.length}'),
                          title: Text(
                            items[index]['name'] ??
                                items[index]['title'] ??
                                text('new'),
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: MarketingFields(
                                fields: field['fields'],
                                values: Map<String, dynamic>.from(items[index]),
                                bootstrap: bootstrap,
                                config: config,
                                onChanged: (updated) {
                                  final next = [...items];
                                  next[index] = updated;
                                  update(next);
                                },
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                final next = [...items]..removeAt(index);
                                update(next);
                              },
                              child: Text(text('remove')),
                            ),
                          ],
                        ),
                      ),
                    TextButton(
                      onPressed: () => update([
                        ...items,
                        marketingInitial(
                          field['fields'],
                          name == 'steps' ? {'kind': 'task', 'days': 0} : {},
                        ),
                      ]),
                      child: Text(text('add')),
                    ),
                  ],
                );
              } else if (type == 'select') {
                final source = field['options'];
                final List<dynamic> options = source is List
                    ? source.map((id) => {'id': id, 'name': text(id)}).toList()
                    : (config[source] ?? bootstrap['options'][source] ?? [])
                        as List;
                final filtered = options
                    .where(
                      (o) =>
                          o['client_id'] == null ||
                          o['client_id'] == values['client_id'],
                    )
                    .toList();
                final selected = value?.toString() ?? '';
                if (source is String &&
                    {
                      'clients',
                      'contacts',
                      'quotes',
                      'opportunities',
                      'templates',
                      'currencies',
                      'owners'
                    }.contains(source)) {
                  child = MarketingOptionField(
                    key: ValueKey('$name-$selected'),
                    label: '$label${required ? ' *' : ''}',
                    value: selected,
                    options: source == 'quotes'
                        ? [
                            for (final quote in marketingQuoteOptions(bootstrap,
                                clientId:
                                    values['client_id']?.toString() ?? ''))
                              {
                                ...quote,
                                'name': marketingQuoteLabel(quote, bootstrap)
                              }
                          ]
                        : filtered,
                    onChanged: update,
                    validator: (v) => validate(
                        filtered.any((o) => '${o['id']}' == v) ? v : ''),
                  );
                } else {
                  child = DropdownButtonFormField<String>(
                    key: ValueKey('$name-$selected'),
                    isExpanded: true,
                    decoration: decoration(),
                    validator: validate,
                    initialValue:
                        filtered.any((o) => o['id'].toString() == selected)
                            ? selected
                            : '',
                    items: [
                      const DropdownMenuItem(value: '', child: Text('—')),
                      ...filtered.map(
                        (o) => DropdownMenuItem<String>(
                          value: o['id'].toString(),
                          child: Text(o['name'].toString()),
                        ),
                      ),
                    ],
                    onChanged: update,
                  );
                }
              } else if (type == 'date' || type == 'datetime-local') {
                child = TextFormField(
                  key: ValueKey('$name-$value'),
                  initialValue: (value ?? '').toString().isEmpty
                      ? ''
                      : type == 'datetime-local'
                          ? marketingDateLabel(context, value, relative: false)
                          : DateTime.tryParse('$value') == null
                              ? '$value'
                              : MaterialLocalizations.of(context)
                                  .formatMediumDate(DateTime.parse('$value')),
                  readOnly: true,
                  validator: validate,
                  decoration: decoration(
                    suffixIcon: IconButton(
                      tooltip:
                          MaterialLocalizations.of(context).deleteButtonTooltip,
                      icon: const Icon(Icons.clear),
                      onPressed: () => update(''),
                    ),
                  ),
                  onTap: () async {
                    final parsed = (type == 'datetime-local'
                            ? marketingUtcDate(value)?.toLocal()
                            : DateTime.tryParse('$value')) ??
                        DateTime.now();
                    final day = await showDatePicker(
                      context: context,
                      initialDate: parsed,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (day == null || !context.mounted) {
                      return;
                    }
                    if (type == 'date') {
                      update(day.toIso8601String().substring(0, 10));
                      return;
                    }
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(parsed),
                    );
                    if (time == null) {
                      return;
                    }
                    update(
                      DateTime(
                        day.year,
                        day.month,
                        day.day,
                        time.hour,
                        time.minute,
                      ).toUtc().toIso8601String().substring(0, 16),
                    );
                  },
                );
              } else {
                child = TextFormField(
                  key: name == 'consent_source'
                      ? ValueKey(
                          '$name-${values['client_id']}-${values['contact_id']}')
                      : null,
                  initialValue: {'amount', 'budget'}.contains(name)
                      ? marketingPriceInput(value ?? '')
                      : value?.toString() ?? '',
                  inputFormatters: {'amount', 'budget'}.contains(name)
                      ? [
                          TextInputFormatter.withFunction(
                              (oldValue, newValue) =>
                                  RegExp(r'^\d*(?:[.,]\d{0,2})?$')
                                          .hasMatch(newValue.text)
                                      ? newValue
                                      : oldValue),
                        ]
                      : null,
                  decoration: decoration(),
                  validator: validate,
                  minLines: type == 'textarea' ? 3 : 1,
                  maxLines: type == 'textarea' ? 8 : 1,
                  keyboardType: type == 'number'
                      ? const TextInputType.numberWithOptions(decimal: true)
                      : TextInputType.multiline,
                  onChanged: (v) => update(type == 'number'
                      ? (num.tryParse({'amount', 'budget'}.contains(name)
                              ? v.replaceAll(',', '.')
                              : v) ??
                          v)
                      : v),
                );
              }
              final wide = {'boolean', 'textarea', 'list'}.contains(type) ||
                  name == 'title';
              return SizedBox(
                width: responsive && constraints.maxWidth >= 600 && !wide
                    ? (constraints.maxWidth - 16) / 2
                    : constraints.maxWidth,
                child: Padding(
                  key: ValueKey(name),
                  padding: const EdgeInsets.only(bottom: 14),
                  child: child,
                ),
              );
            }).toList());
      });
}
