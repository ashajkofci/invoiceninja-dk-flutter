import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:invoiceninja_flutter/redux/app/app_actions.dart';
import 'package:invoiceninja_flutter/redux/app/app_middleware.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:invoiceninja_flutter/redux/client/client_actions.dart';
import 'package:invoiceninja_flutter/redux/ui/pref_state.dart';

void main() {
  AppState createState({required bool isLarge, required bool isLoaded}) {
    final state = AppState(
      prefState: PrefState(),
      reportErrors: false,
      isWhiteLabeled: false,
    );
    final companyState = state.userCompanyState.rebuild((b) => b
      ..lastUpdated = isLoaded ? 1 : 0
      ..userCompany.company.isLarge = isLarge);

    return state.rebuild(
      (b) => b.userCompanyStates[0] = companyState,
    );
  }

  test('restored unloaded large companies load clients first', () {
    final completer = Completer<Null>();

    final action = initialDataLoadAction(
      createState(isLarge: true, isLoaded: false),
      completer,
    );

    expect(action, isA<LoadClients>());
    expect((action as LoadClients).completer, same(completer));
  });

  test('restored normal state refreshes all data', () {
    final completer = Completer<Null>();

    final action = initialDataLoadAction(
      createState(isLarge: false, isLoaded: false),
      completer,
    );

    expect(action, isA<RefreshData>());
    expect((action as RefreshData).completer, same(completer));
  });
}
