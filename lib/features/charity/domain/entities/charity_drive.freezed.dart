// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'charity_drive.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CharityDrive {

 String get title; Money get goal; Money get raised; int get donorCount;
/// Create a copy of CharityDrive
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharityDriveCopyWith<CharityDrive> get copyWith => _$CharityDriveCopyWithImpl<CharityDrive>(this as CharityDrive, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharityDrive&&(identical(other.title, title) || other.title == title)&&(identical(other.goal, goal) || other.goal == goal)&&(identical(other.raised, raised) || other.raised == raised)&&(identical(other.donorCount, donorCount) || other.donorCount == donorCount));
}


@override
int get hashCode => Object.hash(runtimeType,title,goal,raised,donorCount);

@override
String toString() {
  return 'CharityDrive(title: $title, goal: $goal, raised: $raised, donorCount: $donorCount)';
}


}

/// @nodoc
abstract mixin class $CharityDriveCopyWith<$Res>  {
  factory $CharityDriveCopyWith(CharityDrive value, $Res Function(CharityDrive) _then) = _$CharityDriveCopyWithImpl;
@useResult
$Res call({
 String title, Money goal, Money raised, int donorCount
});




}
/// @nodoc
class _$CharityDriveCopyWithImpl<$Res>
    implements $CharityDriveCopyWith<$Res> {
  _$CharityDriveCopyWithImpl(this._self, this._then);

  final CharityDrive _self;
  final $Res Function(CharityDrive) _then;

/// Create a copy of CharityDrive
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? goal = null,Object? raised = null,Object? donorCount = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,goal: null == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as Money,raised: null == raised ? _self.raised : raised // ignore: cast_nullable_to_non_nullable
as Money,donorCount: null == donorCount ? _self.donorCount : donorCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CharityDrive].
extension CharityDrivePatterns on CharityDrive {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CharityDrive value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CharityDrive() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CharityDrive value)  $default,){
final _that = this;
switch (_that) {
case _CharityDrive():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CharityDrive value)?  $default,){
final _that = this;
switch (_that) {
case _CharityDrive() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  Money goal,  Money raised,  int donorCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CharityDrive() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  Money goal,  Money raised,  int donorCount)  $default,) {final _that = this;
switch (_that) {
case _CharityDrive():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  Money goal,  Money raised,  int donorCount)?  $default,) {final _that = this;
switch (_that) {
case _CharityDrive() when $default != null:
return $default(_that.title,_that.goal,_that.raised,_that.donorCount);case _:
  return null;

}
}

}

/// @nodoc


class _CharityDrive extends CharityDrive {
  const _CharityDrive({required this.title, required this.goal, required this.raised, required this.donorCount}): super._();
  

@override final  String title;
@override final  Money goal;
@override final  Money raised;
@override final  int donorCount;

/// Create a copy of CharityDrive
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharityDriveCopyWith<_CharityDrive> get copyWith => __$CharityDriveCopyWithImpl<_CharityDrive>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharityDrive&&(identical(other.title, title) || other.title == title)&&(identical(other.goal, goal) || other.goal == goal)&&(identical(other.raised, raised) || other.raised == raised)&&(identical(other.donorCount, donorCount) || other.donorCount == donorCount));
}


@override
int get hashCode => Object.hash(runtimeType,title,goal,raised,donorCount);

@override
String toString() {
  return 'CharityDrive(title: $title, goal: $goal, raised: $raised, donorCount: $donorCount)';
}


}

/// @nodoc
abstract mixin class _$CharityDriveCopyWith<$Res> implements $CharityDriveCopyWith<$Res> {
  factory _$CharityDriveCopyWith(_CharityDrive value, $Res Function(_CharityDrive) _then) = __$CharityDriveCopyWithImpl;
@override @useResult
$Res call({
 String title, Money goal, Money raised, int donorCount
});




}
/// @nodoc
class __$CharityDriveCopyWithImpl<$Res>
    implements _$CharityDriveCopyWith<$Res> {
  __$CharityDriveCopyWithImpl(this._self, this._then);

  final _CharityDrive _self;
  final $Res Function(_CharityDrive) _then;

/// Create a copy of CharityDrive
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? goal = null,Object? raised = null,Object? donorCount = null,}) {
  return _then(_CharityDrive(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,goal: null == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as Money,raised: null == raised ? _self.raised : raised // ignore: cast_nullable_to_non_nullable
as Money,donorCount: null == donorCount ? _self.donorCount : donorCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
