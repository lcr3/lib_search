
import 'dart:io';
import 'package:http/http.dart' as http;

abstract class SearchBookApiClient {
  Future<String> get(String endpoint);
}

class SearchBookApiClientImpl implements SearchBookApiClient {
  final baseUrl = 'https://app.rakuten.co.jp/services/api/BooksBook/Search/20170404/';

  @override
  Future<String> get(String endpoint) async {
    final url = _createRequestUrl(endpoint);
    try {
      final response = await http.get(url);
      if (response.statusCode != 200) {
        throw const FormatException('network error');
      }
      print(response.body);
      return response.body;
    } on Exception catch(e) {
      return Future.error(e);
    }
  }

  Uri _createRequestUrl(String searchText) {
    var uri = '$baseUrl?applicationId=1032630259901986279';
    if (searchText.isNotEmpty) {
        uri += '&title=$searchText';
    }
    return Uri.parse(uri);
  }
}