
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lib_search_app/network/entity/library_state.dart';
import 'package:lib_search_app/network/library_stock/library_stock_api_client.dart';
import 'package:lib_search_app/network/library_stock/library_stock_repository.dart';
import 'package:lib_search_app/ui/library_stock/library_stock_view_model.dart';
import 'package:lib_search_app/util/lib_id_store.dart';
import 'package:provider/provider.dart';

class LibraryStockView extends StatelessWidget {
  const LibraryStockView({required this.isbn}) : super();
  final String isbn;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StockList(),
    );
  }
}

class StockList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      final repository = LibraryStockRepository(LibraryStockApiClient());
      final libIdStore = LibIdStore();
      return ChangeNotifierProvider<LibraryStockViewModel>(
        create: (_) => LibraryStockViewModel(repository, libIdStore, ''),
        child: Consumer<LibraryStockViewModel>(
          builder: (context, model, child) =>
            Scaffold(
              appBar: AppBar(
                title: const Text('検索結果'),
              ),
              body: Center(
                child: _StockListView(model),
              ),
            ),
        ),
      );
  }
}

Widget _StockListView(LibraryStockViewModel model) {
  if (model.isLoading) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
  if (model.stockList.isEmpty) {
    // return _emptyListView();
  }
  return ListView.builder(
      itemCount: model.stockList.length,
      itemBuilder: (BuildContext context, int index) {
        return StockTile(state: model.stockList[index]);
        // return StockTile(state: model.stockList[index]);
      });
}

class StockTile extends StatelessWidget {
  const StockTile({required this.state}) : super();
  final LibraryState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
      ),
      child: ListTile(
        // leading: Image.network(book.largeImageUrl),
        title: Text(
          state.name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        subtitle: const Text(
          'book.author',
          maxLines: 1,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}