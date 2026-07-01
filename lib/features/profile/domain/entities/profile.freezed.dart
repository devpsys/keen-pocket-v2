// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Profile {

 String get name; String get phone; int get level;/// 0–100 trust score shown in the ring.
 int get trustScore;/// Achievement tier, e.g. "Keen Pioneer".
 String get tier;/// Short blurb under the tier badge.
 String get tierBlurb; bool get kycVerified;/// Percentage of contributions made on time (0–100).
 int get paymentReliability; int get pocketsJoined; int get adashisCompleted; double get avgRating; String? get avatarUrl;
/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileCopyWith<Profile> get copyWith => _$ProfileCopyWithImpl<Profile>(this as Profile, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Profile&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.level, level) || other.level == level)&&(identical(other.trustScore, trustScore) || other.trustScore == trustScore)&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.tierBlurb, tierBlurb) || other.tierBlurb == tierBlurb)&&(identical(other.kycVerified, kycVerified) || other.kycVerified == kycVerified)&&(identical(other.paymentReliability, paymentReliability) || other.paymentReliability == paymentReliability)&&(identical(other.pocketsJoined, pocketsJoined) || other.pocketsJoined == pocketsJoined)&&(identical(other.adashisCompleted, adashisCompleted) || other.adashisCompleted == adashisCompleted)&&(identical(other.avgRating, avgRating) || other.avgRating == avgRating)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}


@override
int get hashCode => Object.hash(runtimeType,name,phone,level,trustScore,tier,tierBlurb,kycVerified,paymentReliability,pocketsJoined,adashisCompleted,avgRating,avatarUrl);

@override
String toString() {
  return 'Profile(name: $name, phone: $phone, level: $level, trustScore: $trustScore, tier: $tier, tierBlurb: $tierBlurb, kycVerified: $kycVerified, paymentReliability: $paymentReliability, pocketsJoined: $pocketsJoined, adashisCompleted: $adashisCompleted, avgRating: $avgRating, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class $ProfileCopyWith<$Res>  {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) _then) = _$ProfileCopyWithImpl;
@useResult
$Res call({
 String name, String phone, int level, int trustScore, String tier, String tierBlurb, bool kycVerified, int paymentReliability, int pocketsJoined, int adashisCompleted, double avgRating, String? avatarUrl
});




}
/// @nodoc
class _$ProfileCopyWithImpl<$Res>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._self, this._then);

  final Profile _self;
  final $Res Function(Profile) _then;

/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? phone = null,Object? level = null,Object? trustScore = null,Object? tier = null,Object? tierBlurb = null,Object? kycVerified = null,Object? paymentReliability = null,Object? pocketsJoined = null,Object? adashisCompleted = null,Object? avgRating = null,Object? avatarUrl = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,trustScore: null == trustScore ? _self.trustScore : trustScore // ignore: cast_nullable_to_non_nullable
as int,tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as String,tierBlurb: null == tierBlurb ? _self.tierBlurb : tierBlurb // ignore: cast_nullable_to_non_nullable
as String,kycVerified: null == kycVerified ? _self.kycVerified : kycVerified // ignore: cast_nullable_to_non_nullable
as bool,paymentReliability: null == paymentReliability ? _self.paymentReliability : paymentReliability // ignore: cast_nullable_to_non_nullable
as int,pocketsJoined: null == pocketsJoined ? _self.pocketsJoined : pocketsJoined // ignore: cast_nullable_to_non_nullable
as int,adashisCompleted: null == adashisCompleted ? _self.adashisCompleted : adashisCompleted // ignore: cast_nullable_to_non_nullable
as int,avgRating: null == avgRating ? _self.avgRating : avgRating // ignore: cast_nullable_to_non_nullable
as double,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Profile].
extension ProfilePatterns on Profile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Profile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Profile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Profile value)  $default,){
final _that = this;
switch (_that) {
case _Profile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Profile value)?  $default,){
final _that = this;
switch (_that) {
case _Profile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String phone,  int level,  int trustScore,  String tier,  String tierBlurb,  bool kycVerified,  int paymentReliability,  int pocketsJoined,  int adashisCompleted,  double avgRating,  String? avatarUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Profile() when $default != null:
return $default(_that.name,_that.phone,_that.level,_that.trustScore,_that.tier,_that.tierBlurb,_that.kycVerified,_that.paymentReliability,_that.pocketsJoined,_that.adashisCompleted,_that.avgRating,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String phone,  int level,  int trustScore,  String tier,  String tierBlurb,  bool kycVerified,  int paymentReliability,  int pocketsJoined,  int adashisCompleted,  double avgRating,  String? avatarUrl)  $default,) {final _that = this;
switch (_that) {
case _Profile():
return $default(_that.name,_that.phone,_that.level,_that.trustScore,_that.tier,_that.tierBlurb,_that.kycVerified,_that.paymentReliability,_that.pocketsJoined,_that.adashisCompleted,_that.avgRating,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String phone,  int level,  int trustScore,  String tier,  String tierBlurb,  bool kycVerified,  int paymentReliability,  int pocketsJoined,  int adashisCompleted,  double avgRating,  String? avatarUrl)?  $default,) {final _that = this;
switch (_that) {
case _Profile() when $default != null:
return $default(_that.name,_that.phone,_that.level,_that.trustScore,_that.tier,_that.tierBlurb,_that.kycVerified,_that.paymentReliability,_that.pocketsJoined,_that.adashisCompleted,_that.avgRating,_that.avatarUrl);case _:
  return null;

}
}

}

/// @nodoc


class _Profile implements Profile {
  const _Profile({required this.name, required this.phone, required this.level, required this.trustScore, required this.tier, required this.tierBlurb, required this.kycVerified, required this.paymentReliability, required this.pocketsJoined, required this.adashisCompleted, required this.avgRating, this.avatarUrl});
  

@override final  String name;
@override final  String phone;
@override final  int level;
/// 0–100 trust score shown in the ring.
@override final  int trustScore;
/// Achievement tier, e.g. "Keen Pioneer".
@override final  String tier;
/// Short blurb under the tier badge.
@override final  String tierBlurb;
@override final  bool kycVerified;
/// Percentage of contributions made on time (0–100).
@override final  int paymentReliability;
@override final  int pocketsJoined;
@override final  int adashisCompleted;
@override final  double avgRating;
@override final  String? avatarUrl;

/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileCopyWith<_Profile> get copyWith => __$ProfileCopyWithImpl<_Profile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Profile&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.level, level) || other.level == level)&&(identical(other.trustScore, trustScore) || other.trustScore == trustScore)&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.tierBlurb, tierBlurb) || other.tierBlurb == tierBlurb)&&(identical(other.kycVerified, kycVerified) || other.kycVerified == kycVerified)&&(identical(other.paymentReliability, paymentReliability) || other.paymentReliability == paymentReliability)&&(identical(other.pocketsJoined, pocketsJoined) || other.pocketsJoined == pocketsJoined)&&(identical(other.adashisCompleted, adashisCompleted) || other.adashisCompleted == adashisCompleted)&&(identical(other.avgRating, avgRating) || other.avgRating == avgRating)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}


@override
int get hashCode => Object.hash(runtimeType,name,phone,level,trustScore,tier,tierBlurb,kycVerified,paymentReliability,pocketsJoined,adashisCompleted,avgRating,avatarUrl);

@override
String toString() {
  return 'Profile(name: $name, phone: $phone, level: $level, trustScore: $trustScore, tier: $tier, tierBlurb: $tierBlurb, kycVerified: $kycVerified, paymentReliability: $paymentReliability, pocketsJoined: $pocketsJoined, adashisCompleted: $adashisCompleted, avgRating: $avgRating, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class _$ProfileCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$ProfileCopyWith(_Profile value, $Res Function(_Profile) _then) = __$ProfileCopyWithImpl;
@override @useResult
$Res call({
 String name, String phone, int level, int trustScore, String tier, String tierBlurb, bool kycVerified, int paymentReliability, int pocketsJoined, int adashisCompleted, double avgRating, String? avatarUrl
});




}
/// @nodoc
class __$ProfileCopyWithImpl<$Res>
    implements _$ProfileCopyWith<$Res> {
  __$ProfileCopyWithImpl(this._self, this._then);

  final _Profile _self;
  final $Res Function(_Profile) _then;

/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? phone = null,Object? level = null,Object? trustScore = null,Object? tier = null,Object? tierBlurb = null,Object? kycVerified = null,Object? paymentReliability = null,Object? pocketsJoined = null,Object? adashisCompleted = null,Object? avgRating = null,Object? avatarUrl = freezed,}) {
  return _then(_Profile(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,trustScore: null == trustScore ? _self.trustScore : trustScore // ignore: cast_nullable_to_non_nullable
as int,tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as String,tierBlurb: null == tierBlurb ? _self.tierBlurb : tierBlurb // ignore: cast_nullable_to_non_nullable
as String,kycVerified: null == kycVerified ? _self.kycVerified : kycVerified // ignore: cast_nullable_to_non_nullable
as bool,paymentReliability: null == paymentReliability ? _self.paymentReliability : paymentReliability // ignore: cast_nullable_to_non_nullable
as int,pocketsJoined: null == pocketsJoined ? _self.pocketsJoined : pocketsJoined // ignore: cast_nullable_to_non_nullable
as int,adashisCompleted: null == adashisCompleted ? _self.adashisCompleted : adashisCompleted // ignore: cast_nullable_to_non_nullable
as int,avgRating: null == avgRating ? _self.avgRating : avgRating // ignore: cast_nullable_to_non_nullable
as double,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
