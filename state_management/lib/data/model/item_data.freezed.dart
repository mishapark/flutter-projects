// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ItemData {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ItemDataCopyWith<ItemData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemDataCopyWith<$Res> {
  factory $ItemDataCopyWith(ItemData value, $Res Function(ItemData) then) =
      _$ItemDataCopyWithImpl<$Res, ItemData>;
  @useResult
  $Res call({int id, String title, String description, String image});
}

/// @nodoc
class _$ItemDataCopyWithImpl<$Res, $Val extends ItemData>
    implements $ItemDataCopyWith<$Res> {
  _$ItemDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ItemDataCopyWith<$Res> implements $ItemDataCopyWith<$Res> {
  factory _$$_ItemDataCopyWith(
          _$_ItemData value, $Res Function(_$_ItemData) then) =
      __$$_ItemDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title, String description, String image});
}

/// @nodoc
class __$$_ItemDataCopyWithImpl<$Res>
    extends _$ItemDataCopyWithImpl<$Res, _$_ItemData>
    implements _$$_ItemDataCopyWith<$Res> {
  __$$_ItemDataCopyWithImpl(
      _$_ItemData _value, $Res Function(_$_ItemData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? image = null,
  }) {
    return _then(_$_ItemData(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ItemData implements _ItemData {
  const _$_ItemData(
      {required this.id,
      required this.title,
      required this.description,
      required this.image});

  @override
  final int id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String image;

  @override
  String toString() {
    return 'ItemData(id: $id, title: $title, description: $description, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ItemDataCopyWith<_$_ItemData> get copyWith =>
      __$$_ItemDataCopyWithImpl<_$_ItemData>(this, _$identity);
}

abstract class _ItemData implements ItemData {
  const factory _ItemData(
      {required final int id,
      required final String title,
      required final String description,
      required final String image}) = _$_ItemData;

  @override
  int get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$_ItemDataCopyWith<_$_ItemData> get copyWith =>
      throw _privateConstructorUsedError;
}
