import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'item.dart';

part 'item_state.freezed.dart';
part 'item_state.g.dart';

@freezed
abstract class ItemState implements _$ItemState {
  factory ItemState({
    @Default(<Item>[]) List<Item> items,
  }) = _ItemState;

  factory ItemState.fromJson(Map<String, dynamic> json) => _$ItemStateFromJson(json);

  static ItemState fromCustomJson(List<Map<String, dynamic>> json) => ItemState(
    items: json.map(Item.fromCustomJson) as List<Item>,
  );

}