// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_ui_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ListUIState> _$listUIStateSerializer = _$ListUIStateSerializer();

class _$ListUIStateSerializer implements StructuredSerializer<ListUIState> {
  @override
  final Iterable<Type> types = const [ListUIState, _$ListUIState];
  @override
  final String wireName = 'ListUIState';

  @override
  Iterable<Object?> serialize(Serializers serializers, ListUIState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'filterClearedAt',
      serializers.serialize(object.filterClearedAt,
          specifiedType: const FullType(int)),
      'sortField',
      serializers.serialize(object.sortField,
          specifiedType: const FullType(String)),
      'sortAscending',
      serializers.serialize(object.sortAscending,
          specifiedType: const FullType(bool)),
      'stateFilters',
      serializers.serialize(object.stateFilters,
          specifiedType:
              const FullType(BuiltList, const [const FullType(EntityState)])),
      'statusFilters',
      serializers.serialize(object.statusFilters,
          specifiedType:
              const FullType(BuiltList, const [const FullType(EntityStatus)])),
      'custom1Filters',
      serializers.serialize(object.custom1Filters,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'custom2Filters',
      serializers.serialize(object.custom2Filters,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'custom3Filters',
      serializers.serialize(object.custom3Filters,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'custom4Filters',
      serializers.serialize(object.custom4Filters,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'custom5Filters',
      serializers.serialize(object.custom5Filters,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'custom6Filters',
      serializers.serialize(object.custom6Filters,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'custom7Filters',
      serializers.serialize(object.custom7Filters,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'custom8Filters',
      serializers.serialize(object.custom8Filters,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];
    Object? value;
    value = object.filter;
    if (value != null) {
      result
        ..add('filter')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.selectedIds;
    if (value != null) {
      result
        ..add('selectedIds')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    return result;
  }

  @override
  ListUIState deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ListUIStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'filter':
          result.filter = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'filterClearedAt':
          result.filterClearedAt = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'sortField':
          result.sortField = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'sortAscending':
          result.sortAscending = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'stateFilters':
          result.stateFilters.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(EntityState)]))!
              as BuiltList<Object?>);
          break;
        case 'statusFilters':
          result.statusFilters.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(EntityStatus)]))!
              as BuiltList<Object?>);
          break;
        case 'custom1Filters':
          result.custom1Filters.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'custom2Filters':
          result.custom2Filters.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'custom3Filters':
          result.custom3Filters.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'custom4Filters':
          result.custom4Filters.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'custom5Filters':
          result.custom5Filters.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'custom6Filters':
          result.custom6Filters.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'custom7Filters':
          result.custom7Filters.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'custom8Filters':
          result.custom8Filters.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'selectedIds':
          result.selectedIds.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$ListUIState extends ListUIState {
  @override
  final String? filter;
  @override
  final int filterClearedAt;
  @override
  final String sortField;
  @override
  final bool sortAscending;
  @override
  final BuiltList<EntityState> stateFilters;
  @override
  final BuiltList<EntityStatus> statusFilters;
  @override
  final BuiltList<String> custom1Filters;
  @override
  final BuiltList<String> custom2Filters;
  @override
  final BuiltList<String> custom3Filters;
  @override
  final BuiltList<String> custom4Filters;
  @override
  final BuiltList<String> custom5Filters;
  @override
  final BuiltList<String> custom6Filters;
  @override
  final BuiltList<String> custom7Filters;
  @override
  final BuiltList<String> custom8Filters;
  @override
  final BuiltList<String>? selectedIds;

  factory _$ListUIState([void Function(ListUIStateBuilder)? updates]) =>
      (ListUIStateBuilder()..update(updates))._build();

  _$ListUIState._(
      {this.filter,
      required this.filterClearedAt,
      required this.sortField,
      required this.sortAscending,
      required this.stateFilters,
      required this.statusFilters,
      required this.custom1Filters,
      required this.custom2Filters,
      required this.custom3Filters,
      required this.custom4Filters,
      required this.custom5Filters,
      required this.custom6Filters,
      required this.custom7Filters,
      required this.custom8Filters,
      this.selectedIds})
      : super._();
  @override
  ListUIState rebuild(void Function(ListUIStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ListUIStateBuilder toBuilder() => ListUIStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ListUIState &&
        filter == other.filter &&
        filterClearedAt == other.filterClearedAt &&
        sortField == other.sortField &&
        sortAscending == other.sortAscending &&
        stateFilters == other.stateFilters &&
        statusFilters == other.statusFilters &&
        custom1Filters == other.custom1Filters &&
        custom2Filters == other.custom2Filters &&
        custom3Filters == other.custom3Filters &&
        custom4Filters == other.custom4Filters &&
        custom5Filters == other.custom5Filters &&
        custom6Filters == other.custom6Filters &&
        custom7Filters == other.custom7Filters &&
        custom8Filters == other.custom8Filters &&
        selectedIds == other.selectedIds;
  }

  int? __hashCode;
  @override
  int get hashCode {
    if (__hashCode != null) return __hashCode!;
    var _$hash = 0;
    _$hash = $jc(_$hash, filter.hashCode);
    _$hash = $jc(_$hash, filterClearedAt.hashCode);
    _$hash = $jc(_$hash, sortField.hashCode);
    _$hash = $jc(_$hash, sortAscending.hashCode);
    _$hash = $jc(_$hash, stateFilters.hashCode);
    _$hash = $jc(_$hash, statusFilters.hashCode);
    _$hash = $jc(_$hash, custom1Filters.hashCode);
    _$hash = $jc(_$hash, custom2Filters.hashCode);
    _$hash = $jc(_$hash, custom3Filters.hashCode);
    _$hash = $jc(_$hash, custom4Filters.hashCode);
    _$hash = $jc(_$hash, custom5Filters.hashCode);
    _$hash = $jc(_$hash, custom6Filters.hashCode);
    _$hash = $jc(_$hash, custom7Filters.hashCode);
    _$hash = $jc(_$hash, custom8Filters.hashCode);
    _$hash = $jc(_$hash, selectedIds.hashCode);
    _$hash = $jf(_$hash);
    return __hashCode ??= _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ListUIState')
          ..add('filter', filter)
          ..add('filterClearedAt', filterClearedAt)
          ..add('sortField', sortField)
          ..add('sortAscending', sortAscending)
          ..add('stateFilters', stateFilters)
          ..add('statusFilters', statusFilters)
          ..add('custom1Filters', custom1Filters)
          ..add('custom2Filters', custom2Filters)
          ..add('custom3Filters', custom3Filters)
          ..add('custom4Filters', custom4Filters)
          ..add('custom5Filters', custom5Filters)
          ..add('custom6Filters', custom6Filters)
          ..add('custom7Filters', custom7Filters)
          ..add('custom8Filters', custom8Filters)
          ..add('selectedIds', selectedIds))
        .toString();
  }
}

class ListUIStateBuilder implements Builder<ListUIState, ListUIStateBuilder> {
  _$ListUIState? _$v;

  String? _filter;
  String? get filter => _$this._filter;
  set filter(String? filter) => _$this._filter = filter;

  int? _filterClearedAt;
  int? get filterClearedAt => _$this._filterClearedAt;
  set filterClearedAt(int? filterClearedAt) =>
      _$this._filterClearedAt = filterClearedAt;

  String? _sortField;
  String? get sortField => _$this._sortField;
  set sortField(String? sortField) => _$this._sortField = sortField;

  bool? _sortAscending;
  bool? get sortAscending => _$this._sortAscending;
  set sortAscending(bool? sortAscending) =>
      _$this._sortAscending = sortAscending;

  ListBuilder<EntityState>? _stateFilters;
  ListBuilder<EntityState> get stateFilters =>
      _$this._stateFilters ??= ListBuilder<EntityState>();
  set stateFilters(ListBuilder<EntityState>? stateFilters) =>
      _$this._stateFilters = stateFilters;

  ListBuilder<EntityStatus>? _statusFilters;
  ListBuilder<EntityStatus> get statusFilters =>
      _$this._statusFilters ??= ListBuilder<EntityStatus>();
  set statusFilters(ListBuilder<EntityStatus>? statusFilters) =>
      _$this._statusFilters = statusFilters;

  ListBuilder<String>? _custom1Filters;
  ListBuilder<String> get custom1Filters =>
      _$this._custom1Filters ??= ListBuilder<String>();
  set custom1Filters(ListBuilder<String>? custom1Filters) =>
      _$this._custom1Filters = custom1Filters;

  ListBuilder<String>? _custom2Filters;
  ListBuilder<String> get custom2Filters =>
      _$this._custom2Filters ??= ListBuilder<String>();
  set custom2Filters(ListBuilder<String>? custom2Filters) =>
      _$this._custom2Filters = custom2Filters;

  ListBuilder<String>? _custom3Filters;
  ListBuilder<String> get custom3Filters =>
      _$this._custom3Filters ??= ListBuilder<String>();
  set custom3Filters(ListBuilder<String>? custom3Filters) =>
      _$this._custom3Filters = custom3Filters;

  ListBuilder<String>? _custom4Filters;
  ListBuilder<String> get custom4Filters =>
      _$this._custom4Filters ??= ListBuilder<String>();
  set custom4Filters(ListBuilder<String>? custom4Filters) =>
      _$this._custom4Filters = custom4Filters;

  ListBuilder<String>? _custom5Filters;
  ListBuilder<String> get custom5Filters =>
      _$this._custom5Filters ??= ListBuilder<String>();
  set custom5Filters(ListBuilder<String>? custom5Filters) =>
      _$this._custom5Filters = custom5Filters;

  ListBuilder<String>? _custom6Filters;
  ListBuilder<String> get custom6Filters =>
      _$this._custom6Filters ??= ListBuilder<String>();
  set custom6Filters(ListBuilder<String>? custom6Filters) =>
      _$this._custom6Filters = custom6Filters;

  ListBuilder<String>? _custom7Filters;
  ListBuilder<String> get custom7Filters =>
      _$this._custom7Filters ??= ListBuilder<String>();
  set custom7Filters(ListBuilder<String>? custom7Filters) =>
      _$this._custom7Filters = custom7Filters;

  ListBuilder<String>? _custom8Filters;
  ListBuilder<String> get custom8Filters =>
      _$this._custom8Filters ??= ListBuilder<String>();
  set custom8Filters(ListBuilder<String>? custom8Filters) =>
      _$this._custom8Filters = custom8Filters;

  ListBuilder<String>? _selectedIds;
  ListBuilder<String> get selectedIds =>
      _$this._selectedIds ??= ListBuilder<String>();
  set selectedIds(ListBuilder<String>? selectedIds) =>
      _$this._selectedIds = selectedIds;

  ListUIStateBuilder();

  ListUIStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _filter = $v.filter;
      _filterClearedAt = $v.filterClearedAt;
      _sortField = $v.sortField;
      _sortAscending = $v.sortAscending;
      _stateFilters = $v.stateFilters.toBuilder();
      _statusFilters = $v.statusFilters.toBuilder();
      _custom1Filters = $v.custom1Filters.toBuilder();
      _custom2Filters = $v.custom2Filters.toBuilder();
      _custom3Filters = $v.custom3Filters.toBuilder();
      _custom4Filters = $v.custom4Filters.toBuilder();
      _custom5Filters = $v.custom5Filters.toBuilder();
      _custom6Filters = $v.custom6Filters.toBuilder();
      _custom7Filters = $v.custom7Filters.toBuilder();
      _custom8Filters = $v.custom8Filters.toBuilder();
      _selectedIds = $v.selectedIds?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ListUIState other) {
    _$v = other as _$ListUIState;
  }

  @override
  void update(void Function(ListUIStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ListUIState build() => _build();

  _$ListUIState _build() {
    _$ListUIState _$result;
    try {
      _$result = _$v ??
          _$ListUIState._(
            filter: filter,
            filterClearedAt: BuiltValueNullFieldError.checkNotNull(
                filterClearedAt, r'ListUIState', 'filterClearedAt'),
            sortField: BuiltValueNullFieldError.checkNotNull(
                sortField, r'ListUIState', 'sortField'),
            sortAscending: BuiltValueNullFieldError.checkNotNull(
                sortAscending, r'ListUIState', 'sortAscending'),
            stateFilters: stateFilters.build(),
            statusFilters: statusFilters.build(),
            custom1Filters: custom1Filters.build(),
            custom2Filters: custom2Filters.build(),
            custom3Filters: custom3Filters.build(),
            custom4Filters: custom4Filters.build(),
            custom5Filters: custom5Filters.build(),
            custom6Filters: custom6Filters.build(),
            custom7Filters: custom7Filters.build(),
            custom8Filters: custom8Filters.build(),
            selectedIds: _selectedIds?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'stateFilters';
        stateFilters.build();
        _$failedField = 'statusFilters';
        statusFilters.build();
        _$failedField = 'custom1Filters';
        custom1Filters.build();
        _$failedField = 'custom2Filters';
        custom2Filters.build();
        _$failedField = 'custom3Filters';
        custom3Filters.build();
        _$failedField = 'custom4Filters';
        custom4Filters.build();
        _$failedField = 'custom5Filters';
        custom5Filters.build();
        _$failedField = 'custom6Filters';
        custom6Filters.build();
        _$failedField = 'custom7Filters';
        custom7Filters.build();
        _$failedField = 'custom8Filters';
        custom8Filters.build();
        _$failedField = 'selectedIds';
        _selectedIds?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ListUIState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
