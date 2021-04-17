
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:lib_search_app/network/response/item.dart';

abstract class SearchBookApiClient {
  Future<String> get(String endpoint);
}

class SearchBookApiClientImpl implements SearchBookApiClient {
  @override
  Future<String> get(String endpoint) async {
    final url = Uri.parse('https://app.rakuten.co.jp/services/api/BooksBook/Search/20170404/?applicationId=1032630259901986279');
    try {
      final response = await http.get(url);
      if (response.statusCode != 200) {
        throw Exception('failed');
      }
      // final jsonBody = json.decode(response.body) as Map<String, dynamic>;
      // final jsonList = (jsonBody['Items'] as List).cast<Map<String, dynamic>>();
      // final list = jsonList.map(Item.fromCustomJson);
      print(response.body);
      return response.body;
    } on SocketException {
      throw Exception('No Internet connection');
    }


    throw UnimplementedError();
  }

    // Uri.parse('),);

  
}
