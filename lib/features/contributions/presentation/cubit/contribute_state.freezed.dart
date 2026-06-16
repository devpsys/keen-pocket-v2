// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contribute_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContributeState {

 StateStatus get status; Failure? get failure; Map<String, String> get fieldErrors;
/// Create a copy of ContributeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContributeStateCopyWith<ContributeState> get copyWith => _$ContributeStateCopyWithImpl<ContributeState>(this as ContributeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContributeState&&(identical(other.status, status) || other.status == status)&&(identical(other.failure, failure) || other.failure == failure)&&const DeepCollectionEquality().equals(other.fieldErrors, fieldErrors));
}


@override
int get hashCode => Object.hash(runtimeType,status,failure,const DeepCollectionEquality().hash(fieldErrors));

@override
String toString() {
  return 'ContributeState(status: $status, failure: $failure, fieldErrors: $fieldErrors)';
}


}

/// @nodoc
abstract mixin class $ContributeStateCopyWith<$Res>  {
  factory $ContributeStateCopyWith(ContributeState value, $Res Function(ContributeState) _then) = _$ContributeStateCopyWithImpl;
@useResult
$Res call({
 StateStatus status, Failure? failure, Map<String, String> fieldErrors
});




}
/// @nodoc
class _$ContributeStateCopyWithImpl<$Res>
    implements $ContributeStateCopyWith<$Res> {
  _$ContributeStateCopyWithImpl(this._self, this._then);

  final ContributeState _self;
  final $Res Function(ContributeState) _then;

/// Create a copy of ContributeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? failure = freezed,Object? fieldErrors = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,fieldErrors: null == fieldErrors ? _self.fieldErrors : fieldErrors // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ContributeState].
extension ContributeStatePatterns on ContributeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContributeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContributeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContributeState value)  $default,){
final _that = this;
switch (_that) {
case _ContributeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContributeState value)?  $default,){
final _that = this;
switch (_that) {
case _ContributeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StateStatus status,  Failure? failure,  Map<String, String> fieldErrors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContributeState() when $default != null:
return $default(_that.status,_that.failure,_that.fieldErrors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StateStatus status,  Failure? failure,  Map<String, String> fieldErrors)  $default,) {final _that = this;
switch (_that) {
case _ContributeState():
return $default(_that.status,_that.failure,_that.fieldErrors);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StateStatus status,  Failure? failure,  Map<String, String> fieldErrors)?  $default,) {final _that = this;
switch (_that) {
case _ContributeState() when $default != null:
return $default(_that.status,_that.failure,_that.fieldErrors);case _:
  return null;

}
}

}

/// @nodoc


class _ContributeState implements ContributeState {
  const _ContributeState({this.status = StateStatus.initial, this.failure, final  Map<String, String> fieldErrors = const <String, String>{}}): _fieldErrors = fieldErrors;
  

@override@JsonKey() final  StateStatus status;
@override final  Failure? failure;
 final  Map<String, String> _fieldErrors;
@override@JsonKey() Map<String, String> get fieldErrors {
  if (_fieldErrors is EqualUnmodifiableMapView) return _fieldErrors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_fieldErrors);
}


/// Create a copy of ContributeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContributeStateCopyWith<_ContributeState> get copyWith => __$ContributeStateCopyWithImpl<_ContributeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContributeState&&(identical(other.status, status) || other.status == status)&&(identical(other.failure, failure) || other.failure == failure)&&const DeepCollectionEquality().equals(other._fieldErrors, _fieldErrors));
}


@override
int get hashCode => Object.hash(runtimeType,status,failure,const DeepCollectionEquality().hash(_fieldErrors));

@override
String toString() {
  return 'ContributeState(status: $status, failure: $failure, fieldErrors: $fieldErrors)';
}


}

/// @nodoc
abstract mixin class _$ContributeStateCopyWith<$Res> implements $ContributeStateCopyWith<$Res> {
  factory _$ContributeStateCopyWith(_ContributeState value, $Res Function(_ContributeState) _then) = __$ContributeStateCopyWithImpl;
@override @useResult
$Res call({
 StateStatus status, Failure? failure, Map<String, String> fieldErrors
});




}
/// @nodoc
class __$ContributeStateCopyWithImpl<$Res>
    implements _$ContributeStateCopyWith<$Res> {
  __$ContributeStateCopyWithImpl(this._self, this._then);

  final _ContributeState _self;
  final $Res Function(_ContributeState) _then;

/// Create a copy of ContributeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? failure = freezed,Object? fieldErrors = null,}) {
  return _then(_ContributeState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,fieldErrors: null == fieldErrors ? _self._fieldErrors : fieldErrors // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}


}

// dart format on
