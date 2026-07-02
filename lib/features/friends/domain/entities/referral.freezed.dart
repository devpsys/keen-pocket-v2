// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'referral.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReferralEntry {

 String get id; String get name; String get joinedLabel; ReferralStatus get status; String? get detail; String? get rewardAmount;
/// Create a copy of ReferralEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReferralEntryCopyWith<ReferralEntry> get copyWith => _$ReferralEntryCopyWithImpl<ReferralEntry>(this as ReferralEntry, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReferralEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.joinedLabel, joinedLabel) || other.joinedLabel == joinedLabel)&&(identical(other.status, status) || other.status == status)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.rewardAmount, rewardAmount) || other.rewardAmount == rewardAmount));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,joinedLabel,status,detail,rewardAmount);

@override
String toString() {
  return 'ReferralEntry(id: $id, name: $name, joinedLabel: $joinedLabel, status: $status, detail: $detail, rewardAmount: $rewardAmount)';
}


}

/// @nodoc
abstract mixin class $ReferralEntryCopyWith<$Res>  {
  factory $ReferralEntryCopyWith(ReferralEntry value, $Res Function(ReferralEntry) _then) = _$ReferralEntryCopyWithImpl;
@useResult
$Res call({
 String id, String name, String joinedLabel, ReferralStatus status, String? detail, String? rewardAmount
});




}
/// @nodoc
class _$ReferralEntryCopyWithImpl<$Res>
    implements $ReferralEntryCopyWith<$Res> {
  _$ReferralEntryCopyWithImpl(this._self, this._then);

  final ReferralEntry _self;
  final $Res Function(ReferralEntry) _then;

/// Create a copy of ReferralEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? joinedLabel = null,Object? status = null,Object? detail = freezed,Object? rewardAmount = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,joinedLabel: null == joinedLabel ? _self.joinedLabel : joinedLabel // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ReferralStatus,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String?,rewardAmount: freezed == rewardAmount ? _self.rewardAmount : rewardAmount // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReferralEntry].
extension ReferralEntryPatterns on ReferralEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReferralEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReferralEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReferralEntry value)  $default,){
final _that = this;
switch (_that) {
case _ReferralEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReferralEntry value)?  $default,){
final _that = this;
switch (_that) {
case _ReferralEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String joinedLabel,  ReferralStatus status,  String? detail,  String? rewardAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReferralEntry() when $default != null:
return $default(_that.id,_that.name,_that.joinedLabel,_that.status,_that.detail,_that.rewardAmount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String joinedLabel,  ReferralStatus status,  String? detail,  String? rewardAmount)  $default,) {final _that = this;
switch (_that) {
case _ReferralEntry():
return $default(_that.id,_that.name,_that.joinedLabel,_that.status,_that.detail,_that.rewardAmount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String joinedLabel,  ReferralStatus status,  String? detail,  String? rewardAmount)?  $default,) {final _that = this;
switch (_that) {
case _ReferralEntry() when $default != null:
return $default(_that.id,_that.name,_that.joinedLabel,_that.status,_that.detail,_that.rewardAmount);case _:
  return null;

}
}

}

/// @nodoc


class _ReferralEntry implements ReferralEntry {
  const _ReferralEntry({required this.id, required this.name, required this.joinedLabel, required this.status, this.detail, this.rewardAmount});
  

@override final  String id;
@override final  String name;
@override final  String joinedLabel;
@override final  ReferralStatus status;
@override final  String? detail;
@override final  String? rewardAmount;

/// Create a copy of ReferralEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReferralEntryCopyWith<_ReferralEntry> get copyWith => __$ReferralEntryCopyWithImpl<_ReferralEntry>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReferralEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.joinedLabel, joinedLabel) || other.joinedLabel == joinedLabel)&&(identical(other.status, status) || other.status == status)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.rewardAmount, rewardAmount) || other.rewardAmount == rewardAmount));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,joinedLabel,status,detail,rewardAmount);

@override
String toString() {
  return 'ReferralEntry(id: $id, name: $name, joinedLabel: $joinedLabel, status: $status, detail: $detail, rewardAmount: $rewardAmount)';
}


}

/// @nodoc
abstract mixin class _$ReferralEntryCopyWith<$Res> implements $ReferralEntryCopyWith<$Res> {
  factory _$ReferralEntryCopyWith(_ReferralEntry value, $Res Function(_ReferralEntry) _then) = __$ReferralEntryCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String joinedLabel, ReferralStatus status, String? detail, String? rewardAmount
});




}
/// @nodoc
class __$ReferralEntryCopyWithImpl<$Res>
    implements _$ReferralEntryCopyWith<$Res> {
  __$ReferralEntryCopyWithImpl(this._self, this._then);

  final _ReferralEntry _self;
  final $Res Function(_ReferralEntry) _then;

/// Create a copy of ReferralEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? joinedLabel = null,Object? status = null,Object? detail = freezed,Object? rewardAmount = freezed,}) {
  return _then(_ReferralEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,joinedLabel: null == joinedLabel ? _self.joinedLabel : joinedLabel // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ReferralStatus,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String?,rewardAmount: freezed == rewardAmount ? _self.rewardAmount : rewardAmount // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$Referral {

 String get inviteLink; String get referralCode; int get invited; int get qualified; int get rewarded; List<ReferralEntry> get circle;
/// Create a copy of Referral
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReferralCopyWith<Referral> get copyWith => _$ReferralCopyWithImpl<Referral>(this as Referral, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Referral&&(identical(other.inviteLink, inviteLink) || other.inviteLink == inviteLink)&&(identical(other.referralCode, referralCode) || other.referralCode == referralCode)&&(identical(other.invited, invited) || other.invited == invited)&&(identical(other.qualified, qualified) || other.qualified == qualified)&&(identical(other.rewarded, rewarded) || other.rewarded == rewarded)&&const DeepCollectionEquality().equals(other.circle, circle));
}


@override
int get hashCode => Object.hash(runtimeType,inviteLink,referralCode,invited,qualified,rewarded,const DeepCollectionEquality().hash(circle));

@override
String toString() {
  return 'Referral(inviteLink: $inviteLink, referralCode: $referralCode, invited: $invited, qualified: $qualified, rewarded: $rewarded, circle: $circle)';
}


}

/// @nodoc
abstract mixin class $ReferralCopyWith<$Res>  {
  factory $ReferralCopyWith(Referral value, $Res Function(Referral) _then) = _$ReferralCopyWithImpl;
@useResult
$Res call({
 String inviteLink, String referralCode, int invited, int qualified, int rewarded, List<ReferralEntry> circle
});




}
/// @nodoc
class _$ReferralCopyWithImpl<$Res>
    implements $ReferralCopyWith<$Res> {
  _$ReferralCopyWithImpl(this._self, this._then);

  final Referral _self;
  final $Res Function(Referral) _then;

/// Create a copy of Referral
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? inviteLink = null,Object? referralCode = null,Object? invited = null,Object? qualified = null,Object? rewarded = null,Object? circle = null,}) {
  return _then(_self.copyWith(
inviteLink: null == inviteLink ? _self.inviteLink : inviteLink // ignore: cast_nullable_to_non_nullable
as String,referralCode: null == referralCode ? _self.referralCode : referralCode // ignore: cast_nullable_to_non_nullable
as String,invited: null == invited ? _self.invited : invited // ignore: cast_nullable_to_non_nullable
as int,qualified: null == qualified ? _self.qualified : qualified // ignore: cast_nullable_to_non_nullable
as int,rewarded: null == rewarded ? _self.rewarded : rewarded // ignore: cast_nullable_to_non_nullable
as int,circle: null == circle ? _self.circle : circle // ignore: cast_nullable_to_non_nullable
as List<ReferralEntry>,
  ));
}

}


/// Adds pattern-matching-related methods to [Referral].
extension ReferralPatterns on Referral {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Referral value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Referral() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Referral value)  $default,){
final _that = this;
switch (_that) {
case _Referral():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Referral value)?  $default,){
final _that = this;
switch (_that) {
case _Referral() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String inviteLink,  String referralCode,  int invited,  int qualified,  int rewarded,  List<ReferralEntry> circle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Referral() when $default != null:
return $default(_that.inviteLink,_that.referralCode,_that.invited,_that.qualified,_that.rewarded,_that.circle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String inviteLink,  String referralCode,  int invited,  int qualified,  int rewarded,  List<ReferralEntry> circle)  $default,) {final _that = this;
switch (_that) {
case _Referral():
return $default(_that.inviteLink,_that.referralCode,_that.invited,_that.qualified,_that.rewarded,_that.circle);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String inviteLink,  String referralCode,  int invited,  int qualified,  int rewarded,  List<ReferralEntry> circle)?  $default,) {final _that = this;
switch (_that) {
case _Referral() when $default != null:
return $default(_that.inviteLink,_that.referralCode,_that.invited,_that.qualified,_that.rewarded,_that.circle);case _:
  return null;

}
}

}

/// @nodoc


class _Referral implements Referral {
  const _Referral({required this.inviteLink, required this.referralCode, required this.invited, required this.qualified, required this.rewarded, required final  List<ReferralEntry> circle}): _circle = circle;
  

@override final  String inviteLink;
@override final  String referralCode;
@override final  int invited;
@override final  int qualified;
@override final  int rewarded;
 final  List<ReferralEntry> _circle;
@override List<ReferralEntry> get circle {
  if (_circle is EqualUnmodifiableListView) return _circle;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_circle);
}


/// Create a copy of Referral
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReferralCopyWith<_Referral> get copyWith => __$ReferralCopyWithImpl<_Referral>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Referral&&(identical(other.inviteLink, inviteLink) || other.inviteLink == inviteLink)&&(identical(other.referralCode, referralCode) || other.referralCode == referralCode)&&(identical(other.invited, invited) || other.invited == invited)&&(identical(other.qualified, qualified) || other.qualified == qualified)&&(identical(other.rewarded, rewarded) || other.rewarded == rewarded)&&const DeepCollectionEquality().equals(other._circle, _circle));
}


@override
int get hashCode => Object.hash(runtimeType,inviteLink,referralCode,invited,qualified,rewarded,const DeepCollectionEquality().hash(_circle));

@override
String toString() {
  return 'Referral(inviteLink: $inviteLink, referralCode: $referralCode, invited: $invited, qualified: $qualified, rewarded: $rewarded, circle: $circle)';
}


}

/// @nodoc
abstract mixin class _$ReferralCopyWith<$Res> implements $ReferralCopyWith<$Res> {
  factory _$ReferralCopyWith(_Referral value, $Res Function(_Referral) _then) = __$ReferralCopyWithImpl;
@override @useResult
$Res call({
 String inviteLink, String referralCode, int invited, int qualified, int rewarded, List<ReferralEntry> circle
});




}
/// @nodoc
class __$ReferralCopyWithImpl<$Res>
    implements _$ReferralCopyWith<$Res> {
  __$ReferralCopyWithImpl(this._self, this._then);

  final _Referral _self;
  final $Res Function(_Referral) _then;

/// Create a copy of Referral
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? inviteLink = null,Object? referralCode = null,Object? invited = null,Object? qualified = null,Object? rewarded = null,Object? circle = null,}) {
  return _then(_Referral(
inviteLink: null == inviteLink ? _self.inviteLink : inviteLink // ignore: cast_nullable_to_non_nullable
as String,referralCode: null == referralCode ? _self.referralCode : referralCode // ignore: cast_nullable_to_non_nullable
as String,invited: null == invited ? _self.invited : invited // ignore: cast_nullable_to_non_nullable
as int,qualified: null == qualified ? _self.qualified : qualified // ignore: cast_nullable_to_non_nullable
as int,rewarded: null == rewarded ? _self.rewarded : rewarded // ignore: cast_nullable_to_non_nullable
as int,circle: null == circle ? _self._circle : circle // ignore: cast_nullable_to_non_nullable
as List<ReferralEntry>,
  ));
}


}

// dart format on
