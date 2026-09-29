import 'dart:async';
import 'package:invoiceninja_flutter/redux/quote/quote_actions.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:invoiceninja_flutter/constants.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/data/web_client.dart';
import 'package:invoiceninja_flutter/redux/app/app_actions.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:invoiceninja_flutter/redux/settings/settings_actions.dart';

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
    };

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
  const MarketingScreen({super.key, this.quoteId});
  final String? quoteId;
  static const route = '/marketing';
  @override
  Widget build(BuildContext context) => StoreBuilder<AppState>(
        builder: (context, store) => _MarketingWorkspace(
          key: ValueKey('${store.state.company.id}-$quoteId'),
          quoteId: quoteId,
          state: store.state,
        ),
      );
}

class _MarketingWorkspace extends StatefulWidget {
  const _MarketingWorkspace({super.key, required this.state, this.quoteId});
  final String? quoteId;
  final AppState state;
  @override
  State<_MarketingWorkspace> createState() => _MarketingWorkspaceState();
}

class _MarketingWorkspaceState extends State<_MarketingWorkspace> {
  Map<String, dynamic>? _bootstrap;
  List<dynamic> _records = [];
  List<dynamic>? _allOpportunities;
  bool _board = true, _cacheDirty = false, _viewInitialized = false;
  String _tab = 'opportunities',
      _search = '',
      _filter = '',
      _opportunity = '',
      _error = '';
  bool _busy = false, _archived = false;
  int _page = 1, _lastPage = 1, _generation = 0;
  String _language = '', _quoteChoice = '', _worklist = '';
  final _searchController = TextEditingController();
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  bool _openedQuote = false;
  final Set<String> _selected = {};
  String text(String key) => _bootstrap?['labels'][key]?.toString() ?? key;
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
    const client = WebClient();
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
      final query = Uri(
        queryParameters: {
          'page': '$_page',
          'worklist': _worklist,
          'q': _search,
          'archived': _archived ? '1' : '0',
          if (_tab == 'opportunities')
            'stage_id': _filter
          else
            'state': _filter,
          'opportunity_id': _opportunity,
        },
      ).query;
      final filtered = marketingFilterOpportunities(
        pipeline,
        Map<String, dynamic>.from(bootstrap['data']),
        search: _search,
        stage: _filter,
        archived: _archived,
        opportunity: _opportunity,
        worklist: _worklist,
      );
      final records = _tab == 'opportunities'
          ? {
              'data': _board
                  ? filtered
                  : filtered.skip((_page - 1) * 50).take(50).toList(),
              'last_page':
                  _board ? 1 : ((filtered.length + 49) ~/ 50).clamp(1, 1000000),
            }
          : await api('GET', '$_tab?$query');
      if (mounted && generation == _generation)
        setState(() {
          _bootstrap = Map<String, dynamic>.from(bootstrap['data']);
          _allOpportunities = pipeline;
          _cacheDirty = false;
          _records = records['data'];
          _lastPage = records['last_page'];
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
        _opportunity = record['id'];
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
    setState(() {
      _tab = value == 'due' ? 'activities' : 'opportunities';
      _worklist = value;
      _opportunity = '';
      _filter = '';
      _search = '';
      _searchController.clear();
      _archived = false;
      _page = 1;
    });
    _load();
  }

  Future<void> _quickFollowup(Map<String, dynamic> record) async {
    setState(() {
      _tab = 'activities';
      _opportunity = record['id'];
      _filter = 'pending';
      _worklist = '';
      _page = 1;
    });
    await _edit();
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

  Future<void> _edit([Map<String, dynamic>? record]) async {
    final fields = _bootstrap!['fields'][_tab] as List<dynamic>;
    final values = record ??
        marketingInitial(fields, {
          ...Map<String, dynamic>.from(_bootstrap!['defaults']),
          'opportunity_id': _opportunity,
          'kind': 'task',
          if (_tab == 'activities') 'title': text('add_followup'),
          'due_at': DateTime.now().toUtc().toIso8601String().substring(0, 16),
        });
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => _MarketingEditor(
        title: '${text(record == null ? 'new' : 'edit')} · ${text(_tab)}',
        fields: fields,
        values: values,
        bootstrap: _bootstrap!,
        save: (updated) => api(
          record == null ? 'POST' : 'PUT',
          '$_tab${record == null ? '' : '/${record['id']}'}',
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
            ? _bootstrap!['config']['offer_sequence_${record['locale']}']
            : '';
    String error = '';
    bool busy = false;
    await showDialog<void>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setLocal) => AlertDialog(
          title: Text(text('enroll')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                isExpanded: true,
                decoration: InputDecoration(labelText: text('sequence')),
                initialValue: selected,
                items: [
                  const DropdownMenuItem(value: '', child: Text('—')),
                  ...(_bootstrap!['config']['sequences'] as List).map(
                    (s) => DropdownMenuItem<String>(
                      value: s['id'],
                      child: Text(s['name']),
                    ),
                  ),
                ],
                onChanged:
                    busy ? null : (v) => setLocal(() => selected = v ?? ''),
              ),
              if (error.isNotEmpty) Text(error),
            ],
          ),
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
                            if (record == null) 'ids': _selected.toList(),
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

  Widget _sectionTitle(String title, {IconData? icon}) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          children: [
            if (icon != null) ...[
              Icon(icon,
                  size: 20, color: Theme.of(context).colorScheme.primary),
              const SizedBox(width: 8),
            ],
            Expanded(
              child:
                  Text(title, style: Theme.of(context).textTheme.titleMedium),
            ),
          ],
        ),
      );

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
            child: Text(
              next == null
                  ? text('needs_followup')
                  : '${next['title']} · ${next['due_at']}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );

  Future<void> _openQuoteRecord(Map<String, dynamic> record) async {
    try {
      final store = StoreProvider.of<AppState>(context);
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

  Widget _kanbanCard(Map<String, dynamic> record, Map<String, dynamic> stage) {
    final next = record['next_activity'];
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              record['title'],
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
            Text(
              optionName('clients', record['client_id']),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 12),
            Text(
              '${record['amount']} ${optionName('currencies', record['currency_id'])}',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 12),
            _nextAction(next),
            if (allowed('edit'))
              DropdownButtonFormField<String>(
                key: ValueKey(
                  '${record['id']}-${record['revision']}-${record['stage_id']}',
                ),
                initialValue: record['stage_id'],
                isExpanded: true,
                decoration: InputDecoration(labelText: text('stage_id')),
                items: [
                  for (final s in _bootstrap!['config']['stages'])
                    DropdownMenuItem<String>(
                      value: s['id'],
                      child: Text(s['name']),
                    ),
                ],
                onChanged: _busy
                    ? null
                    : (value) {
                        if (value != null) {
                          _moveStage(record, value);
                        }
                      },
              ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: [
                if (allowed('edit'))
                  TextButton(
                    onPressed: _busy ? null : () => _edit(record),
                    child: Text(text('edit')),
                  ),
                TextButton(
                  onPressed: _busy
                      ? null
                      : () {
                          setState(() {
                            _tab = 'activities';
                            _filter = '';
                            _worklist = '';
                            _opportunity = record['id'];
                            _page = 1;
                          });
                          _load();
                        },
                  child: Text(text('history')),
                ),
                if ((record['quote_id'] ?? '').toString().isNotEmpty)
                  TextButton(
                    onPressed: _busy ? null : () => _openQuoteRecord(record),
                    child: Text(text('view_quote')),
                  ),
                if (allowed('edit'))
                  TextButton.icon(
                    onPressed:
                        _busy ? null : () => _removeFromMarketing(record),
                    icon: const Icon(Icons.remove_circle_outline, size: 18),
                    label: Text(text('remove_from_marketing')),
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.error,
                    ),
                  ),
                if (allowed('create') &&
                    record['archived'] != true &&
                    stage['outcome'] == 'open')
                  TextButton(
                    onPressed: _busy ? null : () => _quickFollowup(record),
                    child: Text(text('add_followup')),
                  ),
                if (allowed('edit') &&
                    record['archived'] != true &&
                    stage['outcome'] == 'open')
                  TextButton(
                    onPressed: _busy ? null : () => _enroll(record),
                    child: Text(text('enroll')),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _kanban() => SizedBox(
        height: 600,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final rawStage in _bootstrap!['config']['stages'])
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
                        width: 320,
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
                                Badge(label: Text('${cards.length}')),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Expanded(
                              child: ListView(
                                children: [
                                  for (final raw in cards)
                                    Builder(
                                      builder: (context) {
                                        final record =
                                            Map<String, dynamic>.from(
                                          raw,
                                        );
                                        final card = _kanbanCard(record, stage);
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

  @override
  Widget build(BuildContext context) {
    if (widget.state.company.enabledModules & kModuleMarketing == 0)
      return Scaffold(
        appBar: AppBar(title: Text(marketingTitle(context))),
        body: const Center(child: Text('403')),
      );
    final bootstrap = _bootstrap;
    return Scaffold(
      appBar: AppBar(
        title: Text(marketingTitle(context)),
        actions: [
          IconButton(
            tooltip: text('refresh'),
            onPressed: _busy ? null : () => _load(refresh: true),
            icon: const Icon(Icons.refresh),
          ),
          if (allowed('configure'))
            IconButton(
              tooltip: text('settings'),
              onPressed: _busy ? null : _settings,
              icon: const Icon(Icons.settings),
            ),
        ],
      ),
      floatingActionButton: allowed('create')
          ? FloatingActionButton(
              tooltip: text('new'),
              onPressed: _busy ? null : () => _edit(),
              child: const Icon(Icons.add),
            )
          : null,
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 96),
        children: [
          if (_busy) const LinearProgressIndicator(),
          if (_error.isNotEmpty)
            Card(
              color: Theme.of(context).colorScheme.errorContainer,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SelectableText(
                  _error,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onErrorContainer,
                  ),
                ),
              ),
            ),
          if (bootstrap != null) ...[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SegmentedButton<String>(
                segments: [
                  ButtonSegment(
                    value: 'opportunities',
                    icon: const Icon(Icons.view_kanban_outlined),
                    label: Text(text('opportunities')),
                  ),
                  ButtonSegment(
                    value: 'activities',
                    icon: const Icon(Icons.event_note_outlined),
                    label: Text(text('activities')),
                  ),
                ],
                selected: {_tab},
                onSelectionChanged: _busy
                    ? null
                    : (values) {
                        setState(() {
                          _tab = values.first;
                          _worklist = '';
                          _opportunity = '';
                          _filter = '';
                          _page = 1;
                        });
                        _load();
                      },
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                FilterChip(
                  label: Text(
                    '${text('due_work')} · ${bootstrap['workload']?['due'] ?? 0}',
                  ),
                  selected: _worklist == 'due',
                  onSelected: _busy ? null : (_) => _showWork('due'),
                ),
                FilterChip(
                  label: Text(
                    '${text('needs_followup')} · ${bootstrap['workload']?['needs_followup'] ?? 0}',
                  ),
                  selected: _worklist == 'needs_followup',
                  onSelected: _busy ? null : (_) => _showWork('needs_followup'),
                ),
                if (_worklist.isNotEmpty || _opportunity.isNotEmpty)
                  ActionChip(
                    label: Text(text('show_all')),
                    onPressed: _busy
                        ? null
                        : () {
                            setState(() {
                              _worklist = '';
                              _opportunity = '';
                              _filter = '';
                            });
                            _load();
                          },
                  ),
              ],
            ),
            if (_tab == 'opportunities' && allowed('create')) ...[
              const SizedBox(height: 20),
              Card.filled(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _sectionTitle(
                        text('from_quote'),
                        icon: Icons.description_outlined,
                      ),
                      Text(text('quote_start_help')),
                      const SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        isExpanded: true,
                        initialValue: _quoteChoice,
                        decoration: InputDecoration(
                          labelText: text('quote_id'),
                          border: const OutlineInputBorder(),
                        ),
                        items: [
                          const DropdownMenuItem(value: '', child: Text('—')),
                          ...(bootstrap['options']['quotes'] as List).map(
                            (q) => DropdownMenuItem<String>(
                              value: q['id'],
                              child: Text(
                                '${q['name']} · ${optionName('clients', q['client_id'])}',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                        onChanged: _busy
                            ? null
                            : (v) => setState(() => _quoteChoice = v ?? ''),
                      ),
                      const SizedBox(height: 12),
                      FilledButton.icon(
                        onPressed: _busy || _quoteChoice.isEmpty
                            ? null
                            : () => _fromQuote(_quoteChoice),
                        icon: const Icon(Icons.track_changes),
                        label: Text(text('from_quote')),
                      ),
                    ],
                  ),
                ),
              ),
            ],
            if (_tab == 'opportunities') ...[
              const SizedBox(height: 24),
              _sectionTitle(text('forecast'), icon: Icons.insights_outlined),
              for (final f in bootstrap['forecast'])
                Card.outlined(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          optionName('currencies', f['currency_id']),
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(height: 8),
                        Text('${text('open')}: ${f['open']}'),
                        Text('${text('forecast')}: ${f['weighted']}'),
                        Text(
                          '${text('won')}: ${f['won']} · ${text('lost')}: ${f['lost']}',
                        ),
                      ],
                    ),
                  ),
                ),
            ],
            const SizedBox(height: 24),
            TextField(
              controller: _searchController,
              onChanged: _tab == 'opportunities'
                  ? (value) {
                      _search = value;
                      _page = 1;
                      _load();
                    }
                  : null,
              decoration: InputDecoration(
                labelText: text('search'),
                suffixIcon: const Icon(Icons.search),
              ),
              onSubmitted: (value) {
                _search = value;
                _page = 1;
                _load();
              },
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              key: ValueKey('$_tab-$_filter-filter'),
              isExpanded: true,
              initialValue: _filter,
              decoration: InputDecoration(
                labelText: text(_tab == 'opportunities' ? 'stage_id' : 'state'),
              ),
              items: [
                DropdownMenuItem(value: '', child: Text(text('all'))),
                if (_tab == 'opportunities')
                  ...(bootstrap['config']['stages'] as List).map(
                    (s) => DropdownMenuItem<String>(
                      value: s['id'],
                      child: Text(s['name']),
                    ),
                  )
                else
                  ...[
                    'pending',
                    'sent',
                    'failed',
                    'sending',
                    'done',
                    'cancelled',
                  ].map(
                    (s) => DropdownMenuItem(value: s, child: Text(text(s))),
                  ),
              ],
              onChanged: _busy
                  ? null
                  : (v) {
                      setState(() {
                        _filter = v ?? '';
                        _page = 1;
                      });
                      _load();
                    },
            ),
            if (_tab == 'opportunities')
              CheckboxListTile(
                title: Text(text('archived')),
                value: _archived,
                onChanged: _busy
                    ? null
                    : (v) {
                        setState(() {
                          _archived = v ?? false;
                          _page = 1;
                        });
                        _load();
                      },
              ),
            if (_tab == 'activities')
              DropdownButtonFormField<String>(
                key: ValueKey('opportunity-$_opportunity'),
                isExpanded: true,
                initialValue:
                    (bootstrap['options']['opportunities'] as List).any(
                  (o) => o['id'] == _opportunity,
                )
                        ? _opportunity
                        : '',
                decoration: InputDecoration(labelText: text('opportunity_id')),
                items: [
                  DropdownMenuItem(value: '', child: Text(text('all'))),
                  ...(bootstrap['options']['opportunities'] as List).map(
                    (o) => DropdownMenuItem<String>(
                      value: o['id'],
                      child: Text(o['name']),
                    ),
                  ),
                ],
                onChanged: _busy
                    ? null
                    : (v) {
                        setState(() {
                          _opportunity = v ?? '';
                          _page = 1;
                        });
                        _load();
                      },
              ),
            if (_tab == 'opportunities' && !_board && allowed('edit'))
              Wrap(
                spacing: 12,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text('${text('selected')}: ${_selected.length}'),
                  TextButton(
                    onPressed:
                        _busy || _selected.isEmpty ? null : () => _enroll(null),
                    child: Text(text('enroll')),
                  ),
                  TextButton(
                    onPressed: () => setState(() => _selected.clear()),
                    child: Text(text('cancel')),
                  ),
                ],
              ),
            const SizedBox(height: 16),
            if (_tab == 'opportunities')
              Align(
                alignment: Alignment.centerLeft,
                child: SegmentedButton<bool>(
                  segments: [
                    ButtonSegment(
                      value: true,
                      icon: const Icon(Icons.view_kanban_outlined),
                      label: Text(text('board')),
                    ),
                    ButtonSegment(
                      value: false,
                      icon: const Icon(Icons.view_list_outlined),
                      label: Text(text('list')),
                    ),
                  ],
                  selected: {_board},
                  onSelectionChanged: _busy
                      ? null
                      : (values) {
                          setState(() {
                            _board = values.first;
                            _page = 1;
                            _selected.clear();
                          });
                          _load();
                        },
                ),
              ),
            if (_records.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Column(
                  children: [
                    Icon(
                      Icons.inbox_outlined,
                      size: 40,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      text('empty'),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            if (_tab == 'opportunities' && _board) _kanban(),
            for (final raw
                in (_tab == 'opportunities' && _board ? [] : _records))
              Builder(
                builder: (context) {
                  final record = Map<String, dynamic>.from(raw);
                  return Card.outlined(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              if (_tab == 'opportunities' && allowed('edit'))
                                Checkbox(
                                  value: _selected.contains(record['id']),
                                  onChanged: _busy
                                      ? null
                                      : (value) => setState(() {
                                            if (value == true) {
                                              _selected.add(record['id']);
                                            } else {
                                              _selected.remove(record['id']);
                                            }
                                          }),
                                ),
                              Expanded(
                                child: Text(
                                  record['title'],
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Chip(
                              label: Text(
                                _tab == 'opportunities'
                                    ? optionName('stages', record['stage_id'])
                                    : text(record['state']),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          if (_tab == 'opportunities') ...[
                            Text(optionName('clients', record['client_id'])),
                            const SizedBox(height: 4),
                            Text(
                              '${record['amount']} ${optionName('currencies', record['currency_id'])}',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(height: 12),
                            _nextAction(record['next_activity']),
                          ] else
                            Text('${record['due_at']} UTC'),
                          if ((record['notes'] ?? '')
                              .toString()
                              .isNotEmpty) ...[
                            const SizedBox(height: 8),
                            Text(record['notes']),
                          ],
                          if (record['error'] != null)
                            Text(
                              record['error'],
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.error,
                              ),
                            ),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 8,
                            runSpacing: 4,
                            children: [
                              if (allowed('edit') &&
                                  (_tab == 'opportunities' ||
                                      record['state'] == 'pending'))
                                TextButton(
                                  onPressed: _busy ? null : () => _edit(record),
                                  child: Text(text('edit')),
                                ),
                              if (_tab == 'opportunities') ...[
                                if (allowed('create') &&
                                    record['archived'] != true &&
                                    (bootstrap['config']['stages'] as List).any(
                                      (s) =>
                                          s['id'] == record['stage_id'] &&
                                          s['outcome'] == 'open',
                                    ))
                                  TextButton(
                                    onPressed: _busy
                                        ? null
                                        : () => _quickFollowup(record),
                                    child: Text(text('add_followup')),
                                  ),
                                TextButton(
                                  onPressed: _busy
                                      ? null
                                      : () {
                                          setState(() {
                                            _tab = 'activities';
                                            _filter = '';
                                            _opportunity = record['id'];
                                            _page = 1;
                                          });
                                          _load();
                                        },
                                  child: Text(text('history')),
                                ),
                                if (allowed('edit'))
                                  TextButton(
                                    onPressed:
                                        _busy ? null : () => _enroll(record),
                                    child: Text(text('enroll')),
                                  ),
                                if (allowed('edit'))
                                  TextButton.icon(
                                    onPressed: _busy
                                        ? null
                                        : () => _removeFromMarketing(record),
                                    icon: const Icon(
                                      Icons.remove_circle_outline,
                                      size: 18,
                                    ),
                                    label: Text(text('remove_from_marketing')),
                                    style: TextButton.styleFrom(
                                      foregroundColor: Theme.of(
                                        context,
                                      ).colorScheme.error,
                                    ),
                                  ),
                                TextButton(
                                  onPressed: _busy
                                      ? null
                                      : () async {
                                          try {
                                            final store =
                                                StoreProvider.of<AppState>(
                                              context,
                                            );
                                            if ((record['quote_id'] ?? '')
                                                .toString()
                                                .isNotEmpty) {
                                              if (store
                                                      .state
                                                      .quoteState
                                                      .map[record['quote_id']]
                                                      ?.isLoaded !=
                                                  true) {
                                                final completer =
                                                    Completer<void>();
                                                store.dispatch(
                                                  LoadQuote(
                                                    quoteId: record['quote_id'],
                                                    completer: completer,
                                                  ),
                                                );
                                                await completer.future;
                                              }
                                              if (mounted)
                                                viewEntityById(
                                                  entityId: record['quote_id'],
                                                  entityType: EntityType.quote,
                                                  force: true,
                                                );
                                            } else {
                                              createEntity(
                                                entity: InvoiceEntity(
                                                  state: store.state,
                                                  client: store
                                                      .state
                                                      .clientState
                                                      .map[record['client_id']],
                                                  entityType: EntityType.quote,
                                                ),
                                              );
                                            }
                                          } catch (e) {
                                            if (mounted)
                                              setState(
                                                () => _error = e.toString(),
                                              );
                                          }
                                        },
                                  child: Text(
                                    text(
                                      (record['quote_id'] ?? '')
                                              .toString()
                                              .isNotEmpty
                                          ? 'view_quote'
                                          : 'create_quote',
                                    ),
                                  ),
                                ),
                              ] else ...[
                                if (record['kind'] == 'email')
                                  TextButton(
                                    onPressed:
                                        _busy ? null : () => _preview(record),
                                    child: Text(text('preview')),
                                  ),
                                if (allowed('edit') &&
                                    record['state'] == 'pending') ...[
                                  if (record['kind'] != 'email')
                                    TextButton(
                                      onPressed: _busy
                                          ? null
                                          : () => _action(record, 'complete'),
                                      child: Text(text('complete')),
                                    ),
                                  TextButton(
                                    onPressed: _busy
                                        ? null
                                        : () => _action(record, 'cancel'),
                                    child: Text(text('cancel')),
                                  ),
                                ],
                              ],
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: _busy || _page == 1
                      ? null
                      : () {
                          _page--;
                          _load();
                        },
                  child: Text(text('previous')),
                ),
                Text('${text('page')} $_page / $_lastPage'),
                TextButton(
                  onPressed: _busy || _page >= _lastPage
                      ? null
                      : () {
                          _page++;
                          _load();
                        },
                  child: Text(text('next')),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _MarketingEditor extends StatefulWidget {
  const _MarketingEditor({
    required this.title,
    required this.fields,
    required this.values,
    required this.bootstrap,
    required this.save,
  });
  final String title;
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
  String text(String key) => widget.bootstrap['labels'][key]?.toString() ?? key;
  @override
  Widget build(BuildContext context) => PopScope(
        canPop: !busy,
        child: AlertDialog(
          title: Text(widget.title),
          content: SizedBox(
            width: 800,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MarketingFields(
                    fields: widget.fields,
                    values: values,
                    bootstrap: widget.bootstrap,
                    config:
                        Map<String, dynamic>.from(widget.bootstrap['config']),
                    onChanged: (v) => setState(() => values = v),
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
              onPressed: busy ? null : () => Navigator.pop(context),
              child: Text(text('cancel')),
            ),
            FilledButton(
              onPressed: busy
                  ? null
                  : () async {
                      setState(() => busy = true);
                      try {
                        await widget.save(values);
                        if (context.mounted) {
                          Navigator.pop(context);
                        }
                      } catch (e) {
                        if (mounted)
                          setState(() {
                            error = e.toString();
                            busy = false;
                          });
                      }
                    },
              child: Text(text('save')),
            ),
          ],
        ),
      );
}

class MarketingFields extends StatelessWidget {
  const MarketingFields({
    super.key,
    required this.fields,
    required this.values,
    required this.bootstrap,
    required this.config,
    required this.onChanged,
  });
  final List<dynamic> fields;
  final Map<String, dynamic> values, bootstrap, config;
  final ValueChanged<Map<String, dynamic>> onChanged;
  String text(String key) => bootstrap['labels'][key]?.toString() ?? key;
  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: fields.map<Widget>((field) {
          final name = field['name'] as String;
          final type = field['type'];
          final value = values[name];
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
            child = DropdownButtonFormField<String>(
              isExpanded: true,
              decoration: InputDecoration(labelText: text(name)),
              initialValue: filtered.any((o) => o['id'].toString() == selected)
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
          } else if (type == 'date' || type == 'datetime-local') {
            child = TextFormField(
              key: ValueKey('$name-$value'),
              initialValue: value?.toString() ?? '',
              readOnly: true,
              decoration: InputDecoration(
                labelText: text(name),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () => update(''),
                ),
              ),
              onTap: () async {
                final parsed = DateTime.tryParse(value?.toString() ?? '') ??
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
                  DateTime.utc(
                    day.year,
                    day.month,
                    day.day,
                    time.hour,
                    time.minute,
                  ).toIso8601String().substring(0, 16),
                );
              },
            );
          } else {
            child = TextFormField(
              initialValue: value?.toString() ?? '',
              decoration: InputDecoration(labelText: text(name)),
              minLines: type == 'textarea' ? 3 : 1,
              maxLines: type == 'textarea' ? 8 : 1,
              keyboardType: type == 'number'
                  ? const TextInputType.numberWithOptions(decimal: true)
                  : TextInputType.multiline,
              onChanged: (v) =>
                  update(type == 'number' ? (num.tryParse(v) ?? v) : v),
            );
          }
          return Padding(
            key: ValueKey(name),
            padding: const EdgeInsets.only(bottom: 14),
            child: child,
          );
        }).toList(),
      );
}
