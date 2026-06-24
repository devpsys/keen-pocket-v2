// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'disputes_hub_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DisputesHubState {

 StateStatus get status; List<DisputeView> get disputes; bool get adminView; String? get selectedId; int? get resolvedThisMonth; String? get avgResolution;
/// Create a copy of DisputesHubState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DisputesHubStateCopyWith<DisputesHubState> get copyWith => _$DisputesHubStateCopyWithImpl<DisputesHubState>(this as DisputesHubState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DisputesHubState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.disputes, disputes)&&(identical(other.adminView, adminView) || other.adminView == adminView)&&(identical(other.selectedId, selectedId) || other.selectedId == selectedId)&&(identical(other.resolvedThisMonth, resolvedThisMonth) || other.resolvedThisMonth == resolvedThisMonth)&&(identical(other.avgResolution, avgResolution) || other.avgResolution == avgResolution));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(disputes),adminView,selectedId,resolvedThisMonth,avgResolution);

@override
String toString() {
  return 'DisputesHubState(status: $status, disputes: $disputes, adminView: $adminView, selectedId: $selectedId, resolvedThisMonth: $resolvedThisMonth, avgResolution: $avgResolution)';
}


}

/// @nodoc
abstract mixin class $DisputesHubStateCopyWith<$Res>  {
  factory $DisputesHubStateCopyWith(DisputesHubState value, $Res Function(DisputesHubState) _then) = _$DisputesHubStateCopyWithImpl;
@useResult
$Res call({
 StateStatus status, List<DisputeView> disputes, bool adminView, String? selectedId, int? resolvedThisMonth, String? avgResolution
});




}
/// @nodoc
class _$DisputesHubStateCopyWithImpl<$Res>
    implements $DisputesHubStateCopyWith<$Res> {
  _$DisputesHubStateCopyWithImpl(this._self, this._then);

  final DisputesHubState _self;
  final $Res Function(DisputesHubState) _then;

/// Create a copy of DisputesHubState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? disputes = null,Object? adminView = null,Object? selectedId = freezed,Object? resolvedThisMonth = freezed,Object? avgResolution = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,disputes: null == disputes ? _self.disputes : disputes // ignore: cast_nullable_to_non_nullable
as List<DisputeView>,adminView: null == adminView ? _self.adminView : adminView // ignore: cast_nullable_to_non_nullable
as bool,selectedId: freezed == selectedId ? _self.selectedId : selectedId // ignore: cast_nullable_to_non_nullable
as String?,resolvedThisMonth: freezed == resolvedThisMonth ? _self.resolvedThisMonth : resolvedThisMonth // ignore: cast_nullable_to_non_nullable
as int?,avgResolution: freezed == avgResolution ? _self.avgResolution : avgResolution // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DisputesHubState].
extension DisputesHubStatePatterns on DisputesHubState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DisputesHubState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DisputesHubState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DisputesHubState value)  $default,){
final _that = this;
switch (_that) {
case _DisputesHubState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DisputesHubState value)?  $default,){
final _that = this;
switch (_that) {
case _DisputesHubState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StateStatus status,  List<DisputeView> disputes,  bool adminView,  String? selectedId,  int? resolvedThisMonth,  String? avgResolution)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DisputesHubState() when $default != null:
return $default(_that.status,_that.disputes,_that.adminView,_that.selectedId,_that.resolvedThisMonth,_that.avgResolution);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StateStatus status,  List<DisputeView> disputes,  bool adminView,  String? selectedId,  int? resolvedThisMonth,  String? avgResolution)  $default,) {final _that = this;
switch (_that) {
case _DisputesHubState():
return $default(_that.status,_that.disputes,_that.adminView,_that.selectedId,_that.resolvedThisMonth,_that.avgResolution);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StateStatus status,  List<DisputeView> disputes,  bool adminView,  String? selectedId,  int? resolvedThisMonth,  String? avgResolution)?  $default,) {final _that = this;
switch (_that) {
case _DisputesHubState() when $default != null:
return $default(_that.status,_that.disputes,_that.adminView,_that.selectedId,_that.resolvedThisMonth,_that.avgResolution);case _:
  return null;

}
}

}

/// @nodoc


class _DisputesHubState implements DisputesHubState {
  const _DisputesHubState({this.status = StateStatus.initial, final  List<DisputeView> disputes = const <DisputeView>[], this.adminView = false, this.selectedId, this.resolvedThisMonth, this.avgResolution}): _disputes = disputes;
  

@override@JsonKey() final  StateStatus status;
 final  List<DisputeView> _disputes;
@override@JsonKey() List<DisputeView> get disputes {
  if (_disputes is EqualUnmodifiableListView) return _disputes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_disputes);
}

@override@JsonKey() final  bool adminView;
@override final  String? selectedId;
@override final  int? resolvedThisMonth;
@override final  String? avgResolution;

/// Create a copy of DisputesHubState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DisputesHubStateCopyWith<_DisputesHubState> get copyWith => __$DisputesHubStateCopyWithImpl<_DisputesHubState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DisputesHubState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._disputes, _disputes)&&(identical(other.adminView, adminView) || other.adminView == adminView)&&(identical(other.selectedId, selectedId) || other.selectedId == selectedId)&&(identical(other.resolvedThisMonth, resolvedThisMonth) || other.resolvedThisMonth == resolvedThisMonth)&&(identical(other.avgResolution, avgResolution) || other.avgResolution == avgResolution));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_disputes),adminView,selectedId,resolvedThisMonth,avgResolution);

@override
String toString() {
  return 'DisputesHubState(status: $status, disputes: $disputes, adminView: $adminView, selectedId: $selectedId, resolvedThisMonth: $resolvedThisMonth, avgResolution: $avgResolution)';
}


}

/// @nodoc
abstract mixin class _$DisputesHubStateCopyWith<$Res> implements $DisputesHubStateCopyWith<$Res> {
  factory _$DisputesHubStateCopyWith(_DisputesHubState value, $Res Function(_DisputesHubState) _then) = __$DisputesHubStateCopyWithImpl;
@override @useResult
$Res call({
 StateStatus status, List<DisputeView> disputes, bool adminView, String? selectedId, int? resolvedThisMonth, String? avgResolution
});




}
/// @nodoc
class __$DisputesHubStateCopyWithImpl<$Res>
    implements _$DisputesHubStateCopyWith<$Res> {
  __$DisputesHubStateCopyWithImpl(this._self, this._then);

  final _DisputesHubState _self;
  final $Res Function(_DisputesHubState) _then;

/// Create a copy of DisputesHubState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? disputes = null,Object? adminView = null,Object? selectedId = freezed,Object? resolvedThisMonth = freezed,Object? avgResolution = freezed,}) {
  return _then(_DisputesHubState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,disputes: null == disputes ? _self._disputes : disputes // ignore: cast_nullable_to_non_nullable
as List<DisputeView>,adminView: null == adminView ? _self.adminView : adminView // ignore: cast_nullable_to_non_nullable
as bool,selectedId: freezed == selectedId ? _self.selectedId : selectedId // ignore: cast_nullable_to_non_nullable
as String?,resolvedThisMonth: freezed == resolvedThisMonth ? _self.resolvedThisMonth : resolvedThisMonth // ignore: cast_nullable_to_non_nullable
as int?,avgResolution: freezed == avgResolution ? _self.avgResolution : avgResolution // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
