import 'package:http/http.dart' as http;

abstract class IHttpClient {
  Future get({required String url});
}

class HttpCLient implements IHttpClient {
  @override
  Future<http.Response> get({required String url}) async {
    return await http.get(Uri.parse(url));
  }
}
