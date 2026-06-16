// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_history_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InvoiceHistoryState {

 StateStatus get status; List<Invoice> get invoices; Failure? get failure;
/// Create a copy of InvoiceHistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoiceHistoryStateCopyWith<InvoiceHistoryState> get copyWith => _$InvoiceHistoryStateCopyWithImpl<InvoiceHistoryState>(this as InvoiceHistoryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvoiceHistoryState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.invoices, invoices)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(invoices),failure);

@override
String toString() {
  return 'InvoiceHistoryState(status: $status, invoices: $invoices, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $InvoiceHistoryStateCopyWith<$Res>  {
  factory $InvoiceHistoryStateCopyWith(InvoiceHistoryState value, $Res Function(InvoiceHistoryState) _then) = _$InvoiceHistoryStateCopyWithImpl;
@useResult
$Res call({
 StateStatus status, List<Invoice> invoices, Failure? failure
});




}
/// @nodoc
class _$InvoiceHistoryStateCopyWithImpl<$Res>
    implements $InvoiceHistoryStateCopyWith<$Res> {
  _$InvoiceHistoryStateCopyWithImpl(this._self, this._then);

  final InvoiceHistoryState _self;
  final $Res Function(InvoiceHistoryState) _then;

/// Create a copy of InvoiceHistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? invoices = null,Object? failure = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,invoices: null == invoices ? _self.invoices : invoices // ignore: cast_nullable_to_non_nullable
as List<Invoice>,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

}


/// Adds pattern-matching-related methods to [InvoiceHistoryState].
extension InvoiceHistoryStatePatterns on InvoiceHistoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvoiceHistoryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvoiceHistoryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvoiceHistoryState value)  $default,){
final _that = this;
switch (_that) {
case _InvoiceHistoryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvoiceHistoryState value)?  $default,){
final _that = this;
switch (_that) {
case _InvoiceHistoryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StateStatus status,  List<Invoice> invoices,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvoiceHistoryState() when $default != null:
return $default(_that.status,_that.invoices,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StateStatus status,  List<Invoice> invoices,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _InvoiceHistoryState():
return $default(_that.status,_that.invoices,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StateStatus status,  List<Invoice> invoices,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _InvoiceHistoryState() when $default != null:
return $default(_that.status,_that.invoices,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _InvoiceHistoryState implements InvoiceHistoryState {
  const _InvoiceHistoryState({this.status = StateStatus.initial, final  List<Invoice> invoices = const <Invoice>[], this.failure}): _invoices = invoices;
  

@override@JsonKey() final  StateStatus status;
 final  List<Invoice> _invoices;
@override@JsonKey() List<Invoice> get invoices {
  if (_invoices is EqualUnmodifiableListView) return _invoices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_invoices);
}

@override final  Failure? failure;

/// Create a copy of InvoiceHistoryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvoiceHistoryStateCopyWith<_InvoiceHistoryState> get copyWith => __$InvoiceHistoryStateCopyWithImpl<_InvoiceHistoryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvoiceHistoryState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._invoices, _invoices)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_invoices),failure);

@override
String toString() {
  return 'InvoiceHistoryState(status: $status, invoices: $invoices, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$InvoiceHistoryStateCopyWith<$Res> implements $InvoiceHistoryStateCopyWith<$Res> {
  factory _$InvoiceHistoryStateCopyWith(_InvoiceHistoryState value, $Res Function(_InvoiceHistoryState) _then) = __$InvoiceHistoryStateCopyWithImpl;
@override @useResult
$Res call({
 StateStatus status, List<Invoice> invoices, Failure? failure
});




}
/// @nodoc
class __$InvoiceHistoryStateCopyWithImpl<$Res>
    implements _$InvoiceHistoryStateCopyWith<$Res> {
  __$InvoiceHistoryStateCopyWithImpl(this._self, this._then);

  final _InvoiceHistoryState _self;
  final $Res Function(_InvoiceHistoryState) _then;

/// Create a copy of InvoiceHistoryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? invoices = null,Object? failure = freezed,}) {
  return _then(_InvoiceHistoryState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,invoices: null == invoices ? _self._invoices : invoices // ignore: cast_nullable_to_non_nullable
as List<Invoice>,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}


}

// dart format on
