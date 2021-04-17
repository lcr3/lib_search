import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lib_search_app/model/controller/search_book_controller.dart';

class SearchBookPage extends StatelessWidget {
  const SearchBookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('商品リスト'),
        // leading: CartButton(),
      ),
      // body: _ListView(),
    );
  }
}


// class _ListView extends HookWidget {
//   const _ListView();
//
//   @override
//   Widget build(BuildContext context) {
//     // final isLoading =
//     // useProvider(itemsProvider.state.select((s) => s.isLoading));
//     // final ids = useProvider(
//     //   itemsProvider.state.select((s) => s.stocks.map((s) => s.item.id)),
//     // ).toList();
//     final books = useProvider(
//         searchBookProvider.state
//     )
//
//     return isLoading
//         ? const Center(child: CircularProgressIndicator())
//         : ListView.builder(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       itemCount: ids.length,
//       itemBuilder: (_, index) => ItemTile(id: ids[index]),
//     );
//   }
// }