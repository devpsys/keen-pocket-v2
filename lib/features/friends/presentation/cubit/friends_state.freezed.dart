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

 StateStatus get status; String get inviteLink; String get referralCode; int get invited; int get qualified; int get rewarded; List<ReferralView> get circle; Failure? get failure;
/// Create a copy of FriendsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FriendsStateCopyWith<FriendsState> get copyWith => _$FriendsStateCopyWithImpl<FriendsState>(this as FriendsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FriendsState&&(identical(other.status, status) || other.status == status)&&(identical(other.inviteLink, inviteLink) || other.inviteLink == inviteLink)&&(identical(other.referralCode, referralCode) || other.referralCode == referralCode)&&(identical(other.invited, invited) || other.invited == invited)&&(identical(other.qualified, qualified) || other.qualified == qualified)&&(identical(other.rewarded, rewarded) || other.rewarded == rewarded)&&const DeepCollectionEquality().equals(other.circle, circle)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,inviteLink,referralCode,invited,qualified,rewarded,const DeepCollectionEquality().hash(circle),failure);

@override
String toString() {
  return 'FriendsState(status: $status, inviteLink: $inviteLink, referralCode: $referralCode, invited: $invited, qualified: $qualified, rewarded: $rewarded, circle: $circle, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $FriendsStateCopyWith<$Res>  {
  factory $FriendsStateCopyWith(FriendsState value, $Res Function(FriendsState) _then) = _$FriendsStateCopyWithImpl;
@useResult
$Res call({
 StateStatus status, String inviteLink, String referralCode, int invited, int qualified, int rewarded, List<ReferralView> circle, Failure? failure
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
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? inviteLink = null,Object? referralCode = null,Object? invited = null,Object? qualified = null,Object? rewarded = null,Object? circle = null,Object? failure = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,inviteLink: null == inviteLink ? _self.inviteLink : inviteLink // ignore: cast_nullable_to_non_nullable
as String,referralCode: null == referralCode ? _self.referralCode : referralCode // ignore: cast_nullable_to_non_nullable
as String,invited: null == invited ? _self.invited : invited // ignore: cast_nullable_to_non_nullable
as int,qualified: null == qualified ? _self.qualified : qualified // ignore: cast_nullable_to_non_nullable
as int,rewarded: null == rewarded ? _self.rewarded : rewarded // ignore: cast_nullable_to_non_nullable
as int,circle: null == circle ? _self.circle : circle // ignore: cast_nullable_to_non_nullable
as List<ReferralView>,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StateStatus status,  String inviteLink,  String referralCode,  int invited,  int qualified,  int rewarded,  List<ReferralView> circle,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FriendsState() when $default != null:
return $default(_that.status,_that.inviteLink,_that.referralCode,_that.invited,_that.qualified,_that.rewarded,_that.circle,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StateStatus status,  String inviteLink,  String referralCode,  int invited,  int qualified,  int rewarded,  List<ReferralView> circle,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _FriendsState():
return $default(_that.status,_that.inviteLink,_that.referralCode,_that.invited,_that.qualified,_that.rewarded,_that.circle,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StateStatus status,  String inviteLink,  String referralCode,  int invited,  int qualified,  int rewarded,  List<ReferralView> circle,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _FriendsState() when $default != null:
return $default(_that.status,_that.inviteLink,_that.referralCode,_that.invited,_that.qualified,_that.rewarded,_that.circle,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _FriendsState implements FriendsState {
  const _FriendsState({this.status = StateStatus.initial, this.inviteLink = '', this.referralCode = '', this.invited = 0, this.qualified = 0, this.rewarded = 0, final  List<ReferralView> circle = const <ReferralView>[], this.failure}): _circle = circle;
  

@override@JsonKey() final  StateStatus status;
@override@JsonKey() final  String inviteLink;
@override@JsonKey() final  String referralCode;
@override@JsonKey() final  int invited;
@override@JsonKey() final  int qualified;
@override@JsonKey() final  int rewarded;
 final  List<ReferralView> _circle;
@override@JsonKey() List<ReferralView> get circle {
  if (_circle is EqualUnmodifiableListView) return _circle;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_circle);
}

@override final  Failure? failure;

/// Create a copy of FriendsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FriendsStateCopyWith<_FriendsState> get copyWith => __$FriendsStateCopyWithImpl<_FriendsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FriendsState&&(identical(other.status, status) || other.status == status)&&(identical(other.inviteLink, inviteLink) || other.inviteLink == inviteLink)&&(identical(other.referralCode, referralCode) || other.referralCode == referralCode)&&(identical(other.invited, invited) || other.invited == invited)&&(identical(other.qualified, qualified) || other.qualified == qualified)&&(identical(other.rewarded, rewarded) || other.rewarded == rewarded)&&const DeepCollectionEquality().equals(other._circle, _circle)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,inviteLink,referralCode,invited,qualified,rewarded,const DeepCollectionEquality().hash(_circle),failure);

@override
String toString() {
  return 'FriendsState(status: $status, inviteLink: $inviteLink, referralCode: $referralCode, invited: $invited, qualified: $qualified, rewarded: $rewarded, circle: $circle, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$FriendsStateCopyWith<$Res> implements $FriendsStateCopyWith<$Res> {
  factory _$FriendsStateCopyWith(_FriendsState value, $Res Function(_FriendsState) _then) = __$FriendsStateCopyWithImpl;
@override @useResult
$Res call({
 StateStatus status, String inviteLink, String referralCode, int invited, int qualified, int rewarded, List<ReferralView> circle, Failure? failure
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
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? inviteLink = null,Object? referralCode = null,Object? invited = null,Object? qualified = null,Object? rewarded = null,Object? circle = null,Object? failure = freezed,}) {
  return _then(_FriendsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,inviteLink: null == inviteLink ? _self.inviteLink : inviteLink // ignore: cast_nullable_to_non_nullable
as String,referralCode: null == referralCode ? _self.referralCode : referralCode // ignore: cast_nullable_to_non_nullable
as String,invited: null == invited ? _self.invited : invited // ignore: cast_nullable_to_non_nullable
as int,qualified: null == qualified ? _self.qualified : qualified // ignore: cast_nullable_to_non_nullable
as int,rewarded: null == rewarded ? _self.rewarded : rewarded // ignore: cast_nullable_to_non_nullable
as int,circle: null == circle ? _self._circle : circle // ignore: cast_nullable_to_non_nullable
as List<ReferralView>,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}


}

// dart format on
