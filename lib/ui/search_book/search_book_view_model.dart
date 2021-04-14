import 'dart:async';
import 'package:flutter/material.dart';

enum UiState {
  Idle,
  Loading,
  Loaded,
}

class SearchBookViewModel extends ChangeNotifier {
  // _はprivateを意味する

  // stateを管理
  var _uiState = UiState.Idle;
  // トリガー？
  var _searchSuccessAction = StreamController<Event>();

  bool get isLogging => _uiState == UiState.Loading;

  StreamController<Event> get searchSuccessAction => _searchSuccessAction;


  void search() {
    notifyListeners();

    Future.delayed(Duration(milliseconds: 1500)).then((_) {
      // Login Success!
      _uiState = UiState.Loaded;
      notifyListeners();

      _searchSuccessAction.sink.add(Event());
    });
  }

  @override
  void dispose() {
    _searchSuccessAction.close();
    super.dispose();
  }
}

class Event {}
