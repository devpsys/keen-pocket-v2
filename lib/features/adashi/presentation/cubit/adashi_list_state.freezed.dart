// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'adashi_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AdashiListState {

 StateStatus get status; List<AdashiSummaryView> get circles;
/// Create a copy of AdashiListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdashiListStateCopyWith<AdashiListState> get copyWith => _$AdashiListStateCopyWithImpl<AdashiListState>(this as AdashiListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdashiListState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.circles, circles));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(circles));

@override
String toString() {
  return 'AdashiListState(status: $status, circles: $circles)';
}


}

/// @nodoc
abstract mixin class $AdashiListStateCopyWith<$Res>  {
  factory $AdashiListStateCopyWith(AdashiListState value, $Res Function(AdashiListState) _then) = _$AdashiListStateCopyWithImpl;
@useResult
$Res call({
 StateStatus status, List<AdashiSummaryView> circles
});




}
/// @nodoc
class _$AdashiListStateCopyWithImpl<$Res>
    implements $AdashiListStateCopyWith<$Res> {
  _$AdashiListStateCopyWithImpl(this._self, this._then);

  final AdashiListState _self;
  final $Res Function(AdashiListState) _then;

/// Create a copy of AdashiListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? circles = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,circles: null == circles ? _self.circles : circles // ignore: cast_nullable_to_non_nullable
as List<AdashiSummaryView>,
  ));
}

}


/// Adds pattern-matching-related methods to [AdashiListState].
extension AdashiListStatePatterns on AdashiListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdashiListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdashiListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdashiListState value)  $default,){
final _that = this;
switch (_that) {
case _AdashiListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdashiListState value)?  $default,){
final _that = this;
switch (_that) {
case _AdashiListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StateStatus status,  List<AdashiSummaryView> circles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdashiListState() when $default != null:
return $default(_that.status,_that.circles);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StateStatus status,  List<AdashiSummaryView> circles)  $default,) {final _that = this;
switch (_that) {
case _AdashiListState():
return $default(_that.status,_that.circles);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StateStatus status,  List<AdashiSummaryView> circles)?  $default,) {final _that = this;
switch (_that) {
case _AdashiListState() when $default != null:
return $default(_that.status,_that.circles);case _:
  return null;

}
}

}

/// @nodoc


class _AdashiListState implements AdashiListState {
  const _AdashiListState({this.status = StateStatus.initial, final  List<AdashiSummaryView> circles = const <AdashiSummaryView>[]}): _circles = circles;
  

@override@JsonKey() final  StateStatus status;
 final  List<AdashiSummaryView> _circles;
@override@JsonKey() List<AdashiSummaryView> get circles {
  if (_circles is EqualUnmodifiableListView) return _circles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_circles);
}


/// Create a copy of AdashiListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdashiListStateCopyWith<_AdashiListState> get copyWith => __$AdashiListStateCopyWithImpl<_AdashiListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdashiListState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._circles, _circles));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_circles));

@override
String toString() {
  return 'AdashiListState(status: $status, circles: $circles)';
}


}

/// @nodoc
abstract mixin class _$AdashiListStateCopyWith<$Res> implements $AdashiListStateCopyWith<$Res> {
  factory _$AdashiListStateCopyWith(_AdashiListState value, $Res Function(_AdashiListState) _then) = __$AdashiListStateCopyWithImpl;
@override @useResult
$Res call({
 StateStatus status, List<AdashiSummaryView> circles
});




}
/// @nodoc
class __$AdashiListStateCopyWithImpl<$Res>
    implements _$AdashiListStateCopyWith<$Res> {
  __$AdashiListStateCopyWithImpl(this._self, this._then);

  final _AdashiListState _self;
  final $Res Function(_AdashiListState) _then;

/// Create a copy of AdashiListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? circles = null,}) {
  return _then(_AdashiListState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,circles: null == circles ? _self._circles : circles // ignore: cast_nullable_to_non_nullable
as List<AdashiSummaryView>,
  ));
}


}

// dart format on
