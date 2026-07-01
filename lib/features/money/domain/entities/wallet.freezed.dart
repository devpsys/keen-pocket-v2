// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WalletTransaction {

 String get id; String get label; Money get amount; bool get isCredit; WalletTxnKind get kind; String get timeAgo; Money? get balanceAfter; String? get source; WalletTxnStatus? get status;
/// Create a copy of WalletTransaction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalletTransactionCopyWith<WalletTransaction> get copyWith => _$WalletTransactionCopyWithImpl<WalletTransaction>(this as WalletTransaction, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletTransaction&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.isCredit, isCredit) || other.isCredit == isCredit)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.timeAgo, timeAgo) || other.timeAgo == timeAgo)&&(identical(other.balanceAfter, balanceAfter) || other.balanceAfter == balanceAfter)&&(identical(other.source, source) || other.source == source)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,id,label,amount,isCredit,kind,timeAgo,balanceAfter,source,status);

@override
String toString() {
  return 'WalletTransaction(id: $id, label: $label, amount: $amount, isCredit: $isCredit, kind: $kind, timeAgo: $timeAgo, balanceAfter: $balanceAfter, source: $source, status: $status)';
}


}

/// @nodoc
abstract mixin class $WalletTransactionCopyWith<$Res>  {
  factory $WalletTransactionCopyWith(WalletTransaction value, $Res Function(WalletTransaction) _then) = _$WalletTransactionCopyWithImpl;
@useResult
$Res call({
 String id, String label, Money amount, bool isCredit, WalletTxnKind kind, String timeAgo, Money? balanceAfter, String? source, WalletTxnStatus? status
});




}
/// @nodoc
class _$WalletTransactionCopyWithImpl<$Res>
    implements $WalletTransactionCopyWith<$Res> {
  _$WalletTransactionCopyWithImpl(this._self, this._then);

  final WalletTransaction _self;
  final $Res Function(WalletTransaction) _then;

/// Create a copy of WalletTransaction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,Object? amount = null,Object? isCredit = null,Object? kind = null,Object? timeAgo = null,Object? balanceAfter = freezed,Object? source = freezed,Object? status = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Money,isCredit: null == isCredit ? _self.isCredit : isCredit // ignore: cast_nullable_to_non_nullable
as bool,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as WalletTxnKind,timeAgo: null == timeAgo ? _self.timeAgo : timeAgo // ignore: cast_nullable_to_non_nullable
as String,balanceAfter: freezed == balanceAfter ? _self.balanceAfter : balanceAfter // ignore: cast_nullable_to_non_nullable
as Money?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as WalletTxnStatus?,
  ));
}

}


/// Adds pattern-matching-related methods to [WalletTransaction].
extension WalletTransactionPatterns on WalletTransaction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WalletTransaction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WalletTransaction() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WalletTransaction value)  $default,){
final _that = this;
switch (_that) {
case _WalletTransaction():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WalletTransaction value)?  $default,){
final _that = this;
switch (_that) {
case _WalletTransaction() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String label,  Money amount,  bool isCredit,  WalletTxnKind kind,  String timeAgo,  Money? balanceAfter,  String? source,  WalletTxnStatus? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WalletTransaction() when $default != null:
return $default(_that.id,_that.label,_that.amount,_that.isCredit,_that.kind,_that.timeAgo,_that.balanceAfter,_that.source,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String label,  Money amount,  bool isCredit,  WalletTxnKind kind,  String timeAgo,  Money? balanceAfter,  String? source,  WalletTxnStatus? status)  $default,) {final _that = this;
switch (_that) {
case _WalletTransaction():
return $default(_that.id,_that.label,_that.amount,_that.isCredit,_that.kind,_that.timeAgo,_that.balanceAfter,_that.source,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String label,  Money amount,  bool isCredit,  WalletTxnKind kind,  String timeAgo,  Money? balanceAfter,  String? source,  WalletTxnStatus? status)?  $default,) {final _that = this;
switch (_that) {
case _WalletTransaction() when $default != null:
return $default(_that.id,_that.label,_that.amount,_that.isCredit,_that.kind,_that.timeAgo,_that.balanceAfter,_that.source,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _WalletTransaction implements WalletTransaction {
  const _WalletTransaction({required this.id, required this.label, required this.amount, required this.isCredit, required this.kind, required this.timeAgo, this.balanceAfter, this.source, this.status});
  

@override final  String id;
@override final  String label;
@override final  Money amount;
@override final  bool isCredit;
@override final  WalletTxnKind kind;
@override final  String timeAgo;
@override final  Money? balanceAfter;
@override final  String? source;
@override final  WalletTxnStatus? status;

/// Create a copy of WalletTransaction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WalletTransactionCopyWith<_WalletTransaction> get copyWith => __$WalletTransactionCopyWithImpl<_WalletTransaction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WalletTransaction&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.isCredit, isCredit) || other.isCredit == isCredit)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.timeAgo, timeAgo) || other.timeAgo == timeAgo)&&(identical(other.balanceAfter, balanceAfter) || other.balanceAfter == balanceAfter)&&(identical(other.source, source) || other.source == source)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,id,label,amount,isCredit,kind,timeAgo,balanceAfter,source,status);

@override
String toString() {
  return 'WalletTransaction(id: $id, label: $label, amount: $amount, isCredit: $isCredit, kind: $kind, timeAgo: $timeAgo, balanceAfter: $balanceAfter, source: $source, status: $status)';
}


}

/// @nodoc
abstract mixin class _$WalletTransactionCopyWith<$Res> implements $WalletTransactionCopyWith<$Res> {
  factory _$WalletTransactionCopyWith(_WalletTransaction value, $Res Function(_WalletTransaction) _then) = __$WalletTransactionCopyWithImpl;
@override @useResult
$Res call({
 String id, String label, Money amount, bool isCredit, WalletTxnKind kind, String timeAgo, Money? balanceAfter, String? source, WalletTxnStatus? status
});




}
/// @nodoc
class __$WalletTransactionCopyWithImpl<$Res>
    implements _$WalletTransactionCopyWith<$Res> {
  __$WalletTransactionCopyWithImpl(this._self, this._then);

  final _WalletTransaction _self;
  final $Res Function(_WalletTransaction) _then;

/// Create a copy of WalletTransaction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? amount = null,Object? isCredit = null,Object? kind = null,Object? timeAgo = null,Object? balanceAfter = freezed,Object? source = freezed,Object? status = freezed,}) {
  return _then(_WalletTransaction(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Money,isCredit: null == isCredit ? _self.isCredit : isCredit // ignore: cast_nullable_to_non_nullable
as bool,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as WalletTxnKind,timeAgo: null == timeAgo ? _self.timeAgo : timeAgo // ignore: cast_nullable_to_non_nullable
as String,balanceAfter: freezed == balanceAfter ? _self.balanceAfter : balanceAfter // ignore: cast_nullable_to_non_nullable
as Money?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as WalletTxnStatus?,
  ));
}


}

/// @nodoc
mixin _$Wallet {

 Money get balance; List<WalletTransaction> get transactions; String? get monthlyDelta; Money? get spendingUsed; Money? get spendingLimit; String? get mascotTip;
/// Create a copy of Wallet
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalletCopyWith<Wallet> get copyWith => _$WalletCopyWithImpl<Wallet>(this as Wallet, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Wallet&&(identical(other.balance, balance) || other.balance == balance)&&const DeepCollectionEquality().equals(other.transactions, transactions)&&(identical(other.monthlyDelta, monthlyDelta) || other.monthlyDelta == monthlyDelta)&&(identical(other.spendingUsed, spendingUsed) || other.spendingUsed == spendingUsed)&&(identical(other.spendingLimit, spendingLimit) || other.spendingLimit == spendingLimit)&&(identical(other.mascotTip, mascotTip) || other.mascotTip == mascotTip));
}


@override
int get hashCode => Object.hash(runtimeType,balance,const DeepCollectionEquality().hash(transactions),monthlyDelta,spendingUsed,spendingLimit,mascotTip);

@override
String toString() {
  return 'Wallet(balance: $balance, transactions: $transactions, monthlyDelta: $monthlyDelta, spendingUsed: $spendingUsed, spendingLimit: $spendingLimit, mascotTip: $mascotTip)';
}


}

/// @nodoc
abstract mixin class $WalletCopyWith<$Res>  {
  factory $WalletCopyWith(Wallet value, $Res Function(Wallet) _then) = _$WalletCopyWithImpl;
@useResult
$Res call({
 Money balance, List<WalletTransaction> transactions, String? monthlyDelta, Money? spendingUsed, Money? spendingLimit, String? mascotTip
});




}
/// @nodoc
class _$WalletCopyWithImpl<$Res>
    implements $WalletCopyWith<$Res> {
  _$WalletCopyWithImpl(this._self, this._then);

  final Wallet _self;
  final $Res Function(Wallet) _then;

/// Create a copy of Wallet
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? balance = null,Object? transactions = null,Object? monthlyDelta = freezed,Object? spendingUsed = freezed,Object? spendingLimit = freezed,Object? mascotTip = freezed,}) {
  return _then(_self.copyWith(
balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as Money,transactions: null == transactions ? _self.transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<WalletTransaction>,monthlyDelta: freezed == monthlyDelta ? _self.monthlyDelta : monthlyDelta // ignore: cast_nullable_to_non_nullable
as String?,spendingUsed: freezed == spendingUsed ? _self.spendingUsed : spendingUsed // ignore: cast_nullable_to_non_nullable
as Money?,spendingLimit: freezed == spendingLimit ? _self.spendingLimit : spendingLimit // ignore: cast_nullable_to_non_nullable
as Money?,mascotTip: freezed == mascotTip ? _self.mascotTip : mascotTip // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Wallet].
extension WalletPatterns on Wallet {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Wallet value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Wallet() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Wallet value)  $default,){
final _that = this;
switch (_that) {
case _Wallet():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Wallet value)?  $default,){
final _that = this;
switch (_that) {
case _Wallet() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Money balance,  List<WalletTransaction> transactions,  String? monthlyDelta,  Money? spendingUsed,  Money? spendingLimit,  String? mascotTip)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Wallet() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Money balance,  List<WalletTransaction> transactions,  String? monthlyDelta,  Money? spendingUsed,  Money? spendingLimit,  String? mascotTip)  $default,) {final _that = this;
switch (_that) {
case _Wallet():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Money balance,  List<WalletTransaction> transactions,  String? monthlyDelta,  Money? spendingUsed,  Money? spendingLimit,  String? mascotTip)?  $default,) {final _that = this;
switch (_that) {
case _Wallet() when $default != null:
return $default(_that.balance,_that.transactions,_that.monthlyDelta,_that.spendingUsed,_that.spendingLimit,_that.mascotTip);case _:
  return null;

}
}

}

/// @nodoc


class _Wallet implements Wallet {
  const _Wallet({required this.balance, required final  List<WalletTransaction> transactions, this.monthlyDelta, this.spendingUsed, this.spendingLimit, this.mascotTip}): _transactions = transactions;
  

@override final  Money balance;
 final  List<WalletTransaction> _transactions;
@override List<WalletTransaction> get transactions {
  if (_transactions is EqualUnmodifiableListView) return _transactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactions);
}

@override final  String? monthlyDelta;
@override final  Money? spendingUsed;
@override final  Money? spendingLimit;
@override final  String? mascotTip;

/// Create a copy of Wallet
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WalletCopyWith<_Wallet> get copyWith => __$WalletCopyWithImpl<_Wallet>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Wallet&&(identical(other.balance, balance) || other.balance == balance)&&const DeepCollectionEquality().equals(other._transactions, _transactions)&&(identical(other.monthlyDelta, monthlyDelta) || other.monthlyDelta == monthlyDelta)&&(identical(other.spendingUsed, spendingUsed) || other.spendingUsed == spendingUsed)&&(identical(other.spendingLimit, spendingLimit) || other.spendingLimit == spendingLimit)&&(identical(other.mascotTip, mascotTip) || other.mascotTip == mascotTip));
}


@override
int get hashCode => Object.hash(runtimeType,balance,const DeepCollectionEquality().hash(_transactions),monthlyDelta,spendingUsed,spendingLimit,mascotTip);

@override
String toString() {
  return 'Wallet(balance: $balance, transactions: $transactions, monthlyDelta: $monthlyDelta, spendingUsed: $spendingUsed, spendingLimit: $spendingLimit, mascotTip: $mascotTip)';
}


}

/// @nodoc
abstract mixin class _$WalletCopyWith<$Res> implements $WalletCopyWith<$Res> {
  factory _$WalletCopyWith(_Wallet value, $Res Function(_Wallet) _then) = __$WalletCopyWithImpl;
@override @useResult
$Res call({
 Money balance, List<WalletTransaction> transactions, String? monthlyDelta, Money? spendingUsed, Money? spendingLimit, String? mascotTip
});




}
/// @nodoc
class __$WalletCopyWithImpl<$Res>
    implements _$WalletCopyWith<$Res> {
  __$WalletCopyWithImpl(this._self, this._then);

  final _Wallet _self;
  final $Res Function(_Wallet) _then;

/// Create a copy of Wallet
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? balance = null,Object? transactions = null,Object? monthlyDelta = freezed,Object? spendingUsed = freezed,Object? spendingLimit = freezed,Object? mascotTip = freezed,}) {
  return _then(_Wallet(
balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as Money,transactions: null == transactions ? _self._transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<WalletTransaction>,monthlyDelta: freezed == monthlyDelta ? _self.monthlyDelta : monthlyDelta // ignore: cast_nullable_to_non_nullable
as String?,spendingUsed: freezed == spendingUsed ? _self.spendingUsed : spendingUsed // ignore: cast_nullable_to_non_nullable
as Money?,spendingLimit: freezed == spendingLimit ? _self.spendingLimit : spendingLimit // ignore: cast_nullable_to_non_nullable
as Money?,mascotTip: freezed == mascotTip ? _self.mascotTip : mascotTip // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
