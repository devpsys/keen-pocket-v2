// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'adashi_rotation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AdashiRotationState {

 StateStatus get status; AdashiRotationView? get rotation;
/// Create a copy of AdashiRotationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdashiRotationStateCopyWith<AdashiRotationState> get copyWith => _$AdashiRotationStateCopyWithImpl<AdashiRotationState>(this as AdashiRotationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdashiRotationState&&(identical(other.status, status) || other.status == status)&&(identical(other.rotation, rotation) || other.rotation == rotation));
}


@override
int get hashCode => Object.hash(runtimeType,status,rotation);

@override
String toString() {
  return 'AdashiRotationState(status: $status, rotation: $rotation)';
}


}

/// @nodoc
abstract mixin class $AdashiRotationStateCopyWith<$Res>  {
  factory $AdashiRotationStateCopyWith(AdashiRotationState value, $Res Function(AdashiRotationState) _then) = _$AdashiRotationStateCopyWithImpl;
@useResult
$Res call({
 StateStatus status, AdashiRotationView? rotation
});




}
/// @nodoc
class _$AdashiRotationStateCopyWithImpl<$Res>
    implements $AdashiRotationStateCopyWith<$Res> {
  _$AdashiRotationStateCopyWithImpl(this._self, this._then);

  final AdashiRotationState _self;
  final $Res Function(AdashiRotationState) _then;

/// Create a copy of AdashiRotationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? rotation = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,rotation: freezed == rotation ? _self.rotation : rotation // ignore: cast_nullable_to_non_nullable
as AdashiRotationView?,
  ));
}

}


/// Adds pattern-matching-related methods to [AdashiRotationState].
extension AdashiRotationStatePatterns on AdashiRotationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdashiRotationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdashiRotationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdashiRotationState value)  $default,){
final _that = this;
switch (_that) {
case _AdashiRotationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdashiRotationState value)?  $default,){
final _that = this;
switch (_that) {
case _AdashiRotationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StateStatus status,  AdashiRotationView? rotation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdashiRotationState() when $default != null:
return $default(_that.status,_that.rotation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StateStatus status,  AdashiRotationView? rotation)  $default,) {final _that = this;
switch (_that) {
case _AdashiRotationState():
return $default(_that.status,_that.rotation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StateStatus status,  AdashiRotationView? rotation)?  $default,) {final _that = this;
switch (_that) {
case _AdashiRotationState() when $default != null:
return $default(_that.status,_that.rotation);case _:
  return null;

}
}

}

/// @nodoc


class _AdashiRotationState implements AdashiRotationState {
  const _AdashiRotationState({this.status = StateStatus.initial, this.rotation});
  

@override@JsonKey() final  StateStatus status;
@override final  AdashiRotationView? rotation;

/// Create a copy of AdashiRotationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdashiRotationStateCopyWith<_AdashiRotationState> get copyWith => __$AdashiRotationStateCopyWithImpl<_AdashiRotationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdashiRotationState&&(identical(other.status, status) || other.status == status)&&(identical(other.rotation, rotation) || other.rotation == rotation));
}


@override
int get hashCode => Object.hash(runtimeType,status,rotation);

@override
String toString() {
  return 'AdashiRotationState(status: $status, rotation: $rotation)';
}


}

/// @nodoc
abstract mixin class _$AdashiRotationStateCopyWith<$Res> implements $AdashiRotationStateCopyWith<$Res> {
  factory _$AdashiRotationStateCopyWith(_AdashiRotationState value, $Res Function(_AdashiRotationState) _then) = __$AdashiRotationStateCopyWithImpl;
@override @useResult
$Res call({
 StateStatus status, AdashiRotationView? rotation
});




}
/// @nodoc
class __$AdashiRotationStateCopyWithImpl<$Res>
    implements _$AdashiRotationStateCopyWith<$Res> {
  __$AdashiRotationStateCopyWithImpl(this._self, this._then);

  final _AdashiRotationState _self;
  final $Res Function(_AdashiRotationState) _then;

/// Create a copy of AdashiRotationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? rotation = freezed,}) {
  return _then(_AdashiRotationState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,rotation: freezed == rotation ? _self.rotation : rotation // ignore: cast_nullable_to_non_nullable
as AdashiRotationView?,
  ));
}


}

// dart format on
