import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
abstract class Item with _$Item {
  factory Item({
    required String title,
    required String author,
    required String isbn,
    required String largeImageUrl,
  }) = _Item;
  // Item._();

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  static Item fromCustomJson(Map<String, dynamic> json) => Item(
      title: json['Item']['title'] as String,
      author: json['Item']['author'] as String,
      isbn: json['Item']['isbn'] as String,
      largeImageUrl: json['Item']['largeImageUrl'] as String,
  );
}
