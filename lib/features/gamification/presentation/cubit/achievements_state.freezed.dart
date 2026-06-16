// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'achievements_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AchievementsState {

 StateStatus get status; AchievementsView? get data;
/// Create a copy of AchievementsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AchievementsStateCopyWith<AchievementsState> get copyWith => _$AchievementsStateCopyWithImpl<AchievementsState>(this as AchievementsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AchievementsState&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'AchievementsState(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $AchievementsStateCopyWith<$Res>  {
  factory $AchievementsStateCopyWith(AchievementsState value, $Res Function(AchievementsState) _then) = _$AchievementsStateCopyWithImpl;
@useResult
$Res call({
 StateStatus status, AchievementsView? data
});




}
/// @nodoc
class _$AchievementsStateCopyWithImpl<$Res>
    implements $AchievementsStateCopyWith<$Res> {
  _$AchievementsStateCopyWithImpl(this._self, this._then);

  final AchievementsState _self;
  final $Res Function(AchievementsState) _then;

/// Create a copy of AchievementsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AchievementsView?,
  ));
}

}


/// Adds pattern-matching-related methods to [AchievementsState].
extension AchievementsStatePatterns on AchievementsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AchievementsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AchievementsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AchievementsState value)  $default,){
final _that = this;
switch (_that) {
case _AchievementsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AchievementsState value)?  $default,){
final _that = this;
switch (_that) {
case _AchievementsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StateStatus status,  AchievementsView? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AchievementsState() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StateStatus status,  AchievementsView? data)  $default,) {final _that = this;
switch (_that) {
case _AchievementsState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StateStatus status,  AchievementsView? data)?  $default,) {final _that = this;
switch (_that) {
case _AchievementsState() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc


class _AchievementsState implements AchievementsState {
  const _AchievementsState({this.status = StateStatus.initial, this.data});
  

@override@JsonKey() final  StateStatus status;
@override final  AchievementsView? data;

/// Create a copy of AchievementsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AchievementsStateCopyWith<_AchievementsState> get copyWith => __$AchievementsStateCopyWithImpl<_AchievementsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AchievementsState&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'AchievementsState(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$AchievementsStateCopyWith<$Res> implements $AchievementsStateCopyWith<$Res> {
  factory _$AchievementsStateCopyWith(_AchievementsState value, $Res Function(_AchievementsState) _then) = __$AchievementsStateCopyWithImpl;
@override @useResult
$Res call({
 StateStatus status, AchievementsView? data
});




}
/// @nodoc
class __$AchievementsStateCopyWithImpl<$Res>
    implements _$AchievementsStateCopyWith<$Res> {
  __$AchievementsStateCopyWithImpl(this._self, this._then);

  final _AchievementsState _self;
  final $Res Function(_AchievementsState) _then;

/// Create a copy of AchievementsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = freezed,}) {
  return _then(_AchievementsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AchievementsView?,
  ));
}


}

// dart format on
