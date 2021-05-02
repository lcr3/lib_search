import 'package:lib_search_app/network/entity/library_state.dart';

class LibraryStockResponse {
  final String session;
  final int _isContinue;
  final List<LibraryState> state;

  LibraryStockResponse(this.session, this._isContinue, this.state);

  bool isFinish() {
    if (_isContinue == 0) {
      return true;
    }
    return false;
  }

  static LibraryStockResponse fromJson(Map<String, dynamic> json) {
    final book = json['books'] as Map<String, dynamic>;
    final isbn = book.values.first as Map<String, dynamic>;
    // ignore: cascade_invocations
    final states = <LibraryState>[];
    isbn.forEach((key, dynamic value) {
      final stateMap = value as Map<String, dynamic>;
      states.add(LibraryState.fromJson(key, stateMap));
    });

    final libraryStockResponse = LibraryStockResponse(
      json['session'] as String,
      json['continue'] as int,
      states,
    );
    return libraryStockResponse;
  }
}

