// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WalletTransactionDto {

 String get id; String get label; int get amount;// kobo
@JsonKey(name: 'is_credit') bool get isCredit; String get kind;// top_up | payment | refund
@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'balance_after') int? get balanceAfter;// kobo
 String? get source; String? get status;
/// Create a copy of WalletTransactionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalletTransactionDtoCopyWith<WalletTransactionDto> get copyWith => _$WalletTransactionDtoCopyWithImpl<WalletTransactionDto>(this as WalletTransactionDto, _$identity);

  /// Serializes this WalletTransactionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletTransactionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.isCredit, isCredit) || other.isCredit == isCredit)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.balanceAfter, balanceAfter) || other.balanceAfter == balanceAfter)&&(identical(other.source, source) || other.source == source)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,amount,isCredit,kind,createdAt,balanceAfter,source,status);

@override
String toString() {
  return 'WalletTransactionDto(id: $id, label: $label, amount: $amount, isCredit: $isCredit, kind: $kind, createdAt: $createdAt, balanceAfter: $balanceAfter, source: $source, status: $status)';
}


}

/// @nodoc
abstract mixin class $WalletTransactionDtoCopyWith<$Res>  {
  factory $WalletTransactionDtoCopyWith(WalletTransactionDto value, $Res Function(WalletTransactionDto) _then) = _$WalletTransactionDtoCopyWithImpl;
@useResult
$Res call({
 String id, String label, int amount,@JsonKey(name: 'is_credit') bool isCredit, String kind,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'balance_after') int? balanceAfter, String? source, String? status
});




}
/// @nodoc
class _$WalletTransactionDtoCopyWithImpl<$Res>
    implements $WalletTransactionDtoCopyWith<$Res> {
  _$WalletTransactionDtoCopyWithImpl(this._self, this._then);

  final WalletTransactionDto _self;
  final $Res Function(WalletTransactionDto) _then;

/// Create a copy of WalletTransactionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,Object? amount = null,Object? isCredit = null,Object? kind = null,Object? createdAt = null,Object? balanceAfter = freezed,Object? source = freezed,Object? status = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,isCredit: null == isCredit ? _self.isCredit : isCredit // ignore: cast_nullable_to_non_nullable
as bool,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,balanceAfter: freezed == balanceAfter ? _self.balanceAfter : balanceAfter // ignore: cast_nullable_to_non_nullable
as int?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WalletTransactionDto].
extension WalletTransactionDtoPatterns on WalletTransactionDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WalletTransactionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WalletTransactionDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WalletTransactionDto value)  $default,){
final _that = this;
switch (_that) {
case _WalletTransactionDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WalletTransactionDto value)?  $default,){
final _that = this;
switch (_that) {
case _WalletTransactionDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String label,  int amount, @JsonKey(name: 'is_credit')  bool isCredit,  String kind, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'balance_after')  int? balanceAfter,  String? source,  String? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WalletTransactionDto() when $default != null:
return $default(_that.id,_that.label,_that.amount,_that.isCredit,_that.kind,_that.createdAt,_that.balanceAfter,_that.source,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String label,  int amount, @JsonKey(name: 'is_credit')  bool isCredit,  String kind, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'balance_after')  int? balanceAfter,  String? source,  String? status)  $default,) {final _that = this;
switch (_that) {
case _WalletTransactionDto():
return $default(_that.id,_that.label,_that.amount,_that.isCredit,_that.kind,_that.createdAt,_that.balanceAfter,_that.source,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String label,  int amount, @JsonKey(name: 'is_credit')  bool isCredit,  String kind, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'balance_after')  int? balanceAfter,  String? source,  String? status)?  $default,) {final _that = this;
switch (_that) {
case _WalletTransactionDto() when $default != null:
return $default(_that.id,_that.label,_that.amount,_that.isCredit,_that.kind,_that.createdAt,_that.balanceAfter,_that.source,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WalletTransactionDto implements WalletTransactionDto {
  const _WalletTransactionDto({required this.id, required this.label, required this.amount, @JsonKey(name: 'is_credit') required this.isCredit, required this.kind, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'balance_after') this.balanceAfter, this.source, this.status});
  factory _WalletTransactionDto.fromJson(Map<String, dynamic> json) => _$WalletTransactionDtoFromJson(json);

@override final  String id;
@override final  String label;
@override final  int amount;
// kobo
@override@JsonKey(name: 'is_credit') final  bool isCredit;
@override final  String kind;
// top_up | payment | refund
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'balance_after') final  int? balanceAfter;
// kobo
@override final  String? source;
@override final  String? status;

/// Create a copy of WalletTransactionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WalletTransactionDtoCopyWith<_WalletTransactionDto> get copyWith => __$WalletTransactionDtoCopyWithImpl<_WalletTransactionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WalletTransactionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WalletTransactionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.isCredit, isCredit) || other.isCredit == isCredit)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.balanceAfter, balanceAfter) || other.balanceAfter == balanceAfter)&&(identical(other.source, source) || other.source == source)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,amount,isCredit,kind,createdAt,balanceAfter,source,status);

@override
String toString() {
  return 'WalletTransactionDto(id: $id, label: $label, amount: $amount, isCredit: $isCredit, kind: $kind, createdAt: $createdAt, balanceAfter: $balanceAfter, source: $source, status: $status)';
}


}

/// @nodoc
abstract mixin class _$WalletTransactionDtoCopyWith<$Res> implements $WalletTransactionDtoCopyWith<$Res> {
  factory _$WalletTransactionDtoCopyWith(_WalletTransactionDto value, $Res Function(_WalletTransactionDto) _then) = __$WalletTransactionDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String label, int amount,@JsonKey(name: 'is_credit') bool isCredit, String kind,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'balance_after') int? balanceAfter, String? source, String? status
});




}
/// @nodoc
class __$WalletTransactionDtoCopyWithImpl<$Res>
    implements _$WalletTransactionDtoCopyWith<$Res> {
  __$WalletTransactionDtoCopyWithImpl(this._self, this._then);

  final _WalletTransactionDto _self;
  final $Res Function(_WalletTransactionDto) _then;

/// Create a copy of WalletTransactionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? amount = null,Object? isCredit = null,Object? kind = null,Object? createdAt = null,Object? balanceAfter = freezed,Object? source = freezed,Object? status = freezed,}) {
  return _then(_WalletTransactionDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,isCredit: null == isCredit ? _self.isCredit : isCredit // ignore: cast_nullable_to_non_nullable
as bool,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,balanceAfter: freezed == balanceAfter ? _self.balanceAfter : balanceAfter // ignore: cast_nullable_to_non_nullable
as int?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$WalletDto {

 int get balance;// kobo
 List<WalletTransactionDto> get transactions;@JsonKey(name: 'monthly_delta') String? get monthlyDelta;@JsonKey(name: 'spending_used') int? get spendingUsed;// kobo
@JsonKey(name: 'spending_limit') int? get spendingLimit;// kobo
@JsonKey(name: 'mascot_tip') String? get mascotTip;
/// Create a copy of WalletDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalletDtoCopyWith<WalletDto> get copyWith => _$WalletDtoCopyWithImpl<WalletDto>(this as WalletDto, _$identity);

  /// Serializes this WalletDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletDto&&(identical(other.balance, balance) || other.balance == balance)&&const DeepCollectionEquality().equals(other.transactions, transactions)&&(identical(other.monthlyDelta, monthlyDelta) || other.monthlyDelta == monthlyDelta)&&(identical(other.spendingUsed, spendingUsed) || other.spendingUsed == spendingUsed)&&(identical(other.spendingLimit, spendingLimit) || other.spendingLimit == spendingLimit)&&(identical(other.mascotTip, mascotTip) || other.mascotTip == mascotTip));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,balance,const DeepCollectionEquality().hash(transactions),monthlyDelta,spendingUsed,spendingLimit,mascotTip);

@override
String toString() {
  return 'WalletDto(balance: $balance, transactions: $transactions, monthlyDelta: $monthlyDelta, spendingUsed: $spendingUsed, spendingLimit: $spendingLimit, mascotTip: $mascotTip)';
}


}

/// @nodoc
abstract mixin class $WalletDtoCopyWith<$Res>  {
  factory $WalletDtoCopyWith(WalletDto value, $Res Function(WalletDto) _then) = _$WalletDtoCopyWithImpl;
@useResult
$Res call({
 int balance, List<WalletTransactionDto> transactions,@JsonKey(name: 'monthly_delta') String? monthlyDelta,@JsonKey(name: 'spending_used') int? spendingUsed,@JsonKey(name: 'spending_limit') int? spendingLimit,@JsonKey(name: 'mascot_tip') String? mascotTip
});




}
/// @nodoc
class _$WalletDtoCopyWithImpl<$Res>
    implements $WalletDtoCopyWith<$Res> {
  _$WalletDtoCopyWithImpl(this._self, this._then);

  final WalletDto _self;
  final $Res Function(WalletDto) _then;

/// Create a copy of WalletDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? balance = null,Object? transactions = null,Object? monthlyDelta = freezed,Object? spendingUsed = freezed,Object? spendingLimit = freezed,Object? mascotTip = freezed,}) {
  return _then(_self.copyWith(
balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int,transactions: null == transactions ? _self.transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<WalletTransactionDto>,monthlyDelta: freezed == monthlyDelta ? _self.monthlyDelta : monthlyDelta // ignore: cast_nullable_to_non_nullable
as String?,spendingUsed: freezed == spendingUsed ? _self.spendingUsed : spendingUsed // ignore: cast_nullable_to_non_nullable
as int?,spendingLimit: freezed == spendingLimit ? _self.spendingLimit : spendingLimit // ignore: cast_nullable_to_non_nullable
as int?,mascotTip: freezed == mascotTip ? _self.mascotTip : mascotTip // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WalletDto].
extension WalletDtoPatterns on WalletDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WalletDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WalletDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WalletDto value)  $default,){
final _that = this;
switch (_that) {
case _WalletDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WalletDto value)?  $default,){
final _that = this;
switch (_that) {
case _WalletDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int balance,  List<WalletTransactionDto> transactions, @JsonKey(name: 'monthly_delta')  String? monthlyDelta, @JsonKey(name: 'spending_used')  int? spendingUsed, @JsonKey(name: 'spending_limit')  int? spendingLimit, @JsonKey(name: 'mascot_tip')  String? mascotTip)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WalletDto() when $default != null:
return $default(_that.balance,_that.transactions,_that.monthlyDelta,_that.spendingUsed,_that.spendingLimit,_that.mascotTip);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int balance,  List<WalletTransactionDto> transactions, @JsonKey(name: 'monthly_delta')  String? monthlyDelta, @JsonKey(name: 'spending_used')  int? spendingUsed, @JsonKey(name: 'spending_limit')  int? spendingLimit, @JsonKey(name: 'mascot_tip')  String? mascotTip)  $default,) {final _that = this;
switch (_that) {
case _WalletDto():
return $default(_that.balance,_that.transactions,_that.monthlyDelta,_that.spendingUsed,_that.spendingLimit,_that.mascotTip);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int balance,  List<WalletTransactionDto> transactions, @JsonKey(name: 'monthly_delta')  String? monthlyDelta, @JsonKey(name: 'spending_used')  int? spendingUsed, @JsonKey(name: 'spending_limit')  int? spendingLimit, @JsonKey(name: 'mascot_tip')  String? mascotTip)?  $default,) {final _that = this;
switch (_that) {
case _WalletDto() when $default != null:
return $default(_that.balance,_that.transactions,_that.monthlyDelta,_that.spendingUsed,_that.spendingLimit,_that.mascotTip);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WalletDto implements WalletDto {
  const _WalletDto({required this.balance, final  List<WalletTransactionDto> transactions = const <WalletTransactionDto>[], @JsonKey(name: 'monthly_delta') this.monthlyDelta, @JsonKey(name: 'spending_used') this.spendingUsed, @JsonKey(name: 'spending_limit') this.spendingLimit, @JsonKey(name: 'mascot_tip') this.mascotTip}): _transactions = transactions;
  factory _WalletDto.fromJson(Map<String, dynamic> json) => _$WalletDtoFromJson(json);

@override final  int balance;
// kobo
 final  List<WalletTransactionDto> _transactions;
// kobo
@override@JsonKey() List<WalletTransactionDto> get transactions {
  if (_transactions is EqualUnmodifiableListView) return _transactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactions);
}

@override@JsonKey(name: 'monthly_delta') final  String? monthlyDelta;
@override@JsonKey(name: 'spending_used') final  int? spendingUsed;
// kobo
@override@JsonKey(name: 'spending_limit') final  int? spendingLimit;
// kobo
@override@JsonKey(name: 'mascot_tip') final  String? mascotTip;

/// Create a copy of WalletDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WalletDtoCopyWith<_WalletDto> get copyWith => __$WalletDtoCopyWithImpl<_WalletDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WalletDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WalletDto&&(identical(other.balance, balance) || other.balance == balance)&&const DeepCollectionEquality().equals(other._transactions, _transactions)&&(identical(other.monthlyDelta, monthlyDelta) || other.monthlyDelta == monthlyDelta)&&(identical(other.spendingUsed, spendingUsed) || other.spendingUsed == spendingUsed)&&(identical(other.spendingLimit, spendingLimit) || other.spendingLimit == spendingLimit)&&(identical(other.mascotTip, mascotTip) || other.mascotTip == mascotTip));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,balance,const DeepCollectionEquality().hash(_transactions),monthlyDelta,spendingUsed,spendingLimit,mascotTip);

@override
String toString() {
  return 'WalletDto(balance: $balance, transactions: $transactions, monthlyDelta: $monthlyDelta, spendingUsed: $spendingUsed, spendingLimit: $spendingLimit, mascotTip: $mascotTip)';
}


}

/// @nodoc
abstract mixin class _$WalletDtoCopyWith<$Res> implements $WalletDtoCopyWith<$Res> {
  factory _$WalletDtoCopyWith(_WalletDto value, $Res Function(_WalletDto) _then) = __$WalletDtoCopyWithImpl;
@override @useResult
$Res call({
 int balance, List<WalletTransactionDto> transactions,@JsonKey(name: 'monthly_delta') String? monthlyDelta,@JsonKey(name: 'spending_used') int? spendingUsed,@JsonKey(name: 'spending_limit') int? spendingLimit,@JsonKey(name: 'mascot_tip') String? mascotTip
});




}
/// @nodoc
class __$WalletDtoCopyWithImpl<$Res>
    implements _$WalletDtoCopyWith<$Res> {
  __$WalletDtoCopyWithImpl(this._self, this._then);

  final _WalletDto _self;
  final $Res Function(_WalletDto) _then;

/// Create a copy of WalletDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? balance = null,Object? transactions = null,Object? monthlyDelta = freezed,Object? spendingUsed = freezed,Object? spendingLimit = freezed,Object? mascotTip = freezed,}) {
  return _then(_WalletDto(
balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int,transactions: null == transactions ? _self._transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<WalletTransactionDto>,monthlyDelta: freezed == monthlyDelta ? _self.monthlyDelta : monthlyDelta // ignore: cast_nullable_to_non_nullable
as String?,spendingUsed: freezed == spendingUsed ? _self.spendingUsed : spendingUsed // ignore: cast_nullable_to_non_nullable
as int?,spendingLimit: freezed == spendingLimit ? _self.spendingLimit : spendingLimit // ignore: cast_nullable_to_non_nullable
as int?,mascotTip: freezed == mascotTip ? _self.mascotTip : mascotTip // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
