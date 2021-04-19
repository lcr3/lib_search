import 'package:flutter/material.dart';
import 'package:lib_search_app/network/entity/book.dart';
import 'package:lib_search_app/network/search_book_api_client.dart';
import 'package:lib_search_app/network/search_book_repository.dart';
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

// class BookList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Search Book'),
//       ),
//       // body: _textFieldView(),
//     );
//   }

  // Widget _textFieldView() {
  //   final context = useContext();
  //   return Column(
  //     children: [
  //       Padding(
  //         padding:
  //         const EdgeInsets.only(top: 16, right: 16, bottom: 0, left: 16),
  //         child: TextField(
  //           // controller: searchTextField,
  //           decoration: const InputDecoration(hintText: '検索キーワードを入力してください'),
  //           autofocus: true,
  //           onSubmitted: (searchKeyword) => _submission(searchKeyword, context),
  //         ),
  //       ),
  //       // Expanded(
  //       //   child: _buildList(),
  //       // ),
  //     ],
  //   );
  // }

  // void _submission(String searchKeyword, BuildContext context) {
  //   print('きたよ');
  //   context.read(searchBookViewModelProvider)
  //       .searchBookRequest(searchKeyword);
  // }
// }

// class BookTileList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final repo = SearchBookRepositoryImpl(SearchBookApiClientImpl());
//     return ChangeNotifierProvider<SearchBookViewModel>(
//       name: (context) => SearchBookViewModel(repo),
//       child: Consumer<SearchBookViewModel>(
//           builder: (context, model, child) => Scaffold(
//               appBar: AppBar(
//                 title: Text('Flutter Demo Home Page'),
//               ),
//               body: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Text(
//                       'You have pushed the button this many times:',
//                     ),
//                     // CountText(),
//                   ],
//                 ),
//               ),
//               floatingActionButton: FloatingActionButton(
//                 onPressed: model.searchBookRequest('aaaa'),
//                 tooltip: 'Increment',
//                 child: Icon(Icons.add),
//               )
//           )
//       )
//     );
//   }

class BookList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final repo = SearchBookRepositoryImpl(SearchBookApiClientImpl());
    return ChangeNotifierProvider<SearchBookViewModel>(
      create: (_) => SearchBookViewModel(repo),
      child: Consumer<SearchBookViewModel>(
          builder: (context, model, child) => Scaffold(
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
                        child: ListView.builder(
                            itemCount: model.searchResultList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return BookTile(
                                  book: model.searchResultList[index]);
                            }),
                      ),
                      // CountText(),
                    ],
                  ),
                ),
              )
      ),
    );
  }

  // Widget _buildList() {
    // final repositoryListState =
    // useProvider(repositoryListViewModelProvider.state);
    // ListView.builder(itemBuilder: itemBuilder)

    // return repositoryListState.when(
    //   data: (repositoryList) => repositoryList.isNotEmpty
    //       ? ListView.builder(
    //     padding: const EdgeInsets.all(16),
    //     itemCount: repositoryList.length,
    //     itemBuilder: (BuildContext context, int index) {
    //       return _repositoryTile(repositoryList[index]);
    //     },
    //   )
    //       : _emptyListView(),
    //   loading: _loadingView,
    //   error: (error, _) => _errorView(error.toString()),
    // );
  // }
}

  // Consumer<ClientProvider>(
  // builder: (_, data, __) => Expanded(
  // child: ListView.builder(
  // itemCount: data.clients.length,
  // itemBuilder: (context, index) {
  // return ClientRow(data.clients[index]);
  // },)

  // Widget _buildList() {
  //   final searchBookState = useProvider(searchBookViewModelProvider.notifier);
  //
  //   return searchBookState
  // }
//
//
//     return repositoryListState.when(
//       data: (repositoryList) => repositoryList.isNotEmpty
//           ? ListView.builder(
//         padding: const EdgeInsets.all(16),
//         itemCount: repositoryList.length,
//         itemBuilder: (BuildContext context, int index) {
//           return _repositoryTile(repositoryList[index]);
//         },
//       )
//           : _emptyListView(),
//       loading: _loadingView,
//       error: (error, _) => _errorView(error.toString()),
//     );
//   }
//
//   Widget _loadingView() {
//     return const Center(
//       child: CircularProgressIndicator(),
//     );
//   }
//
//   // Widget _errorView(String errorMessage) {
//   //   Fluttertoast.showToast(
//   //     msg: errorMessage,
//   //     backgroundColor: Colors.grey,
//   //   );
//   //   return Container();
//   // }
//
//   Widget _emptyListView() {
//     return const Center(
//       child: Text(
//         'Repositoryが見つかりませんでした',
//         style: TextStyle(
//           color: Colors.black54,
//           fontSize: 16,
//         ),
//       ),
//     );
//   }
//

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
      ),
    );
  }
}