// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Book _$_$_BookFromJson(Map<String, dynamic> json) {
  return _$_Book(
    title: json['title'] as String,
    author: json['author'] as String,
    isbn: json['isbn'] as String,
    largeImageUrl: json['largeImageUrl'] as String,
  );
}

Map<String, dynamic> _$_$_BookToJson(_$_Book instance) => <String, dynamic>{
      'title': instance.title,
      'author': instance.author,
      'isbn': instance.isbn,
      'largeImageUrl': instance.largeImageUrl,
    };
