// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'item_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ItemState _$ItemStateFromJson(Map<String, dynamic> json) {
  return _ItemState.fromJson(json);
}

/// @nodoc
class _$ItemStateTearOff {
  const _$ItemStateTearOff();

  _ItemState call({List<Item> items = const <Item>[]}) {
    return _ItemState(
      items: items,
    );
  }

  ItemState fromJson(Map<String, Object> json) {
    return ItemState.fromJson(json);
  }
}

/// @nodoc
const $ItemState = _$ItemStateTearOff();

/// @nodoc
mixin _$ItemState {
  List<Item> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemStateCopyWith<ItemState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemStateCopyWith<$Res> {
  factory $ItemStateCopyWith(ItemState value, $Res Function(ItemState) then) =
      _$ItemStateCopyWithImpl<$Res>;
  $Res call({List<Item> items});
}

/// @nodoc
class _$ItemStateCopyWithImpl<$Res> implements $ItemStateCopyWith<$Res> {
  _$ItemStateCopyWithImpl(this._value, this._then);

  final ItemState _value;
  // ignore: unused_field
  final $Res Function(ItemState) _then;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
    ));
  }
}

/// @nodoc
abstract class _$ItemStateCopyWith<$Res> implements $ItemStateCopyWith<$Res> {
  factory _$ItemStateCopyWith(
          _ItemState value, $Res Function(_ItemState) then) =
      __$ItemStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Item> items});
}

/// @nodoc
class __$ItemStateCopyWithImpl<$Res> extends _$ItemStateCopyWithImpl<$Res>
    implements _$ItemStateCopyWith<$Res> {
  __$ItemStateCopyWithImpl(_ItemState _value, $Res Function(_ItemState) _then)
      : super(_value, (v) => _then(v as _ItemState));

  @override
  _ItemState get _value => super._value as _ItemState;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_ItemState(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ItemState with DiagnosticableTreeMixin implements _ItemState {
  _$_ItemState({this.items = const <Item>[]});

  factory _$_ItemState.fromJson(Map<String, dynamic> json) =>
      _$_$_ItemStateFromJson(json);

  @JsonKey(defaultValue: const <Item>[])
  @override
  final List<Item> items;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ItemState(items: $items)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ItemState'))
      ..add(DiagnosticsProperty('items', items));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ItemState &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(items);

  @JsonKey(ignore: true)
  @override
  _$ItemStateCopyWith<_ItemState> get copyWith =>
      __$ItemStateCopyWithImpl<_ItemState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ItemStateToJson(this);
  }
}

abstract class _ItemState implements ItemState {
  factory _ItemState({List<Item> items}) = _$_ItemState;

  factory _ItemState.fromJson(Map<String, dynamic> json) =
      _$_ItemState.fromJson;

  @override
  List<Item> get items => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ItemStateCopyWith<_ItemState> get copyWith =>
      throw _privateConstructorUsedError;
}
