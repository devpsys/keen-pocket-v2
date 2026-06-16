// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pockets_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PocketsState {

 StateStatus get status; List<Pocket> get pockets; Failure? get failure;
/// Create a copy of PocketsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PocketsStateCopyWith<PocketsState> get copyWith => _$PocketsStateCopyWithImpl<PocketsState>(this as PocketsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PocketsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.pockets, pockets)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(pockets),failure);

@override
String toString() {
  return 'PocketsState(status: $status, pockets: $pockets, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $PocketsStateCopyWith<$Res>  {
  factory $PocketsStateCopyWith(PocketsState value, $Res Function(PocketsState) _then) = _$PocketsStateCopyWithImpl;
@useResult
$Res call({
 StateStatus status, List<Pocket> pockets, Failure? failure
});




}
/// @nodoc
class _$PocketsStateCopyWithImpl<$Res>
    implements $PocketsStateCopyWith<$Res> {
  _$PocketsStateCopyWithImpl(this._self, this._then);

  final PocketsState _self;
  final $Res Function(PocketsState) _then;

/// Create a copy of PocketsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? pockets = null,Object? failure = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,pockets: null == pockets ? _self.pockets : pockets // ignore: cast_nullable_to_non_nullable
as List<Pocket>,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

}


/// Adds pattern-matching-related methods to [PocketsState].
extension PocketsStatePatterns on PocketsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PocketsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PocketsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PocketsState value)  $default,){
final _that = this;
switch (_that) {
case _PocketsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PocketsState value)?  $default,){
final _that = this;
switch (_that) {
case _PocketsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StateStatus status,  List<Pocket> pockets,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PocketsState() when $default != null:
return $default(_that.status,_that.pockets,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StateStatus status,  List<Pocket> pockets,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _PocketsState():
return $default(_that.status,_that.pockets,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StateStatus status,  List<Pocket> pockets,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _PocketsState() when $default != null:
return $default(_that.status,_that.pockets,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _PocketsState implements PocketsState {
  const _PocketsState({this.status = StateStatus.initial, final  List<Pocket> pockets = const <Pocket>[], this.failure}): _pockets = pockets;
  

@override@JsonKey() final  StateStatus status;
 final  List<Pocket> _pockets;
@override@JsonKey() List<Pocket> get pockets {
  if (_pockets is EqualUnmodifiableListView) return _pockets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pockets);
}

@override final  Failure? failure;

/// Create a copy of PocketsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PocketsStateCopyWith<_PocketsState> get copyWith => __$PocketsStateCopyWithImpl<_PocketsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PocketsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._pockets, _pockets)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_pockets),failure);

@override
String toString() {
  return 'PocketsState(status: $status, pockets: $pockets, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$PocketsStateCopyWith<$Res> implements $PocketsStateCopyWith<$Res> {
  factory _$PocketsStateCopyWith(_PocketsState value, $Res Function(_PocketsState) _then) = __$PocketsStateCopyWithImpl;
@override @useResult
$Res call({
 StateStatus status, List<Pocket> pockets, Failure? failure
});




}
/// @nodoc
class __$PocketsStateCopyWithImpl<$Res>
    implements _$PocketsStateCopyWith<$Res> {
  __$PocketsStateCopyWithImpl(this._self, this._then);

  final _PocketsState _self;
  final $Res Function(_PocketsState) _then;

/// Create a copy of PocketsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? pockets = null,Object? failure = freezed,}) {
  return _then(_PocketsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,pockets: null == pockets ? _self._pockets : pockets // ignore: cast_nullable_to_non_nullable
as List<Pocket>,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}


}

// dart format on
