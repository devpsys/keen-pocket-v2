// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'charity_drive_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CharityDriveDto {

 String get title; int get goal;// kobo
 int get raised;// kobo
@JsonKey(name: 'donor_count') int get donorCount;
/// Create a copy of CharityDriveDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharityDriveDtoCopyWith<CharityDriveDto> get copyWith => _$CharityDriveDtoCopyWithImpl<CharityDriveDto>(this as CharityDriveDto, _$identity);

  /// Serializes this CharityDriveDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharityDriveDto&&(identical(other.title, title) || other.title == title)&&(identical(other.goal, goal) || other.goal == goal)&&(identical(other.raised, raised) || other.raised == raised)&&(identical(other.donorCount, donorCount) || other.donorCount == donorCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,goal,raised,donorCount);

@override
String toString() {
  return 'CharityDriveDto(title: $title, goal: $goal, raised: $raised, donorCount: $donorCount)';
}


}

/// @nodoc
abstract mixin class $CharityDriveDtoCopyWith<$Res>  {
  factory $CharityDriveDtoCopyWith(CharityDriveDto value, $Res Function(CharityDriveDto) _then) = _$CharityDriveDtoCopyWithImpl;
@useResult
$Res call({
 String title, int goal, int raised,@JsonKey(name: 'donor_count') int donorCount
});




}
/// @nodoc
class _$CharityDriveDtoCopyWithImpl<$Res>
    implements $CharityDriveDtoCopyWith<$Res> {
  _$CharityDriveDtoCopyWithImpl(this._self, this._then);

  final CharityDriveDto _self;
  final $Res Function(CharityDriveDto) _then;

/// Create a copy of CharityDriveDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? goal = null,Object? raised = null,Object? donorCount = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,goal: null == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as int,raised: null == raised ? _self.raised : raised // ignore: cast_nullable_to_non_nullable
as int,donorCount: null == donorCount ? _self.donorCount : donorCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CharityDriveDto].
extension CharityDriveDtoPatterns on CharityDriveDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CharityDriveDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CharityDriveDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CharityDriveDto value)  $default,){
final _that = this;
switch (_that) {
case _CharityDriveDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CharityDriveDto value)?  $default,){
final _that = this;
switch (_that) {
case _CharityDriveDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  int goal,  int raised, @JsonKey(name: 'donor_count')  int donorCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CharityDriveDto() when $default != null:
return $default(_that.title,_that.goal,_that.raised,_that.donorCount);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  int goal,  int raised, @JsonKey(name: 'donor_count')  int donorCount)  $default,) {final _that = this;
switch (_that) {
case _CharityDriveDto():
return $default(_that.title,_that.goal,_that.raised,_that.donorCount);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  int goal,  int raised, @JsonKey(name: 'donor_count')  int donorCount)?  $default,) {final _that = this;
switch (_that) {
case _CharityDriveDto() when $default != null:
return $default(_that.title,_that.goal,_that.raised,_that.donorCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CharityDriveDto implements CharityDriveDto {
  const _CharityDriveDto({required this.title, required this.goal, required this.raised, @JsonKey(name: 'donor_count') required this.donorCount});
  factory _CharityDriveDto.fromJson(Map<String, dynamic> json) => _$CharityDriveDtoFromJson(json);

@override final  String title;
@override final  int goal;
// kobo
@override final  int raised;
// kobo
@override@JsonKey(name: 'donor_count') final  int donorCount;

/// Create a copy of CharityDriveDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharityDriveDtoCopyWith<_CharityDriveDto> get copyWith => __$CharityDriveDtoCopyWithImpl<_CharityDriveDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CharityDriveDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharityDriveDto&&(identical(other.title, title) || other.title == title)&&(identical(other.goal, goal) || other.goal == goal)&&(identical(other.raised, raised) || other.raised == raised)&&(identical(other.donorCount, donorCount) || other.donorCount == donorCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,goal,raised,donorCount);

@override
String toString() {
  return 'CharityDriveDto(title: $title, goal: $goal, raised: $raised, donorCount: $donorCount)';
}


}

/// @nodoc
abstract mixin class _$CharityDriveDtoCopyWith<$Res> implements $CharityDriveDtoCopyWith<$Res> {
  factory _$CharityDriveDtoCopyWith(_CharityDriveDto value, $Res Function(_CharityDriveDto) _then) = __$CharityDriveDtoCopyWithImpl;
@override @useResult
$Res call({
 String title, int goal, int raised,@JsonKey(name: 'donor_count') int donorCount
});




}
/// @nodoc
class __$CharityDriveDtoCopyWithImpl<$Res>
    implements _$CharityDriveDtoCopyWith<$Res> {
  __$CharityDriveDtoCopyWithImpl(this._self, this._then);

  final _CharityDriveDto _self;
  final $Res Function(_CharityDriveDto) _then;

/// Create a copy of CharityDriveDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? goal = null,Object? raised = null,Object? donorCount = null,}) {
  return _then(_CharityDriveDto(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,goal: null == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as int,raised: null == raised ? _self.raised : raised // ignore: cast_nullable_to_non_nullable
as int,donorCount: null == donorCount ? _self.donorCount : donorCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
