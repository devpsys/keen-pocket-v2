// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discover_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DiscoverItem {

 String get id; String get name; DiscoverItemType get type; String get emoji; String get adminName; DiscoverBadge get badge; Money get contribution; String get contributionUnit; String get metricValue; bool get metricIsStartDate; double get rating; int get memberCount;
/// Create a copy of DiscoverItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiscoverItemCopyWith<DiscoverItem> get copyWith => _$DiscoverItemCopyWithImpl<DiscoverItem>(this as DiscoverItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiscoverItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.emoji, emoji) || other.emoji == emoji)&&(identical(other.adminName, adminName) || other.adminName == adminName)&&(identical(other.badge, badge) || other.badge == badge)&&(identical(other.contribution, contribution) || other.contribution == contribution)&&(identical(other.contributionUnit, contributionUnit) || other.contributionUnit == contributionUnit)&&(identical(other.metricValue, metricValue) || other.metricValue == metricValue)&&(identical(other.metricIsStartDate, metricIsStartDate) || other.metricIsStartDate == metricIsStartDate)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.memberCount, memberCount) || other.memberCount == memberCount));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,type,emoji,adminName,badge,contribution,contributionUnit,metricValue,metricIsStartDate,rating,memberCount);

@override
String toString() {
  return 'DiscoverItem(id: $id, name: $name, type: $type, emoji: $emoji, adminName: $adminName, badge: $badge, contribution: $contribution, contributionUnit: $contributionUnit, metricValue: $metricValue, metricIsStartDate: $metricIsStartDate, rating: $rating, memberCount: $memberCount)';
}


}

/// @nodoc
abstract mixin class $DiscoverItemCopyWith<$Res>  {
  factory $DiscoverItemCopyWith(DiscoverItem value, $Res Function(DiscoverItem) _then) = _$DiscoverItemCopyWithImpl;
@useResult
$Res call({
 String id, String name, DiscoverItemType type, String emoji, String adminName, DiscoverBadge badge, Money contribution, String contributionUnit, String metricValue, bool metricIsStartDate, double rating, int memberCount
});




}
/// @nodoc
class _$DiscoverItemCopyWithImpl<$Res>
    implements $DiscoverItemCopyWith<$Res> {
  _$DiscoverItemCopyWithImpl(this._self, this._then);

  final DiscoverItem _self;
  final $Res Function(DiscoverItem) _then;

/// Create a copy of DiscoverItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,Object? emoji = null,Object? adminName = null,Object? badge = null,Object? contribution = null,Object? contributionUnit = null,Object? metricValue = null,Object? metricIsStartDate = null,Object? rating = null,Object? memberCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DiscoverItemType,emoji: null == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String,adminName: null == adminName ? _self.adminName : adminName // ignore: cast_nullable_to_non_nullable
as String,badge: null == badge ? _self.badge : badge // ignore: cast_nullable_to_non_nullable
as DiscoverBadge,contribution: null == contribution ? _self.contribution : contribution // ignore: cast_nullable_to_non_nullable
as Money,contributionUnit: null == contributionUnit ? _self.contributionUnit : contributionUnit // ignore: cast_nullable_to_non_nullable
as String,metricValue: null == metricValue ? _self.metricValue : metricValue // ignore: cast_nullable_to_non_nullable
as String,metricIsStartDate: null == metricIsStartDate ? _self.metricIsStartDate : metricIsStartDate // ignore: cast_nullable_to_non_nullable
as bool,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,memberCount: null == memberCount ? _self.memberCount : memberCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DiscoverItem].
extension DiscoverItemPatterns on DiscoverItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DiscoverItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DiscoverItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DiscoverItem value)  $default,){
final _that = this;
switch (_that) {
case _DiscoverItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DiscoverItem value)?  $default,){
final _that = this;
switch (_that) {
case _DiscoverItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  DiscoverItemType type,  String emoji,  String adminName,  DiscoverBadge badge,  Money contribution,  String contributionUnit,  String metricValue,  bool metricIsStartDate,  double rating,  int memberCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DiscoverItem() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  DiscoverItemType type,  String emoji,  String adminName,  DiscoverBadge badge,  Money contribution,  String contributionUnit,  String metricValue,  bool metricIsStartDate,  double rating,  int memberCount)  $default,) {final _that = this;
switch (_that) {
case _DiscoverItem():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  DiscoverItemType type,  String emoji,  String adminName,  DiscoverBadge badge,  Money contribution,  String contributionUnit,  String metricValue,  bool metricIsStartDate,  double rating,  int memberCount)?  $default,) {final _that = this;
switch (_that) {
case _DiscoverItem() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.emoji,_that.adminName,_that.badge,_that.contribution,_that.contributionUnit,_that.metricValue,_that.metricIsStartDate,_that.rating,_that.memberCount);case _:
  return null;

}
}

}

/// @nodoc


class _DiscoverItem implements DiscoverItem {
  const _DiscoverItem({required this.id, required this.name, required this.type, required this.emoji, required this.adminName, required this.badge, required this.contribution, required this.contributionUnit, required this.metricValue, required this.metricIsStartDate, required this.rating, required this.memberCount});
  

@override final  String id;
@override final  String name;
@override final  DiscoverItemType type;
@override final  String emoji;
@override final  String adminName;
@override final  DiscoverBadge badge;
@override final  Money contribution;
@override final  String contributionUnit;
@override final  String metricValue;
@override final  bool metricIsStartDate;
@override final  double rating;
@override final  int memberCount;

/// Create a copy of DiscoverItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiscoverItemCopyWith<_DiscoverItem> get copyWith => __$DiscoverItemCopyWithImpl<_DiscoverItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiscoverItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.emoji, emoji) || other.emoji == emoji)&&(identical(other.adminName, adminName) || other.adminName == adminName)&&(identical(other.badge, badge) || other.badge == badge)&&(identical(other.contribution, contribution) || other.contribution == contribution)&&(identical(other.contributionUnit, contributionUnit) || other.contributionUnit == contributionUnit)&&(identical(other.metricValue, metricValue) || other.metricValue == metricValue)&&(identical(other.metricIsStartDate, metricIsStartDate) || other.metricIsStartDate == metricIsStartDate)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.memberCount, memberCount) || other.memberCount == memberCount));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,type,emoji,adminName,badge,contribution,contributionUnit,metricValue,metricIsStartDate,rating,memberCount);

@override
String toString() {
  return 'DiscoverItem(id: $id, name: $name, type: $type, emoji: $emoji, adminName: $adminName, badge: $badge, contribution: $contribution, contributionUnit: $contributionUnit, metricValue: $metricValue, metricIsStartDate: $metricIsStartDate, rating: $rating, memberCount: $memberCount)';
}


}

/// @nodoc
abstract mixin class _$DiscoverItemCopyWith<$Res> implements $DiscoverItemCopyWith<$Res> {
  factory _$DiscoverItemCopyWith(_DiscoverItem value, $Res Function(_DiscoverItem) _then) = __$DiscoverItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, DiscoverItemType type, String emoji, String adminName, DiscoverBadge badge, Money contribution, String contributionUnit, String metricValue, bool metricIsStartDate, double rating, int memberCount
});




}
/// @nodoc
class __$DiscoverItemCopyWithImpl<$Res>
    implements _$DiscoverItemCopyWith<$Res> {
  __$DiscoverItemCopyWithImpl(this._self, this._then);

  final _DiscoverItem _self;
  final $Res Function(_DiscoverItem) _then;

/// Create a copy of DiscoverItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,Object? emoji = null,Object? adminName = null,Object? badge = null,Object? contribution = null,Object? contributionUnit = null,Object? metricValue = null,Object? metricIsStartDate = null,Object? rating = null,Object? memberCount = null,}) {
  return _then(_DiscoverItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DiscoverItemType,emoji: null == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String,adminName: null == adminName ? _self.adminName : adminName // ignore: cast_nullable_to_non_nullable
as String,badge: null == badge ? _self.badge : badge // ignore: cast_nullable_to_non_nullable
as DiscoverBadge,contribution: null == contribution ? _self.contribution : contribution // ignore: cast_nullable_to_non_nullable
as Money,contributionUnit: null == contributionUnit ? _self.contributionUnit : contributionUnit // ignore: cast_nullable_to_non_nullable
as String,metricValue: null == metricValue ? _self.metricValue : metricValue // ignore: cast_nullable_to_non_nullable
as String,metricIsStartDate: null == metricIsStartDate ? _self.metricIsStartDate : metricIsStartDate // ignore: cast_nullable_to_non_nullable
as bool,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,memberCount: null == memberCount ? _self.memberCount : memberCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
