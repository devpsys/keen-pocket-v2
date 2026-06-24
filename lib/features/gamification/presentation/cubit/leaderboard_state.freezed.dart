// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leaderboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LeaderboardState {

 StateStatus get status; LeaderboardScope get scope; List<PodiumEntry> get podium; List<LeaderboardEntry> get rows; LeaderboardStanding? get standing;
/// Create a copy of LeaderboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeaderboardStateCopyWith<LeaderboardState> get copyWith => _$LeaderboardStateCopyWithImpl<LeaderboardState>(this as LeaderboardState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeaderboardState&&(identical(other.status, status) || other.status == status)&&(identical(other.scope, scope) || other.scope == scope)&&const DeepCollectionEquality().equals(other.podium, podium)&&const DeepCollectionEquality().equals(other.rows, rows)&&(identical(other.standing, standing) || other.standing == standing));
}


@override
int get hashCode => Object.hash(runtimeType,status,scope,const DeepCollectionEquality().hash(podium),const DeepCollectionEquality().hash(rows),standing);

@override
String toString() {
  return 'LeaderboardState(status: $status, scope: $scope, podium: $podium, rows: $rows, standing: $standing)';
}


}

/// @nodoc
abstract mixin class $LeaderboardStateCopyWith<$Res>  {
  factory $LeaderboardStateCopyWith(LeaderboardState value, $Res Function(LeaderboardState) _then) = _$LeaderboardStateCopyWithImpl;
@useResult
$Res call({
 StateStatus status, LeaderboardScope scope, List<PodiumEntry> podium, List<LeaderboardEntry> rows, LeaderboardStanding? standing
});




}
/// @nodoc
class _$LeaderboardStateCopyWithImpl<$Res>
    implements $LeaderboardStateCopyWith<$Res> {
  _$LeaderboardStateCopyWithImpl(this._self, this._then);

  final LeaderboardState _self;
  final $Res Function(LeaderboardState) _then;

/// Create a copy of LeaderboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? scope = null,Object? podium = null,Object? rows = null,Object? standing = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as LeaderboardScope,podium: null == podium ? _self.podium : podium // ignore: cast_nullable_to_non_nullable
as List<PodiumEntry>,rows: null == rows ? _self.rows : rows // ignore: cast_nullable_to_non_nullable
as List<LeaderboardEntry>,standing: freezed == standing ? _self.standing : standing // ignore: cast_nullable_to_non_nullable
as LeaderboardStanding?,
  ));
}

}


/// Adds pattern-matching-related methods to [LeaderboardState].
extension LeaderboardStatePatterns on LeaderboardState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LeaderboardState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LeaderboardState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LeaderboardState value)  $default,){
final _that = this;
switch (_that) {
case _LeaderboardState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LeaderboardState value)?  $default,){
final _that = this;
switch (_that) {
case _LeaderboardState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StateStatus status,  LeaderboardScope scope,  List<PodiumEntry> podium,  List<LeaderboardEntry> rows,  LeaderboardStanding? standing)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LeaderboardState() when $default != null:
return $default(_that.status,_that.scope,_that.podium,_that.rows,_that.standing);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StateStatus status,  LeaderboardScope scope,  List<PodiumEntry> podium,  List<LeaderboardEntry> rows,  LeaderboardStanding? standing)  $default,) {final _that = this;
switch (_that) {
case _LeaderboardState():
return $default(_that.status,_that.scope,_that.podium,_that.rows,_that.standing);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StateStatus status,  LeaderboardScope scope,  List<PodiumEntry> podium,  List<LeaderboardEntry> rows,  LeaderboardStanding? standing)?  $default,) {final _that = this;
switch (_that) {
case _LeaderboardState() when $default != null:
return $default(_that.status,_that.scope,_that.podium,_that.rows,_that.standing);case _:
  return null;

}
}

}

/// @nodoc


class _LeaderboardState implements LeaderboardState {
  const _LeaderboardState({this.status = StateStatus.initial, this.scope = LeaderboardScope.thisWeek, final  List<PodiumEntry> podium = const <PodiumEntry>[], final  List<LeaderboardEntry> rows = const <LeaderboardEntry>[], this.standing}): _podium = podium,_rows = rows;
  

@override@JsonKey() final  StateStatus status;
@override@JsonKey() final  LeaderboardScope scope;
 final  List<PodiumEntry> _podium;
@override@JsonKey() List<PodiumEntry> get podium {
  if (_podium is EqualUnmodifiableListView) return _podium;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_podium);
}

 final  List<LeaderboardEntry> _rows;
@override@JsonKey() List<LeaderboardEntry> get rows {
  if (_rows is EqualUnmodifiableListView) return _rows;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rows);
}

@override final  LeaderboardStanding? standing;

/// Create a copy of LeaderboardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeaderboardStateCopyWith<_LeaderboardState> get copyWith => __$LeaderboardStateCopyWithImpl<_LeaderboardState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeaderboardState&&(identical(other.status, status) || other.status == status)&&(identical(other.scope, scope) || other.scope == scope)&&const DeepCollectionEquality().equals(other._podium, _podium)&&const DeepCollectionEquality().equals(other._rows, _rows)&&(identical(other.standing, standing) || other.standing == standing));
}


@override
int get hashCode => Object.hash(runtimeType,status,scope,const DeepCollectionEquality().hash(_podium),const DeepCollectionEquality().hash(_rows),standing);

@override
String toString() {
  return 'LeaderboardState(status: $status, scope: $scope, podium: $podium, rows: $rows, standing: $standing)';
}


}

/// @nodoc
abstract mixin class _$LeaderboardStateCopyWith<$Res> implements $LeaderboardStateCopyWith<$Res> {
  factory _$LeaderboardStateCopyWith(_LeaderboardState value, $Res Function(_LeaderboardState) _then) = __$LeaderboardStateCopyWithImpl;
@override @useResult
$Res call({
 StateStatus status, LeaderboardScope scope, List<PodiumEntry> podium, List<LeaderboardEntry> rows, LeaderboardStanding? standing
});




}
/// @nodoc
class __$LeaderboardStateCopyWithImpl<$Res>
    implements _$LeaderboardStateCopyWith<$Res> {
  __$LeaderboardStateCopyWithImpl(this._self, this._then);

  final _LeaderboardState _self;
  final $Res Function(_LeaderboardState) _then;

/// Create a copy of LeaderboardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? scope = null,Object? podium = null,Object? rows = null,Object? standing = freezed,}) {
  return _then(_LeaderboardState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as LeaderboardScope,podium: null == podium ? _self._podium : podium // ignore: cast_nullable_to_non_nullable
as List<PodiumEntry>,rows: null == rows ? _self._rows : rows // ignore: cast_nullable_to_non_nullable
as List<LeaderboardEntry>,standing: freezed == standing ? _self.standing : standing // ignore: cast_nullable_to_non_nullable
as LeaderboardStanding?,
  ));
}


}

// dart format on
