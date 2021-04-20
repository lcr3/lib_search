import 'package:flutter_test/flutter_test.dart';
import 'package:lib_search_app/network/search_book_api_client.dart';
import 'package:lib_search_app/network/search_book_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'mock_response.dart';
import 'search_book_repository_test.mocks.dart';

// flutter pub run build_runner build でmockを自動生成
@GenerateMocks([SearchBookApiClient])
void main() {
  // setup
  final mockSetup = MockSearchBookJson();
  final mockJsom = mockSetup.mockResponse;
  final expactResponseBooks = mockSetup.mockBooks;

  group('SearchBookRepository Tests', () {
    final client = MockSearchBookApiClient();

    test('Success repository.searchBook', () async {
      // Mockレスポンスをセット
      when(client.get('レガシーコード')).thenAnswer((_) => Future.value(mockJsom));

      // 検証クラスを初期化
      final repository = SearchBookRepositoryImpl(client);

      // 実行
      final result = await repository.searchBook('レガシーコード');

      // 検証
      expect(result, expactResponseBooks);
      expect(result.length, 2);

      final first = result.first;
      final second = result[1];

      expect(first.title, expactResponseBooks.first.title);
      expect(first.author, expactResponseBooks.first.author);
      expect(first.isbn, expactResponseBooks.first.isbn);
      expect(first.largeImageUrl, expactResponseBooks.first.largeImageUrl);
      expect(second.title, expactResponseBooks[1].title);
      expect(second.author, expactResponseBooks[1].author);
      expect(second.isbn, expactResponseBooks[1].isbn);
      expect(second.largeImageUrl, expactResponseBooks[1].largeImageUrl);
    });

    test('Faild repository.searchBook', () async {
      // Mockレスポンスをセット
      const expectError = FormatException('request error');
      when(client.get('レガシーコード')).thenAnswer((_) => Future.error(expectError));

      // 検証クラスを初期化
      final repository = SearchBookRepositoryImpl(client);

      // 実行
      try {
        await repository.searchBook('レガシーコード');
        fail('Unexpected');
      } on FormatException catch(error) {
        expect(error, expectError);
      }
    });
  });
}
