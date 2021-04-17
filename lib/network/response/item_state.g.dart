// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ItemState _$_$_ItemStateFromJson(Map<String, dynamic> json) {
  return _$_ItemState(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$_$_ItemStateToJson(_$_ItemState instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
