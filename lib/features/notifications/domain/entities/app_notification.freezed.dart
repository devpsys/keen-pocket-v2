// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppNotification {

 String get id; String get title; String get body; bool get isRead; String get timeAgo; NotificationKind get kind; String? get dateLabel; String? get category; String? get detailBody; double? get goalPercent;// 0..1
 String? get savedLabel; String? get targetLabel; String? get relatedPocket; String? get relatedPocketImageUrl; String? get sourceAccount; String? get mascotTip;
/// Create a copy of AppNotification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppNotificationCopyWith<AppNotification> get copyWith => _$AppNotificationCopyWithImpl<AppNotification>(this as AppNotification, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppNotification&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.timeAgo, timeAgo) || other.timeAgo == timeAgo)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.dateLabel, dateLabel) || other.dateLabel == dateLabel)&&(identical(other.category, category) || other.category == category)&&(identical(other.detailBody, detailBody) || other.detailBody == detailBody)&&(identical(other.goalPercent, goalPercent) || other.goalPercent == goalPercent)&&(identical(other.savedLabel, savedLabel) || other.savedLabel == savedLabel)&&(identical(other.targetLabel, targetLabel) || other.targetLabel == targetLabel)&&(identical(other.relatedPocket, relatedPocket) || other.relatedPocket == relatedPocket)&&(identical(other.relatedPocketImageUrl, relatedPocketImageUrl) || other.relatedPocketImageUrl == relatedPocketImageUrl)&&(identical(other.sourceAccount, sourceAccount) || other.sourceAccount == sourceAccount)&&(identical(other.mascotTip, mascotTip) || other.mascotTip == mascotTip));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,body,isRead,timeAgo,kind,dateLabel,category,detailBody,goalPercent,savedLabel,targetLabel,relatedPocket,relatedPocketImageUrl,sourceAccount,mascotTip);

@override
String toString() {
  return 'AppNotification(id: $id, title: $title, body: $body, isRead: $isRead, timeAgo: $timeAgo, kind: $kind, dateLabel: $dateLabel, category: $category, detailBody: $detailBody, goalPercent: $goalPercent, savedLabel: $savedLabel, targetLabel: $targetLabel, relatedPocket: $relatedPocket, relatedPocketImageUrl: $relatedPocketImageUrl, sourceAccount: $sourceAccount, mascotTip: $mascotTip)';
}


}

/// @nodoc
abstract mixin class $AppNotificationCopyWith<$Res>  {
  factory $AppNotificationCopyWith(AppNotification value, $Res Function(AppNotification) _then) = _$AppNotificationCopyWithImpl;
@useResult
$Res call({
 String id, String title, String body, bool isRead, String timeAgo, NotificationKind kind, String? dateLabel, String? category, String? detailBody, double? goalPercent, String? savedLabel, String? targetLabel, String? relatedPocket, String? relatedPocketImageUrl, String? sourceAccount, String? mascotTip
});




}
/// @nodoc
class _$AppNotificationCopyWithImpl<$Res>
    implements $AppNotificationCopyWith<$Res> {
  _$AppNotificationCopyWithImpl(this._self, this._then);

  final AppNotification _self;
  final $Res Function(AppNotification) _then;

/// Create a copy of AppNotification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? body = null,Object? isRead = null,Object? timeAgo = null,Object? kind = null,Object? dateLabel = freezed,Object? category = freezed,Object? detailBody = freezed,Object? goalPercent = freezed,Object? savedLabel = freezed,Object? targetLabel = freezed,Object? relatedPocket = freezed,Object? relatedPocketImageUrl = freezed,Object? sourceAccount = freezed,Object? mascotTip = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,timeAgo: null == timeAgo ? _self.timeAgo : timeAgo // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as NotificationKind,dateLabel: freezed == dateLabel ? _self.dateLabel : dateLabel // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [AppNotification].
extension AppNotificationPatterns on AppNotification {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppNotification value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppNotification() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppNotification value)  $default,){
final _that = this;
switch (_that) {
case _AppNotification():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppNotification value)?  $default,){
final _that = this;
switch (_that) {
case _AppNotification() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String body,  bool isRead,  String timeAgo,  NotificationKind kind,  String? dateLabel,  String? category,  String? detailBody,  double? goalPercent,  String? savedLabel,  String? targetLabel,  String? relatedPocket,  String? relatedPocketImageUrl,  String? sourceAccount,  String? mascotTip)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppNotification() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String body,  bool isRead,  String timeAgo,  NotificationKind kind,  String? dateLabel,  String? category,  String? detailBody,  double? goalPercent,  String? savedLabel,  String? targetLabel,  String? relatedPocket,  String? relatedPocketImageUrl,  String? sourceAccount,  String? mascotTip)  $default,) {final _that = this;
switch (_that) {
case _AppNotification():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String body,  bool isRead,  String timeAgo,  NotificationKind kind,  String? dateLabel,  String? category,  String? detailBody,  double? goalPercent,  String? savedLabel,  String? targetLabel,  String? relatedPocket,  String? relatedPocketImageUrl,  String? sourceAccount,  String? mascotTip)?  $default,) {final _that = this;
switch (_that) {
case _AppNotification() when $default != null:
return $default(_that.id,_that.title,_that.body,_that.isRead,_that.timeAgo,_that.kind,_that.dateLabel,_that.category,_that.detailBody,_that.goalPercent,_that.savedLabel,_that.targetLabel,_that.relatedPocket,_that.relatedPocketImageUrl,_that.sourceAccount,_that.mascotTip);case _:
  return null;

}
}

}

/// @nodoc


class _AppNotification implements AppNotification {
  const _AppNotification({required this.id, required this.title, required this.body, required this.isRead, required this.timeAgo, this.kind = NotificationKind.payment, this.dateLabel, this.category, this.detailBody, this.goalPercent, this.savedLabel, this.targetLabel, this.relatedPocket, this.relatedPocketImageUrl, this.sourceAccount, this.mascotTip});
  

@override final  String id;
@override final  String title;
@override final  String body;
@override final  bool isRead;
@override final  String timeAgo;
@override@JsonKey() final  NotificationKind kind;
@override final  String? dateLabel;
@override final  String? category;
@override final  String? detailBody;
@override final  double? goalPercent;
// 0..1
@override final  String? savedLabel;
@override final  String? targetLabel;
@override final  String? relatedPocket;
@override final  String? relatedPocketImageUrl;
@override final  String? sourceAccount;
@override final  String? mascotTip;

/// Create a copy of AppNotification
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppNotificationCopyWith<_AppNotification> get copyWith => __$AppNotificationCopyWithImpl<_AppNotification>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppNotification&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.timeAgo, timeAgo) || other.timeAgo == timeAgo)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.dateLabel, dateLabel) || other.dateLabel == dateLabel)&&(identical(other.category, category) || other.category == category)&&(identical(other.detailBody, detailBody) || other.detailBody == detailBody)&&(identical(other.goalPercent, goalPercent) || other.goalPercent == goalPercent)&&(identical(other.savedLabel, savedLabel) || other.savedLabel == savedLabel)&&(identical(other.targetLabel, targetLabel) || other.targetLabel == targetLabel)&&(identical(other.relatedPocket, relatedPocket) || other.relatedPocket == relatedPocket)&&(identical(other.relatedPocketImageUrl, relatedPocketImageUrl) || other.relatedPocketImageUrl == relatedPocketImageUrl)&&(identical(other.sourceAccount, sourceAccount) || other.sourceAccount == sourceAccount)&&(identical(other.mascotTip, mascotTip) || other.mascotTip == mascotTip));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,body,isRead,timeAgo,kind,dateLabel,category,detailBody,goalPercent,savedLabel,targetLabel,relatedPocket,relatedPocketImageUrl,sourceAccount,mascotTip);

@override
String toString() {
  return 'AppNotification(id: $id, title: $title, body: $body, isRead: $isRead, timeAgo: $timeAgo, kind: $kind, dateLabel: $dateLabel, category: $category, detailBody: $detailBody, goalPercent: $goalPercent, savedLabel: $savedLabel, targetLabel: $targetLabel, relatedPocket: $relatedPocket, relatedPocketImageUrl: $relatedPocketImageUrl, sourceAccount: $sourceAccount, mascotTip: $mascotTip)';
}


}

/// @nodoc
abstract mixin class _$AppNotificationCopyWith<$Res> implements $AppNotificationCopyWith<$Res> {
  factory _$AppNotificationCopyWith(_AppNotification value, $Res Function(_AppNotification) _then) = __$AppNotificationCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String body, bool isRead, String timeAgo, NotificationKind kind, String? dateLabel, String? category, String? detailBody, double? goalPercent, String? savedLabel, String? targetLabel, String? relatedPocket, String? relatedPocketImageUrl, String? sourceAccount, String? mascotTip
});




}
/// @nodoc
class __$AppNotificationCopyWithImpl<$Res>
    implements _$AppNotificationCopyWith<$Res> {
  __$AppNotificationCopyWithImpl(this._self, this._then);

  final _AppNotification _self;
  final $Res Function(_AppNotification) _then;

/// Create a copy of AppNotification
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? body = null,Object? isRead = null,Object? timeAgo = null,Object? kind = null,Object? dateLabel = freezed,Object? category = freezed,Object? detailBody = freezed,Object? goalPercent = freezed,Object? savedLabel = freezed,Object? targetLabel = freezed,Object? relatedPocket = freezed,Object? relatedPocketImageUrl = freezed,Object? sourceAccount = freezed,Object? mascotTip = freezed,}) {
  return _then(_AppNotification(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,timeAgo: null == timeAgo ? _self.timeAgo : timeAgo // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as NotificationKind,dateLabel: freezed == dateLabel ? _self.dateLabel : dateLabel // ignore: cast_nullable_to_non_nullable
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
