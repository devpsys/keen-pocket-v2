// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pocket_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PocketDetailState {

 StateStatus get status; Pocket? get pocket; PocketRole get role; Failure? get failure;
/// Create a copy of PocketDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PocketDetailStateCopyWith<PocketDetailState> get copyWith => _$PocketDetailStateCopyWithImpl<PocketDetailState>(this as PocketDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PocketDetailState&&(identical(other.status, status) || other.status == status)&&(identical(other.pocket, pocket) || other.pocket == pocket)&&(identical(other.role, role) || other.role == role)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,pocket,role,failure);

@override
String toString() {
  return 'PocketDetailState(status: $status, pocket: $pocket, role: $role, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $PocketDetailStateCopyWith<$Res>  {
  factory $PocketDetailStateCopyWith(PocketDetailState value, $Res Function(PocketDetailState) _then) = _$PocketDetailStateCopyWithImpl;
@useResult
$Res call({
 StateStatus status, Pocket? pocket, PocketRole role, Failure? failure
});


$PocketCopyWith<$Res>? get pocket;

}
/// @nodoc
class _$PocketDetailStateCopyWithImpl<$Res>
    implements $PocketDetailStateCopyWith<$Res> {
  _$PocketDetailStateCopyWithImpl(this._self, this._then);

  final PocketDetailState _self;
  final $Res Function(PocketDetailState) _then;

/// Create a copy of PocketDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? pocket = freezed,Object? role = null,Object? failure = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,pocket: freezed == pocket ? _self.pocket : pocket // ignore: cast_nullable_to_non_nullable
as Pocket?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as PocketRole,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}
/// Create a copy of PocketDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PocketCopyWith<$Res>? get pocket {
    if (_self.pocket == null) {
    return null;
  }

  return $PocketCopyWith<$Res>(_self.pocket!, (value) {
    return _then(_self.copyWith(pocket: value));
  });
}
}


/// Adds pattern-matching-related methods to [PocketDetailState].
extension PocketDetailStatePatterns on PocketDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PocketDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PocketDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PocketDetailState value)  $default,){
final _that = this;
switch (_that) {
case _PocketDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PocketDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _PocketDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StateStatus status,  Pocket? pocket,  PocketRole role,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PocketDetailState() when $default != null:
return $default(_that.status,_that.pocket,_that.role,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StateStatus status,  Pocket? pocket,  PocketRole role,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _PocketDetailState():
return $default(_that.status,_that.pocket,_that.role,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StateStatus status,  Pocket? pocket,  PocketRole role,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _PocketDetailState() when $default != null:
return $default(_that.status,_that.pocket,_that.role,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _PocketDetailState implements PocketDetailState {
  const _PocketDetailState({this.status = StateStatus.initial, this.pocket, this.role = PocketRole.guest, this.failure});
  

@override@JsonKey() final  StateStatus status;
@override final  Pocket? pocket;
@override@JsonKey() final  PocketRole role;
@override final  Failure? failure;

/// Create a copy of PocketDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PocketDetailStateCopyWith<_PocketDetailState> get copyWith => __$PocketDetailStateCopyWithImpl<_PocketDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PocketDetailState&&(identical(other.status, status) || other.status == status)&&(identical(other.pocket, pocket) || other.pocket == pocket)&&(identical(other.role, role) || other.role == role)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,pocket,role,failure);

@override
String toString() {
  return 'PocketDetailState(status: $status, pocket: $pocket, role: $role, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$PocketDetailStateCopyWith<$Res> implements $PocketDetailStateCopyWith<$Res> {
  factory _$PocketDetailStateCopyWith(_PocketDetailState value, $Res Function(_PocketDetailState) _then) = __$PocketDetailStateCopyWithImpl;
@override @useResult
$Res call({
 StateStatus status, Pocket? pocket, PocketRole role, Failure? failure
});


@override $PocketCopyWith<$Res>? get pocket;

}
/// @nodoc
class __$PocketDetailStateCopyWithImpl<$Res>
    implements _$PocketDetailStateCopyWith<$Res> {
  __$PocketDetailStateCopyWithImpl(this._self, this._then);

  final _PocketDetailState _self;
  final $Res Function(_PocketDetailState) _then;

/// Create a copy of PocketDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? pocket = freezed,Object? role = null,Object? failure = freezed,}) {
  return _then(_PocketDetailState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,pocket: freezed == pocket ? _self.pocket : pocket // ignore: cast_nullable_to_non_nullable
as Pocket?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as PocketRole,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of PocketDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PocketCopyWith<$Res>? get pocket {
    if (_self.pocket == null) {
    return null;
  }

  return $PocketCopyWith<$Res>(_self.pocket!, (value) {
    return _then(_self.copyWith(pocket: value));
  });
}
}

// dart format on
