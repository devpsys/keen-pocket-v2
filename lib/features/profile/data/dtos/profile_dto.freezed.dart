// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileDto {

@JsonKey(name: 'full_name') String get name; String get phone; int get level;@JsonKey(name: 'trust_score') int get trustScore; String get tier;@JsonKey(name: 'tier_blurb') String get tierBlurb;@JsonKey(name: 'kyc_verified') bool get kycVerified;@JsonKey(name: 'payment_reliability') int get paymentReliability;@JsonKey(name: 'pockets_joined') int get pocketsJoined;@JsonKey(name: 'adashis_completed') int get adashisCompleted;@JsonKey(name: 'avg_rating') double get avgRating;@JsonKey(name: 'avatar_url') String? get avatarUrl;
/// Create a copy of ProfileDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileDtoCopyWith<ProfileDto> get copyWith => _$ProfileDtoCopyWithImpl<ProfileDto>(this as ProfileDto, _$identity);

  /// Serializes this ProfileDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileDto&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.level, level) || other.level == level)&&(identical(other.trustScore, trustScore) || other.trustScore == trustScore)&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.tierBlurb, tierBlurb) || other.tierBlurb == tierBlurb)&&(identical(other.kycVerified, kycVerified) || other.kycVerified == kycVerified)&&(identical(other.paymentReliability, paymentReliability) || other.paymentReliability == paymentReliability)&&(identical(other.pocketsJoined, pocketsJoined) || other.pocketsJoined == pocketsJoined)&&(identical(other.adashisCompleted, adashisCompleted) || other.adashisCompleted == adashisCompleted)&&(identical(other.avgRating, avgRating) || other.avgRating == avgRating)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,phone,level,trustScore,tier,tierBlurb,kycVerified,paymentReliability,pocketsJoined,adashisCompleted,avgRating,avatarUrl);

@override
String toString() {
  return 'ProfileDto(name: $name, phone: $phone, level: $level, trustScore: $trustScore, tier: $tier, tierBlurb: $tierBlurb, kycVerified: $kycVerified, paymentReliability: $paymentReliability, pocketsJoined: $pocketsJoined, adashisCompleted: $adashisCompleted, avgRating: $avgRating, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class $ProfileDtoCopyWith<$Res>  {
  factory $ProfileDtoCopyWith(ProfileDto value, $Res Function(ProfileDto) _then) = _$ProfileDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'full_name') String name, String phone, int level,@JsonKey(name: 'trust_score') int trustScore, String tier,@JsonKey(name: 'tier_blurb') String tierBlurb,@JsonKey(name: 'kyc_verified') bool kycVerified,@JsonKey(name: 'payment_reliability') int paymentReliability,@JsonKey(name: 'pockets_joined') int pocketsJoined,@JsonKey(name: 'adashis_completed') int adashisCompleted,@JsonKey(name: 'avg_rating') double avgRating,@JsonKey(name: 'avatar_url') String? avatarUrl
});




}
/// @nodoc
class _$ProfileDtoCopyWithImpl<$Res>
    implements $ProfileDtoCopyWith<$Res> {
  _$ProfileDtoCopyWithImpl(this._self, this._then);

  final ProfileDto _self;
  final $Res Function(ProfileDto) _then;

/// Create a copy of ProfileDto
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


/// Adds pattern-matching-related methods to [ProfileDto].
extension ProfileDtoPatterns on ProfileDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileDto value)  $default,){
final _that = this;
switch (_that) {
case _ProfileDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileDto value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'full_name')  String name,  String phone,  int level, @JsonKey(name: 'trust_score')  int trustScore,  String tier, @JsonKey(name: 'tier_blurb')  String tierBlurb, @JsonKey(name: 'kyc_verified')  bool kycVerified, @JsonKey(name: 'payment_reliability')  int paymentReliability, @JsonKey(name: 'pockets_joined')  int pocketsJoined, @JsonKey(name: 'adashis_completed')  int adashisCompleted, @JsonKey(name: 'avg_rating')  double avgRating, @JsonKey(name: 'avatar_url')  String? avatarUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'full_name')  String name,  String phone,  int level, @JsonKey(name: 'trust_score')  int trustScore,  String tier, @JsonKey(name: 'tier_blurb')  String tierBlurb, @JsonKey(name: 'kyc_verified')  bool kycVerified, @JsonKey(name: 'payment_reliability')  int paymentReliability, @JsonKey(name: 'pockets_joined')  int pocketsJoined, @JsonKey(name: 'adashis_completed')  int adashisCompleted, @JsonKey(name: 'avg_rating')  double avgRating, @JsonKey(name: 'avatar_url')  String? avatarUrl)  $default,) {final _that = this;
switch (_that) {
case _ProfileDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'full_name')  String name,  String phone,  int level, @JsonKey(name: 'trust_score')  int trustScore,  String tier, @JsonKey(name: 'tier_blurb')  String tierBlurb, @JsonKey(name: 'kyc_verified')  bool kycVerified, @JsonKey(name: 'payment_reliability')  int paymentReliability, @JsonKey(name: 'pockets_joined')  int pocketsJoined, @JsonKey(name: 'adashis_completed')  int adashisCompleted, @JsonKey(name: 'avg_rating')  double avgRating, @JsonKey(name: 'avatar_url')  String? avatarUrl)?  $default,) {final _that = this;
switch (_that) {
case _ProfileDto() when $default != null:
return $default(_that.name,_that.phone,_that.level,_that.trustScore,_that.tier,_that.tierBlurb,_that.kycVerified,_that.paymentReliability,_that.pocketsJoined,_that.adashisCompleted,_that.avgRating,_that.avatarUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileDto implements ProfileDto {
  const _ProfileDto({@JsonKey(name: 'full_name') required this.name, required this.phone, required this.level, @JsonKey(name: 'trust_score') required this.trustScore, required this.tier, @JsonKey(name: 'tier_blurb') required this.tierBlurb, @JsonKey(name: 'kyc_verified') required this.kycVerified, @JsonKey(name: 'payment_reliability') required this.paymentReliability, @JsonKey(name: 'pockets_joined') required this.pocketsJoined, @JsonKey(name: 'adashis_completed') required this.adashisCompleted, @JsonKey(name: 'avg_rating') required this.avgRating, @JsonKey(name: 'avatar_url') this.avatarUrl});
  factory _ProfileDto.fromJson(Map<String, dynamic> json) => _$ProfileDtoFromJson(json);

@override@JsonKey(name: 'full_name') final  String name;
@override final  String phone;
@override final  int level;
@override@JsonKey(name: 'trust_score') final  int trustScore;
@override final  String tier;
@override@JsonKey(name: 'tier_blurb') final  String tierBlurb;
@override@JsonKey(name: 'kyc_verified') final  bool kycVerified;
@override@JsonKey(name: 'payment_reliability') final  int paymentReliability;
@override@JsonKey(name: 'pockets_joined') final  int pocketsJoined;
@override@JsonKey(name: 'adashis_completed') final  int adashisCompleted;
@override@JsonKey(name: 'avg_rating') final  double avgRating;
@override@JsonKey(name: 'avatar_url') final  String? avatarUrl;

/// Create a copy of ProfileDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileDtoCopyWith<_ProfileDto> get copyWith => __$ProfileDtoCopyWithImpl<_ProfileDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileDto&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.level, level) || other.level == level)&&(identical(other.trustScore, trustScore) || other.trustScore == trustScore)&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.tierBlurb, tierBlurb) || other.tierBlurb == tierBlurb)&&(identical(other.kycVerified, kycVerified) || other.kycVerified == kycVerified)&&(identical(other.paymentReliability, paymentReliability) || other.paymentReliability == paymentReliability)&&(identical(other.pocketsJoined, pocketsJoined) || other.pocketsJoined == pocketsJoined)&&(identical(other.adashisCompleted, adashisCompleted) || other.adashisCompleted == adashisCompleted)&&(identical(other.avgRating, avgRating) || other.avgRating == avgRating)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,phone,level,trustScore,tier,tierBlurb,kycVerified,paymentReliability,pocketsJoined,adashisCompleted,avgRating,avatarUrl);

@override
String toString() {
  return 'ProfileDto(name: $name, phone: $phone, level: $level, trustScore: $trustScore, tier: $tier, tierBlurb: $tierBlurb, kycVerified: $kycVerified, paymentReliability: $paymentReliability, pocketsJoined: $pocketsJoined, adashisCompleted: $adashisCompleted, avgRating: $avgRating, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class _$ProfileDtoCopyWith<$Res> implements $ProfileDtoCopyWith<$Res> {
  factory _$ProfileDtoCopyWith(_ProfileDto value, $Res Function(_ProfileDto) _then) = __$ProfileDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'full_name') String name, String phone, int level,@JsonKey(name: 'trust_score') int trustScore, String tier,@JsonKey(name: 'tier_blurb') String tierBlurb,@JsonKey(name: 'kyc_verified') bool kycVerified,@JsonKey(name: 'payment_reliability') int paymentReliability,@JsonKey(name: 'pockets_joined') int pocketsJoined,@JsonKey(name: 'adashis_completed') int adashisCompleted,@JsonKey(name: 'avg_rating') double avgRating,@JsonKey(name: 'avatar_url') String? avatarUrl
});




}
/// @nodoc
class __$ProfileDtoCopyWithImpl<$Res>
    implements _$ProfileDtoCopyWith<$Res> {
  __$ProfileDtoCopyWithImpl(this._self, this._then);

  final _ProfileDto _self;
  final $Res Function(_ProfileDto) _then;

/// Create a copy of ProfileDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? phone = null,Object? level = null,Object? trustScore = null,Object? tier = null,Object? tierBlurb = null,Object? kycVerified = null,Object? paymentReliability = null,Object? pocketsJoined = null,Object? adashisCompleted = null,Object? avgRating = null,Object? avatarUrl = freezed,}) {
  return _then(_ProfileDto(
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
