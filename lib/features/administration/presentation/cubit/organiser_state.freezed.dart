// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'organiser_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrganiserState {

 StateStatus get status; OrganiserView? get data;
/// Create a copy of OrganiserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrganiserStateCopyWith<OrganiserState> get copyWith => _$OrganiserStateCopyWithImpl<OrganiserState>(this as OrganiserState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrganiserState&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'OrganiserState(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $OrganiserStateCopyWith<$Res>  {
  factory $OrganiserStateCopyWith(OrganiserState value, $Res Function(OrganiserState) _then) = _$OrganiserStateCopyWithImpl;
@useResult
$Res call({
 StateStatus status, OrganiserView? data
});




}
/// @nodoc
class _$OrganiserStateCopyWithImpl<$Res>
    implements $OrganiserStateCopyWith<$Res> {
  _$OrganiserStateCopyWithImpl(this._self, this._then);

  final OrganiserState _self;
  final $Res Function(OrganiserState) _then;

/// Create a copy of OrganiserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as OrganiserView?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrganiserState].
extension OrganiserStatePatterns on OrganiserState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrganiserState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrganiserState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrganiserState value)  $default,){
final _that = this;
switch (_that) {
case _OrganiserState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrganiserState value)?  $default,){
final _that = this;
switch (_that) {
case _OrganiserState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StateStatus status,  OrganiserView? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrganiserState() when $default != null:
return $default(_that.status,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StateStatus status,  OrganiserView? data)  $default,) {final _that = this;
switch (_that) {
case _OrganiserState():
return $default(_that.status,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StateStatus status,  OrganiserView? data)?  $default,) {final _that = this;
switch (_that) {
case _OrganiserState() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc


class _OrganiserState implements OrganiserState {
  const _OrganiserState({this.status = StateStatus.initial, this.data});
  

@override@JsonKey() final  StateStatus status;
@override final  OrganiserView? data;

/// Create a copy of OrganiserState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrganiserStateCopyWith<_OrganiserState> get copyWith => __$OrganiserStateCopyWithImpl<_OrganiserState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrganiserState&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'OrganiserState(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$OrganiserStateCopyWith<$Res> implements $OrganiserStateCopyWith<$Res> {
  factory _$OrganiserStateCopyWith(_OrganiserState value, $Res Function(_OrganiserState) _then) = __$OrganiserStateCopyWithImpl;
@override @useResult
$Res call({
 StateStatus status, OrganiserView? data
});




}
/// @nodoc
class __$OrganiserStateCopyWithImpl<$Res>
    implements _$OrganiserStateCopyWith<$Res> {
  __$OrganiserStateCopyWithImpl(this._self, this._then);

  final _OrganiserState _self;
  final $Res Function(_OrganiserState) _then;

/// Create a copy of OrganiserState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = freezed,}) {
  return _then(_OrganiserState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as OrganiserView?,
  ));
}


}

// dart format on
