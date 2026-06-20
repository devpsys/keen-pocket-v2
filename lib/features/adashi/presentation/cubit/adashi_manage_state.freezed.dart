// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'adashi_manage_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AdashiManageState {

 StateStatus get status; AdashiManageView? get manage;
/// Create a copy of AdashiManageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdashiManageStateCopyWith<AdashiManageState> get copyWith => _$AdashiManageStateCopyWithImpl<AdashiManageState>(this as AdashiManageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdashiManageState&&(identical(other.status, status) || other.status == status)&&(identical(other.manage, manage) || other.manage == manage));
}


@override
int get hashCode => Object.hash(runtimeType,status,manage);

@override
String toString() {
  return 'AdashiManageState(status: $status, manage: $manage)';
}


}

/// @nodoc
abstract mixin class $AdashiManageStateCopyWith<$Res>  {
  factory $AdashiManageStateCopyWith(AdashiManageState value, $Res Function(AdashiManageState) _then) = _$AdashiManageStateCopyWithImpl;
@useResult
$Res call({
 StateStatus status, AdashiManageView? manage
});




}
/// @nodoc
class _$AdashiManageStateCopyWithImpl<$Res>
    implements $AdashiManageStateCopyWith<$Res> {
  _$AdashiManageStateCopyWithImpl(this._self, this._then);

  final AdashiManageState _self;
  final $Res Function(AdashiManageState) _then;

/// Create a copy of AdashiManageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? manage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,manage: freezed == manage ? _self.manage : manage // ignore: cast_nullable_to_non_nullable
as AdashiManageView?,
  ));
}

}


/// Adds pattern-matching-related methods to [AdashiManageState].
extension AdashiManageStatePatterns on AdashiManageState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdashiManageState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdashiManageState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdashiManageState value)  $default,){
final _that = this;
switch (_that) {
case _AdashiManageState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdashiManageState value)?  $default,){
final _that = this;
switch (_that) {
case _AdashiManageState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StateStatus status,  AdashiManageView? manage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdashiManageState() when $default != null:
return $default(_that.status,_that.manage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StateStatus status,  AdashiManageView? manage)  $default,) {final _that = this;
switch (_that) {
case _AdashiManageState():
return $default(_that.status,_that.manage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StateStatus status,  AdashiManageView? manage)?  $default,) {final _that = this;
switch (_that) {
case _AdashiManageState() when $default != null:
return $default(_that.status,_that.manage);case _:
  return null;

}
}

}

/// @nodoc


class _AdashiManageState implements AdashiManageState {
  const _AdashiManageState({this.status = StateStatus.initial, this.manage});
  

@override@JsonKey() final  StateStatus status;
@override final  AdashiManageView? manage;

/// Create a copy of AdashiManageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdashiManageStateCopyWith<_AdashiManageState> get copyWith => __$AdashiManageStateCopyWithImpl<_AdashiManageState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdashiManageState&&(identical(other.status, status) || other.status == status)&&(identical(other.manage, manage) || other.manage == manage));
}


@override
int get hashCode => Object.hash(runtimeType,status,manage);

@override
String toString() {
  return 'AdashiManageState(status: $status, manage: $manage)';
}


}

/// @nodoc
abstract mixin class _$AdashiManageStateCopyWith<$Res> implements $AdashiManageStateCopyWith<$Res> {
  factory _$AdashiManageStateCopyWith(_AdashiManageState value, $Res Function(_AdashiManageState) _then) = __$AdashiManageStateCopyWithImpl;
@override @useResult
$Res call({
 StateStatus status, AdashiManageView? manage
});




}
/// @nodoc
class __$AdashiManageStateCopyWithImpl<$Res>
    implements _$AdashiManageStateCopyWith<$Res> {
  __$AdashiManageStateCopyWithImpl(this._self, this._then);

  final _AdashiManageState _self;
  final $Res Function(_AdashiManageState) _then;

/// Create a copy of AdashiManageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? manage = freezed,}) {
  return _then(_AdashiManageState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,manage: freezed == manage ? _self.manage : manage // ignore: cast_nullable_to_non_nullable
as AdashiManageView?,
  ));
}


}

// dart format on
