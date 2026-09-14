// Package imports:
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

// Project imports:
import 'package:invoiceninja_flutter/data/models/models.dart';

part 'list_ui_state.g.dart';

ListUIState toggleAdditionalCustomFilter(
    ListUIState state, String value, int fieldNumber) {
  final filters = state.getCustomFilters(fieldNumber)!;
  return state.rebuild((b) {
    final shouldRemove = filters.contains(value);
    switch (fieldNumber) {
      case 5:
        shouldRemove
            ? b.custom5Filters.remove(value)
            : b.custom5Filters.add(value);
        break;
      case 6:
        shouldRemove
            ? b.custom6Filters.remove(value)
            : b.custom6Filters.add(value);
        break;
      case 7:
        shouldRemove
            ? b.custom7Filters.remove(value)
            : b.custom7Filters.add(value);
        break;
      case 8:
        shouldRemove
            ? b.custom8Filters.remove(value)
            : b.custom8Filters.add(value);
        break;
    }
  });
}

abstract class ListUIState implements Built<ListUIState, ListUIStateBuilder> {
  factory ListUIState(String sortField, {bool? sortAscending}) {
    return _$ListUIState._(
        filterClearedAt: 0,
        sortField: sortField,
        sortAscending: sortAscending ?? true,
        stateFilters: BuiltList<EntityState>(<EntityState>[
          EntityState.active,
        ]),
        statusFilters: BuiltList<EntityStatus>(),
        custom1Filters: BuiltList<String>(),
        custom2Filters: BuiltList<String>(),
        custom3Filters: BuiltList<String>(),
        custom4Filters: BuiltList<String>(),
        custom5Filters: BuiltList<String>(),
        custom6Filters: BuiltList<String>(),
        custom7Filters: BuiltList<String>(),
        custom8Filters: BuiltList<String>(),
        filter: null);
  }

  ListUIState._();

  @override
  @memoized
  int get hashCode;

  int get tableHashCode =>
      custom1Filters.hashCode ^
      custom2Filters.hashCode ^
      custom3Filters.hashCode ^
      custom4Filters.hashCode ^
      custom5Filters.hashCode ^
      custom6Filters.hashCode ^
      custom7Filters.hashCode ^
      custom8Filters.hashCode ^
      stateFilters.hashCode ^
      statusFilters.hashCode ^
      filterClearedAt.hashCode ^
      filter.hashCode ^
      sortAscending.hashCode ^
      sortField.hashCode;

  String? get filter;

  int get filterClearedAt;

  String get sortField;

  bool get sortAscending;

  BuiltList<EntityState> get stateFilters;

  BuiltList<EntityStatus> get statusFilters;

  BuiltList<String>? getCustomFilters(int fieldNumber) {
    switch (fieldNumber) {
      case 1:
        return custom1Filters;
      case 2:
        return custom2Filters;
      case 3:
        return custom3Filters;
      case 4:
        return custom4Filters;
      case 5:
        return custom5Filters;
      case 6:
        return custom6Filters;
      case 7:
        return custom7Filters;
      case 8:
        return custom8Filters;
      default:
        return null;
    }
  }

  BuiltList<String> get custom1Filters;

  BuiltList<String> get custom2Filters;

  BuiltList<String> get custom3Filters;

  BuiltList<String> get custom4Filters;

  BuiltList<String> get custom5Filters;

  BuiltList<String> get custom6Filters;

  BuiltList<String> get custom7Filters;

  BuiltList<String> get custom8Filters;

  bool get hasStateFilters =>
      stateFilters.length != 1 || stateFilters.first != EntityState.active;

  bool get hasStatusFilters => statusFilters.isNotEmpty;

  bool get hasCustom1Filters => custom1Filters.isNotEmpty;

  bool get hasCustom2Filters => custom2Filters.isNotEmpty;

  bool get hasCustom3Filters => custom3Filters.isNotEmpty;

  bool get hasCustom4Filters => custom4Filters.isNotEmpty;

  bool get hasCustom5Filters => custom5Filters.isNotEmpty;

  bool get hasCustom6Filters => custom6Filters.isNotEmpty;

  bool get hasCustom7Filters => custom7Filters.isNotEmpty;

  bool get hasCustom8Filters => custom8Filters.isNotEmpty;

  BuiltList<String>? get selectedIds;

  bool isInMultiselect() {
    return selectedIds != null;
  }

  bool isSelected(String id) {
    return selectedIds != null && selectedIds!.contains(id);
  }

  //factory EntityUIState([void updates(EntityUIStateBuilder b)]) = _$listUIState;
  static Serializer<ListUIState> get serializer => _$listUIStateSerializer;
}
