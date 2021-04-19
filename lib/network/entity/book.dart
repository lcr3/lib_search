import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';
part 'book.g.dart';

@freezed
abstract class Book with _$Book {
  factory Book({
    required String title,
    required String author,
    required String isbn,
    required String largeImageUrl,
  }) = _Book;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  // ignore: prefer_constructors_over_static_methods
  static Book fromCustomJson(Map<String, dynamic> json) => Book(
      title: json['Item']['title'] as String,
      author: json['Item']['author'] as String,
      isbn: json['Item']['isbn'] as String,
      largeImageUrl: json['Item']['largeImageUrl'] as String,
  );
}
