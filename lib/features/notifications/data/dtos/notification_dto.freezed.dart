// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationDto {

 String get id; String get title; String get body;@JsonKey(name: 'is_read') bool get isRead;@JsonKey(name: 'time_ago') String get timeAgo; String get kind;// payment | member | invite | reminder | security | adashi | support
@JsonKey(name: 'date_label') String? get dateLabel; String? get category;@JsonKey(name: 'detail_body') String? get detailBody;@JsonKey(name: 'goal_percent') double? get goalPercent;@JsonKey(name: 'saved_label') String? get savedLabel;@JsonKey(name: 'target_label') String? get targetLabel;@JsonKey(name: 'related_pocket') String? get relatedPocket;@JsonKey(name: 'related_pocket_image_url') String? get relatedPocketImageUrl;@JsonKey(name: 'source_account') String? get sourceAccount;@JsonKey(name: 'mascot_tip') String? get mascotTip;
/// Create a copy of NotificationDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationDtoCopyWith<NotificationDto> get copyWith => _$NotificationDtoCopyWithImpl<NotificationDto>(this as NotificationDto, _$identity);

  /// Serializes this NotificationDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.timeAgo, timeAgo) || other.timeAgo == timeAgo)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.dateLabel, dateLabel) || other.dateLabel == dateLabel)&&(identical(other.category, category) || other.category == category)&&(identical(other.detailBody, detailBody) || other.detailBody == detailBody)&&(identical(other.goalPercent, goalPercent) || other.goalPercent == goalPercent)&&(identical(other.savedLabel, savedLabel) || other.savedLabel == savedLabel)&&(identical(other.targetLabel, targetLabel) || other.targetLabel == targetLabel)&&(identical(other.relatedPocket, relatedPocket) || other.relatedPocket == relatedPocket)&&(identical(other.relatedPocketImageUrl, relatedPocketImageUrl) || other.relatedPocketImageUrl == relatedPocketImageUrl)&&(identical(other.sourceAccount, sourceAccount) || other.sourceAccount == sourceAccount)&&(identical(other.mascotTip, mascotTip) || other.mascotTip == mascotTip));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,body,isRead,timeAgo,kind,dateLabel,category,detailBody,goalPercent,savedLabel,targetLabel,relatedPocket,relatedPocketImageUrl,sourceAccount,mascotTip);

@override
String toString() {
  return 'NotificationDto(id: $id, title: $title, body: $body, isRead: $isRead, timeAgo: $timeAgo, kind: $kind, dateLabel: $dateLabel, category: $category, detailBody: $detailBody, goalPercent: $goalPercent, savedLabel: $savedLabel, targetLabel: $targetLabel, relatedPocket: $relatedPocket, relatedPocketImageUrl: $relatedPocketImageUrl, sourceAccount: $sourceAccount, mascotTip: $mascotTip)';
}


}

/// @nodoc
abstract mixin class $NotificationDtoCopyWith<$Res>  {
  factory $NotificationDtoCopyWith(NotificationDto value, $Res Function(NotificationDto) _then) = _$NotificationDtoCopyWithImpl;
@useResult
$Res call({
 String id, String title, String body,@JsonKey(name: 'is_read') bool isRead,@JsonKey(name: 'time_ago') String timeAgo, String kind,@JsonKey(name: 'date_label') String? dateLabel, String? category,@JsonKey(name: 'detail_body') String? detailBody,@JsonKey(name: 'goal_percent') double? goalPercent,@JsonKey(name: 'saved_label') String? savedLabel,@JsonKey(name: 'target_label') String? targetLabel,@JsonKey(name: 'related_pocket') String? relatedPocket,@JsonKey(name: 'related_pocket_image_url') String? relatedPocketImageUrl,@JsonKey(name: 'source_account') String? sourceAccount,@JsonKey(name: 'mascot_tip') String? mascotTip
});




}
/// @nodoc
class _$NotificationDtoCopyWithImpl<$Res>
    implements $NotificationDtoCopyWith<$Res> {
  _$NotificationDtoCopyWithImpl(this._self, this._then);

  final NotificationDto _self;
  final $Res Function(NotificationDto) _then;

/// Create a copy of NotificationDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? body = null,Object? isRead = null,Object? timeAgo = null,Object? kind = null,Object? dateLabel = freezed,Object? category = freezed,Object? detailBody = freezed,Object? goalPercent = freezed,Object? savedLabel = freezed,Object? targetLabel = freezed,Object? relatedPocket = freezed,Object? relatedPocketImageUrl = freezed,Object? sourceAccount = freezed,Object? mascotTip = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,timeAgo: null == timeAgo ? _self.timeAgo : timeAgo // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,dateLabel: freezed == dateLabel ? _self.dateLabel : dateLabel // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,detailBody: freezed == detailBody ? _self.detailBody : detailBody // ignore: cast_nullable_to_non_nullable
as String?,goalPercent: freezed == goalPercent ? _self.goalPercent : goalPercent // ignore: cast_nullable_to_non_nullable
as double?,savedLabel: freezed == savedLabel ? _self.savedLabel : savedLabel // ignore: cast_nullable_to_non_nullable
as String?,targetLabel: freezed == targetLabel ? _self.targetLabel : targetLabel // ignore: cast_nullable_to_non_nullable
as String?,relatedPocket: freezed == relatedPocket ? _self.relatedPocket : relatedPocket // ignore: cast_nullable_to_non_nullable
as String?,relatedPocketImageUrl: freezed == relatedPocketImageUrl ? _self.relatedPocketImageUrl : relatedPocketImageUrl // ignore: cast_nullable_to_non_nullable
as String?,sourceAccount: freezed == sourceAccount ? _self.sourceAccount : sourceAccount // ignore: cast_nullable_to_non_nullable
as String?,mascotTip: freezed == mascotTip ? _self.mascotTip : mascotTip // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationDto].
extension NotificationDtoPatterns on NotificationDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationDto value)  $default,){
final _that = this;
switch (_that) {
case _NotificationDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationDto value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String body, @JsonKey(name: 'is_read')  bool isRead, @JsonKey(name: 'time_ago')  String timeAgo,  String kind, @JsonKey(name: 'date_label')  String? dateLabel,  String? category, @JsonKey(name: 'detail_body')  String? detailBody, @JsonKey(name: 'goal_percent')  double? goalPercent, @JsonKey(name: 'saved_label')  String? savedLabel, @JsonKey(name: 'target_label')  String? targetLabel, @JsonKey(name: 'related_pocket')  String? relatedPocket, @JsonKey(name: 'related_pocket_image_url')  String? relatedPocketImageUrl, @JsonKey(name: 'source_account')  String? sourceAccount, @JsonKey(name: 'mascot_tip')  String? mascotTip)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationDto() when $default != null:
return $default(_that.id,_that.title,_that.body,_that.isRead,_that.timeAgo,_that.kind,_that.dateLabel,_that.category,_that.detailBody,_that.goalPercent,_that.savedLabel,_that.targetLabel,_that.relatedPocket,_that.relatedPocketImageUrl,_that.sourceAccount,_that.mascotTip);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String body, @JsonKey(name: 'is_read')  bool isRead, @JsonKey(name: 'time_ago')  String timeAgo,  String kind, @JsonKey(name: 'date_label')  String? dateLabel,  String? category, @JsonKey(name: 'detail_body')  String? detailBody, @JsonKey(name: 'goal_percent')  double? goalPercent, @JsonKey(name: 'saved_label')  String? savedLabel, @JsonKey(name: 'target_label')  String? targetLabel, @JsonKey(name: 'related_pocket')  String? relatedPocket, @JsonKey(name: 'related_pocket_image_url')  String? relatedPocketImageUrl, @JsonKey(name: 'source_account')  String? sourceAccount, @JsonKey(name: 'mascot_tip')  String? mascotTip)  $default,) {final _that = this;
switch (_that) {
case _NotificationDto():
return $default(_that.id,_that.title,_that.body,_that.isRead,_that.timeAgo,_that.kind,_that.dateLabel,_that.category,_that.detailBody,_that.goalPercent,_that.savedLabel,_that.targetLabel,_that.relatedPocket,_that.relatedPocketImageUrl,_that.sourceAccount,_that.mascotTip);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String body, @JsonKey(name: 'is_read')  bool isRead, @JsonKey(name: 'time_ago')  String timeAgo,  String kind, @JsonKey(name: 'date_label')  String? dateLabel,  String? category, @JsonKey(name: 'detail_body')  String? detailBody, @JsonKey(name: 'goal_percent')  double? goalPercent, @JsonKey(name: 'saved_label')  String? savedLabel, @JsonKey(name: 'target_label')  String? targetLabel, @JsonKey(name: 'related_pocket')  String? relatedPocket, @JsonKey(name: 'related_pocket_image_url')  String? relatedPocketImageUrl, @JsonKey(name: 'source_account')  String? sourceAccount, @JsonKey(name: 'mascot_tip')  String? mascotTip)?  $default,) {final _that = this;
switch (_that) {
case _NotificationDto() when $default != null:
return $default(_that.id,_that.title,_that.body,_that.isRead,_that.timeAgo,_that.kind,_that.dateLabel,_that.category,_that.detailBody,_that.goalPercent,_that.savedLabel,_that.targetLabel,_that.relatedPocket,_that.relatedPocketImageUrl,_that.sourceAccount,_that.mascotTip);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationDto implements NotificationDto {
  const _NotificationDto({required this.id, required this.title, required this.body, @JsonKey(name: 'is_read') required this.isRead, @JsonKey(name: 'time_ago') required this.timeAgo, required this.kind, @JsonKey(name: 'date_label') this.dateLabel, this.category, @JsonKey(name: 'detail_body') this.detailBody, @JsonKey(name: 'goal_percent') this.goalPercent, @JsonKey(name: 'saved_label') this.savedLabel, @JsonKey(name: 'target_label') this.targetLabel, @JsonKey(name: 'related_pocket') this.relatedPocket, @JsonKey(name: 'related_pocket_image_url') this.relatedPocketImageUrl, @JsonKey(name: 'source_account') this.sourceAccount, @JsonKey(name: 'mascot_tip') this.mascotTip});
  factory _NotificationDto.fromJson(Map<String, dynamic> json) => _$NotificationDtoFromJson(json);

@override final  String id;
@override final  String title;
@override final  String body;
@override@JsonKey(name: 'is_read') final  bool isRead;
@override@JsonKey(name: 'time_ago') final  String timeAgo;
@override final  String kind;
// payment | member | invite | reminder | security | adashi | support
@override@JsonKey(name: 'date_label') final  String? dateLabel;
@override final  String? category;
@override@JsonKey(name: 'detail_body') final  String? detailBody;
@override@JsonKey(name: 'goal_percent') final  double? goalPercent;
@override@JsonKey(name: 'saved_label') final  String? savedLabel;
@override@JsonKey(name: 'target_label') final  String? targetLabel;
@override@JsonKey(name: 'related_pocket') final  String? relatedPocket;
@override@JsonKey(name: 'related_pocket_image_url') final  String? relatedPocketImageUrl;
@override@JsonKey(name: 'source_account') final  String? sourceAccount;
@override@JsonKey(name: 'mascot_tip') final  String? mascotTip;

/// Create a copy of NotificationDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationDtoCopyWith<_NotificationDto> get copyWith => __$NotificationDtoCopyWithImpl<_NotificationDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.timeAgo, timeAgo) || other.timeAgo == timeAgo)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.dateLabel, dateLabel) || other.dateLabel == dateLabel)&&(identical(other.category, category) || other.category == category)&&(identical(other.detailBody, detailBody) || other.detailBody == detailBody)&&(identical(other.goalPercent, goalPercent) || other.goalPercent == goalPercent)&&(identical(other.savedLabel, savedLabel) || other.savedLabel == savedLabel)&&(identical(other.targetLabel, targetLabel) || other.targetLabel == targetLabel)&&(identical(other.relatedPocket, relatedPocket) || other.relatedPocket == relatedPocket)&&(identical(other.relatedPocketImageUrl, relatedPocketImageUrl) || other.relatedPocketImageUrl == relatedPocketImageUrl)&&(identical(other.sourceAccount, sourceAccount) || other.sourceAccount == sourceAccount)&&(identical(other.mascotTip, mascotTip) || other.mascotTip == mascotTip));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,body,isRead,timeAgo,kind,dateLabel,category,detailBody,goalPercent,savedLabel,targetLabel,relatedPocket,relatedPocketImageUrl,sourceAccount,mascotTip);

@override
String toString() {
  return 'NotificationDto(id: $id, title: $title, body: $body, isRead: $isRead, timeAgo: $timeAgo, kind: $kind, dateLabel: $dateLabel, category: $category, detailBody: $detailBody, goalPercent: $goalPercent, savedLabel: $savedLabel, targetLabel: $targetLabel, relatedPocket: $relatedPocket, relatedPocketImageUrl: $relatedPocketImageUrl, sourceAccount: $sourceAccount, mascotTip: $mascotTip)';
}


}

/// @nodoc
abstract mixin class _$NotificationDtoCopyWith<$Res> implements $NotificationDtoCopyWith<$Res> {
  factory _$NotificationDtoCopyWith(_NotificationDto value, $Res Function(_NotificationDto) _then) = __$NotificationDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String body,@JsonKey(name: 'is_read') bool isRead,@JsonKey(name: 'time_ago') String timeAgo, String kind,@JsonKey(name: 'date_label') String? dateLabel, String? category,@JsonKey(name: 'detail_body') String? detailBody,@JsonKey(name: 'goal_percent') double? goalPercent,@JsonKey(name: 'saved_label') String? savedLabel,@JsonKey(name: 'target_label') String? targetLabel,@JsonKey(name: 'related_pocket') String? relatedPocket,@JsonKey(name: 'related_pocket_image_url') String? relatedPocketImageUrl,@JsonKey(name: 'source_account') String? sourceAccount,@JsonKey(name: 'mascot_tip') String? mascotTip
});




}
/// @nodoc
class __$NotificationDtoCopyWithImpl<$Res>
    implements _$NotificationDtoCopyWith<$Res> {
  __$NotificationDtoCopyWithImpl(this._self, this._then);

  final _NotificationDto _self;
  final $Res Function(_NotificationDto) _then;

/// Create a copy of NotificationDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? body = null,Object? isRead = null,Object? timeAgo = null,Object? kind = null,Object? dateLabel = freezed,Object? category = freezed,Object? detailBody = freezed,Object? goalPercent = freezed,Object? savedLabel = freezed,Object? targetLabel = freezed,Object? relatedPocket = freezed,Object? relatedPocketImageUrl = freezed,Object? sourceAccount = freezed,Object? mascotTip = freezed,}) {
  return _then(_NotificationDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,timeAgo: null == timeAgo ? _self.timeAgo : timeAgo // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,dateLabel: freezed == dateLabel ? _self.dateLabel : dateLabel // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,detailBody: freezed == detailBody ? _self.detailBody : detailBody // ignore: cast_nullable_to_non_nullable
as String?,goalPercent: freezed == goalPercent ? _self.goalPercent : goalPercent // ignore: cast_nullable_to_non_nullable
as double?,savedLabel: freezed == savedLabel ? _self.savedLabel : savedLabel // ignore: cast_nullable_to_non_nullable
as String?,targetLabel: freezed == targetLabel ? _self.targetLabel : targetLabel // ignore: cast_nullable_to_non_nullable
as String?,relatedPocket: freezed == relatedPocket ? _self.relatedPocket : relatedPocket // ignore: cast_nullable_to_non_nullable
as String?,relatedPocketImageUrl: freezed == relatedPocketImageUrl ? _self.relatedPocketImageUrl : relatedPocketImageUrl // ignore: cast_nullable_to_non_nullable
as String?,sourceAccount: freezed == sourceAccount ? _self.sourceAccount : sourceAccount // ignore: cast_nullable_to_non_nullable
as String?,mascotTip: freezed == mascotTip ? _self.mascotTip : mascotTip // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
