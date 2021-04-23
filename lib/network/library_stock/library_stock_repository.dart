import 'package:lib_search_app/network/entity/library_stock_response.dart';
import 'library_stock_api_client.dart';

// ignore: one_member_abstracts
abstract class LibraryStockUseCase {
  Future<LibraryListResponse?> searchStock(String session, String isbn, List<String> libIds);
}

class LibraryStockRepository implements LibraryStockUseCase {
  LibraryStockRepository(this._apiClient);
  final LibraryStockApiClient _apiClient;
  static const _interval = 2;

  @override
  // ignore: lines_longer_than_80_chars
  Future<LibraryListResponse?> searchStock(String session,
      String isbn,
      List<String> libIds) async {
    try {
      final response = await _apiClient.searchStockPauling(
          session, isbn, libIds);
      if (response.isFinish()) {
        print('検索完了');
        return response;
      }
      print('検索続行');
      // インターバルをおいて再度リクエスト
      Future.delayed(const Duration(seconds: _interval), () {
        searchStock(response.session, isbn, libIds);
      });
    } on FormatException catch (error) {
      return Future.error(error);
    } on Exception catch (error) {
      return Future.error(error);
    }
  }
}