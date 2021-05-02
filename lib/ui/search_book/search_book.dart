import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lib_search_app/network/entity/book.dart';
import 'package:lib_search_app/network/search_book_api_client.dart';
import 'package:lib_search_app/network/search_book_repository.dart';
import 'package:lib_search_app/ui/library_stock/library_stock.dart';
import 'package:lib_search_app/ui/search_book/search_book_view_model.dart';
import 'package:provider/provider.dart';

class SearchBookView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      home: BookList(),
    );
  }
}

class BookList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final repo = SearchBookRepositoryImpl(SearchBookApiClientImpl());
    return ChangeNotifierProvider<SearchBookViewModel>(
      create: (_) => SearchBookViewModel(repo),
      child: Consumer<SearchBookViewModel>(
          builder: (context, model, child) =>
              Scaffold(
                appBar: AppBar(
                  title: const Text('Search Book'),
                ),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 16, right: 16, bottom: 0, left: 16),
                        child: TextField(
                          decoration: const InputDecoration(
                              hintText: '検索キーワードを入力してください'),
                          autofocus: true,
                          onSubmitted: (searchKeyword) =>
                              model.searchBookRequest(searchKeyword),
                        ),
                      ),
                      Expanded(
                        child: _bookListView(model),
                      ),
                      // CountText(),
                    ],
                  ),
                ),
              )
      ),
    );
  }

  Widget _bookListView(SearchBookViewModel model) {
    if (model.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (model.error != null) {
      // TODO(error): 動的エラーメッセージに対応する
      return _errorView('エラーが発生しました。');
    }
    if (model.searchResultList.isEmpty) {
      return _emptyListView();
    }
    return ListView.builder(
        itemCount: model.searchResultList.length,
        itemBuilder: (BuildContext context, int index) {
          return BookTile(book: model.searchResultList[index]);
        });
  }

  Widget _errorView(String errorMessage) {
    Fluttertoast.showToast(
      msg: errorMessage,
      backgroundColor: Colors.grey,
    );
    return Container();
  }

  Widget _emptyListView() {
    return const Center(
      child: Text(
        'お探しの書籍は見つかりませんでした。',
        style: TextStyle(
          color: Colors.black54,
          fontSize: 16,
        ),
      ),
    );
  }
}

class BookTile extends StatelessWidget {
  const BookTile({required this.book}) : super();
  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
      ),
      child: ListTile(
        leading: Image.network(book.largeImageUrl),
        title: Text(
          book.title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          book.author,
          maxLines: 1,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        onTap: () {
          Navigator.push<MaterialPageRoute>(
              context,
              MaterialPageRoute(
                  builder: (context) {
                    return LibraryStockView(isbn: book.isbn);
                  })
          );
        },
      ),
    );
  }
}