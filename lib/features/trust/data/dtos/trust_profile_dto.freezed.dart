// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trust_profile_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RatingDto {

 String get author; int get stars; String get comment; String? get context;@JsonKey(name: 'avatar_url') String? get avatarUrl;
/// Create a copy of RatingDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RatingDtoCopyWith<RatingDto> get copyWith => _$RatingDtoCopyWithImpl<RatingDto>(this as RatingDto, _$identity);

  /// Serializes this RatingDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RatingDto&&(identical(other.author, author) || other.author == author)&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.context, context) || other.context == context)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,author,stars,comment,context,avatarUrl);

@override
String toString() {
  return 'RatingDto(author: $author, stars: $stars, comment: $comment, context: $context, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class $RatingDtoCopyWith<$Res>  {
  factory $RatingDtoCopyWith(RatingDto value, $Res Function(RatingDto) _then) = _$RatingDtoCopyWithImpl;
@useResult
$Res call({
 String author, int stars, String comment, String? context,@JsonKey(name: 'avatar_url') String? avatarUrl
});




}
/// @nodoc
class _$RatingDtoCopyWithImpl<$Res>
    implements $RatingDtoCopyWith<$Res> {
  _$RatingDtoCopyWithImpl(this._self, this._then);

  final RatingDto _self;
  final $Res Function(RatingDto) _then;

/// Create a copy of RatingDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? author = null,Object? stars = null,Object? comment = null,Object? context = freezed,Object? avatarUrl = freezed,}) {
  return _then(_self.copyWith(
author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,stars: null == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,context: freezed == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RatingDto].
extension RatingDtoPatterns on RatingDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RatingDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RatingDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RatingDto value)  $default,){
final _that = this;
switch (_that) {
case _RatingDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RatingDto value)?  $default,){
final _that = this;
switch (_that) {
case _RatingDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String author,  int stars,  String comment,  String? context, @JsonKey(name: 'avatar_url')  String? avatarUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RatingDto() when $default != null:
return $default(_that.author,_that.stars,_that.comment,_that.context,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String author,  int stars,  String comment,  String? context, @JsonKey(name: 'avatar_url')  String? avatarUrl)  $default,) {final _that = this;
switch (_that) {
case _RatingDto():
return $default(_that.author,_that.stars,_that.comment,_that.context,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String author,  int stars,  String comment,  String? context, @JsonKey(name: 'avatar_url')  String? avatarUrl)?  $default,) {final _that = this;
switch (_that) {
case _RatingDto() when $default != null:
return $default(_that.author,_that.stars,_that.comment,_that.context,_that.avatarUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RatingDto implements RatingDto {
  const _RatingDto({required this.author, required this.stars, required this.comment, this.context, @JsonKey(name: 'avatar_url') this.avatarUrl});
  factory _RatingDto.fromJson(Map<String, dynamic> json) => _$RatingDtoFromJson(json);

@override final  String author;
@override final  int stars;
@override final  String comment;
@override final  String? context;
@override@JsonKey(name: 'avatar_url') final  String? avatarUrl;

/// Create a copy of RatingDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RatingDtoCopyWith<_RatingDto> get copyWith => __$RatingDtoCopyWithImpl<_RatingDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RatingDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RatingDto&&(identical(other.author, author) || other.author == author)&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.context, context) || other.context == context)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,author,stars,comment,context,avatarUrl);

@override
String toString() {
  return 'RatingDto(author: $author, stars: $stars, comment: $comment, context: $context, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class _$RatingDtoCopyWith<$Res> implements $RatingDtoCopyWith<$Res> {
  factory _$RatingDtoCopyWith(_RatingDto value, $Res Function(_RatingDto) _then) = __$RatingDtoCopyWithImpl;
@override @useResult
$Res call({
 String author, int stars, String comment, String? context,@JsonKey(name: 'avatar_url') String? avatarUrl
});




}
/// @nodoc
class __$RatingDtoCopyWithImpl<$Res>
    implements _$RatingDtoCopyWith<$Res> {
  __$RatingDtoCopyWithImpl(this._self, this._then);

  final _RatingDto _self;
  final $Res Function(_RatingDto) _then;

/// Create a copy of RatingDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? author = null,Object? stars = null,Object? comment = null,Object? context = freezed,Object? avatarUrl = freezed,}) {
  return _then(_RatingDto(
author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,stars: null == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,context: freezed == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$TrustProfileDto {

 int get score; String get band;@JsonKey(name: 'kyc_verified') bool get kycVerified; List<RatingDto> get ratings;@JsonKey(name: 'member_name') String? get memberName;@JsonKey(name: 'member_since') String? get memberSince; String? get rank;@JsonKey(name: 'avatar_url') String? get avatarUrl;@JsonKey(name: 'payment_reliability') int get paymentReliability;@JsonKey(name: 'pockets_joined') int get pocketsJoined;@JsonKey(name: 'adashis_completed') int get adashisCompleted;@JsonKey(name: 'avg_rating') double get avgRating;
/// Create a copy of TrustProfileDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrustProfileDtoCopyWith<TrustProfileDto> get copyWith => _$TrustProfileDtoCopyWithImpl<TrustProfileDto>(this as TrustProfileDto, _$identity);

  /// Serializes this TrustProfileDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrustProfileDto&&(identical(other.score, score) || other.score == score)&&(identical(other.band, band) || other.band == band)&&(identical(other.kycVerified, kycVerified) || other.kycVerified == kycVerified)&&const DeepCollectionEquality().equals(other.ratings, ratings)&&(identical(other.memberName, memberName) || other.memberName == memberName)&&(identical(other.memberSince, memberSince) || other.memberSince == memberSince)&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.paymentReliability, paymentReliability) || other.paymentReliability == paymentReliability)&&(identical(other.pocketsJoined, pocketsJoined) || other.pocketsJoined == pocketsJoined)&&(identical(other.adashisCompleted, adashisCompleted) || other.adashisCompleted == adashisCompleted)&&(identical(other.avgRating, avgRating) || other.avgRating == avgRating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,score,band,kycVerified,const DeepCollectionEquality().hash(ratings),memberName,memberSince,rank,avatarUrl,paymentReliability,pocketsJoined,adashisCompleted,avgRating);

@override
String toString() {
  return 'TrustProfileDto(score: $score, band: $band, kycVerified: $kycVerified, ratings: $ratings, memberName: $memberName, memberSince: $memberSince, rank: $rank, avatarUrl: $avatarUrl, paymentReliability: $paymentReliability, pocketsJoined: $pocketsJoined, adashisCompleted: $adashisCompleted, avgRating: $avgRating)';
}


}

/// @nodoc
abstract mixin class $TrustProfileDtoCopyWith<$Res>  {
  factory $TrustProfileDtoCopyWith(TrustProfileDto value, $Res Function(TrustProfileDto) _then) = _$TrustProfileDtoCopyWithImpl;
@useResult
$Res call({
 int score, String band,@JsonKey(name: 'kyc_verified') bool kycVerified, List<RatingDto> ratings,@JsonKey(name: 'member_name') String? memberName,@JsonKey(name: 'member_since') String? memberSince, String? rank,@JsonKey(name: 'avatar_url') String? avatarUrl,@JsonKey(name: 'payment_reliability') int paymentReliability,@JsonKey(name: 'pockets_joined') int pocketsJoined,@JsonKey(name: 'adashis_completed') int adashisCompleted,@JsonKey(name: 'avg_rating') double avgRating
});




}
/// @nodoc
class _$TrustProfileDtoCopyWithImpl<$Res>
    implements $TrustProfileDtoCopyWith<$Res> {
  _$TrustProfileDtoCopyWithImpl(this._self, this._then);

  final TrustProfileDto _self;
  final $Res Function(TrustProfileDto) _then;

/// Create a copy of TrustProfileDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? score = null,Object? band = null,Object? kycVerified = null,Object? ratings = null,Object? memberName = freezed,Object? memberSince = freezed,Object? rank = freezed,Object? avatarUrl = freezed,Object? paymentReliability = null,Object? pocketsJoined = null,Object? adashisCompleted = null,Object? avgRating = null,}) {
  return _then(_self.copyWith(
score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,band: null == band ? _self.band : band // ignore: cast_nullable_to_non_nullable
as String,kycVerified: null == kycVerified ? _self.kycVerified : kycVerified // ignore: cast_nullable_to_non_nullable
as bool,ratings: null == ratings ? _self.ratings : ratings // ignore: cast_nullable_to_non_nullable
as List<RatingDto>,memberName: freezed == memberName ? _self.memberName : memberName // ignore: cast_nullable_to_non_nullable
as String?,memberSince: freezed == memberSince ? _self.memberSince : memberSince // ignore: cast_nullable_to_non_nullable
as String?,rank: freezed == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,paymentReliability: null == paymentReliability ? _self.paymentReliability : paymentReliability // ignore: cast_nullable_to_non_nullable
as int,pocketsJoined: null == pocketsJoined ? _self.pocketsJoined : pocketsJoined // ignore: cast_nullable_to_non_nullable
as int,adashisCompleted: null == adashisCompleted ? _self.adashisCompleted : adashisCompleted // ignore: cast_nullable_to_non_nullable
as int,avgRating: null == avgRating ? _self.avgRating : avgRating // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [TrustProfileDto].
extension TrustProfileDtoPatterns on TrustProfileDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrustProfileDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrustProfileDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrustProfileDto value)  $default,){
final _that = this;
switch (_that) {
case _TrustProfileDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrustProfileDto value)?  $default,){
final _that = this;
switch (_that) {
case _TrustProfileDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int score,  String band, @JsonKey(name: 'kyc_verified')  bool kycVerified,  List<RatingDto> ratings, @JsonKey(name: 'member_name')  String? memberName, @JsonKey(name: 'member_since')  String? memberSince,  String? rank, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'payment_reliability')  int paymentReliability, @JsonKey(name: 'pockets_joined')  int pocketsJoined, @JsonKey(name: 'adashis_completed')  int adashisCompleted, @JsonKey(name: 'avg_rating')  double avgRating)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrustProfileDto() when $default != null:
return $default(_that.score,_that.band,_that.kycVerified,_that.ratings,_that.memberName,_that.memberSince,_that.rank,_that.avatarUrl,_that.paymentReliability,_that.pocketsJoined,_that.adashisCompleted,_that.avgRating);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int score,  String band, @JsonKey(name: 'kyc_verified')  bool kycVerified,  List<RatingDto> ratings, @JsonKey(name: 'member_name')  String? memberName, @JsonKey(name: 'member_since')  String? memberSince,  String? rank, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'payment_reliability')  int paymentReliability, @JsonKey(name: 'pockets_joined')  int pocketsJoined, @JsonKey(name: 'adashis_completed')  int adashisCompleted, @JsonKey(name: 'avg_rating')  double avgRating)  $default,) {final _that = this;
switch (_that) {
case _TrustProfileDto():
return $default(_that.score,_that.band,_that.kycVerified,_that.ratings,_that.memberName,_that.memberSince,_that.rank,_that.avatarUrl,_that.paymentReliability,_that.pocketsJoined,_that.adashisCompleted,_that.avgRating);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int score,  String band, @JsonKey(name: 'kyc_verified')  bool kycVerified,  List<RatingDto> ratings, @JsonKey(name: 'member_name')  String? memberName, @JsonKey(name: 'member_since')  String? memberSince,  String? rank, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'payment_reliability')  int paymentReliability, @JsonKey(name: 'pockets_joined')  int pocketsJoined, @JsonKey(name: 'adashis_completed')  int adashisCompleted, @JsonKey(name: 'avg_rating')  double avgRating)?  $default,) {final _that = this;
switch (_that) {
case _TrustProfileDto() when $default != null:
return $default(_that.score,_that.band,_that.kycVerified,_that.ratings,_that.memberName,_that.memberSince,_that.rank,_that.avatarUrl,_that.paymentReliability,_that.pocketsJoined,_that.adashisCompleted,_that.avgRating);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrustProfileDto implements TrustProfileDto {
  const _TrustProfileDto({required this.score, required this.band, @JsonKey(name: 'kyc_verified') required this.kycVerified, final  List<RatingDto> ratings = const <RatingDto>[], @JsonKey(name: 'member_name') this.memberName, @JsonKey(name: 'member_since') this.memberSince, this.rank, @JsonKey(name: 'avatar_url') this.avatarUrl, @JsonKey(name: 'payment_reliability') this.paymentReliability = 0, @JsonKey(name: 'pockets_joined') this.pocketsJoined = 0, @JsonKey(name: 'adashis_completed') this.adashisCompleted = 0, @JsonKey(name: 'avg_rating') this.avgRating = 0}): _ratings = ratings;
  factory _TrustProfileDto.fromJson(Map<String, dynamic> json) => _$TrustProfileDtoFromJson(json);

@override final  int score;
@override final  String band;
@override@JsonKey(name: 'kyc_verified') final  bool kycVerified;
 final  List<RatingDto> _ratings;
@override@JsonKey() List<RatingDto> get ratings {
  if (_ratings is EqualUnmodifiableListView) return _ratings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ratings);
}

@override@JsonKey(name: 'member_name') final  String? memberName;
@override@JsonKey(name: 'member_since') final  String? memberSince;
@override final  String? rank;
@override@JsonKey(name: 'avatar_url') final  String? avatarUrl;
@override@JsonKey(name: 'payment_reliability') final  int paymentReliability;
@override@JsonKey(name: 'pockets_joined') final  int pocketsJoined;
@override@JsonKey(name: 'adashis_completed') final  int adashisCompleted;
@override@JsonKey(name: 'avg_rating') final  double avgRating;

/// Create a copy of TrustProfileDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrustProfileDtoCopyWith<_TrustProfileDto> get copyWith => __$TrustProfileDtoCopyWithImpl<_TrustProfileDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrustProfileDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrustProfileDto&&(identical(other.score, score) || other.score == score)&&(identical(other.band, band) || other.band == band)&&(identical(other.kycVerified, kycVerified) || other.kycVerified == kycVerified)&&const DeepCollectionEquality().equals(other._ratings, _ratings)&&(identical(other.memberName, memberName) || other.memberName == memberName)&&(identical(other.memberSince, memberSince) || other.memberSince == memberSince)&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.paymentReliability, paymentReliability) || other.paymentReliability == paymentReliability)&&(identical(other.pocketsJoined, pocketsJoined) || other.pocketsJoined == pocketsJoined)&&(identical(other.adashisCompleted, adashisCompleted) || other.adashisCompleted == adashisCompleted)&&(identical(other.avgRating, avgRating) || other.avgRating == avgRating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,score,band,kycVerified,const DeepCollectionEquality().hash(_ratings),memberName,memberSince,rank,avatarUrl,paymentReliability,pocketsJoined,adashisCompleted,avgRating);

@override
String toString() {
  return 'TrustProfileDto(score: $score, band: $band, kycVerified: $kycVerified, ratings: $ratings, memberName: $memberName, memberSince: $memberSince, rank: $rank, avatarUrl: $avatarUrl, paymentReliability: $paymentReliability, pocketsJoined: $pocketsJoined, adashisCompleted: $adashisCompleted, avgRating: $avgRating)';
}


}

/// @nodoc
abstract mixin class _$TrustProfileDtoCopyWith<$Res> implements $TrustProfileDtoCopyWith<$Res> {
  factory _$TrustProfileDtoCopyWith(_TrustProfileDto value, $Res Function(_TrustProfileDto) _then) = __$TrustProfileDtoCopyWithImpl;
@override @useResult
$Res call({
 int score, String band,@JsonKey(name: 'kyc_verified') bool kycVerified, List<RatingDto> ratings,@JsonKey(name: 'member_name') String? memberName,@JsonKey(name: 'member_since') String? memberSince, String? rank,@JsonKey(name: 'avatar_url') String? avatarUrl,@JsonKey(name: 'payment_reliability') int paymentReliability,@JsonKey(name: 'pockets_joined') int pocketsJoined,@JsonKey(name: 'adashis_completed') int adashisCompleted,@JsonKey(name: 'avg_rating') double avgRating
});




}
/// @nodoc
class __$TrustProfileDtoCopyWithImpl<$Res>
    implements _$TrustProfileDtoCopyWith<$Res> {
  __$TrustProfileDtoCopyWithImpl(this._self, this._then);

  final _TrustProfileDto _self;
  final $Res Function(_TrustProfileDto) _then;

/// Create a copy of TrustProfileDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? score = null,Object? band = null,Object? kycVerified = null,Object? ratings = null,Object? memberName = freezed,Object? memberSince = freezed,Object? rank = freezed,Object? avatarUrl = freezed,Object? paymentReliability = null,Object? pocketsJoined = null,Object? adashisCompleted = null,Object? avgRating = null,}) {
  return _then(_TrustProfileDto(
score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,band: null == band ? _self.band : band // ignore: cast_nullable_to_non_nullable
as String,kycVerified: null == kycVerified ? _self.kycVerified : kycVerified // ignore: cast_nullable_to_non_nullable
as bool,ratings: null == ratings ? _self._ratings : ratings // ignore: cast_nullable_to_non_nullable
as List<RatingDto>,memberName: freezed == memberName ? _self.memberName : memberName // ignore: cast_nullable_to_non_nullable
as String?,memberSince: freezed == memberSince ? _self.memberSince : memberSince // ignore: cast_nullable_to_non_nullable
as String?,rank: freezed == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,paymentReliability: null == paymentReliability ? _self.paymentReliability : paymentReliability // ignore: cast_nullable_to_non_nullable
as int,pocketsJoined: null == pocketsJoined ? _self.pocketsJoined : pocketsJoined // ignore: cast_nullable_to_non_nullable
as int,adashisCompleted: null == adashisCompleted ? _self.adashisCompleted : adashisCompleted // ignore: cast_nullable_to_non_nullable
as int,avgRating: null == avgRating ? _self.avgRating : avgRating // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
