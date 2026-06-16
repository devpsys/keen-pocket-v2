// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'adashi_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AdashiDetailState {

 StateStatus get status; AdashiDetailView? get adashi;
/// Create a copy of AdashiDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdashiDetailStateCopyWith<AdashiDetailState> get copyWith => _$AdashiDetailStateCopyWithImpl<AdashiDetailState>(this as AdashiDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdashiDetailState&&(identical(other.status, status) || other.status == status)&&(identical(other.adashi, adashi) || other.adashi == adashi));
}


@override
int get hashCode => Object.hash(runtimeType,status,adashi);

@override
String toString() {
  return 'AdashiDetailState(status: $status, adashi: $adashi)';
}


}

/// @nodoc
abstract mixin class $AdashiDetailStateCopyWith<$Res>  {
  factory $AdashiDetailStateCopyWith(AdashiDetailState value, $Res Function(AdashiDetailState) _then) = _$AdashiDetailStateCopyWithImpl;
@useResult
$Res call({
 StateStatus status, AdashiDetailView? adashi
});




}
/// @nodoc
class _$AdashiDetailStateCopyWithImpl<$Res>
    implements $AdashiDetailStateCopyWith<$Res> {
  _$AdashiDetailStateCopyWithImpl(this._self, this._then);

  final AdashiDetailState _self;
  final $Res Function(AdashiDetailState) _then;

/// Create a copy of AdashiDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? adashi = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,adashi: freezed == adashi ? _self.adashi : adashi // ignore: cast_nullable_to_non_nullable
as AdashiDetailView?,
  ));
}

}


/// Adds pattern-matching-related methods to [AdashiDetailState].
extension AdashiDetailStatePatterns on AdashiDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdashiDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdashiDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdashiDetailState value)  $default,){
final _that = this;
switch (_that) {
case _AdashiDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdashiDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _AdashiDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StateStatus status,  AdashiDetailView? adashi)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdashiDetailState() when $default != null:
return $default(_that.status,_that.adashi);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StateStatus status,  AdashiDetailView? adashi)  $default,) {final _that = this;
switch (_that) {
case _AdashiDetailState():
return $default(_that.status,_that.adashi);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StateStatus status,  AdashiDetailView? adashi)?  $default,) {final _that = this;
switch (_that) {
case _AdashiDetailState() when $default != null:
return $default(_that.status,_that.adashi);case _:
  return null;

}
}

}

/// @nodoc


class _AdashiDetailState implements AdashiDetailState {
  const _AdashiDetailState({this.status = StateStatus.initial, this.adashi});
  

@override@JsonKey() final  StateStatus status;
@override final  AdashiDetailView? adashi;

/// Create a copy of AdashiDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdashiDetailStateCopyWith<_AdashiDetailState> get copyWith => __$AdashiDetailStateCopyWithImpl<_AdashiDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdashiDetailState&&(identical(other.status, status) || other.status == status)&&(identical(other.adashi, adashi) || other.adashi == adashi));
}


@override
int get hashCode => Object.hash(runtimeType,status,adashi);

@override
String toString() {
  return 'AdashiDetailState(status: $status, adashi: $adashi)';
}


}

/// @nodoc
abstract mixin class _$AdashiDetailStateCopyWith<$Res> implements $AdashiDetailStateCopyWith<$Res> {
  factory _$AdashiDetailStateCopyWith(_AdashiDetailState value, $Res Function(_AdashiDetailState) _then) = __$AdashiDetailStateCopyWithImpl;
@override @useResult
$Res call({
 StateStatus status, AdashiDetailView? adashi
});




}
/// @nodoc
class __$AdashiDetailStateCopyWithImpl<$Res>
    implements _$AdashiDetailStateCopyWith<$Res> {
  __$AdashiDetailStateCopyWithImpl(this._self, this._then);

  final _AdashiDetailState _self;
  final $Res Function(_AdashiDetailState) _then;

/// Create a copy of AdashiDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? adashi = freezed,}) {
  return _then(_AdashiDetailState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,adashi: freezed == adashi ? _self.adashi : adashi // ignore: cast_nullable_to_non_nullable
as AdashiDetailView?,
  ));
}


}

// dart format on
