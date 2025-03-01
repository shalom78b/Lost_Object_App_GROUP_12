// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchItemDto _$SearchItemDtoFromJson(Map<String, dynamic> json) {
  return $SearchItemDto.fromJson(json);
}

/// @nodoc
mixin _$SearchItemDto {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  bool? get image => throw _privateConstructorUsedError;
  UserDto get user => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchItemDtoCopyWith<SearchItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchItemDtoCopyWith<$Res> {
  factory $SearchItemDtoCopyWith(
          SearchItemDto value, $Res Function(SearchItemDto) then) =
      _$SearchItemDtoCopyWithImpl<$Res, SearchItemDto>;
  @useResult
  $Res call(
      {int id,
      String title,
      String type,
      bool? image,
      UserDto user,
      DateTime date,
      double distance});

  $UserDtoCopyWith<$Res> get user;
}

/// @nodoc
class _$SearchItemDtoCopyWithImpl<$Res, $Val extends SearchItemDto>
    implements $SearchItemDtoCopyWith<$Res> {
  _$SearchItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? image = freezed,
    Object? user = null,
    Object? date = null,
    Object? distance = null,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as bool?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDtoCopyWith<$Res> get user {
    return $UserDtoCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$$SearchItemDtoCopyWith<$Res>
    implements $SearchItemDtoCopyWith<$Res> {
  factory _$$$SearchItemDtoCopyWith(
          _$$SearchItemDto value, $Res Function(_$$SearchItemDto) then) =
      __$$$SearchItemDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String type,
      bool? image,
      UserDto user,
      DateTime date,
      double distance});

  @override
  $UserDtoCopyWith<$Res> get user;
}

/// @nodoc
class __$$$SearchItemDtoCopyWithImpl<$Res>
    extends _$SearchItemDtoCopyWithImpl<$Res, _$$SearchItemDto>
    implements _$$$SearchItemDtoCopyWith<$Res> {
  __$$$SearchItemDtoCopyWithImpl(
      _$$SearchItemDto _value, $Res Function(_$$SearchItemDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? image = freezed,
    Object? user = null,
    Object? date = null,
    Object? distance = null,
  }) {
    return _then(_$$SearchItemDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as bool?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$$SearchItemDto implements $SearchItemDto {
  const _$$SearchItemDto(
      {required this.id,
      required this.title,
      required this.type,
      this.image,
      required this.user,
      required this.date,
      required this.distance});

  factory _$$SearchItemDto.fromJson(Map<String, dynamic> json) =>
      _$$$SearchItemDtoFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String type;
  @override
  final bool? image;
  @override
  final UserDto user;
  @override
  final DateTime date;
  @override
  final double distance;

  @override
  String toString() {
    return 'SearchItemDto(id: $id, title: $title, type: $type, image: $image, user: $user, date: $date, distance: $distance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$SearchItemDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.distance, distance) ||
                other.distance == distance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, type, image, user, date, distance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$$SearchItemDtoCopyWith<_$$SearchItemDto> get copyWith =>
      __$$$SearchItemDtoCopyWithImpl<_$$SearchItemDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$$SearchItemDtoToJson(
      this,
    );
  }
}

abstract class $SearchItemDto implements SearchItemDto {
  const factory $SearchItemDto(
      {required final int id,
      required final String title,
      required final String type,
      final bool? image,
      required final UserDto user,
      required final DateTime date,
      required final double distance}) = _$$SearchItemDto;

  factory $SearchItemDto.fromJson(Map<String, dynamic> json) =
      _$$SearchItemDto.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get type;
  @override
  bool? get image;
  @override
  UserDto get user;
  @override
  DateTime get date;
  @override
  double get distance;
  @override
  @JsonKey(ignore: true)
  _$$$SearchItemDtoCopyWith<_$$SearchItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}
