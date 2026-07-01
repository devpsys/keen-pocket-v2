// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trust_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Rating {

 String get author; int get stars;// 1..5
 String get comment; String? get context;// e.g. "Travel Pocket • July 2023"
 String? get avatarUrl;
/// Create a copy of Rating
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RatingCopyWith<Rating> get copyWith => _$RatingCopyWithImpl<Rating>(this as Rating, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Rating&&(identical(other.author, author) || other.author == author)&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.context, context) || other.context == context)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}


@override
int get hashCode => Object.hash(runtimeType,author,stars,comment,context,avatarUrl);

@override
String toString() {
  return 'Rating(author: $author, stars: $stars, comment: $comment, context: $context, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class $RatingCopyWith<$Res>  {
  factory $RatingCopyWith(Rating value, $Res Function(Rating) _then) = _$RatingCopyWithImpl;
@useResult
$Res call({
 String author, int stars, String comment, String? context, String? avatarUrl
});




}
/// @nodoc
class _$RatingCopyWithImpl<$Res>
    implements $RatingCopyWith<$Res> {
  _$RatingCopyWithImpl(this._self, this._then);

  final Rating _self;
  final $Res Function(Rating) _then;

/// Create a copy of Rating
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


/// Adds pattern-matching-related methods to [Rating].
extension RatingPatterns on Rating {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Rating value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Rating() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Rating value)  $default,){
final _that = this;
switch (_that) {
case _Rating():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Rating value)?  $default,){
final _that = this;
switch (_that) {
case _Rating() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String author,  int stars,  String comment,  String? context,  String? avatarUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Rating() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String author,  int stars,  String comment,  String? context,  String? avatarUrl)  $default,) {final _that = this;
switch (_that) {
case _Rating():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String author,  int stars,  String comment,  String? context,  String? avatarUrl)?  $default,) {final _that = this;
switch (_that) {
case _Rating() when $default != null:
return $default(_that.author,_that.stars,_that.comment,_that.context,_that.avatarUrl);case _:
  return null;

}
}

}

/// @nodoc


class _Rating implements Rating {
  const _Rating({required this.author, required this.stars, required this.comment, this.context, this.avatarUrl});
  

@override final  String author;
@override final  int stars;
// 1..5
@override final  String comment;
@override final  String? context;
// e.g. "Travel Pocket • July 2023"
@override final  String? avatarUrl;

/// Create a copy of Rating
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RatingCopyWith<_Rating> get copyWith => __$RatingCopyWithImpl<_Rating>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Rating&&(identical(other.author, author) || other.author == author)&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.context, context) || other.context == context)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}


@override
int get hashCode => Object.hash(runtimeType,author,stars,comment,context,avatarUrl);

@override
String toString() {
  return 'Rating(author: $author, stars: $stars, comment: $comment, context: $context, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class _$RatingCopyWith<$Res> implements $RatingCopyWith<$Res> {
  factory _$RatingCopyWith(_Rating value, $Res Function(_Rating) _then) = __$RatingCopyWithImpl;
@override @useResult
$Res call({
 String author, int stars, String comment, String? context, String? avatarUrl
});




}
/// @nodoc
class __$RatingCopyWithImpl<$Res>
    implements _$RatingCopyWith<$Res> {
  __$RatingCopyWithImpl(this._self, this._then);

  final _Rating _self;
  final $Res Function(_Rating) _then;

/// Create a copy of Rating
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? author = null,Object? stars = null,Object? comment = null,Object? context = freezed,Object? avatarUrl = freezed,}) {
  return _then(_Rating(
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
mixin _$TrustProfile {

 int get score;// 0..100
 String get band;// e.g. "Excellent"
 bool get kycVerified; List<Rating> get ratings; String? get memberName; String? get memberSince; String? get rank; String? get avatarUrl; int get paymentReliability;// 0..100
 int get pocketsJoined; int get adashisCompleted; double get avgRating;
/// Create a copy of TrustProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrustProfileCopyWith<TrustProfile> get copyWith => _$TrustProfileCopyWithImpl<TrustProfile>(this as TrustProfile, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrustProfile&&(identical(other.score, score) || other.score == score)&&(identical(other.band, band) || other.band == band)&&(identical(other.kycVerified, kycVerified) || other.kycVerified == kycVerified)&&const DeepCollectionEquality().equals(other.ratings, ratings)&&(identical(other.memberName, memberName) || other.memberName == memberName)&&(identical(other.memberSince, memberSince) || other.memberSince == memberSince)&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.paymentReliability, paymentReliability) || other.paymentReliability == paymentReliability)&&(identical(other.pocketsJoined, pocketsJoined) || other.pocketsJoined == pocketsJoined)&&(identical(other.adashisCompleted, adashisCompleted) || other.adashisCompleted == adashisCompleted)&&(identical(other.avgRating, avgRating) || other.avgRating == avgRating));
}


@override
int get hashCode => Object.hash(runtimeType,score,band,kycVerified,const DeepCollectionEquality().hash(ratings),memberName,memberSince,rank,avatarUrl,paymentReliability,pocketsJoined,adashisCompleted,avgRating);

@override
String toString() {
  return 'TrustProfile(score: $score, band: $band, kycVerified: $kycVerified, ratings: $ratings, memberName: $memberName, memberSince: $memberSince, rank: $rank, avatarUrl: $avatarUrl, paymentReliability: $paymentReliability, pocketsJoined: $pocketsJoined, adashisCompleted: $adashisCompleted, avgRating: $avgRating)';
}


}

/// @nodoc
abstract mixin class $TrustProfileCopyWith<$Res>  {
  factory $TrustProfileCopyWith(TrustProfile value, $Res Function(TrustProfile) _then) = _$TrustProfileCopyWithImpl;
@useResult
$Res call({
 int score, String band, bool kycVerified, List<Rating> ratings, String? memberName, String? memberSince, String? rank, String? avatarUrl, int paymentReliability, int pocketsJoined, int adashisCompleted, double avgRating
});




}
/// @nodoc
class _$TrustProfileCopyWithImpl<$Res>
    implements $TrustProfileCopyWith<$Res> {
  _$TrustProfileCopyWithImpl(this._self, this._then);

  final TrustProfile _self;
  final $Res Function(TrustProfile) _then;

/// Create a copy of TrustProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? score = null,Object? band = null,Object? kycVerified = null,Object? ratings = null,Object? memberName = freezed,Object? memberSince = freezed,Object? rank = freezed,Object? avatarUrl = freezed,Object? paymentReliability = null,Object? pocketsJoined = null,Object? adashisCompleted = null,Object? avgRating = null,}) {
  return _then(_self.copyWith(
score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,band: null == band ? _self.band : band // ignore: cast_nullable_to_non_nullable
as String,kycVerified: null == kycVerified ? _self.kycVerified : kycVerified // ignore: cast_nullable_to_non_nullable
as bool,ratings: null == ratings ? _self.ratings : ratings // ignore: cast_nullable_to_non_nullable
as List<Rating>,memberName: freezed == memberName ? _self.memberName : memberName // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [TrustProfile].
extension TrustProfilePatterns on TrustProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrustProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrustProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrustProfile value)  $default,){
final _that = this;
switch (_that) {
case _TrustProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrustProfile value)?  $default,){
final _that = this;
switch (_that) {
case _TrustProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int score,  String band,  bool kycVerified,  List<Rating> ratings,  String? memberName,  String? memberSince,  String? rank,  String? avatarUrl,  int paymentReliability,  int pocketsJoined,  int adashisCompleted,  double avgRating)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrustProfile() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int score,  String band,  bool kycVerified,  List<Rating> ratings,  String? memberName,  String? memberSince,  String? rank,  String? avatarUrl,  int paymentReliability,  int pocketsJoined,  int adashisCompleted,  double avgRating)  $default,) {final _that = this;
switch (_that) {
case _TrustProfile():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int score,  String band,  bool kycVerified,  List<Rating> ratings,  String? memberName,  String? memberSince,  String? rank,  String? avatarUrl,  int paymentReliability,  int pocketsJoined,  int adashisCompleted,  double avgRating)?  $default,) {final _that = this;
switch (_that) {
case _TrustProfile() when $default != null:
return $default(_that.score,_that.band,_that.kycVerified,_that.ratings,_that.memberName,_that.memberSince,_that.rank,_that.avatarUrl,_that.paymentReliability,_that.pocketsJoined,_that.adashisCompleted,_that.avgRating);case _:
  return null;

}
}

}

/// @nodoc


class _TrustProfile implements TrustProfile {
  const _TrustProfile({required this.score, required this.band, required this.kycVerified, required final  List<Rating> ratings, this.memberName, this.memberSince, this.rank, this.avatarUrl, this.paymentReliability = 0, this.pocketsJoined = 0, this.adashisCompleted = 0, this.avgRating = 0}): _ratings = ratings;
  

@override final  int score;
// 0..100
@override final  String band;
// e.g. "Excellent"
@override final  bool kycVerified;
 final  List<Rating> _ratings;
@override List<Rating> get ratings {
  if (_ratings is EqualUnmodifiableListView) return _ratings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ratings);
}

@override final  String? memberName;
@override final  String? memberSince;
@override final  String? rank;
@override final  String? avatarUrl;
@override@JsonKey() final  int paymentReliability;
// 0..100
@override@JsonKey() final  int pocketsJoined;
@override@JsonKey() final  int adashisCompleted;
@override@JsonKey() final  double avgRating;

/// Create a copy of TrustProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrustProfileCopyWith<_TrustProfile> get copyWith => __$TrustProfileCopyWithImpl<_TrustProfile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrustProfile&&(identical(other.score, score) || other.score == score)&&(identical(other.band, band) || other.band == band)&&(identical(other.kycVerified, kycVerified) || other.kycVerified == kycVerified)&&const DeepCollectionEquality().equals(other._ratings, _ratings)&&(identical(other.memberName, memberName) || other.memberName == memberName)&&(identical(other.memberSince, memberSince) || other.memberSince == memberSince)&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.paymentReliability, paymentReliability) || other.paymentReliability == paymentReliability)&&(identical(other.pocketsJoined, pocketsJoined) || other.pocketsJoined == pocketsJoined)&&(identical(other.adashisCompleted, adashisCompleted) || other.adashisCompleted == adashisCompleted)&&(identical(other.avgRating, avgRating) || other.avgRating == avgRating));
}


@override
int get hashCode => Object.hash(runtimeType,score,band,kycVerified,const DeepCollectionEquality().hash(_ratings),memberName,memberSince,rank,avatarUrl,paymentReliability,pocketsJoined,adashisCompleted,avgRating);

@override
String toString() {
  return 'TrustProfile(score: $score, band: $band, kycVerified: $kycVerified, ratings: $ratings, memberName: $memberName, memberSince: $memberSince, rank: $rank, avatarUrl: $avatarUrl, paymentReliability: $paymentReliability, pocketsJoined: $pocketsJoined, adashisCompleted: $adashisCompleted, avgRating: $avgRating)';
}


}

/// @nodoc
abstract mixin class _$TrustProfileCopyWith<$Res> implements $TrustProfileCopyWith<$Res> {
  factory _$TrustProfileCopyWith(_TrustProfile value, $Res Function(_TrustProfile) _then) = __$TrustProfileCopyWithImpl;
@override @useResult
$Res call({
 int score, String band, bool kycVerified, List<Rating> ratings, String? memberName, String? memberSince, String? rank, String? avatarUrl, int paymentReliability, int pocketsJoined, int adashisCompleted, double avgRating
});




}
/// @nodoc
class __$TrustProfileCopyWithImpl<$Res>
    implements _$TrustProfileCopyWith<$Res> {
  __$TrustProfileCopyWithImpl(this._self, this._then);

  final _TrustProfile _self;
  final $Res Function(_TrustProfile) _then;

/// Create a copy of TrustProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? score = null,Object? band = null,Object? kycVerified = null,Object? ratings = null,Object? memberName = freezed,Object? memberSince = freezed,Object? rank = freezed,Object? avatarUrl = freezed,Object? paymentReliability = null,Object? pocketsJoined = null,Object? adashisCompleted = null,Object? avgRating = null,}) {
  return _then(_TrustProfile(
score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,band: null == band ? _self.band : band // ignore: cast_nullable_to_non_nullable
as String,kycVerified: null == kycVerified ? _self.kycVerified : kycVerified // ignore: cast_nullable_to_non_nullable
as bool,ratings: null == ratings ? _self._ratings : ratings // ignore: cast_nullable_to_non_nullable
as List<Rating>,memberName: freezed == memberName ? _self.memberName : memberName // ignore: cast_nullable_to_non_nullable
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
