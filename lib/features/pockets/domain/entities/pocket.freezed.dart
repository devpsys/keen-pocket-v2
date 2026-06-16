// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pocket.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Pocket {

 String get id; String get name; String get organiserId; Money get handPrice; int get totalHands; int get filledHands; int get memberCount; bool get isPublic; Set<String> get memberIds;
/// Create a copy of Pocket
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PocketCopyWith<Pocket> get copyWith => _$PocketCopyWithImpl<Pocket>(this as Pocket, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Pocket&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.organiserId, organiserId) || other.organiserId == organiserId)&&(identical(other.handPrice, handPrice) || other.handPrice == handPrice)&&(identical(other.totalHands, totalHands) || other.totalHands == totalHands)&&(identical(other.filledHands, filledHands) || other.filledHands == filledHands)&&(identical(other.memberCount, memberCount) || other.memberCount == memberCount)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&const DeepCollectionEquality().equals(other.memberIds, memberIds));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,organiserId,handPrice,totalHands,filledHands,memberCount,isPublic,const DeepCollectionEquality().hash(memberIds));

@override
String toString() {
  return 'Pocket(id: $id, name: $name, organiserId: $organiserId, handPrice: $handPrice, totalHands: $totalHands, filledHands: $filledHands, memberCount: $memberCount, isPublic: $isPublic, memberIds: $memberIds)';
}


}

/// @nodoc
abstract mixin class $PocketCopyWith<$Res>  {
  factory $PocketCopyWith(Pocket value, $Res Function(Pocket) _then) = _$PocketCopyWithImpl;
@useResult
$Res call({
 String id, String name, String organiserId, Money handPrice, int totalHands, int filledHands, int memberCount, bool isPublic, Set<String> memberIds
});




}
/// @nodoc
class _$PocketCopyWithImpl<$Res>
    implements $PocketCopyWith<$Res> {
  _$PocketCopyWithImpl(this._self, this._then);

  final Pocket _self;
  final $Res Function(Pocket) _then;

/// Create a copy of Pocket
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? organiserId = null,Object? handPrice = null,Object? totalHands = null,Object? filledHands = null,Object? memberCount = null,Object? isPublic = null,Object? memberIds = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,organiserId: null == organiserId ? _self.organiserId : organiserId // ignore: cast_nullable_to_non_nullable
as String,handPrice: null == handPrice ? _self.handPrice : handPrice // ignore: cast_nullable_to_non_nullable
as Money,totalHands: null == totalHands ? _self.totalHands : totalHands // ignore: cast_nullable_to_non_nullable
as int,filledHands: null == filledHands ? _self.filledHands : filledHands // ignore: cast_nullable_to_non_nullable
as int,memberCount: null == memberCount ? _self.memberCount : memberCount // ignore: cast_nullable_to_non_nullable
as int,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,memberIds: null == memberIds ? _self.memberIds : memberIds // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [Pocket].
extension PocketPatterns on Pocket {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Pocket value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Pocket() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Pocket value)  $default,){
final _that = this;
switch (_that) {
case _Pocket():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Pocket value)?  $default,){
final _that = this;
switch (_that) {
case _Pocket() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String organiserId,  Money handPrice,  int totalHands,  int filledHands,  int memberCount,  bool isPublic,  Set<String> memberIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Pocket() when $default != null:
return $default(_that.id,_that.name,_that.organiserId,_that.handPrice,_that.totalHands,_that.filledHands,_that.memberCount,_that.isPublic,_that.memberIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String organiserId,  Money handPrice,  int totalHands,  int filledHands,  int memberCount,  bool isPublic,  Set<String> memberIds)  $default,) {final _that = this;
switch (_that) {
case _Pocket():
return $default(_that.id,_that.name,_that.organiserId,_that.handPrice,_that.totalHands,_that.filledHands,_that.memberCount,_that.isPublic,_that.memberIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String organiserId,  Money handPrice,  int totalHands,  int filledHands,  int memberCount,  bool isPublic,  Set<String> memberIds)?  $default,) {final _that = this;
switch (_that) {
case _Pocket() when $default != null:
return $default(_that.id,_that.name,_that.organiserId,_that.handPrice,_that.totalHands,_that.filledHands,_that.memberCount,_that.isPublic,_that.memberIds);case _:
  return null;

}
}

}

/// @nodoc


class _Pocket extends Pocket {
  const _Pocket({required this.id, required this.name, required this.organiserId, required this.handPrice, required this.totalHands, required this.filledHands, required this.memberCount, this.isPublic = false, final  Set<String> memberIds = const <String>{}}): _memberIds = memberIds,super._();
  

@override final  String id;
@override final  String name;
@override final  String organiserId;
@override final  Money handPrice;
@override final  int totalHands;
@override final  int filledHands;
@override final  int memberCount;
@override@JsonKey() final  bool isPublic;
 final  Set<String> _memberIds;
@override@JsonKey() Set<String> get memberIds {
  if (_memberIds is EqualUnmodifiableSetView) return _memberIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_memberIds);
}


/// Create a copy of Pocket
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PocketCopyWith<_Pocket> get copyWith => __$PocketCopyWithImpl<_Pocket>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Pocket&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.organiserId, organiserId) || other.organiserId == organiserId)&&(identical(other.handPrice, handPrice) || other.handPrice == handPrice)&&(identical(other.totalHands, totalHands) || other.totalHands == totalHands)&&(identical(other.filledHands, filledHands) || other.filledHands == filledHands)&&(identical(other.memberCount, memberCount) || other.memberCount == memberCount)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&const DeepCollectionEquality().equals(other._memberIds, _memberIds));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,organiserId,handPrice,totalHands,filledHands,memberCount,isPublic,const DeepCollectionEquality().hash(_memberIds));

@override
String toString() {
  return 'Pocket(id: $id, name: $name, organiserId: $organiserId, handPrice: $handPrice, totalHands: $totalHands, filledHands: $filledHands, memberCount: $memberCount, isPublic: $isPublic, memberIds: $memberIds)';
}


}

/// @nodoc
abstract mixin class _$PocketCopyWith<$Res> implements $PocketCopyWith<$Res> {
  factory _$PocketCopyWith(_Pocket value, $Res Function(_Pocket) _then) = __$PocketCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String organiserId, Money handPrice, int totalHands, int filledHands, int memberCount, bool isPublic, Set<String> memberIds
});




}
/// @nodoc
class __$PocketCopyWithImpl<$Res>
    implements _$PocketCopyWith<$Res> {
  __$PocketCopyWithImpl(this._self, this._then);

  final _Pocket _self;
  final $Res Function(_Pocket) _then;

/// Create a copy of Pocket
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? organiserId = null,Object? handPrice = null,Object? totalHands = null,Object? filledHands = null,Object? memberCount = null,Object? isPublic = null,Object? memberIds = null,}) {
  return _then(_Pocket(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,organiserId: null == organiserId ? _self.organiserId : organiserId // ignore: cast_nullable_to_non_nullable
as String,handPrice: null == handPrice ? _self.handPrice : handPrice // ignore: cast_nullable_to_non_nullable
as Money,totalHands: null == totalHands ? _self.totalHands : totalHands // ignore: cast_nullable_to_non_nullable
as int,filledHands: null == filledHands ? _self.filledHands : filledHands // ignore: cast_nullable_to_non_nullable
as int,memberCount: null == memberCount ? _self.memberCount : memberCount // ignore: cast_nullable_to_non_nullable
as int,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,memberIds: null == memberIds ? _self._memberIds : memberIds // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}


}

// dart format on
