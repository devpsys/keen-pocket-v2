// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friends_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FriendsState {

 StateStatus get status; String get inviteCode; List<FriendView> get connections;
/// Create a copy of FriendsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FriendsStateCopyWith<FriendsState> get copyWith => _$FriendsStateCopyWithImpl<FriendsState>(this as FriendsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FriendsState&&(identical(other.status, status) || other.status == status)&&(identical(other.inviteCode, inviteCode) || other.inviteCode == inviteCode)&&const DeepCollectionEquality().equals(other.connections, connections));
}


@override
int get hashCode => Object.hash(runtimeType,status,inviteCode,const DeepCollectionEquality().hash(connections));

@override
String toString() {
  return 'FriendsState(status: $status, inviteCode: $inviteCode, connections: $connections)';
}


}

/// @nodoc
abstract mixin class $FriendsStateCopyWith<$Res>  {
  factory $FriendsStateCopyWith(FriendsState value, $Res Function(FriendsState) _then) = _$FriendsStateCopyWithImpl;
@useResult
$Res call({
 StateStatus status, String inviteCode, List<FriendView> connections
});




}
/// @nodoc
class _$FriendsStateCopyWithImpl<$Res>
    implements $FriendsStateCopyWith<$Res> {
  _$FriendsStateCopyWithImpl(this._self, this._then);

  final FriendsState _self;
  final $Res Function(FriendsState) _then;

/// Create a copy of FriendsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? inviteCode = null,Object? connections = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,inviteCode: null == inviteCode ? _self.inviteCode : inviteCode // ignore: cast_nullable_to_non_nullable
as String,connections: null == connections ? _self.connections : connections // ignore: cast_nullable_to_non_nullable
as List<FriendView>,
  ));
}

}


/// Adds pattern-matching-related methods to [FriendsState].
extension FriendsStatePatterns on FriendsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FriendsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FriendsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FriendsState value)  $default,){
final _that = this;
switch (_that) {
case _FriendsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FriendsState value)?  $default,){
final _that = this;
switch (_that) {
case _FriendsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StateStatus status,  String inviteCode,  List<FriendView> connections)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FriendsState() when $default != null:
return $default(_that.status,_that.inviteCode,_that.connections);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StateStatus status,  String inviteCode,  List<FriendView> connections)  $default,) {final _that = this;
switch (_that) {
case _FriendsState():
return $default(_that.status,_that.inviteCode,_that.connections);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StateStatus status,  String inviteCode,  List<FriendView> connections)?  $default,) {final _that = this;
switch (_that) {
case _FriendsState() when $default != null:
return $default(_that.status,_that.inviteCode,_that.connections);case _:
  return null;

}
}

}

/// @nodoc


class _FriendsState extends FriendsState {
  const _FriendsState({this.status = StateStatus.initial, this.inviteCode = '', final  List<FriendView> connections = const <FriendView>[]}): _connections = connections,super._();
  

@override@JsonKey() final  StateStatus status;
@override@JsonKey() final  String inviteCode;
 final  List<FriendView> _connections;
@override@JsonKey() List<FriendView> get connections {
  if (_connections is EqualUnmodifiableListView) return _connections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_connections);
}


/// Create a copy of FriendsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FriendsStateCopyWith<_FriendsState> get copyWith => __$FriendsStateCopyWithImpl<_FriendsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FriendsState&&(identical(other.status, status) || other.status == status)&&(identical(other.inviteCode, inviteCode) || other.inviteCode == inviteCode)&&const DeepCollectionEquality().equals(other._connections, _connections));
}


@override
int get hashCode => Object.hash(runtimeType,status,inviteCode,const DeepCollectionEquality().hash(_connections));

@override
String toString() {
  return 'FriendsState(status: $status, inviteCode: $inviteCode, connections: $connections)';
}


}

/// @nodoc
abstract mixin class _$FriendsStateCopyWith<$Res> implements $FriendsStateCopyWith<$Res> {
  factory _$FriendsStateCopyWith(_FriendsState value, $Res Function(_FriendsState) _then) = __$FriendsStateCopyWithImpl;
@override @useResult
$Res call({
 StateStatus status, String inviteCode, List<FriendView> connections
});




}
/// @nodoc
class __$FriendsStateCopyWithImpl<$Res>
    implements _$FriendsStateCopyWith<$Res> {
  __$FriendsStateCopyWithImpl(this._self, this._then);

  final _FriendsState _self;
  final $Res Function(_FriendsState) _then;

/// Create a copy of FriendsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? inviteCode = null,Object? connections = null,}) {
  return _then(_FriendsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,inviteCode: null == inviteCode ? _self.inviteCode : inviteCode // ignore: cast_nullable_to_non_nullable
as String,connections: null == connections ? _self._connections : connections // ignore: cast_nullable_to_non_nullable
as List<FriendView>,
  ));
}


}

// dart format on
