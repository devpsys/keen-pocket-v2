// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payouts_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PayoutsState {

 StateStatus get status; List<BankAccountView> get collections; List<PayoutCollectionView> get tabletCollections; List<PayoutView> get payouts; Money? get totalCollected; String? get mascotTip;
/// Create a copy of PayoutsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PayoutsStateCopyWith<PayoutsState> get copyWith => _$PayoutsStateCopyWithImpl<PayoutsState>(this as PayoutsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PayoutsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.collections, collections)&&const DeepCollectionEquality().equals(other.tabletCollections, tabletCollections)&&const DeepCollectionEquality().equals(other.payouts, payouts)&&(identical(other.totalCollected, totalCollected) || other.totalCollected == totalCollected)&&(identical(other.mascotTip, mascotTip) || other.mascotTip == mascotTip));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(collections),const DeepCollectionEquality().hash(tabletCollections),const DeepCollectionEquality().hash(payouts),totalCollected,mascotTip);

@override
String toString() {
  return 'PayoutsState(status: $status, collections: $collections, tabletCollections: $tabletCollections, payouts: $payouts, totalCollected: $totalCollected, mascotTip: $mascotTip)';
}


}

/// @nodoc
abstract mixin class $PayoutsStateCopyWith<$Res>  {
  factory $PayoutsStateCopyWith(PayoutsState value, $Res Function(PayoutsState) _then) = _$PayoutsStateCopyWithImpl;
@useResult
$Res call({
 StateStatus status, List<BankAccountView> collections, List<PayoutCollectionView> tabletCollections, List<PayoutView> payouts, Money? totalCollected, String? mascotTip
});




}
/// @nodoc
class _$PayoutsStateCopyWithImpl<$Res>
    implements $PayoutsStateCopyWith<$Res> {
  _$PayoutsStateCopyWithImpl(this._self, this._then);

  final PayoutsState _self;
  final $Res Function(PayoutsState) _then;

/// Create a copy of PayoutsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? collections = null,Object? tabletCollections = null,Object? payouts = null,Object? totalCollected = freezed,Object? mascotTip = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,collections: null == collections ? _self.collections : collections // ignore: cast_nullable_to_non_nullable
as List<BankAccountView>,tabletCollections: null == tabletCollections ? _self.tabletCollections : tabletCollections // ignore: cast_nullable_to_non_nullable
as List<PayoutCollectionView>,payouts: null == payouts ? _self.payouts : payouts // ignore: cast_nullable_to_non_nullable
as List<PayoutView>,totalCollected: freezed == totalCollected ? _self.totalCollected : totalCollected // ignore: cast_nullable_to_non_nullable
as Money?,mascotTip: freezed == mascotTip ? _self.mascotTip : mascotTip // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PayoutsState].
extension PayoutsStatePatterns on PayoutsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PayoutsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PayoutsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PayoutsState value)  $default,){
final _that = this;
switch (_that) {
case _PayoutsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PayoutsState value)?  $default,){
final _that = this;
switch (_that) {
case _PayoutsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StateStatus status,  List<BankAccountView> collections,  List<PayoutCollectionView> tabletCollections,  List<PayoutView> payouts,  Money? totalCollected,  String? mascotTip)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PayoutsState() when $default != null:
return $default(_that.status,_that.collections,_that.tabletCollections,_that.payouts,_that.totalCollected,_that.mascotTip);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StateStatus status,  List<BankAccountView> collections,  List<PayoutCollectionView> tabletCollections,  List<PayoutView> payouts,  Money? totalCollected,  String? mascotTip)  $default,) {final _that = this;
switch (_that) {
case _PayoutsState():
return $default(_that.status,_that.collections,_that.tabletCollections,_that.payouts,_that.totalCollected,_that.mascotTip);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StateStatus status,  List<BankAccountView> collections,  List<PayoutCollectionView> tabletCollections,  List<PayoutView> payouts,  Money? totalCollected,  String? mascotTip)?  $default,) {final _that = this;
switch (_that) {
case _PayoutsState() when $default != null:
return $default(_that.status,_that.collections,_that.tabletCollections,_that.payouts,_that.totalCollected,_that.mascotTip);case _:
  return null;

}
}

}

/// @nodoc


class _PayoutsState implements PayoutsState {
  const _PayoutsState({this.status = StateStatus.initial, final  List<BankAccountView> collections = const <BankAccountView>[], final  List<PayoutCollectionView> tabletCollections = const <PayoutCollectionView>[], final  List<PayoutView> payouts = const <PayoutView>[], this.totalCollected, this.mascotTip}): _collections = collections,_tabletCollections = tabletCollections,_payouts = payouts;
  

@override@JsonKey() final  StateStatus status;
 final  List<BankAccountView> _collections;
@override@JsonKey() List<BankAccountView> get collections {
  if (_collections is EqualUnmodifiableListView) return _collections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_collections);
}

 final  List<PayoutCollectionView> _tabletCollections;
@override@JsonKey() List<PayoutCollectionView> get tabletCollections {
  if (_tabletCollections is EqualUnmodifiableListView) return _tabletCollections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tabletCollections);
}

 final  List<PayoutView> _payouts;
@override@JsonKey() List<PayoutView> get payouts {
  if (_payouts is EqualUnmodifiableListView) return _payouts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_payouts);
}

@override final  Money? totalCollected;
@override final  String? mascotTip;

/// Create a copy of PayoutsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PayoutsStateCopyWith<_PayoutsState> get copyWith => __$PayoutsStateCopyWithImpl<_PayoutsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PayoutsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._collections, _collections)&&const DeepCollectionEquality().equals(other._tabletCollections, _tabletCollections)&&const DeepCollectionEquality().equals(other._payouts, _payouts)&&(identical(other.totalCollected, totalCollected) || other.totalCollected == totalCollected)&&(identical(other.mascotTip, mascotTip) || other.mascotTip == mascotTip));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_collections),const DeepCollectionEquality().hash(_tabletCollections),const DeepCollectionEquality().hash(_payouts),totalCollected,mascotTip);

@override
String toString() {
  return 'PayoutsState(status: $status, collections: $collections, tabletCollections: $tabletCollections, payouts: $payouts, totalCollected: $totalCollected, mascotTip: $mascotTip)';
}


}

/// @nodoc
abstract mixin class _$PayoutsStateCopyWith<$Res> implements $PayoutsStateCopyWith<$Res> {
  factory _$PayoutsStateCopyWith(_PayoutsState value, $Res Function(_PayoutsState) _then) = __$PayoutsStateCopyWithImpl;
@override @useResult
$Res call({
 StateStatus status, List<BankAccountView> collections, List<PayoutCollectionView> tabletCollections, List<PayoutView> payouts, Money? totalCollected, String? mascotTip
});




}
/// @nodoc
class __$PayoutsStateCopyWithImpl<$Res>
    implements _$PayoutsStateCopyWith<$Res> {
  __$PayoutsStateCopyWithImpl(this._self, this._then);

  final _PayoutsState _self;
  final $Res Function(_PayoutsState) _then;

/// Create a copy of PayoutsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? collections = null,Object? tabletCollections = null,Object? payouts = null,Object? totalCollected = freezed,Object? mascotTip = freezed,}) {
  return _then(_PayoutsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,collections: null == collections ? _self._collections : collections // ignore: cast_nullable_to_non_nullable
as List<BankAccountView>,tabletCollections: null == tabletCollections ? _self._tabletCollections : tabletCollections // ignore: cast_nullable_to_non_nullable
as List<PayoutCollectionView>,payouts: null == payouts ? _self._payouts : payouts // ignore: cast_nullable_to_non_nullable
as List<PayoutView>,totalCollected: freezed == totalCollected ? _self.totalCollected : totalCollected // ignore: cast_nullable_to_non_nullable
as Money?,mascotTip: freezed == mascotTip ? _self.mascotTip : mascotTip // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
