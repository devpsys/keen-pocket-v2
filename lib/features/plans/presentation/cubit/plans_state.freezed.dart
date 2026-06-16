// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plans_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlansState {

 StateStatus get status; List<PlanView> get plans;
/// Create a copy of PlansState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlansStateCopyWith<PlansState> get copyWith => _$PlansStateCopyWithImpl<PlansState>(this as PlansState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlansState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.plans, plans));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(plans));

@override
String toString() {
  return 'PlansState(status: $status, plans: $plans)';
}


}

/// @nodoc
abstract mixin class $PlansStateCopyWith<$Res>  {
  factory $PlansStateCopyWith(PlansState value, $Res Function(PlansState) _then) = _$PlansStateCopyWithImpl;
@useResult
$Res call({
 StateStatus status, List<PlanView> plans
});




}
/// @nodoc
class _$PlansStateCopyWithImpl<$Res>
    implements $PlansStateCopyWith<$Res> {
  _$PlansStateCopyWithImpl(this._self, this._then);

  final PlansState _self;
  final $Res Function(PlansState) _then;

/// Create a copy of PlansState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? plans = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,plans: null == plans ? _self.plans : plans // ignore: cast_nullable_to_non_nullable
as List<PlanView>,
  ));
}

}


/// Adds pattern-matching-related methods to [PlansState].
extension PlansStatePatterns on PlansState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlansState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlansState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlansState value)  $default,){
final _that = this;
switch (_that) {
case _PlansState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlansState value)?  $default,){
final _that = this;
switch (_that) {
case _PlansState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StateStatus status,  List<PlanView> plans)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlansState() when $default != null:
return $default(_that.status,_that.plans);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StateStatus status,  List<PlanView> plans)  $default,) {final _that = this;
switch (_that) {
case _PlansState():
return $default(_that.status,_that.plans);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StateStatus status,  List<PlanView> plans)?  $default,) {final _that = this;
switch (_that) {
case _PlansState() when $default != null:
return $default(_that.status,_that.plans);case _:
  return null;

}
}

}

/// @nodoc


class _PlansState implements PlansState {
  const _PlansState({this.status = StateStatus.initial, final  List<PlanView> plans = const <PlanView>[]}): _plans = plans;
  

@override@JsonKey() final  StateStatus status;
 final  List<PlanView> _plans;
@override@JsonKey() List<PlanView> get plans {
  if (_plans is EqualUnmodifiableListView) return _plans;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_plans);
}


/// Create a copy of PlansState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlansStateCopyWith<_PlansState> get copyWith => __$PlansStateCopyWithImpl<_PlansState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlansState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._plans, _plans));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_plans));

@override
String toString() {
  return 'PlansState(status: $status, plans: $plans)';
}


}

/// @nodoc
abstract mixin class _$PlansStateCopyWith<$Res> implements $PlansStateCopyWith<$Res> {
  factory _$PlansStateCopyWith(_PlansState value, $Res Function(_PlansState) _then) = __$PlansStateCopyWithImpl;
@override @useResult
$Res call({
 StateStatus status, List<PlanView> plans
});




}
/// @nodoc
class __$PlansStateCopyWithImpl<$Res>
    implements _$PlansStateCopyWith<$Res> {
  __$PlansStateCopyWithImpl(this._self, this._then);

  final _PlansState _self;
  final $Res Function(_PlansState) _then;

/// Create a copy of PlansState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? plans = null,}) {
  return _then(_PlansState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,plans: null == plans ? _self._plans : plans // ignore: cast_nullable_to_non_nullable
as List<PlanView>,
  ));
}


}

// dart format on
