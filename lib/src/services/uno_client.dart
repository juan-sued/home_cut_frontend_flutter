import 'package:home_cut/src/services/http_client_interface.dart';
import 'package:uno/uno.dart';

class UnoClient implements IHttpClient {
  final uno = Uno();

  @override
  Future<dynamic> get(String url) async {
    try {
      final response = await uno.get(url);
      return response.data;
    } on UnoError catch (e) {
      throw e;
    }
  }
}
