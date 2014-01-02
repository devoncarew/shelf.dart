library harness_console;

import 'dart:io';
import 'package:unittest/unittest.dart';
import 'package:unittest/vm_config.dart';

import 'package:shelf/shelf.dart';

main() {
  testCore(new VMConfiguration());
}

void testCore(Configuration config) {
  unittestConfiguration = config;
  groupSep = ' - ';

  test('default should be 404', () {

    var request = new _RequestMock();

    return startShelf()
        .handleRequest(request)
        .then((ShelfResponse response) {
          expect(response.code, 404);
        });
  });

}

class _RequestMock implements HttpRequest {
  final Uri uri;
  final String method;

  _RequestMock({Uri uri, this.method: 'GET'}) :
    this.uri = (uri == null) ? new Uri(path:'/') : uri;
}
