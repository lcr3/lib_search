import 'package:flutter/material.dart';
import 'package:lib_search_app/ui/search_book/search_book_view_model.dart';
import 'package:provider/provider.dart';

class SearchBookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Injects SearchBookViewModel into this widgets.
        ChangeNotifierProvider(create: (_) => SearchBookViewModel()),
      ],
      child: Scaffold(
        appBar: AppBar(title: Text("書籍検索")),
        body: _SearchBookPageBody(),
      ),
    );
  }
}

class _SearchBookPageBody extends StatefulWidget {
  @override
  __SearchBookPageBodyState createState() => __SearchBookPageBodyState();
}

class __SearchBookPageBodyState extends State<_SearchBookPageBody> {
  @override
  void initState() {
    super.initState();

    // Listen events by view model.
    var viewModel = Provider.of<SearchBookViewModel>(context, listen: false);
    viewModel.searchSuccessAction.stream.listen((_) {
      Navigator.of(context).pushReplacementNamed("/home");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _SearchButton(),
    );
  }
}

class _SearchButton extends StatelessWidget {
  String _getButtonText(SearchBookViewModel vm) =>
      vm.isLogging ? "Wait..." : "Login";

  VoidCallback _onPressed(SearchBookViewModel vm) {
    if (vm.isLogging) {
      // When returning null, the button become disabled.
      return null;
    } else {
      return () {
        vm.search();
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchBookViewModel>(
      builder: (context, viewModel, _) {
        return RaisedButton(
          child: Text(_getButtonText(viewModel)),
          onPressed: _onPressed(viewModel),
        );
      },
    );
  }
}