import 'package:get/get.dart';
import 'http_client.dart';

class HttpClientImplementatation implements HttpClient {
  final client = GetConnect();

  @override
  Future<HttpResponse> get(String url) async {
    final response = await client.get(url);
    return HttpResponse(data: response.body, statusCode: response.statusCode);
  }

  @override
  Future<HttpResponse> post(String url,
      {required Map<String, dynamic> body}) async {
    final response = await client.post(url, body);
    return HttpResponse(data: response.body, statusCode: response.statusCode);
  }
}
