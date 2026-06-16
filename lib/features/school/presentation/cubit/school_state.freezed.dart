// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'school_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SchoolState {

 StateStatus get status; SchoolView? get school;
/// Create a copy of SchoolState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SchoolStateCopyWith<SchoolState> get copyWith => _$SchoolStateCopyWithImpl<SchoolState>(this as SchoolState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SchoolState&&(identical(other.status, status) || other.status == status)&&(identical(other.school, school) || other.school == school));
}


@override
int get hashCode => Object.hash(runtimeType,status,school);

@override
String toString() {
  return 'SchoolState(status: $status, school: $school)';
}


}

/// @nodoc
abstract mixin class $SchoolStateCopyWith<$Res>  {
  factory $SchoolStateCopyWith(SchoolState value, $Res Function(SchoolState) _then) = _$SchoolStateCopyWithImpl;
@useResult
$Res call({
 StateStatus status, SchoolView? school
});




}
/// @nodoc
class _$SchoolStateCopyWithImpl<$Res>
    implements $SchoolStateCopyWith<$Res> {
  _$SchoolStateCopyWithImpl(this._self, this._then);

  final SchoolState _self;
  final $Res Function(SchoolState) _then;

/// Create a copy of SchoolState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? school = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,school: freezed == school ? _self.school : school // ignore: cast_nullable_to_non_nullable
as SchoolView?,
  ));
}

}


/// Adds pattern-matching-related methods to [SchoolState].
extension SchoolStatePatterns on SchoolState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SchoolState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SchoolState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SchoolState value)  $default,){
final _that = this;
switch (_that) {
case _SchoolState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SchoolState value)?  $default,){
final _that = this;
switch (_that) {
case _SchoolState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StateStatus status,  SchoolView? school)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SchoolState() when $default != null:
return $default(_that.status,_that.school);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StateStatus status,  SchoolView? school)  $default,) {final _that = this;
switch (_that) {
case _SchoolState():
return $default(_that.status,_that.school);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StateStatus status,  SchoolView? school)?  $default,) {final _that = this;
switch (_that) {
case _SchoolState() when $default != null:
return $default(_that.status,_that.school);case _:
  return null;

}
}

}

/// @nodoc


class _SchoolState implements SchoolState {
  const _SchoolState({this.status = StateStatus.initial, this.school});
  

@override@JsonKey() final  StateStatus status;
@override final  SchoolView? school;

/// Create a copy of SchoolState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SchoolStateCopyWith<_SchoolState> get copyWith => __$SchoolStateCopyWithImpl<_SchoolState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SchoolState&&(identical(other.status, status) || other.status == status)&&(identical(other.school, school) || other.school == school));
}


@override
int get hashCode => Object.hash(runtimeType,status,school);

@override
String toString() {
  return 'SchoolState(status: $status, school: $school)';
}


}

/// @nodoc
abstract mixin class _$SchoolStateCopyWith<$Res> implements $SchoolStateCopyWith<$Res> {
  factory _$SchoolStateCopyWith(_SchoolState value, $Res Function(_SchoolState) _then) = __$SchoolStateCopyWithImpl;
@override @useResult
$Res call({
 StateStatus status, SchoolView? school
});




}
/// @nodoc
class __$SchoolStateCopyWithImpl<$Res>
    implements _$SchoolStateCopyWith<$Res> {
  __$SchoolStateCopyWithImpl(this._self, this._then);

  final _SchoolState _self;
  final $Res Function(_SchoolState) _then;

/// Create a copy of SchoolState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? school = freezed,}) {
  return _then(_SchoolState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,school: freezed == school ? _self.school : school // ignore: cast_nullable_to_non_nullable
as SchoolView?,
  ));
}


}

// dart format on
