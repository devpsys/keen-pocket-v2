// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'referral_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReferralStatsDto {

 int get invited; int get qualified; int get rewarded; int? get earned;
/// Create a copy of ReferralStatsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReferralStatsDtoCopyWith<ReferralStatsDto> get copyWith => _$ReferralStatsDtoCopyWithImpl<ReferralStatsDto>(this as ReferralStatsDto, _$identity);

  /// Serializes this ReferralStatsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReferralStatsDto&&(identical(other.invited, invited) || other.invited == invited)&&(identical(other.qualified, qualified) || other.qualified == qualified)&&(identical(other.rewarded, rewarded) || other.rewarded == rewarded)&&(identical(other.earned, earned) || other.earned == earned));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,invited,qualified,rewarded,earned);

@override
String toString() {
  return 'ReferralStatsDto(invited: $invited, qualified: $qualified, rewarded: $rewarded, earned: $earned)';
}


}

/// @nodoc
abstract mixin class $ReferralStatsDtoCopyWith<$Res>  {
  factory $ReferralStatsDtoCopyWith(ReferralStatsDto value, $Res Function(ReferralStatsDto) _then) = _$ReferralStatsDtoCopyWithImpl;
@useResult
$Res call({
 int invited, int qualified, int rewarded, int? earned
});




}
/// @nodoc
class _$ReferralStatsDtoCopyWithImpl<$Res>
    implements $ReferralStatsDtoCopyWith<$Res> {
  _$ReferralStatsDtoCopyWithImpl(this._self, this._then);

  final ReferralStatsDto _self;
  final $Res Function(ReferralStatsDto) _then;

/// Create a copy of ReferralStatsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? invited = null,Object? qualified = null,Object? rewarded = null,Object? earned = freezed,}) {
  return _then(_self.copyWith(
invited: null == invited ? _self.invited : invited // ignore: cast_nullable_to_non_nullable
as int,qualified: null == qualified ? _self.qualified : qualified // ignore: cast_nullable_to_non_nullable
as int,rewarded: null == rewarded ? _self.rewarded : rewarded // ignore: cast_nullable_to_non_nullable
as int,earned: freezed == earned ? _self.earned : earned // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReferralStatsDto].
extension ReferralStatsDtoPatterns on ReferralStatsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReferralStatsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReferralStatsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReferralStatsDto value)  $default,){
final _that = this;
switch (_that) {
case _ReferralStatsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReferralStatsDto value)?  $default,){
final _that = this;
switch (_that) {
case _ReferralStatsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int invited,  int qualified,  int rewarded,  int? earned)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReferralStatsDto() when $default != null:
return $default(_that.invited,_that.qualified,_that.rewarded,_that.earned);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int invited,  int qualified,  int rewarded,  int? earned)  $default,) {final _that = this;
switch (_that) {
case _ReferralStatsDto():
return $default(_that.invited,_that.qualified,_that.rewarded,_that.earned);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int invited,  int qualified,  int rewarded,  int? earned)?  $default,) {final _that = this;
switch (_that) {
case _ReferralStatsDto() when $default != null:
return $default(_that.invited,_that.qualified,_that.rewarded,_that.earned);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReferralStatsDto implements ReferralStatsDto {
  const _ReferralStatsDto({required this.invited, required this.qualified, required this.rewarded, this.earned});
  factory _ReferralStatsDto.fromJson(Map<String, dynamic> json) => _$ReferralStatsDtoFromJson(json);

@override final  int invited;
@override final  int qualified;
@override final  int rewarded;
@override final  int? earned;

/// Create a copy of ReferralStatsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReferralStatsDtoCopyWith<_ReferralStatsDto> get copyWith => __$ReferralStatsDtoCopyWithImpl<_ReferralStatsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReferralStatsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReferralStatsDto&&(identical(other.invited, invited) || other.invited == invited)&&(identical(other.qualified, qualified) || other.qualified == qualified)&&(identical(other.rewarded, rewarded) || other.rewarded == rewarded)&&(identical(other.earned, earned) || other.earned == earned));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,invited,qualified,rewarded,earned);

@override
String toString() {
  return 'ReferralStatsDto(invited: $invited, qualified: $qualified, rewarded: $rewarded, earned: $earned)';
}


}

/// @nodoc
abstract mixin class _$ReferralStatsDtoCopyWith<$Res> implements $ReferralStatsDtoCopyWith<$Res> {
  factory _$ReferralStatsDtoCopyWith(_ReferralStatsDto value, $Res Function(_ReferralStatsDto) _then) = __$ReferralStatsDtoCopyWithImpl;
@override @useResult
$Res call({
 int invited, int qualified, int rewarded, int? earned
});




}
/// @nodoc
class __$ReferralStatsDtoCopyWithImpl<$Res>
    implements _$ReferralStatsDtoCopyWith<$Res> {
  __$ReferralStatsDtoCopyWithImpl(this._self, this._then);

  final _ReferralStatsDto _self;
  final $Res Function(_ReferralStatsDto) _then;

/// Create a copy of ReferralStatsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? invited = null,Object? qualified = null,Object? rewarded = null,Object? earned = freezed,}) {
  return _then(_ReferralStatsDto(
invited: null == invited ? _self.invited : invited // ignore: cast_nullable_to_non_nullable
as int,qualified: null == qualified ? _self.qualified : qualified // ignore: cast_nullable_to_non_nullable
as int,rewarded: null == rewarded ? _self.rewarded : rewarded // ignore: cast_nullable_to_non_nullable
as int,earned: freezed == earned ? _self.earned : earned // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$ReferralEntryDto {

 String get id; String get name;@JsonKey(name: 'joined_label') String get joinedLabel; String get status;// pending | qualified | rewarded
 String? get detail;@JsonKey(name: 'reward_amount') String? get rewardAmount;
/// Create a copy of ReferralEntryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReferralEntryDtoCopyWith<ReferralEntryDto> get copyWith => _$ReferralEntryDtoCopyWithImpl<ReferralEntryDto>(this as ReferralEntryDto, _$identity);

  /// Serializes this ReferralEntryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReferralEntryDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.joinedLabel, joinedLabel) || other.joinedLabel == joinedLabel)&&(identical(other.status, status) || other.status == status)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.rewardAmount, rewardAmount) || other.rewardAmount == rewardAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,joinedLabel,status,detail,rewardAmount);

@override
String toString() {
  return 'ReferralEntryDto(id: $id, name: $name, joinedLabel: $joinedLabel, status: $status, detail: $detail, rewardAmount: $rewardAmount)';
}


}

/// @nodoc
abstract mixin class $ReferralEntryDtoCopyWith<$Res>  {
  factory $ReferralEntryDtoCopyWith(ReferralEntryDto value, $Res Function(ReferralEntryDto) _then) = _$ReferralEntryDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name,@JsonKey(name: 'joined_label') String joinedLabel, String status, String? detail,@JsonKey(name: 'reward_amount') String? rewardAmount
});




}
/// @nodoc
class _$ReferralEntryDtoCopyWithImpl<$Res>
    implements $ReferralEntryDtoCopyWith<$Res> {
  _$ReferralEntryDtoCopyWithImpl(this._self, this._then);

  final ReferralEntryDto _self;
  final $Res Function(ReferralEntryDto) _then;

/// Create a copy of ReferralEntryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? joinedLabel = null,Object? status = null,Object? detail = freezed,Object? rewardAmount = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,joinedLabel: null == joinedLabel ? _self.joinedLabel : joinedLabel // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String?,rewardAmount: freezed == rewardAmount ? _self.rewardAmount : rewardAmount // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReferralEntryDto].
extension ReferralEntryDtoPatterns on ReferralEntryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReferralEntryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReferralEntryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReferralEntryDto value)  $default,){
final _that = this;
switch (_that) {
case _ReferralEntryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReferralEntryDto value)?  $default,){
final _that = this;
switch (_that) {
case _ReferralEntryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'joined_label')  String joinedLabel,  String status,  String? detail, @JsonKey(name: 'reward_amount')  String? rewardAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReferralEntryDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'joined_label')  String joinedLabel,  String status,  String? detail, @JsonKey(name: 'reward_amount')  String? rewardAmount)  $default,) {final _that = this;
switch (_that) {
case _ReferralEntryDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @JsonKey(name: 'joined_label')  String joinedLabel,  String status,  String? detail, @JsonKey(name: 'reward_amount')  String? rewardAmount)?  $default,) {final _that = this;
switch (_that) {
case _ReferralEntryDto() when $default != null:
return $default(_that.id,_that.name,_that.joinedLabel,_that.status,_that.detail,_that.rewardAmount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReferralEntryDto implements ReferralEntryDto {
  const _ReferralEntryDto({required this.id, required this.name, @JsonKey(name: 'joined_label') required this.joinedLabel, required this.status, this.detail, @JsonKey(name: 'reward_amount') this.rewardAmount});
  factory _ReferralEntryDto.fromJson(Map<String, dynamic> json) => _$ReferralEntryDtoFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey(name: 'joined_label') final  String joinedLabel;
@override final  String status;
// pending | qualified | rewarded
@override final  String? detail;
@override@JsonKey(name: 'reward_amount') final  String? rewardAmount;

/// Create a copy of ReferralEntryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReferralEntryDtoCopyWith<_ReferralEntryDto> get copyWith => __$ReferralEntryDtoCopyWithImpl<_ReferralEntryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReferralEntryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReferralEntryDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.joinedLabel, joinedLabel) || other.joinedLabel == joinedLabel)&&(identical(other.status, status) || other.status == status)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.rewardAmount, rewardAmount) || other.rewardAmount == rewardAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,joinedLabel,status,detail,rewardAmount);

@override
String toString() {
  return 'ReferralEntryDto(id: $id, name: $name, joinedLabel: $joinedLabel, status: $status, detail: $detail, rewardAmount: $rewardAmount)';
}


}

/// @nodoc
abstract mixin class _$ReferralEntryDtoCopyWith<$Res> implements $ReferralEntryDtoCopyWith<$Res> {
  factory _$ReferralEntryDtoCopyWith(_ReferralEntryDto value, $Res Function(_ReferralEntryDto) _then) = __$ReferralEntryDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@JsonKey(name: 'joined_label') String joinedLabel, String status, String? detail,@JsonKey(name: 'reward_amount') String? rewardAmount
});




}
/// @nodoc
class __$ReferralEntryDtoCopyWithImpl<$Res>
    implements _$ReferralEntryDtoCopyWith<$Res> {
  __$ReferralEntryDtoCopyWithImpl(this._self, this._then);

  final _ReferralEntryDto _self;
  final $Res Function(_ReferralEntryDto) _then;

/// Create a copy of ReferralEntryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? joinedLabel = null,Object? status = null,Object? detail = freezed,Object? rewardAmount = freezed,}) {
  return _then(_ReferralEntryDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,joinedLabel: null == joinedLabel ? _self.joinedLabel : joinedLabel // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String?,rewardAmount: freezed == rewardAmount ? _self.rewardAmount : rewardAmount // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ReferralDto {

@JsonKey(name: 'invite_url') String get inviteUrl;@JsonKey(name: 'invite_code') String get inviteCode; ReferralStatsDto get stats; List<ReferralEntryDto> get circle;
/// Create a copy of ReferralDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReferralDtoCopyWith<ReferralDto> get copyWith => _$ReferralDtoCopyWithImpl<ReferralDto>(this as ReferralDto, _$identity);

  /// Serializes this ReferralDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReferralDto&&(identical(other.inviteUrl, inviteUrl) || other.inviteUrl == inviteUrl)&&(identical(other.inviteCode, inviteCode) || other.inviteCode == inviteCode)&&(identical(other.stats, stats) || other.stats == stats)&&const DeepCollectionEquality().equals(other.circle, circle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,inviteUrl,inviteCode,stats,const DeepCollectionEquality().hash(circle));

@override
String toString() {
  return 'ReferralDto(inviteUrl: $inviteUrl, inviteCode: $inviteCode, stats: $stats, circle: $circle)';
}


}

/// @nodoc
abstract mixin class $ReferralDtoCopyWith<$Res>  {
  factory $ReferralDtoCopyWith(ReferralDto value, $Res Function(ReferralDto) _then) = _$ReferralDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'invite_url') String inviteUrl,@JsonKey(name: 'invite_code') String inviteCode, ReferralStatsDto stats, List<ReferralEntryDto> circle
});


$ReferralStatsDtoCopyWith<$Res> get stats;

}
/// @nodoc
class _$ReferralDtoCopyWithImpl<$Res>
    implements $ReferralDtoCopyWith<$Res> {
  _$ReferralDtoCopyWithImpl(this._self, this._then);

  final ReferralDto _self;
  final $Res Function(ReferralDto) _then;

/// Create a copy of ReferralDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? inviteUrl = null,Object? inviteCode = null,Object? stats = null,Object? circle = null,}) {
  return _then(_self.copyWith(
inviteUrl: null == inviteUrl ? _self.inviteUrl : inviteUrl // ignore: cast_nullable_to_non_nullable
as String,inviteCode: null == inviteCode ? _self.inviteCode : inviteCode // ignore: cast_nullable_to_non_nullable
as String,stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as ReferralStatsDto,circle: null == circle ? _self.circle : circle // ignore: cast_nullable_to_non_nullable
as List<ReferralEntryDto>,
  ));
}
/// Create a copy of ReferralDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReferralStatsDtoCopyWith<$Res> get stats {
  
  return $ReferralStatsDtoCopyWith<$Res>(_self.stats, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReferralDto].
extension ReferralDtoPatterns on ReferralDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReferralDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReferralDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReferralDto value)  $default,){
final _that = this;
switch (_that) {
case _ReferralDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReferralDto value)?  $default,){
final _that = this;
switch (_that) {
case _ReferralDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'invite_url')  String inviteUrl, @JsonKey(name: 'invite_code')  String inviteCode,  ReferralStatsDto stats,  List<ReferralEntryDto> circle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReferralDto() when $default != null:
return $default(_that.inviteUrl,_that.inviteCode,_that.stats,_that.circle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'invite_url')  String inviteUrl, @JsonKey(name: 'invite_code')  String inviteCode,  ReferralStatsDto stats,  List<ReferralEntryDto> circle)  $default,) {final _that = this;
switch (_that) {
case _ReferralDto():
return $default(_that.inviteUrl,_that.inviteCode,_that.stats,_that.circle);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'invite_url')  String inviteUrl, @JsonKey(name: 'invite_code')  String inviteCode,  ReferralStatsDto stats,  List<ReferralEntryDto> circle)?  $default,) {final _that = this;
switch (_that) {
case _ReferralDto() when $default != null:
return $default(_that.inviteUrl,_that.inviteCode,_that.stats,_that.circle);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReferralDto implements ReferralDto {
  const _ReferralDto({@JsonKey(name: 'invite_url') required this.inviteUrl, @JsonKey(name: 'invite_code') required this.inviteCode, required this.stats, final  List<ReferralEntryDto> circle = const <ReferralEntryDto>[]}): _circle = circle;
  factory _ReferralDto.fromJson(Map<String, dynamic> json) => _$ReferralDtoFromJson(json);

@override@JsonKey(name: 'invite_url') final  String inviteUrl;
@override@JsonKey(name: 'invite_code') final  String inviteCode;
@override final  ReferralStatsDto stats;
 final  List<ReferralEntryDto> _circle;
@override@JsonKey() List<ReferralEntryDto> get circle {
  if (_circle is EqualUnmodifiableListView) return _circle;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_circle);
}


/// Create a copy of ReferralDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReferralDtoCopyWith<_ReferralDto> get copyWith => __$ReferralDtoCopyWithImpl<_ReferralDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReferralDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReferralDto&&(identical(other.inviteUrl, inviteUrl) || other.inviteUrl == inviteUrl)&&(identical(other.inviteCode, inviteCode) || other.inviteCode == inviteCode)&&(identical(other.stats, stats) || other.stats == stats)&&const DeepCollectionEquality().equals(other._circle, _circle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,inviteUrl,inviteCode,stats,const DeepCollectionEquality().hash(_circle));

@override
String toString() {
  return 'ReferralDto(inviteUrl: $inviteUrl, inviteCode: $inviteCode, stats: $stats, circle: $circle)';
}


}

/// @nodoc
abstract mixin class _$ReferralDtoCopyWith<$Res> implements $ReferralDtoCopyWith<$Res> {
  factory _$ReferralDtoCopyWith(_ReferralDto value, $Res Function(_ReferralDto) _then) = __$ReferralDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'invite_url') String inviteUrl,@JsonKey(name: 'invite_code') String inviteCode, ReferralStatsDto stats, List<ReferralEntryDto> circle
});


@override $ReferralStatsDtoCopyWith<$Res> get stats;

}
/// @nodoc
class __$ReferralDtoCopyWithImpl<$Res>
    implements _$ReferralDtoCopyWith<$Res> {
  __$ReferralDtoCopyWithImpl(this._self, this._then);

  final _ReferralDto _self;
  final $Res Function(_ReferralDto) _then;

/// Create a copy of ReferralDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? inviteUrl = null,Object? inviteCode = null,Object? stats = null,Object? circle = null,}) {
  return _then(_ReferralDto(
inviteUrl: null == inviteUrl ? _self.inviteUrl : inviteUrl // ignore: cast_nullable_to_non_nullable
as String,inviteCode: null == inviteCode ? _self.inviteCode : inviteCode // ignore: cast_nullable_to_non_nullable
as String,stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as ReferralStatsDto,circle: null == circle ? _self._circle : circle // ignore: cast_nullable_to_non_nullable
as List<ReferralEntryDto>,
  ));
}

/// Create a copy of ReferralDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReferralStatsDtoCopyWith<$Res> get stats {
  
  return $ReferralStatsDtoCopyWith<$Res>(_self.stats, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}

// dart format on
