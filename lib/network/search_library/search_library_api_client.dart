import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lib_search_app/network/entity/library.dart';

class SearchLibraryApiClient {
  final baseUrl = 'https://api.calil.jp/library?';

  Future<List<Library>> searchLibrary(double latitude, double longitude) async {
    final url = _createRequestUri(latitude, longitude);
    print(url);
    try {
      final response = await http.get(url, headers: {'Content-Type': 'application/json'});
      if (response.statusCode != 200) {
        throw const FormatException('network error');
      }
      final jsonBody = json.decode(response.body) as List<dynamic>;
      print(jsonBody);
      final jsonList = jsonBody.cast<Map<String, dynamic>>();
      final list = jsonList.map(Library.formJson);
      return list.toList();
    } on Exception catch (e) {
      return Future.error(e);
    }
  }

  Uri _createRequestUri(double latitude, double longitude) {
    var params = 'appkey=ee9d6e54dd4601e91d0d962975ff704d';
    params += '&geocode=$longitude,$latitude';
    params += '&format=json';
    params += '&callback=';
    return Uri.parse(baseUrl + params);
  }
}