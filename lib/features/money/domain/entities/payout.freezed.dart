// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payout.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Payout {

 String get id; String get reference; Money get amount; PayoutStatus get status; String? get dateLabel; String? get bankName;
/// Create a copy of Payout
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PayoutCopyWith<Payout> get copyWith => _$PayoutCopyWithImpl<Payout>(this as Payout, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Payout&&(identical(other.id, id) || other.id == id)&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.status, status) || other.status == status)&&(identical(other.dateLabel, dateLabel) || other.dateLabel == dateLabel)&&(identical(other.bankName, bankName) || other.bankName == bankName));
}


@override
int get hashCode => Object.hash(runtimeType,id,reference,amount,status,dateLabel,bankName);

@override
String toString() {
  return 'Payout(id: $id, reference: $reference, amount: $amount, status: $status, dateLabel: $dateLabel, bankName: $bankName)';
}


}

/// @nodoc
abstract mixin class $PayoutCopyWith<$Res>  {
  factory $PayoutCopyWith(Payout value, $Res Function(Payout) _then) = _$PayoutCopyWithImpl;
@useResult
$Res call({
 String id, String reference, Money amount, PayoutStatus status, String? dateLabel, String? bankName
});




}
/// @nodoc
class _$PayoutCopyWithImpl<$Res>
    implements $PayoutCopyWith<$Res> {
  _$PayoutCopyWithImpl(this._self, this._then);

  final Payout _self;
  final $Res Function(Payout) _then;

/// Create a copy of Payout
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? reference = null,Object? amount = null,Object? status = null,Object? dateLabel = freezed,Object? bankName = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,reference: null == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Money,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PayoutStatus,dateLabel: freezed == dateLabel ? _self.dateLabel : dateLabel // ignore: cast_nullable_to_non_nullable
as String?,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Payout].
extension PayoutPatterns on Payout {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Payout value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Payout() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Payout value)  $default,){
final _that = this;
switch (_that) {
case _Payout():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Payout value)?  $default,){
final _that = this;
switch (_that) {
case _Payout() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String reference,  Money amount,  PayoutStatus status,  String? dateLabel,  String? bankName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Payout() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String reference,  Money amount,  PayoutStatus status,  String? dateLabel,  String? bankName)  $default,) {final _that = this;
switch (_that) {
case _Payout():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String reference,  Money amount,  PayoutStatus status,  String? dateLabel,  String? bankName)?  $default,) {final _that = this;
switch (_that) {
case _Payout() when $default != null:
return $default(_that.id,_that.reference,_that.amount,_that.status,_that.dateLabel,_that.bankName);case _:
  return null;

}
}

}

/// @nodoc


class _Payout implements Payout {
  const _Payout({required this.id, required this.reference, required this.amount, required this.status, this.dateLabel, this.bankName});
  

@override final  String id;
@override final  String reference;
@override final  Money amount;
@override final  PayoutStatus status;
@override final  String? dateLabel;
@override final  String? bankName;

/// Create a copy of Payout
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PayoutCopyWith<_Payout> get copyWith => __$PayoutCopyWithImpl<_Payout>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Payout&&(identical(other.id, id) || other.id == id)&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.status, status) || other.status == status)&&(identical(other.dateLabel, dateLabel) || other.dateLabel == dateLabel)&&(identical(other.bankName, bankName) || other.bankName == bankName));
}


@override
int get hashCode => Object.hash(runtimeType,id,reference,amount,status,dateLabel,bankName);

@override
String toString() {
  return 'Payout(id: $id, reference: $reference, amount: $amount, status: $status, dateLabel: $dateLabel, bankName: $bankName)';
}


}

/// @nodoc
abstract mixin class _$PayoutCopyWith<$Res> implements $PayoutCopyWith<$Res> {
  factory _$PayoutCopyWith(_Payout value, $Res Function(_Payout) _then) = __$PayoutCopyWithImpl;
@override @useResult
$Res call({
 String id, String reference, Money amount, PayoutStatus status, String? dateLabel, String? bankName
});




}
/// @nodoc
class __$PayoutCopyWithImpl<$Res>
    implements _$PayoutCopyWith<$Res> {
  __$PayoutCopyWithImpl(this._self, this._then);

  final _Payout _self;
  final $Res Function(_Payout) _then;

/// Create a copy of Payout
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? reference = null,Object? amount = null,Object? status = null,Object? dateLabel = freezed,Object? bankName = freezed,}) {
  return _then(_Payout(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,reference: null == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Money,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PayoutStatus,dateLabel: freezed == dateLabel ? _self.dateLabel : dateLabel // ignore: cast_nullable_to_non_nullable
as String?,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$PayoutCollection {

 String get id; String get name; String get bankName; Money get amount; double get percent;// 0..1
 String? get progressLabel;
/// Create a copy of PayoutCollection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PayoutCollectionCopyWith<PayoutCollection> get copyWith => _$PayoutCollectionCopyWithImpl<PayoutCollection>(this as PayoutCollection, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PayoutCollection&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.percent, percent) || other.percent == percent)&&(identical(other.progressLabel, progressLabel) || other.progressLabel == progressLabel));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,bankName,amount,percent,progressLabel);

@override
String toString() {
  return 'PayoutCollection(id: $id, name: $name, bankName: $bankName, amount: $amount, percent: $percent, progressLabel: $progressLabel)';
}


}

/// @nodoc
abstract mixin class $PayoutCollectionCopyWith<$Res>  {
  factory $PayoutCollectionCopyWith(PayoutCollection value, $Res Function(PayoutCollection) _then) = _$PayoutCollectionCopyWithImpl;
@useResult
$Res call({
 String id, String name, String bankName, Money amount, double percent, String? progressLabel
});




}
/// @nodoc
class _$PayoutCollectionCopyWithImpl<$Res>
    implements $PayoutCollectionCopyWith<$Res> {
  _$PayoutCollectionCopyWithImpl(this._self, this._then);

  final PayoutCollection _self;
  final $Res Function(PayoutCollection) _then;

/// Create a copy of PayoutCollection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? bankName = null,Object? amount = null,Object? percent = null,Object? progressLabel = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,bankName: null == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Money,percent: null == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as double,progressLabel: freezed == progressLabel ? _self.progressLabel : progressLabel // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PayoutCollection].
extension PayoutCollectionPatterns on PayoutCollection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PayoutCollection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PayoutCollection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PayoutCollection value)  $default,){
final _that = this;
switch (_that) {
case _PayoutCollection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PayoutCollection value)?  $default,){
final _that = this;
switch (_that) {
case _PayoutCollection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String bankName,  Money amount,  double percent,  String? progressLabel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PayoutCollection() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String bankName,  Money amount,  double percent,  String? progressLabel)  $default,) {final _that = this;
switch (_that) {
case _PayoutCollection():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String bankName,  Money amount,  double percent,  String? progressLabel)?  $default,) {final _that = this;
switch (_that) {
case _PayoutCollection() when $default != null:
return $default(_that.id,_that.name,_that.bankName,_that.amount,_that.percent,_that.progressLabel);case _:
  return null;

}
}

}

/// @nodoc


class _PayoutCollection implements PayoutCollection {
  const _PayoutCollection({required this.id, required this.name, required this.bankName, required this.amount, required this.percent, this.progressLabel});
  

@override final  String id;
@override final  String name;
@override final  String bankName;
@override final  Money amount;
@override final  double percent;
// 0..1
@override final  String? progressLabel;

/// Create a copy of PayoutCollection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PayoutCollectionCopyWith<_PayoutCollection> get copyWith => __$PayoutCollectionCopyWithImpl<_PayoutCollection>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PayoutCollection&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.percent, percent) || other.percent == percent)&&(identical(other.progressLabel, progressLabel) || other.progressLabel == progressLabel));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,bankName,amount,percent,progressLabel);

@override
String toString() {
  return 'PayoutCollection(id: $id, name: $name, bankName: $bankName, amount: $amount, percent: $percent, progressLabel: $progressLabel)';
}


}

/// @nodoc
abstract mixin class _$PayoutCollectionCopyWith<$Res> implements $PayoutCollectionCopyWith<$Res> {
  factory _$PayoutCollectionCopyWith(_PayoutCollection value, $Res Function(_PayoutCollection) _then) = __$PayoutCollectionCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String bankName, Money amount, double percent, String? progressLabel
});




}
/// @nodoc
class __$PayoutCollectionCopyWithImpl<$Res>
    implements _$PayoutCollectionCopyWith<$Res> {
  __$PayoutCollectionCopyWithImpl(this._self, this._then);

  final _PayoutCollection _self;
  final $Res Function(_PayoutCollection) _then;

/// Create a copy of PayoutCollection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? bankName = null,Object? amount = null,Object? percent = null,Object? progressLabel = freezed,}) {
  return _then(_PayoutCollection(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,bankName: null == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Money,percent: null == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as double,progressLabel: freezed == progressLabel ? _self.progressLabel : progressLabel // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$BankAccount {

 String get id; String get label; String get subtitle; String get bankName; String get maskedNuban;
/// Create a copy of BankAccount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BankAccountCopyWith<BankAccount> get copyWith => _$BankAccountCopyWithImpl<BankAccount>(this as BankAccount, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BankAccount&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.maskedNuban, maskedNuban) || other.maskedNuban == maskedNuban));
}


@override
int get hashCode => Object.hash(runtimeType,id,label,subtitle,bankName,maskedNuban);

@override
String toString() {
  return 'BankAccount(id: $id, label: $label, subtitle: $subtitle, bankName: $bankName, maskedNuban: $maskedNuban)';
}


}

/// @nodoc
abstract mixin class $BankAccountCopyWith<$Res>  {
  factory $BankAccountCopyWith(BankAccount value, $Res Function(BankAccount) _then) = _$BankAccountCopyWithImpl;
@useResult
$Res call({
 String id, String label, String subtitle, String bankName, String maskedNuban
});




}
/// @nodoc
class _$BankAccountCopyWithImpl<$Res>
    implements $BankAccountCopyWith<$Res> {
  _$BankAccountCopyWithImpl(this._self, this._then);

  final BankAccount _self;
  final $Res Function(BankAccount) _then;

/// Create a copy of BankAccount
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


/// Adds pattern-matching-related methods to [BankAccount].
extension BankAccountPatterns on BankAccount {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BankAccount value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BankAccount() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BankAccount value)  $default,){
final _that = this;
switch (_that) {
case _BankAccount():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BankAccount value)?  $default,){
final _that = this;
switch (_that) {
case _BankAccount() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String label,  String subtitle,  String bankName,  String maskedNuban)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BankAccount() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String label,  String subtitle,  String bankName,  String maskedNuban)  $default,) {final _that = this;
switch (_that) {
case _BankAccount():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String label,  String subtitle,  String bankName,  String maskedNuban)?  $default,) {final _that = this;
switch (_that) {
case _BankAccount() when $default != null:
return $default(_that.id,_that.label,_that.subtitle,_that.bankName,_that.maskedNuban);case _:
  return null;

}
}

}

/// @nodoc


class _BankAccount implements BankAccount {
  const _BankAccount({required this.id, required this.label, required this.subtitle, required this.bankName, required this.maskedNuban});
  

@override final  String id;
@override final  String label;
@override final  String subtitle;
@override final  String bankName;
@override final  String maskedNuban;

/// Create a copy of BankAccount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BankAccountCopyWith<_BankAccount> get copyWith => __$BankAccountCopyWithImpl<_BankAccount>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BankAccount&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.maskedNuban, maskedNuban) || other.maskedNuban == maskedNuban));
}


@override
int get hashCode => Object.hash(runtimeType,id,label,subtitle,bankName,maskedNuban);

@override
String toString() {
  return 'BankAccount(id: $id, label: $label, subtitle: $subtitle, bankName: $bankName, maskedNuban: $maskedNuban)';
}


}

/// @nodoc
abstract mixin class _$BankAccountCopyWith<$Res> implements $BankAccountCopyWith<$Res> {
  factory _$BankAccountCopyWith(_BankAccount value, $Res Function(_BankAccount) _then) = __$BankAccountCopyWithImpl;
@override @useResult
$Res call({
 String id, String label, String subtitle, String bankName, String maskedNuban
});




}
/// @nodoc
class __$BankAccountCopyWithImpl<$Res>
    implements _$BankAccountCopyWith<$Res> {
  __$BankAccountCopyWithImpl(this._self, this._then);

  final _BankAccount _self;
  final $Res Function(_BankAccount) _then;

/// Create a copy of BankAccount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? subtitle = null,Object? bankName = null,Object? maskedNuban = null,}) {
  return _then(_BankAccount(
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
mixin _$PayoutsHub {

 List<Payout> get payouts; List<PayoutCollection> get collections; List<BankAccount> get bankAccounts; Money get totalCollected; String? get mascotTip;
/// Create a copy of PayoutsHub
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PayoutsHubCopyWith<PayoutsHub> get copyWith => _$PayoutsHubCopyWithImpl<PayoutsHub>(this as PayoutsHub, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PayoutsHub&&const DeepCollectionEquality().equals(other.payouts, payouts)&&const DeepCollectionEquality().equals(other.collections, collections)&&const DeepCollectionEquality().equals(other.bankAccounts, bankAccounts)&&(identical(other.totalCollected, totalCollected) || other.totalCollected == totalCollected)&&(identical(other.mascotTip, mascotTip) || other.mascotTip == mascotTip));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(payouts),const DeepCollectionEquality().hash(collections),const DeepCollectionEquality().hash(bankAccounts),totalCollected,mascotTip);

@override
String toString() {
  return 'PayoutsHub(payouts: $payouts, collections: $collections, bankAccounts: $bankAccounts, totalCollected: $totalCollected, mascotTip: $mascotTip)';
}


}

/// @nodoc
abstract mixin class $PayoutsHubCopyWith<$Res>  {
  factory $PayoutsHubCopyWith(PayoutsHub value, $Res Function(PayoutsHub) _then) = _$PayoutsHubCopyWithImpl;
@useResult
$Res call({
 List<Payout> payouts, List<PayoutCollection> collections, List<BankAccount> bankAccounts, Money totalCollected, String? mascotTip
});




}
/// @nodoc
class _$PayoutsHubCopyWithImpl<$Res>
    implements $PayoutsHubCopyWith<$Res> {
  _$PayoutsHubCopyWithImpl(this._self, this._then);

  final PayoutsHub _self;
  final $Res Function(PayoutsHub) _then;

/// Create a copy of PayoutsHub
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? payouts = null,Object? collections = null,Object? bankAccounts = null,Object? totalCollected = null,Object? mascotTip = freezed,}) {
  return _then(_self.copyWith(
payouts: null == payouts ? _self.payouts : payouts // ignore: cast_nullable_to_non_nullable
as List<Payout>,collections: null == collections ? _self.collections : collections // ignore: cast_nullable_to_non_nullable
as List<PayoutCollection>,bankAccounts: null == bankAccounts ? _self.bankAccounts : bankAccounts // ignore: cast_nullable_to_non_nullable
as List<BankAccount>,totalCollected: null == totalCollected ? _self.totalCollected : totalCollected // ignore: cast_nullable_to_non_nullable
as Money,mascotTip: freezed == mascotTip ? _self.mascotTip : mascotTip // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PayoutsHub].
extension PayoutsHubPatterns on PayoutsHub {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PayoutsHub value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PayoutsHub() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PayoutsHub value)  $default,){
final _that = this;
switch (_that) {
case _PayoutsHub():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PayoutsHub value)?  $default,){
final _that = this;
switch (_that) {
case _PayoutsHub() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Payout> payouts,  List<PayoutCollection> collections,  List<BankAccount> bankAccounts,  Money totalCollected,  String? mascotTip)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PayoutsHub() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Payout> payouts,  List<PayoutCollection> collections,  List<BankAccount> bankAccounts,  Money totalCollected,  String? mascotTip)  $default,) {final _that = this;
switch (_that) {
case _PayoutsHub():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Payout> payouts,  List<PayoutCollection> collections,  List<BankAccount> bankAccounts,  Money totalCollected,  String? mascotTip)?  $default,) {final _that = this;
switch (_that) {
case _PayoutsHub() when $default != null:
return $default(_that.payouts,_that.collections,_that.bankAccounts,_that.totalCollected,_that.mascotTip);case _:
  return null;

}
}

}

/// @nodoc


class _PayoutsHub implements PayoutsHub {
  const _PayoutsHub({required final  List<Payout> payouts, required final  List<PayoutCollection> collections, required final  List<BankAccount> bankAccounts, required this.totalCollected, this.mascotTip}): _payouts = payouts,_collections = collections,_bankAccounts = bankAccounts;
  

 final  List<Payout> _payouts;
@override List<Payout> get payouts {
  if (_payouts is EqualUnmodifiableListView) return _payouts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_payouts);
}

 final  List<PayoutCollection> _collections;
@override List<PayoutCollection> get collections {
  if (_collections is EqualUnmodifiableListView) return _collections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_collections);
}

 final  List<BankAccount> _bankAccounts;
@override List<BankAccount> get bankAccounts {
  if (_bankAccounts is EqualUnmodifiableListView) return _bankAccounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bankAccounts);
}

@override final  Money totalCollected;
@override final  String? mascotTip;

/// Create a copy of PayoutsHub
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PayoutsHubCopyWith<_PayoutsHub> get copyWith => __$PayoutsHubCopyWithImpl<_PayoutsHub>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PayoutsHub&&const DeepCollectionEquality().equals(other._payouts, _payouts)&&const DeepCollectionEquality().equals(other._collections, _collections)&&const DeepCollectionEquality().equals(other._bankAccounts, _bankAccounts)&&(identical(other.totalCollected, totalCollected) || other.totalCollected == totalCollected)&&(identical(other.mascotTip, mascotTip) || other.mascotTip == mascotTip));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payouts),const DeepCollectionEquality().hash(_collections),const DeepCollectionEquality().hash(_bankAccounts),totalCollected,mascotTip);

@override
String toString() {
  return 'PayoutsHub(payouts: $payouts, collections: $collections, bankAccounts: $bankAccounts, totalCollected: $totalCollected, mascotTip: $mascotTip)';
}


}

/// @nodoc
abstract mixin class _$PayoutsHubCopyWith<$Res> implements $PayoutsHubCopyWith<$Res> {
  factory _$PayoutsHubCopyWith(_PayoutsHub value, $Res Function(_PayoutsHub) _then) = __$PayoutsHubCopyWithImpl;
@override @useResult
$Res call({
 List<Payout> payouts, List<PayoutCollection> collections, List<BankAccount> bankAccounts, Money totalCollected, String? mascotTip
});




}
/// @nodoc
class __$PayoutsHubCopyWithImpl<$Res>
    implements _$PayoutsHubCopyWith<$Res> {
  __$PayoutsHubCopyWithImpl(this._self, this._then);

  final _PayoutsHub _self;
  final $Res Function(_PayoutsHub) _then;

/// Create a copy of PayoutsHub
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? payouts = null,Object? collections = null,Object? bankAccounts = null,Object? totalCollected = null,Object? mascotTip = freezed,}) {
  return _then(_PayoutsHub(
payouts: null == payouts ? _self._payouts : payouts // ignore: cast_nullable_to_non_nullable
as List<Payout>,collections: null == collections ? _self._collections : collections // ignore: cast_nullable_to_non_nullable
as List<PayoutCollection>,bankAccounts: null == bankAccounts ? _self._bankAccounts : bankAccounts // ignore: cast_nullable_to_non_nullable
as List<BankAccount>,totalCollected: null == totalCollected ? _self.totalCollected : totalCollected // ignore: cast_nullable_to_non_nullable
as Money,mascotTip: freezed == mascotTip ? _self.mascotTip : mascotTip // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
