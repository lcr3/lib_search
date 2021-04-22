import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lib_search_app/network/entity/library_stock_response.dart';

class LibraryStockApiClient {
  final baseUrl = 'https://api.calil.jp/check?';

  @override
  Future<LibraryListResponse> searchStockPauling(String session, String isbn, List<String> libIds) async {
    final libId = libIds.join(',');
    final url = _createRequestUri(isbn, libId);
    try {
      final response =
          await http.get(url, headers: {'Content-Type': 'application/json'});
      if (response.statusCode != 200) {
        print('error throe');
        throw const FormatException('network error');
      }
      final jsonMap = json.decode(response.body) as Map<String, dynamic>;
      final list = LibraryListResponse.fromJson(jsonMap);
      return list;
    } on Exception catch (e) {
      return Future.error(e);
    }
  }

  Uri _createRequestUri(String isbn, String libIds) {
    var params = 'appkey=ee9d6e54dd4601e91d0d962975ff704d';
    params += '&isbn=$isbn';
    params += '&systemid=$libIds';
    params += '&format=json';
    params += '&callback=no';
    return Uri.parse(baseUrl + params);
  }
}
