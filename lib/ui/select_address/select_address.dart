import 'package:flutter/material.dart';
import 'package:lib_search_app/ui/select_address/select_address_view_model.dart';
import 'package:provider/provider.dart';

class SelectAddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Injects SearchBookViewModel into this widgets.
        ChangeNotifierProvider(create: (_) => SelectAddressViewModel()),
      ],
      child: Scaffold(
        appBar: AppBar(title: Text("決めまっせ")),
        body: _SelectAddressPageBody(),
      ),
    );
  }
}

class _SelectAddressPageBody extends StatefulWidget {
  @override
  __SelectAddressPageBodyState createState() => __SelectAddressPageBodyState();
}

class __SelectAddressPageBodyState extends State<_SelectAddressPageBody> {
  @override
  void initState() {
    super.initState();

    // Listen events by view model.
    var viewModel = Provider.of<SelectAddressViewModel>(context, listen: false);
    viewModel.selectAddressAction.stream.listen((event) {
      Navigator.of(context).pushReplacementNamed("/search_book");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _SelectAddressButton(),
    );
  }
}

class _SelectAddressButton extends StatelessWidget {

  VoidCallback _onPressed(SelectAddressViewModel vm) {
    return () {
      vm.selectAddress();
    };
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectAddressViewModel>(
      builder: (context, viewModel, _) {
        return RaisedButton(
          child: Text("住所きめよ"),
          onPressed: _onPressed(viewModel),
        );
      },
    );
  }
}