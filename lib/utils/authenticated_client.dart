import 'package:http/http.dart';

class AuthenticatedClient extends BaseClient {
  Map<String, String> headers;
  final Client client = Client();

  AuthenticatedClient(this.headers);

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    return client.send(request..headers.addAll(headers));
  }
}