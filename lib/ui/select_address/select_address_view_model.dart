
import 'dart:async';
import 'package:flutter/material.dart';

class SelectAddressViewModel extends ChangeNotifier {
  // private
  var _selectAddressAction = StreamController<SelectAddressEvent>();
  // public
  StreamController<SelectAddressEvent> get selectAddressAction => _selectAddressAction;

  void selectAddress() {
    Future.delayed(Duration(milliseconds: 1500)).then((_) {
      notifyListeners();

      _selectAddressAction.sink.add(SelectAddressEvent());
    });
  }

}

class SelectAddressEvent {}