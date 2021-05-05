import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:lib_search_app/network/entity/library.dart';
import 'package:lib_search_app/network/entity/library_state.dart';
import 'package:lib_search_app/network/library_stock/library_stock_api_client.dart';
import 'package:lib_search_app/network/library_stock/library_stock_repository.dart';
import 'package:lib_search_app/util/lib_id_store.dart';
import 'package:provider/provider.dart';

import 'library_stock_view_model.dart';

class StockList extends StatelessWidget {
  const StockList({required this.isbn}) : super();
  final String isbn;

  @override
  Widget build(BuildContext context) {
    final repository = LibraryStockRepository(LibraryStockApiClient());
    final libIdStore = LibIdStore();
    return ChangeNotifierProvider<LibraryStockViewModel>(
      create: (_) => LibraryStockViewModel(repository, libIdStore, isbn),
      child: Consumer<LibraryStockViewModel>(
          builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              title: const Text('検索結果'),
            ),
            body: LibraryStockList(
              title: '検索結果',
              isLoading: model.isLoading,
              slivers: model.stockList.map((state) => _StockHeaderList(
                title: state.name,
                libraryState: state,
              )).toList(),
            ),
          )
      ),
    );
  }
}

class LibraryStockList extends StatelessWidget {
  const LibraryStockList({
    Key? key,
    required this.title,
    required this.isLoading,
    required this.slivers,
  }) : super(key: key);

  final String title;
  final bool isLoading;
  final List<_StockHeaderList> slivers;

  @override
  Widget build(BuildContext context) {
    return DefaultStickyHeaderController(
      child: Center(
        child: isLoading ? const Center(
          child: CircularProgressIndicator(),
        ) : _libraryScrollView(slivers)
      ),
    );
  }

  Widget _libraryScrollView(List<_StockHeaderList> slivers) {
    var isEmpty = true;
    for (final sliver in slivers) {
      if (sliver.libraryState.references.isNotEmpty) {
        isEmpty = false;
        break;
      }
    }
    if (isEmpty) {
      return _emptyView();
    }
    return CustomScrollView(
      slivers: slivers,
    );
  }

  Widget _emptyView() {
    return const Center(
      child: Text(
        'お探しの書籍を取り扱う図書館はありませんでした。',
        style: TextStyle(
          color: Colors.black54,
          fontSize: 16,
        ),
      ),
    );
  }
}

class _StockHeaderList extends StatelessWidget {
  const _StockHeaderList({
    Key? key,
    required this.title,
    required this.libraryState,
  }) : super(key: key);

  final String title;
  final LibraryState libraryState;

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: Header(title: title),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
              (context, i) => ListTile(
            leading: CircleAvatar(
              child: Text(title),
            ),
            title: Text(libraryState.references[i].fullState()),
          ),
          childCount: libraryState.references.length,
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final libStore = LibIdStore();
    return Container(
      height: 30,
      color: Colors.grey,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.centerLeft,
      child: FutureBuilder(
        future: libStore.getLibrary(title),
        builder: (BuildContext context, AsyncSnapshot<Library?> snapshot) {
          final String savedTitle;
          if (snapshot.hasData && snapshot.data != null) {
            savedTitle = snapshot.data!.formal;
          } else {
            savedTitle = title;
          }
          return Text(
              savedTitle,
              style: const TextStyle(color: Colors.white),
          );
        },
      ),
    );
  }
}