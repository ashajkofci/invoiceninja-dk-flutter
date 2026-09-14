import 'dart:async';
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:invoiceninja_flutter/data/web_client.dart';

class _TrackingClient extends http.BaseClient {
  _TrackingClient(this.handler);

  final Future<http.StreamedResponse> Function(http.BaseRequest request)
      handler;
  bool isClosed = false;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) =>
      handler(request);

  @override
  void close() {
    isClosed = true;
  }
}

http.StreamedResponse _jsonResponse(String body) {
  return http.StreamedResponse(
    Stream.value(utf8.encode(body)),
    200,
    headers: const {
      'content-type': 'application/json',
      'x-app-version': '5.11.66',
      'x-minimum-client-version': '5.0.0',
    },
  );
}

void main() {
  test('get decodes JSON and closes the client', () async {
    late Uri requestedUri;
    final client = _TrackingClient((request) async {
      requestedUri = request.url;
      return _jsonResponse('{"data":[{"id":"client_hash"}]}');
    });
    final webClient = WebClient(clientFactory: () => client);

    final response = await webClient.get(
      'https://example.com/api/v1/clients',
      'token',
    ) as Map<String, dynamic>;

    expect(response['data'], [containsPair('id', 'client_hash')]);
    expect(requestedUri.queryParameters['per_page'], '999999');
    expect(requestedUri.queryParameters, contains('t'));
    expect(client.isClosed, isTrue);
  });

  test('get times out and still closes the client', () async {
    final pendingResponse = Completer<http.StreamedResponse>();
    final client = _TrackingClient((_) => pendingResponse.future);
    final webClient = WebClient(
      clientFactory: () => client,
      requestTimeout: const Duration(milliseconds: 10),
    );

    await expectLater(
      webClient.get('https://example.com/api/v1/clients', 'token'),
      throwsA(isA<TimeoutException>()),
    );
    expect(client.isClosed, isTrue);
  });
}
