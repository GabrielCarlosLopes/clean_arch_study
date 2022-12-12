import 'package:faker/faker.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class HttpAdatper {
  final Client client;

  HttpAdatper(this.client);

  Future<void> request({
    @required String url,
    @required String method,
  }) async {
    final headers = {
      'content-type': 'application/json',
      'accept': 'application/json'
    };
    await client.post(url, headers: headers);
  }
}

class ClientSpy extends Mock implements Client {}

HttpAdatper sut;
ClientSpy client;
String url;

void main() {
  setUp(() {
    client = ClientSpy();
    sut = HttpAdatper(client);
    url = faker.internet.httpUrl();
  });

  group('post', () {
    test('Should call post with correct values', () async {
      await sut.request(url: url, method: 'post');

      verify(client.post(
        url,
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json'
        },
      ));
    });
  });
}
