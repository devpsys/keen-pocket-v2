// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pocket_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PocketDto {

 String get id; String get name;@JsonKey(name: 'organiser_id') String get organiserId;@JsonKey(name: 'hand_price') int get handPriceKobo;@JsonKey(name: 'total_hands') int get totalHands;@JsonKey(name: 'filled_hands') int get filledHands;@JsonKey(name: 'member_count') int get memberCount;@JsonKey(name: 'is_public') bool get isPublic;@JsonKey(name: 'member_ids') List<String> get memberIds;
/// Create a copy of PocketDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PocketDtoCopyWith<PocketDto> get copyWith => _$PocketDtoCopyWithImpl<PocketDto>(this as PocketDto, _$identity);

  /// Serializes this PocketDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PocketDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.organiserId, organiserId) || other.organiserId == organiserId)&&(identical(other.handPriceKobo, handPriceKobo) || other.handPriceKobo == handPriceKobo)&&(identical(other.totalHands, totalHands) || other.totalHands == totalHands)&&(identical(other.filledHands, filledHands) || other.filledHands == filledHands)&&(identical(other.memberCount, memberCount) || other.memberCount == memberCount)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&const DeepCollectionEquality().equals(other.memberIds, memberIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,organiserId,handPriceKobo,totalHands,filledHands,memberCount,isPublic,const DeepCollectionEquality().hash(memberIds));

@override
String toString() {
  return 'PocketDto(id: $id, name: $name, organiserId: $organiserId, handPriceKobo: $handPriceKobo, totalHands: $totalHands, filledHands: $filledHands, memberCount: $memberCount, isPublic: $isPublic, memberIds: $memberIds)';
}


}

/// @nodoc
abstract mixin class $PocketDtoCopyWith<$Res>  {
  factory $PocketDtoCopyWith(PocketDto value, $Res Function(PocketDto) _then) = _$PocketDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name,@JsonKey(name: 'organiser_id') String organiserId,@JsonKey(name: 'hand_price') int handPriceKobo,@JsonKey(name: 'total_hands') int totalHands,@JsonKey(name: 'filled_hands') int filledHands,@JsonKey(name: 'member_count') int memberCount,@JsonKey(name: 'is_public') bool isPublic,@JsonKey(name: 'member_ids') List<String> memberIds
});




}
/// @nodoc
class _$PocketDtoCopyWithImpl<$Res>
    implements $PocketDtoCopyWith<$Res> {
  _$PocketDtoCopyWithImpl(this._self, this._then);

  final PocketDto _self;
  final $Res Function(PocketDto) _then;

/// Create a copy of PocketDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? organiserId = null,Object? handPriceKobo = null,Object? totalHands = null,Object? filledHands = null,Object? memberCount = null,Object? isPublic = null,Object? memberIds = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,organiserId: null == organiserId ? _self.organiserId : organiserId // ignore: cast_nullable_to_non_nullable
as String,handPriceKobo: null == handPriceKobo ? _self.handPriceKobo : handPriceKobo // ignore: cast_nullable_to_non_nullable
as int,totalHands: null == totalHands ? _self.totalHands : totalHands // ignore: cast_nullable_to_non_nullable
as int,filledHands: null == filledHands ? _self.filledHands : filledHands // ignore: cast_nullable_to_non_nullable
as int,memberCount: null == memberCount ? _self.memberCount : memberCount // ignore: cast_nullable_to_non_nullable
as int,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,memberIds: null == memberIds ? _self.memberIds : memberIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [PocketDto].
extension PocketDtoPatterns on PocketDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PocketDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PocketDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PocketDto value)  $default,){
final _that = this;
switch (_that) {
case _PocketDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PocketDto value)?  $default,){
final _that = this;
switch (_that) {
case _PocketDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'organiser_id')  String organiserId, @JsonKey(name: 'hand_price')  int handPriceKobo, @JsonKey(name: 'total_hands')  int totalHands, @JsonKey(name: 'filled_hands')  int filledHands, @JsonKey(name: 'member_count')  int memberCount, @JsonKey(name: 'is_public')  bool isPublic, @JsonKey(name: 'member_ids')  List<String> memberIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PocketDto() when $default != null:
return $default(_that.id,_that.name,_that.organiserId,_that.handPriceKobo,_that.totalHands,_that.filledHands,_that.memberCount,_that.isPublic,_that.memberIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'organiser_id')  String organiserId, @JsonKey(name: 'hand_price')  int handPriceKobo, @JsonKey(name: 'total_hands')  int totalHands, @JsonKey(name: 'filled_hands')  int filledHands, @JsonKey(name: 'member_count')  int memberCount, @JsonKey(name: 'is_public')  bool isPublic, @JsonKey(name: 'member_ids')  List<String> memberIds)  $default,) {final _that = this;
switch (_that) {
case _PocketDto():
return $default(_that.id,_that.name,_that.organiserId,_that.handPriceKobo,_that.totalHands,_that.filledHands,_that.memberCount,_that.isPublic,_that.memberIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @JsonKey(name: 'organiser_id')  String organiserId, @JsonKey(name: 'hand_price')  int handPriceKobo, @JsonKey(name: 'total_hands')  int totalHands, @JsonKey(name: 'filled_hands')  int filledHands, @JsonKey(name: 'member_count')  int memberCount, @JsonKey(name: 'is_public')  bool isPublic, @JsonKey(name: 'member_ids')  List<String> memberIds)?  $default,) {final _that = this;
switch (_that) {
case _PocketDto() when $default != null:
return $default(_that.id,_that.name,_that.organiserId,_that.handPriceKobo,_that.totalHands,_that.filledHands,_that.memberCount,_that.isPublic,_that.memberIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PocketDto implements PocketDto {
  const _PocketDto({required this.id, required this.name, @JsonKey(name: 'organiser_id') required this.organiserId, @JsonKey(name: 'hand_price') required this.handPriceKobo, @JsonKey(name: 'total_hands') required this.totalHands, @JsonKey(name: 'filled_hands') required this.filledHands, @JsonKey(name: 'member_count') required this.memberCount, @JsonKey(name: 'is_public') this.isPublic = false, @JsonKey(name: 'member_ids') final  List<String> memberIds = const <String>[]}): _memberIds = memberIds;
  factory _PocketDto.fromJson(Map<String, dynamic> json) => _$PocketDtoFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey(name: 'organiser_id') final  String organiserId;
@override@JsonKey(name: 'hand_price') final  int handPriceKobo;
@override@JsonKey(name: 'total_hands') final  int totalHands;
@override@JsonKey(name: 'filled_hands') final  int filledHands;
@override@JsonKey(name: 'member_count') final  int memberCount;
@override@JsonKey(name: 'is_public') final  bool isPublic;
 final  List<String> _memberIds;
@override@JsonKey(name: 'member_ids') List<String> get memberIds {
  if (_memberIds is EqualUnmodifiableListView) return _memberIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_memberIds);
}


/// Create a copy of PocketDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PocketDtoCopyWith<_PocketDto> get copyWith => __$PocketDtoCopyWithImpl<_PocketDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PocketDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PocketDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.organiserId, organiserId) || other.organiserId == organiserId)&&(identical(other.handPriceKobo, handPriceKobo) || other.handPriceKobo == handPriceKobo)&&(identical(other.totalHands, totalHands) || other.totalHands == totalHands)&&(identical(other.filledHands, filledHands) || other.filledHands == filledHands)&&(identical(other.memberCount, memberCount) || other.memberCount == memberCount)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&const DeepCollectionEquality().equals(other._memberIds, _memberIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,organiserId,handPriceKobo,totalHands,filledHands,memberCount,isPublic,const DeepCollectionEquality().hash(_memberIds));

@override
String toString() {
  return 'PocketDto(id: $id, name: $name, organiserId: $organiserId, handPriceKobo: $handPriceKobo, totalHands: $totalHands, filledHands: $filledHands, memberCount: $memberCount, isPublic: $isPublic, memberIds: $memberIds)';
}


}

/// @nodoc
abstract mixin class _$PocketDtoCopyWith<$Res> implements $PocketDtoCopyWith<$Res> {
  factory _$PocketDtoCopyWith(_PocketDto value, $Res Function(_PocketDto) _then) = __$PocketDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@JsonKey(name: 'organiser_id') String organiserId,@JsonKey(name: 'hand_price') int handPriceKobo,@JsonKey(name: 'total_hands') int totalHands,@JsonKey(name: 'filled_hands') int filledHands,@JsonKey(name: 'member_count') int memberCount,@JsonKey(name: 'is_public') bool isPublic,@JsonKey(name: 'member_ids') List<String> memberIds
});




}
/// @nodoc
class __$PocketDtoCopyWithImpl<$Res>
    implements _$PocketDtoCopyWith<$Res> {
  __$PocketDtoCopyWithImpl(this._self, this._then);

  final _PocketDto _self;
  final $Res Function(_PocketDto) _then;

/// Create a copy of PocketDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? organiserId = null,Object? handPriceKobo = null,Object? totalHands = null,Object? filledHands = null,Object? memberCount = null,Object? isPublic = null,Object? memberIds = null,}) {
  return _then(_PocketDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,organiserId: null == organiserId ? _self.organiserId : organiserId // ignore: cast_nullable_to_non_nullable
as String,handPriceKobo: null == handPriceKobo ? _self.handPriceKobo : handPriceKobo // ignore: cast_nullable_to_non_nullable
as int,totalHands: null == totalHands ? _self.totalHands : totalHands // ignore: cast_nullable_to_non_nullable
as int,filledHands: null == filledHands ? _self.filledHands : filledHands // ignore: cast_nullable_to_non_nullable
as int,memberCount: null == memberCount ? _self.memberCount : memberCount // ignore: cast_nullable_to_non_nullable
as int,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,memberIds: null == memberIds ? _self._memberIds : memberIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
