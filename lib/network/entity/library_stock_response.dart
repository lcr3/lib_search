import 'package:lib_search_app/network/entity/library_state.dart';

class LibraryListResponse {
  final String session;
  final int _isContinue;
  final List<LibraryState> state;

  LibraryListResponse(this.session, this._isContinue, this.state);

  bool isFinish() {
    return _isContinue == 0 || true;
  }

  static LibraryListResponse fromJson(Map<String, dynamic> json) {
    final book = json['books'] as Map<String, dynamic>;
    final isbn = book.values.first as Map<String, dynamic>;
    // ignore: cascade_invocations
    final List<LibraryState> states = [];
    isbn.forEach((key, value) {
      final stateMap = value as Map<String, dynamic>;
      states.add(LibraryState.fromJson(key, stateMap));
    });

    final libraryListResponse = LibraryListResponse(
      json['session'] as String,
      json['continue'] as int,
      states,
    );
    return libraryListResponse;
  }
}

