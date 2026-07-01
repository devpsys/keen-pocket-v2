// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payouts_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PayoutDto {

 String get id; String get reference; int get amount;// kobo
 String get status;// success | pending | failed
@JsonKey(name: 'date_label') String? get dateLabel;@JsonKey(name: 'bank_name') String? get bankName;
/// Create a copy of PayoutDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PayoutDtoCopyWith<PayoutDto> get copyWith => _$PayoutDtoCopyWithImpl<PayoutDto>(this as PayoutDto, _$identity);

  /// Serializes this PayoutDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PayoutDto&&(identical(other.id, id) || other.id == id)&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.status, status) || other.status == status)&&(identical(other.dateLabel, dateLabel) || other.dateLabel == dateLabel)&&(identical(other.bankName, bankName) || other.bankName == bankName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,reference,amount,status,dateLabel,bankName);

@override
String toString() {
  return 'PayoutDto(id: $id, reference: $reference, amount: $amount, status: $status, dateLabel: $dateLabel, bankName: $bankName)';
}


}

/// @nodoc
abstract mixin class $PayoutDtoCopyWith<$Res>  {
  factory $PayoutDtoCopyWith(PayoutDto value, $Res Function(PayoutDto) _then) = _$PayoutDtoCopyWithImpl;
@useResult
$Res call({
 String id, String reference, int amount, String status,@JsonKey(name: 'date_label') String? dateLabel,@JsonKey(name: 'bank_name') String? bankName
});




}
/// @nodoc
class _$PayoutDtoCopyWithImpl<$Res>
    implements $PayoutDtoCopyWith<$Res> {
  _$PayoutDtoCopyWithImpl(this._self, this._then);

  final PayoutDto _self;
  final $Res Function(PayoutDto) _then;

/// Create a copy of PayoutDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? reference = null,Object? amount = null,Object? status = null,Object? dateLabel = freezed,Object? bankName = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,reference: null == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,dateLabel: freezed == dateLabel ? _self.dateLabel : dateLabel // ignore: cast_nullable_to_non_nullable
as String?,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PayoutDto].
extension PayoutDtoPatterns on PayoutDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PayoutDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PayoutDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PayoutDto value)  $default,){
final _that = this;
switch (_that) {
case _PayoutDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PayoutDto value)?  $default,){
final _that = this;
switch (_that) {
case _PayoutDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String reference,  int amount,  String status, @JsonKey(name: 'date_label')  String? dateLabel, @JsonKey(name: 'bank_name')  String? bankName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PayoutDto() when $default != null:
return $default(_that.id,_that.reference,_that.amount,_that.status,_that.dateLabel,_that.bankName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String reference,  int amount,  String status, @JsonKey(name: 'date_label')  String? dateLabel, @JsonKey(name: 'bank_name')  String? bankName)  $default,) {final _that = this;
switch (_that) {
case _PayoutDto():
return $default(_that.id,_that.reference,_that.amount,_that.status,_that.dateLabel,_that.bankName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String reference,  int amount,  String status, @JsonKey(name: 'date_label')  String? dateLabel, @JsonKey(name: 'bank_name')  String? bankName)?  $default,) {final _that = this;
switch (_that) {
case _PayoutDto() when $default != null:
return $default(_that.id,_that.reference,_that.amount,_that.status,_that.dateLabel,_that.bankName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PayoutDto implements PayoutDto {
  const _PayoutDto({required this.id, required this.reference, required this.amount, required this.status, @JsonKey(name: 'date_label') this.dateLabel, @JsonKey(name: 'bank_name') this.bankName});
  factory _PayoutDto.fromJson(Map<String, dynamic> json) => _$PayoutDtoFromJson(json);

@override final  String id;
@override final  String reference;
@override final  int amount;
// kobo
@override final  String status;
// success | pending | failed
@override@JsonKey(name: 'date_label') final  String? dateLabel;
@override@JsonKey(name: 'bank_name') final  String? bankName;

/// Create a copy of PayoutDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PayoutDtoCopyWith<_PayoutDto> get copyWith => __$PayoutDtoCopyWithImpl<_PayoutDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PayoutDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PayoutDto&&(identical(other.id, id) || other.id == id)&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.status, status) || other.status == status)&&(identical(other.dateLabel, dateLabel) || other.dateLabel == dateLabel)&&(identical(other.bankName, bankName) || other.bankName == bankName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,reference,amount,status,dateLabel,bankName);

@override
String toString() {
  return 'PayoutDto(id: $id, reference: $reference, amount: $amount, status: $status, dateLabel: $dateLabel, bankName: $bankName)';
}


}

/// @nodoc
abstract mixin class _$PayoutDtoCopyWith<$Res> implements $PayoutDtoCopyWith<$Res> {
  factory _$PayoutDtoCopyWith(_PayoutDto value, $Res Function(_PayoutDto) _then) = __$PayoutDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String reference, int amount, String status,@JsonKey(name: 'date_label') String? dateLabel,@JsonKey(name: 'bank_name') String? bankName
});




}
/// @nodoc
class __$PayoutDtoCopyWithImpl<$Res>
    implements _$PayoutDtoCopyWith<$Res> {
  __$PayoutDtoCopyWithImpl(this._self, this._then);

  final _PayoutDto _self;
  final $Res Function(_PayoutDto) _then;

/// Create a copy of PayoutDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? reference = null,Object? amount = null,Object? status = null,Object? dateLabel = freezed,Object? bankName = freezed,}) {
  return _then(_PayoutDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,reference: null == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,dateLabel: freezed == dateLabel ? _self.dateLabel : dateLabel // ignore: cast_nullable_to_non_nullable
as String?,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PayoutCollectionDto {

 String get id; String get name;@JsonKey(name: 'bank_name') String get bankName; int get amount;// kobo
 double get percent;@JsonKey(name: 'progress_label') String? get progressLabel;
/// Create a copy of PayoutCollectionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PayoutCollectionDtoCopyWith<PayoutCollectionDto> get copyWith => _$PayoutCollectionDtoCopyWithImpl<PayoutCollectionDto>(this as PayoutCollectionDto, _$identity);

  /// Serializes this PayoutCollectionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PayoutCollectionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.percent, percent) || other.percent == percent)&&(identical(other.progressLabel, progressLabel) || other.progressLabel == progressLabel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,bankName,amount,percent,progressLabel);

@override
String toString() {
  return 'PayoutCollectionDto(id: $id, name: $name, bankName: $bankName, amount: $amount, percent: $percent, progressLabel: $progressLabel)';
}


}

/// @nodoc
abstract mixin class $PayoutCollectionDtoCopyWith<$Res>  {
  factory $PayoutCollectionDtoCopyWith(PayoutCollectionDto value, $Res Function(PayoutCollectionDto) _then) = _$PayoutCollectionDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name,@JsonKey(name: 'bank_name') String bankName, int amount, double percent,@JsonKey(name: 'progress_label') String? progressLabel
});




}
/// @nodoc
class _$PayoutCollectionDtoCopyWithImpl<$Res>
    implements $PayoutCollectionDtoCopyWith<$Res> {
  _$PayoutCollectionDtoCopyWithImpl(this._self, this._then);

  final PayoutCollectionDto _self;
  final $Res Function(PayoutCollectionDto) _then;

/// Create a copy of PayoutCollectionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? bankName = null,Object? amount = null,Object? percent = null,Object? progressLabel = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,bankName: null == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,percent: null == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as double,progressLabel: freezed == progressLabel ? _self.progressLabel : progressLabel // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PayoutCollectionDto].
extension PayoutCollectionDtoPatterns on PayoutCollectionDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PayoutCollectionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PayoutCollectionDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PayoutCollectionDto value)  $default,){
final _that = this;
switch (_that) {
case _PayoutCollectionDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PayoutCollectionDto value)?  $default,){
final _that = this;
switch (_that) {
case _PayoutCollectionDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'bank_name')  String bankName,  int amount,  double percent, @JsonKey(name: 'progress_label')  String? progressLabel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PayoutCollectionDto() when $default != null:
return $default(_that.id,_that.name,_that.bankName,_that.amount,_that.percent,_that.progressLabel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'bank_name')  String bankName,  int amount,  double percent, @JsonKey(name: 'progress_label')  String? progressLabel)  $default,) {final _that = this;
switch (_that) {
case _PayoutCollectionDto():
return $default(_that.id,_that.name,_that.bankName,_that.amount,_that.percent,_that.progressLabel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @JsonKey(name: 'bank_name')  String bankName,  int amount,  double percent, @JsonKey(name: 'progress_label')  String? progressLabel)?  $default,) {final _that = this;
switch (_that) {
case _PayoutCollectionDto() when $default != null:
return $default(_that.id,_that.name,_that.bankName,_that.amount,_that.percent,_that.progressLabel);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PayoutCollectionDto implements PayoutCollectionDto {
  const _PayoutCollectionDto({required this.id, required this.name, @JsonKey(name: 'bank_name') required this.bankName, required this.amount, required this.percent, @JsonKey(name: 'progress_label') this.progressLabel});
  factory _PayoutCollectionDto.fromJson(Map<String, dynamic> json) => _$PayoutCollectionDtoFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey(name: 'bank_name') final  String bankName;
@override final  int amount;
// kobo
@override final  double percent;
@override@JsonKey(name: 'progress_label') final  String? progressLabel;

/// Create a copy of PayoutCollectionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PayoutCollectionDtoCopyWith<_PayoutCollectionDto> get copyWith => __$PayoutCollectionDtoCopyWithImpl<_PayoutCollectionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PayoutCollectionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PayoutCollectionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.percent, percent) || other.percent == percent)&&(identical(other.progressLabel, progressLabel) || other.progressLabel == progressLabel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,bankName,amount,percent,progressLabel);

@override
String toString() {
  return 'PayoutCollectionDto(id: $id, name: $name, bankName: $bankName, amount: $amount, percent: $percent, progressLabel: $progressLabel)';
}


}

/// @nodoc
abstract mixin class _$PayoutCollectionDtoCopyWith<$Res> implements $PayoutCollectionDtoCopyWith<$Res> {
  factory _$PayoutCollectionDtoCopyWith(_PayoutCollectionDto value, $Res Function(_PayoutCollectionDto) _then) = __$PayoutCollectionDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@JsonKey(name: 'bank_name') String bankName, int amount, double percent,@JsonKey(name: 'progress_label') String? progressLabel
});




}
/// @nodoc
class __$PayoutCollectionDtoCopyWithImpl<$Res>
    implements _$PayoutCollectionDtoCopyWith<$Res> {
  __$PayoutCollectionDtoCopyWithImpl(this._self, this._then);

  final _PayoutCollectionDto _self;
  final $Res Function(_PayoutCollectionDto) _then;

/// Create a copy of PayoutCollectionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? bankName = null,Object? amount = null,Object? percent = null,Object? progressLabel = freezed,}) {
  return _then(_PayoutCollectionDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,bankName: null == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,percent: null == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as double,progressLabel: freezed == progressLabel ? _self.progressLabel : progressLabel // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$BankAccountDto {

 String get id; String get label; String get subtitle;@JsonKey(name: 'bank_name') String get bankName;@JsonKey(name: 'masked_nuban') String get maskedNuban;
/// Create a copy of BankAccountDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BankAccountDtoCopyWith<BankAccountDto> get copyWith => _$BankAccountDtoCopyWithImpl<BankAccountDto>(this as BankAccountDto, _$identity);

  /// Serializes this BankAccountDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BankAccountDto&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.maskedNuban, maskedNuban) || other.maskedNuban == maskedNuban));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,subtitle,bankName,maskedNuban);

@override
String toString() {
  return 'BankAccountDto(id: $id, label: $label, subtitle: $subtitle, bankName: $bankName, maskedNuban: $maskedNuban)';
}


}

/// @nodoc
abstract mixin class $BankAccountDtoCopyWith<$Res>  {
  factory $BankAccountDtoCopyWith(BankAccountDto value, $Res Function(BankAccountDto) _then) = _$BankAccountDtoCopyWithImpl;
@useResult
$Res call({
 String id, String label, String subtitle,@JsonKey(name: 'bank_name') String bankName,@JsonKey(name: 'masked_nuban') String maskedNuban
});




}
/// @nodoc
class _$BankAccountDtoCopyWithImpl<$Res>
    implements $BankAccountDtoCopyWith<$Res> {
  _$BankAccountDtoCopyWithImpl(this._self, this._then);

  final BankAccountDto _self;
  final $Res Function(BankAccountDto) _then;

/// Create a copy of BankAccountDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,Object? subtitle = null,Object? bankName = null,Object? maskedNuban = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,bankName: null == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String,maskedNuban: null == maskedNuban ? _self.maskedNuban : maskedNuban // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BankAccountDto].
extension BankAccountDtoPatterns on BankAccountDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BankAccountDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BankAccountDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BankAccountDto value)  $default,){
final _that = this;
switch (_that) {
case _BankAccountDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BankAccountDto value)?  $default,){
final _that = this;
switch (_that) {
case _BankAccountDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String label,  String subtitle, @JsonKey(name: 'bank_name')  String bankName, @JsonKey(name: 'masked_nuban')  String maskedNuban)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BankAccountDto() when $default != null:
return $default(_that.id,_that.label,_that.subtitle,_that.bankName,_that.maskedNuban);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String label,  String subtitle, @JsonKey(name: 'bank_name')  String bankName, @JsonKey(name: 'masked_nuban')  String maskedNuban)  $default,) {final _that = this;
switch (_that) {
case _BankAccountDto():
return $default(_that.id,_that.label,_that.subtitle,_that.bankName,_that.maskedNuban);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String label,  String subtitle, @JsonKey(name: 'bank_name')  String bankName, @JsonKey(name: 'masked_nuban')  String maskedNuban)?  $default,) {final _that = this;
switch (_that) {
case _BankAccountDto() when $default != null:
return $default(_that.id,_that.label,_that.subtitle,_that.bankName,_that.maskedNuban);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BankAccountDto implements BankAccountDto {
  const _BankAccountDto({required this.id, required this.label, required this.subtitle, @JsonKey(name: 'bank_name') required this.bankName, @JsonKey(name: 'masked_nuban') required this.maskedNuban});
  factory _BankAccountDto.fromJson(Map<String, dynamic> json) => _$BankAccountDtoFromJson(json);

@override final  String id;
@override final  String label;
@override final  String subtitle;
@override@JsonKey(name: 'bank_name') final  String bankName;
@override@JsonKey(name: 'masked_nuban') final  String maskedNuban;

/// Create a copy of BankAccountDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BankAccountDtoCopyWith<_BankAccountDto> get copyWith => __$BankAccountDtoCopyWithImpl<_BankAccountDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BankAccountDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BankAccountDto&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.maskedNuban, maskedNuban) || other.maskedNuban == maskedNuban));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,subtitle,bankName,maskedNuban);

@override
String toString() {
  return 'BankAccountDto(id: $id, label: $label, subtitle: $subtitle, bankName: $bankName, maskedNuban: $maskedNuban)';
}


}

/// @nodoc
abstract mixin class _$BankAccountDtoCopyWith<$Res> implements $BankAccountDtoCopyWith<$Res> {
  factory _$BankAccountDtoCopyWith(_BankAccountDto value, $Res Function(_BankAccountDto) _then) = __$BankAccountDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String label, String subtitle,@JsonKey(name: 'bank_name') String bankName,@JsonKey(name: 'masked_nuban') String maskedNuban
});




}
/// @nodoc
class __$BankAccountDtoCopyWithImpl<$Res>
    implements _$BankAccountDtoCopyWith<$Res> {
  __$BankAccountDtoCopyWithImpl(this._self, this._then);

  final _BankAccountDto _self;
  final $Res Function(_BankAccountDto) _then;

/// Create a copy of BankAccountDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? subtitle = null,Object? bankName = null,Object? maskedNuban = null,}) {
  return _then(_BankAccountDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,bankName: null == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String,maskedNuban: null == maskedNuban ? _self.maskedNuban : maskedNuban // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PayoutsHubDto {

 List<PayoutDto> get payouts; List<PayoutCollectionDto> get collections;@JsonKey(name: 'bank_accounts') List<BankAccountDto> get bankAccounts;@JsonKey(name: 'total_collected') int get totalCollected;// kobo
@JsonKey(name: 'mascot_tip') String? get mascotTip;
/// Create a copy of PayoutsHubDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PayoutsHubDtoCopyWith<PayoutsHubDto> get copyWith => _$PayoutsHubDtoCopyWithImpl<PayoutsHubDto>(this as PayoutsHubDto, _$identity);

  /// Serializes this PayoutsHubDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PayoutsHubDto&&const DeepCollectionEquality().equals(other.payouts, payouts)&&const DeepCollectionEquality().equals(other.collections, collections)&&const DeepCollectionEquality().equals(other.bankAccounts, bankAccounts)&&(identical(other.totalCollected, totalCollected) || other.totalCollected == totalCollected)&&(identical(other.mascotTip, mascotTip) || other.mascotTip == mascotTip));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(payouts),const DeepCollectionEquality().hash(collections),const DeepCollectionEquality().hash(bankAccounts),totalCollected,mascotTip);

@override
String toString() {
  return 'PayoutsHubDto(payouts: $payouts, collections: $collections, bankAccounts: $bankAccounts, totalCollected: $totalCollected, mascotTip: $mascotTip)';
}


}

/// @nodoc
abstract mixin class $PayoutsHubDtoCopyWith<$Res>  {
  factory $PayoutsHubDtoCopyWith(PayoutsHubDto value, $Res Function(PayoutsHubDto) _then) = _$PayoutsHubDtoCopyWithImpl;
@useResult
$Res call({
 List<PayoutDto> payouts, List<PayoutCollectionDto> collections,@JsonKey(name: 'bank_accounts') List<BankAccountDto> bankAccounts,@JsonKey(name: 'total_collected') int totalCollected,@JsonKey(name: 'mascot_tip') String? mascotTip
});




}
/// @nodoc
class _$PayoutsHubDtoCopyWithImpl<$Res>
    implements $PayoutsHubDtoCopyWith<$Res> {
  _$PayoutsHubDtoCopyWithImpl(this._self, this._then);

  final PayoutsHubDto _self;
  final $Res Function(PayoutsHubDto) _then;

/// Create a copy of PayoutsHubDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? payouts = null,Object? collections = null,Object? bankAccounts = null,Object? totalCollected = null,Object? mascotTip = freezed,}) {
  return _then(_self.copyWith(
payouts: null == payouts ? _self.payouts : payouts // ignore: cast_nullable_to_non_nullable
as List<PayoutDto>,collections: null == collections ? _self.collections : collections // ignore: cast_nullable_to_non_nullable
as List<PayoutCollectionDto>,bankAccounts: null == bankAccounts ? _self.bankAccounts : bankAccounts // ignore: cast_nullable_to_non_nullable
as List<BankAccountDto>,totalCollected: null == totalCollected ? _self.totalCollected : totalCollected // ignore: cast_nullable_to_non_nullable
as int,mascotTip: freezed == mascotTip ? _self.mascotTip : mascotTip // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PayoutsHubDto].
extension PayoutsHubDtoPatterns on PayoutsHubDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PayoutsHubDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PayoutsHubDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PayoutsHubDto value)  $default,){
final _that = this;
switch (_that) {
case _PayoutsHubDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PayoutsHubDto value)?  $default,){
final _that = this;
switch (_that) {
case _PayoutsHubDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PayoutDto> payouts,  List<PayoutCollectionDto> collections, @JsonKey(name: 'bank_accounts')  List<BankAccountDto> bankAccounts, @JsonKey(name: 'total_collected')  int totalCollected, @JsonKey(name: 'mascot_tip')  String? mascotTip)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PayoutsHubDto() when $default != null:
return $default(_that.payouts,_that.collections,_that.bankAccounts,_that.totalCollected,_that.mascotTip);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PayoutDto> payouts,  List<PayoutCollectionDto> collections, @JsonKey(name: 'bank_accounts')  List<BankAccountDto> bankAccounts, @JsonKey(name: 'total_collected')  int totalCollected, @JsonKey(name: 'mascot_tip')  String? mascotTip)  $default,) {final _that = this;
switch (_that) {
case _PayoutsHubDto():
return $default(_that.payouts,_that.collections,_that.bankAccounts,_that.totalCollected,_that.mascotTip);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PayoutDto> payouts,  List<PayoutCollectionDto> collections, @JsonKey(name: 'bank_accounts')  List<BankAccountDto> bankAccounts, @JsonKey(name: 'total_collected')  int totalCollected, @JsonKey(name: 'mascot_tip')  String? mascotTip)?  $default,) {final _that = this;
switch (_that) {
case _PayoutsHubDto() when $default != null:
return $default(_that.payouts,_that.collections,_that.bankAccounts,_that.totalCollected,_that.mascotTip);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PayoutsHubDto implements PayoutsHubDto {
  const _PayoutsHubDto({final  List<PayoutDto> payouts = const <PayoutDto>[], final  List<PayoutCollectionDto> collections = const <PayoutCollectionDto>[], @JsonKey(name: 'bank_accounts') final  List<BankAccountDto> bankAccounts = const <BankAccountDto>[], @JsonKey(name: 'total_collected') required this.totalCollected, @JsonKey(name: 'mascot_tip') this.mascotTip}): _payouts = payouts,_collections = collections,_bankAccounts = bankAccounts;
  factory _PayoutsHubDto.fromJson(Map<String, dynamic> json) => _$PayoutsHubDtoFromJson(json);

 final  List<PayoutDto> _payouts;
@override@JsonKey() List<PayoutDto> get payouts {
  if (_payouts is EqualUnmodifiableListView) return _payouts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_payouts);
}

 final  List<PayoutCollectionDto> _collections;
@override@JsonKey() List<PayoutCollectionDto> get collections {
  if (_collections is EqualUnmodifiableListView) return _collections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_collections);
}

 final  List<BankAccountDto> _bankAccounts;
@override@JsonKey(name: 'bank_accounts') List<BankAccountDto> get bankAccounts {
  if (_bankAccounts is EqualUnmodifiableListView) return _bankAccounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bankAccounts);
}

@override@JsonKey(name: 'total_collected') final  int totalCollected;
// kobo
@override@JsonKey(name: 'mascot_tip') final  String? mascotTip;

/// Create a copy of PayoutsHubDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PayoutsHubDtoCopyWith<_PayoutsHubDto> get copyWith => __$PayoutsHubDtoCopyWithImpl<_PayoutsHubDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PayoutsHubDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PayoutsHubDto&&const DeepCollectionEquality().equals(other._payouts, _payouts)&&const DeepCollectionEquality().equals(other._collections, _collections)&&const DeepCollectionEquality().equals(other._bankAccounts, _bankAccounts)&&(identical(other.totalCollected, totalCollected) || other.totalCollected == totalCollected)&&(identical(other.mascotTip, mascotTip) || other.mascotTip == mascotTip));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payouts),const DeepCollectionEquality().hash(_collections),const DeepCollectionEquality().hash(_bankAccounts),totalCollected,mascotTip);

@override
String toString() {
  return 'PayoutsHubDto(payouts: $payouts, collections: $collections, bankAccounts: $bankAccounts, totalCollected: $totalCollected, mascotTip: $mascotTip)';
}


}

/// @nodoc
abstract mixin class _$PayoutsHubDtoCopyWith<$Res> implements $PayoutsHubDtoCopyWith<$Res> {
  factory _$PayoutsHubDtoCopyWith(_PayoutsHubDto value, $Res Function(_PayoutsHubDto) _then) = __$PayoutsHubDtoCopyWithImpl;
@override @useResult
$Res call({
 List<PayoutDto> payouts, List<PayoutCollectionDto> collections,@JsonKey(name: 'bank_accounts') List<BankAccountDto> bankAccounts,@JsonKey(name: 'total_collected') int totalCollected,@JsonKey(name: 'mascot_tip') String? mascotTip
});




}
/// @nodoc
class __$PayoutsHubDtoCopyWithImpl<$Res>
    implements _$PayoutsHubDtoCopyWith<$Res> {
  __$PayoutsHubDtoCopyWithImpl(this._self, this._then);

  final _PayoutsHubDto _self;
  final $Res Function(_PayoutsHubDto) _then;

/// Create a copy of PayoutsHubDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? payouts = null,Object? collections = null,Object? bankAccounts = null,Object? totalCollected = null,Object? mascotTip = freezed,}) {
  return _then(_PayoutsHubDto(
payouts: null == payouts ? _self._payouts : payouts // ignore: cast_nullable_to_non_nullable
as List<PayoutDto>,collections: null == collections ? _self._collections : collections // ignore: cast_nullable_to_non_nullable
as List<PayoutCollectionDto>,bankAccounts: null == bankAccounts ? _self._bankAccounts : bankAccounts // ignore: cast_nullable_to_non_nullable
as List<BankAccountDto>,totalCollected: null == totalCollected ? _self.totalCollected : totalCollected // ignore: cast_nullable_to_non_nullable
as int,mascotTip: freezed == mascotTip ? _self.mascotTip : mascotTip // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
