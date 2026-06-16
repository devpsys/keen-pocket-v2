// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InvoiceItemDto {

 String get id; String get label;@JsonKey(name: 'amount') int get amountKobo; String get type;
/// Create a copy of InvoiceItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoiceItemDtoCopyWith<InvoiceItemDto> get copyWith => _$InvoiceItemDtoCopyWithImpl<InvoiceItemDto>(this as InvoiceItemDto, _$identity);

  /// Serializes this InvoiceItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvoiceItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.amountKobo, amountKobo) || other.amountKobo == amountKobo)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,amountKobo,type);

@override
String toString() {
  return 'InvoiceItemDto(id: $id, label: $label, amountKobo: $amountKobo, type: $type)';
}


}

/// @nodoc
abstract mixin class $InvoiceItemDtoCopyWith<$Res>  {
  factory $InvoiceItemDtoCopyWith(InvoiceItemDto value, $Res Function(InvoiceItemDto) _then) = _$InvoiceItemDtoCopyWithImpl;
@useResult
$Res call({
 String id, String label,@JsonKey(name: 'amount') int amountKobo, String type
});




}
/// @nodoc
class _$InvoiceItemDtoCopyWithImpl<$Res>
    implements $InvoiceItemDtoCopyWith<$Res> {
  _$InvoiceItemDtoCopyWithImpl(this._self, this._then);

  final InvoiceItemDto _self;
  final $Res Function(InvoiceItemDto) _then;

/// Create a copy of InvoiceItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,Object? amountKobo = null,Object? type = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amountKobo: null == amountKobo ? _self.amountKobo : amountKobo // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [InvoiceItemDto].
extension InvoiceItemDtoPatterns on InvoiceItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvoiceItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvoiceItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvoiceItemDto value)  $default,){
final _that = this;
switch (_that) {
case _InvoiceItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvoiceItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _InvoiceItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String label, @JsonKey(name: 'amount')  int amountKobo,  String type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvoiceItemDto() when $default != null:
return $default(_that.id,_that.label,_that.amountKobo,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String label, @JsonKey(name: 'amount')  int amountKobo,  String type)  $default,) {final _that = this;
switch (_that) {
case _InvoiceItemDto():
return $default(_that.id,_that.label,_that.amountKobo,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String label, @JsonKey(name: 'amount')  int amountKobo,  String type)?  $default,) {final _that = this;
switch (_that) {
case _InvoiceItemDto() when $default != null:
return $default(_that.id,_that.label,_that.amountKobo,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InvoiceItemDto implements InvoiceItemDto {
  const _InvoiceItemDto({required this.id, required this.label, @JsonKey(name: 'amount') required this.amountKobo, this.type = 'paid'});
  factory _InvoiceItemDto.fromJson(Map<String, dynamic> json) => _$InvoiceItemDtoFromJson(json);

@override final  String id;
@override final  String label;
@override@JsonKey(name: 'amount') final  int amountKobo;
@override@JsonKey() final  String type;

/// Create a copy of InvoiceItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvoiceItemDtoCopyWith<_InvoiceItemDto> get copyWith => __$InvoiceItemDtoCopyWithImpl<_InvoiceItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvoiceItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvoiceItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.amountKobo, amountKobo) || other.amountKobo == amountKobo)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,amountKobo,type);

@override
String toString() {
  return 'InvoiceItemDto(id: $id, label: $label, amountKobo: $amountKobo, type: $type)';
}


}

/// @nodoc
abstract mixin class _$InvoiceItemDtoCopyWith<$Res> implements $InvoiceItemDtoCopyWith<$Res> {
  factory _$InvoiceItemDtoCopyWith(_InvoiceItemDto value, $Res Function(_InvoiceItemDto) _then) = __$InvoiceItemDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String label,@JsonKey(name: 'amount') int amountKobo, String type
});




}
/// @nodoc
class __$InvoiceItemDtoCopyWithImpl<$Res>
    implements _$InvoiceItemDtoCopyWith<$Res> {
  __$InvoiceItemDtoCopyWithImpl(this._self, this._then);

  final _InvoiceItemDto _self;
  final $Res Function(_InvoiceItemDto) _then;

/// Create a copy of InvoiceItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? amountKobo = null,Object? type = null,}) {
  return _then(_InvoiceItemDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amountKobo: null == amountKobo ? _self.amountKobo : amountKobo // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$InvoiceDto {

 String get id;@JsonKey(name: 'contributor_id') String get contributorId;@JsonKey(name: 'total') int get totalKobo; String get status; List<InvoiceItemDto> get items;
/// Create a copy of InvoiceDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoiceDtoCopyWith<InvoiceDto> get copyWith => _$InvoiceDtoCopyWithImpl<InvoiceDto>(this as InvoiceDto, _$identity);

  /// Serializes this InvoiceDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvoiceDto&&(identical(other.id, id) || other.id == id)&&(identical(other.contributorId, contributorId) || other.contributorId == contributorId)&&(identical(other.totalKobo, totalKobo) || other.totalKobo == totalKobo)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,contributorId,totalKobo,status,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'InvoiceDto(id: $id, contributorId: $contributorId, totalKobo: $totalKobo, status: $status, items: $items)';
}


}

/// @nodoc
abstract mixin class $InvoiceDtoCopyWith<$Res>  {
  factory $InvoiceDtoCopyWith(InvoiceDto value, $Res Function(InvoiceDto) _then) = _$InvoiceDtoCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'contributor_id') String contributorId,@JsonKey(name: 'total') int totalKobo, String status, List<InvoiceItemDto> items
});




}
/// @nodoc
class _$InvoiceDtoCopyWithImpl<$Res>
    implements $InvoiceDtoCopyWith<$Res> {
  _$InvoiceDtoCopyWithImpl(this._self, this._then);

  final InvoiceDto _self;
  final $Res Function(InvoiceDto) _then;

/// Create a copy of InvoiceDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? contributorId = null,Object? totalKobo = null,Object? status = null,Object? items = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,contributorId: null == contributorId ? _self.contributorId : contributorId // ignore: cast_nullable_to_non_nullable
as String,totalKobo: null == totalKobo ? _self.totalKobo : totalKobo // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<InvoiceItemDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [InvoiceDto].
extension InvoiceDtoPatterns on InvoiceDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvoiceDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvoiceDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvoiceDto value)  $default,){
final _that = this;
switch (_that) {
case _InvoiceDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvoiceDto value)?  $default,){
final _that = this;
switch (_that) {
case _InvoiceDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'contributor_id')  String contributorId, @JsonKey(name: 'total')  int totalKobo,  String status,  List<InvoiceItemDto> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvoiceDto() when $default != null:
return $default(_that.id,_that.contributorId,_that.totalKobo,_that.status,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'contributor_id')  String contributorId, @JsonKey(name: 'total')  int totalKobo,  String status,  List<InvoiceItemDto> items)  $default,) {final _that = this;
switch (_that) {
case _InvoiceDto():
return $default(_that.id,_that.contributorId,_that.totalKobo,_that.status,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'contributor_id')  String contributorId, @JsonKey(name: 'total')  int totalKobo,  String status,  List<InvoiceItemDto> items)?  $default,) {final _that = this;
switch (_that) {
case _InvoiceDto() when $default != null:
return $default(_that.id,_that.contributorId,_that.totalKobo,_that.status,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InvoiceDto implements InvoiceDto {
  const _InvoiceDto({required this.id, @JsonKey(name: 'contributor_id') required this.contributorId, @JsonKey(name: 'total') required this.totalKobo, this.status = 'pending', final  List<InvoiceItemDto> items = const <InvoiceItemDto>[]}): _items = items;
  factory _InvoiceDto.fromJson(Map<String, dynamic> json) => _$InvoiceDtoFromJson(json);

@override final  String id;
@override@JsonKey(name: 'contributor_id') final  String contributorId;
@override@JsonKey(name: 'total') final  int totalKobo;
@override@JsonKey() final  String status;
 final  List<InvoiceItemDto> _items;
@override@JsonKey() List<InvoiceItemDto> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of InvoiceDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvoiceDtoCopyWith<_InvoiceDto> get copyWith => __$InvoiceDtoCopyWithImpl<_InvoiceDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvoiceDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvoiceDto&&(identical(other.id, id) || other.id == id)&&(identical(other.contributorId, contributorId) || other.contributorId == contributorId)&&(identical(other.totalKobo, totalKobo) || other.totalKobo == totalKobo)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,contributorId,totalKobo,status,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'InvoiceDto(id: $id, contributorId: $contributorId, totalKobo: $totalKobo, status: $status, items: $items)';
}


}

/// @nodoc
abstract mixin class _$InvoiceDtoCopyWith<$Res> implements $InvoiceDtoCopyWith<$Res> {
  factory _$InvoiceDtoCopyWith(_InvoiceDto value, $Res Function(_InvoiceDto) _then) = __$InvoiceDtoCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'contributor_id') String contributorId,@JsonKey(name: 'total') int totalKobo, String status, List<InvoiceItemDto> items
});




}
/// @nodoc
class __$InvoiceDtoCopyWithImpl<$Res>
    implements _$InvoiceDtoCopyWith<$Res> {
  __$InvoiceDtoCopyWithImpl(this._self, this._then);

  final _InvoiceDto _self;
  final $Res Function(_InvoiceDto) _then;

/// Create a copy of InvoiceDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? contributorId = null,Object? totalKobo = null,Object? status = null,Object? items = null,}) {
  return _then(_InvoiceDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,contributorId: null == contributorId ? _self.contributorId : contributorId // ignore: cast_nullable_to_non_nullable
as String,totalKobo: null == totalKobo ? _self.totalKobo : totalKobo // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<InvoiceItemDto>,
  ));
}


}

// dart format on
