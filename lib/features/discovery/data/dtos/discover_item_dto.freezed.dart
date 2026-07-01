// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discover_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DiscoverItemDto {

 String get id; String get name; String get type;// pocket | adashi
 String get emoji;@JsonKey(name: 'admin_name') String get adminName; String get badge;// kyc_verified | official | adashi
 int get contribution;// kobo
@JsonKey(name: 'contribution_unit') String get contributionUnit;@JsonKey(name: 'metric_value') String get metricValue;@JsonKey(name: 'metric_is_start_date') bool get metricIsStartDate; double get rating;@JsonKey(name: 'member_count') int get memberCount;
/// Create a copy of DiscoverItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiscoverItemDtoCopyWith<DiscoverItemDto> get copyWith => _$DiscoverItemDtoCopyWithImpl<DiscoverItemDto>(this as DiscoverItemDto, _$identity);

  /// Serializes this DiscoverItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiscoverItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.emoji, emoji) || other.emoji == emoji)&&(identical(other.adminName, adminName) || other.adminName == adminName)&&(identical(other.badge, badge) || other.badge == badge)&&(identical(other.contribution, contribution) || other.contribution == contribution)&&(identical(other.contributionUnit, contributionUnit) || other.contributionUnit == contributionUnit)&&(identical(other.metricValue, metricValue) || other.metricValue == metricValue)&&(identical(other.metricIsStartDate, metricIsStartDate) || other.metricIsStartDate == metricIsStartDate)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.memberCount, memberCount) || other.memberCount == memberCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,emoji,adminName,badge,contribution,contributionUnit,metricValue,metricIsStartDate,rating,memberCount);

@override
String toString() {
  return 'DiscoverItemDto(id: $id, name: $name, type: $type, emoji: $emoji, adminName: $adminName, badge: $badge, contribution: $contribution, contributionUnit: $contributionUnit, metricValue: $metricValue, metricIsStartDate: $metricIsStartDate, rating: $rating, memberCount: $memberCount)';
}


}

/// @nodoc
abstract mixin class $DiscoverItemDtoCopyWith<$Res>  {
  factory $DiscoverItemDtoCopyWith(DiscoverItemDto value, $Res Function(DiscoverItemDto) _then) = _$DiscoverItemDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String type, String emoji,@JsonKey(name: 'admin_name') String adminName, String badge, int contribution,@JsonKey(name: 'contribution_unit') String contributionUnit,@JsonKey(name: 'metric_value') String metricValue,@JsonKey(name: 'metric_is_start_date') bool metricIsStartDate, double rating,@JsonKey(name: 'member_count') int memberCount
});




}
/// @nodoc
class _$DiscoverItemDtoCopyWithImpl<$Res>
    implements $DiscoverItemDtoCopyWith<$Res> {
  _$DiscoverItemDtoCopyWithImpl(this._self, this._then);

  final DiscoverItemDto _self;
  final $Res Function(DiscoverItemDto) _then;

/// Create a copy of DiscoverItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,Object? emoji = null,Object? adminName = null,Object? badge = null,Object? contribution = null,Object? contributionUnit = null,Object? metricValue = null,Object? metricIsStartDate = null,Object? rating = null,Object? memberCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,emoji: null == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String,adminName: null == adminName ? _self.adminName : adminName // ignore: cast_nullable_to_non_nullable
as String,badge: null == badge ? _self.badge : badge // ignore: cast_nullable_to_non_nullable
as String,contribution: null == contribution ? _self.contribution : contribution // ignore: cast_nullable_to_non_nullable
as int,contributionUnit: null == contributionUnit ? _self.contributionUnit : contributionUnit // ignore: cast_nullable_to_non_nullable
as String,metricValue: null == metricValue ? _self.metricValue : metricValue // ignore: cast_nullable_to_non_nullable
as String,metricIsStartDate: null == metricIsStartDate ? _self.metricIsStartDate : metricIsStartDate // ignore: cast_nullable_to_non_nullable
as bool,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,memberCount: null == memberCount ? _self.memberCount : memberCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DiscoverItemDto].
extension DiscoverItemDtoPatterns on DiscoverItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DiscoverItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DiscoverItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DiscoverItemDto value)  $default,){
final _that = this;
switch (_that) {
case _DiscoverItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DiscoverItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _DiscoverItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String type,  String emoji, @JsonKey(name: 'admin_name')  String adminName,  String badge,  int contribution, @JsonKey(name: 'contribution_unit')  String contributionUnit, @JsonKey(name: 'metric_value')  String metricValue, @JsonKey(name: 'metric_is_start_date')  bool metricIsStartDate,  double rating, @JsonKey(name: 'member_count')  int memberCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DiscoverItemDto() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.emoji,_that.adminName,_that.badge,_that.contribution,_that.contributionUnit,_that.metricValue,_that.metricIsStartDate,_that.rating,_that.memberCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String type,  String emoji, @JsonKey(name: 'admin_name')  String adminName,  String badge,  int contribution, @JsonKey(name: 'contribution_unit')  String contributionUnit, @JsonKey(name: 'metric_value')  String metricValue, @JsonKey(name: 'metric_is_start_date')  bool metricIsStartDate,  double rating, @JsonKey(name: 'member_count')  int memberCount)  $default,) {final _that = this;
switch (_that) {
case _DiscoverItemDto():
return $default(_that.id,_that.name,_that.type,_that.emoji,_that.adminName,_that.badge,_that.contribution,_that.contributionUnit,_that.metricValue,_that.metricIsStartDate,_that.rating,_that.memberCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String type,  String emoji, @JsonKey(name: 'admin_name')  String adminName,  String badge,  int contribution, @JsonKey(name: 'contribution_unit')  String contributionUnit, @JsonKey(name: 'metric_value')  String metricValue, @JsonKey(name: 'metric_is_start_date')  bool metricIsStartDate,  double rating, @JsonKey(name: 'member_count')  int memberCount)?  $default,) {final _that = this;
switch (_that) {
case _DiscoverItemDto() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.emoji,_that.adminName,_that.badge,_that.contribution,_that.contributionUnit,_that.metricValue,_that.metricIsStartDate,_that.rating,_that.memberCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DiscoverItemDto implements DiscoverItemDto {
  const _DiscoverItemDto({required this.id, required this.name, required this.type, required this.emoji, @JsonKey(name: 'admin_name') required this.adminName, required this.badge, required this.contribution, @JsonKey(name: 'contribution_unit') required this.contributionUnit, @JsonKey(name: 'metric_value') required this.metricValue, @JsonKey(name: 'metric_is_start_date') required this.metricIsStartDate, required this.rating, @JsonKey(name: 'member_count') required this.memberCount});
  factory _DiscoverItemDto.fromJson(Map<String, dynamic> json) => _$DiscoverItemDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String type;
// pocket | adashi
@override final  String emoji;
@override@JsonKey(name: 'admin_name') final  String adminName;
@override final  String badge;
// kyc_verified | official | adashi
@override final  int contribution;
// kobo
@override@JsonKey(name: 'contribution_unit') final  String contributionUnit;
@override@JsonKey(name: 'metric_value') final  String metricValue;
@override@JsonKey(name: 'metric_is_start_date') final  bool metricIsStartDate;
@override final  double rating;
@override@JsonKey(name: 'member_count') final  int memberCount;

/// Create a copy of DiscoverItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiscoverItemDtoCopyWith<_DiscoverItemDto> get copyWith => __$DiscoverItemDtoCopyWithImpl<_DiscoverItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DiscoverItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiscoverItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.emoji, emoji) || other.emoji == emoji)&&(identical(other.adminName, adminName) || other.adminName == adminName)&&(identical(other.badge, badge) || other.badge == badge)&&(identical(other.contribution, contribution) || other.contribution == contribution)&&(identical(other.contributionUnit, contributionUnit) || other.contributionUnit == contributionUnit)&&(identical(other.metricValue, metricValue) || other.metricValue == metricValue)&&(identical(other.metricIsStartDate, metricIsStartDate) || other.metricIsStartDate == metricIsStartDate)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.memberCount, memberCount) || other.memberCount == memberCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,emoji,adminName,badge,contribution,contributionUnit,metricValue,metricIsStartDate,rating,memberCount);

@override
String toString() {
  return 'DiscoverItemDto(id: $id, name: $name, type: $type, emoji: $emoji, adminName: $adminName, badge: $badge, contribution: $contribution, contributionUnit: $contributionUnit, metricValue: $metricValue, metricIsStartDate: $metricIsStartDate, rating: $rating, memberCount: $memberCount)';
}


}

/// @nodoc
abstract mixin class _$DiscoverItemDtoCopyWith<$Res> implements $DiscoverItemDtoCopyWith<$Res> {
  factory _$DiscoverItemDtoCopyWith(_DiscoverItemDto value, $Res Function(_DiscoverItemDto) _then) = __$DiscoverItemDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String type, String emoji,@JsonKey(name: 'admin_name') String adminName, String badge, int contribution,@JsonKey(name: 'contribution_unit') String contributionUnit,@JsonKey(name: 'metric_value') String metricValue,@JsonKey(name: 'metric_is_start_date') bool metricIsStartDate, double rating,@JsonKey(name: 'member_count') int memberCount
});




}
/// @nodoc
class __$DiscoverItemDtoCopyWithImpl<$Res>
    implements _$DiscoverItemDtoCopyWith<$Res> {
  __$DiscoverItemDtoCopyWithImpl(this._self, this._then);

  final _DiscoverItemDto _self;
  final $Res Function(_DiscoverItemDto) _then;

/// Create a copy of DiscoverItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,Object? emoji = null,Object? adminName = null,Object? badge = null,Object? contribution = null,Object? contributionUnit = null,Object? metricValue = null,Object? metricIsStartDate = null,Object? rating = null,Object? memberCount = null,}) {
  return _then(_DiscoverItemDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,emoji: null == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String,adminName: null == adminName ? _self.adminName : adminName // ignore: cast_nullable_to_non_nullable
as String,badge: null == badge ? _self.badge : badge // ignore: cast_nullable_to_non_nullable
as String,contribution: null == contribution ? _self.contribution : contribution // ignore: cast_nullable_to_non_nullable
as int,contributionUnit: null == contributionUnit ? _self.contributionUnit : contributionUnit // ignore: cast_nullable_to_non_nullable
as String,metricValue: null == metricValue ? _self.metricValue : metricValue // ignore: cast_nullable_to_non_nullable
as String,metricIsStartDate: null == metricIsStartDate ? _self.metricIsStartDate : metricIsStartDate // ignore: cast_nullable_to_non_nullable
as bool,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,memberCount: null == memberCount ? _self.memberCount : memberCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
