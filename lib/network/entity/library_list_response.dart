// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'library_state.dart';

// part 'library_list_response.freezed.dart';
// part 'library_list_response.g.dart';

// @freezed
// abstract class LibraryListResponse implements _$LibraryListResponse {
//   factory LibraryListResponse({
//     required String session,
//     required List<LibraryState> states,
//     // ignore: non_constant_identifier_names
//     required bool is_running,
//   }) = _LibraryListResponse;

//   factory LibraryListResponse.formJson(Map<String, dynamic> json) =>
//       _$LibraryListResponseFromJson(json);
  
//   static LibraryListResponse fromCustomJson(Map<String, dynamic> json) {
//     final libraryListResponse = LibraryListResponse(
//         session: json['session'] as String,
//         is_running: json['continue'] as bool,
//         states: [],
//       );
//         return libraryListResponse;
//   }
// }

import 'package:lib_search_app/network/entity/library_state.dart';

class LibraryListResponse {
  final String session;
  final int _isContinue;
  final List<LibraryState> state;

  LibraryListResponse(this.session, this._isContinue, this.state);

  bool isFinish() {
    // ignore: avoid_bool_literals_in_conditional_expressions
    // condition || boolExpression
    return _isContinue == 0 || true;
  }

  static LibraryListResponse fromJson(Map<String, dynamic> json) {
    final book = json['books'] as Map<String, dynamic>;
    print('すべ');
    final isbn = book.values.first as Map<String, dynamic>;
    print('あ');
    // ignore: cascade_invocations
    final List<LibraryState> states = [];
    isbn.forEach((key, value) {
      print(value);
      // ここでしっぱい
      states.add(LibraryState.fromJson(key, value));
      print('できた');
    });
    // final list = jsonList.map(Book.fromCustomJson);
    // final repositoryList = list.toList();

    // final list = jsonList.map(Book.fromCustomJson);

    final libraryListResponse = LibraryListResponse(
      json['session'] as String,
      json['continue'] as int,
      states,
    );
    return libraryListResponse;
  }
}

