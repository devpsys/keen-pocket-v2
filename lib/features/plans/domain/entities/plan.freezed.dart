// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Plan {

 String get id; String get name; String get periodLabel; PlanCadence get cadence; int get bought; int get pending; int get deferred; Money get spent; Money get budget;
/// Create a copy of Plan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanCopyWith<Plan> get copyWith => _$PlanCopyWithImpl<Plan>(this as Plan, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Plan&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.periodLabel, periodLabel) || other.periodLabel == periodLabel)&&(identical(other.cadence, cadence) || other.cadence == cadence)&&(identical(other.bought, bought) || other.bought == bought)&&(identical(other.pending, pending) || other.pending == pending)&&(identical(other.deferred, deferred) || other.deferred == deferred)&&(identical(other.spent, spent) || other.spent == spent)&&(identical(other.budget, budget) || other.budget == budget));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,periodLabel,cadence,bought,pending,deferred,spent,budget);

@override
String toString() {
  return 'Plan(id: $id, name: $name, periodLabel: $periodLabel, cadence: $cadence, bought: $bought, pending: $pending, deferred: $deferred, spent: $spent, budget: $budget)';
}


}

/// @nodoc
abstract mixin class $PlanCopyWith<$Res>  {
  factory $PlanCopyWith(Plan value, $Res Function(Plan) _then) = _$PlanCopyWithImpl;
@useResult
$Res call({
 String id, String name, String periodLabel, PlanCadence cadence, int bought, int pending, int deferred, Money spent, Money budget
});




}
/// @nodoc
class _$PlanCopyWithImpl<$Res>
    implements $PlanCopyWith<$Res> {
  _$PlanCopyWithImpl(this._self, this._then);

  final Plan _self;
  final $Res Function(Plan) _then;

/// Create a copy of Plan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? periodLabel = null,Object? cadence = null,Object? bought = null,Object? pending = null,Object? deferred = null,Object? spent = null,Object? budget = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,periodLabel: null == periodLabel ? _self.periodLabel : periodLabel // ignore: cast_nullable_to_non_nullable
as String,cadence: null == cadence ? _self.cadence : cadence // ignore: cast_nullable_to_non_nullable
as PlanCadence,bought: null == bought ? _self.bought : bought // ignore: cast_nullable_to_non_nullable
as int,pending: null == pending ? _self.pending : pending // ignore: cast_nullable_to_non_nullable
as int,deferred: null == deferred ? _self.deferred : deferred // ignore: cast_nullable_to_non_nullable
as int,spent: null == spent ? _self.spent : spent // ignore: cast_nullable_to_non_nullable
as Money,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}

}


/// Adds pattern-matching-related methods to [Plan].
extension PlanPatterns on Plan {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Plan value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Plan() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Plan value)  $default,){
final _that = this;
switch (_that) {
case _Plan():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Plan value)?  $default,){
final _that = this;
switch (_that) {
case _Plan() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String periodLabel,  PlanCadence cadence,  int bought,  int pending,  int deferred,  Money spent,  Money budget)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Plan() when $default != null:
return $default(_that.id,_that.name,_that.periodLabel,_that.cadence,_that.bought,_that.pending,_that.deferred,_that.spent,_that.budget);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String periodLabel,  PlanCadence cadence,  int bought,  int pending,  int deferred,  Money spent,  Money budget)  $default,) {final _that = this;
switch (_that) {
case _Plan():
return $default(_that.id,_that.name,_that.periodLabel,_that.cadence,_that.bought,_that.pending,_that.deferred,_that.spent,_that.budget);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String periodLabel,  PlanCadence cadence,  int bought,  int pending,  int deferred,  Money spent,  Money budget)?  $default,) {final _that = this;
switch (_that) {
case _Plan() when $default != null:
return $default(_that.id,_that.name,_that.periodLabel,_that.cadence,_that.bought,_that.pending,_that.deferred,_that.spent,_that.budget);case _:
  return null;

}
}

}

/// @nodoc


class _Plan extends Plan {
  const _Plan({required this.id, required this.name, required this.periodLabel, required this.cadence, required this.bought, required this.pending, required this.deferred, required this.spent, required this.budget}): super._();
  

@override final  String id;
@override final  String name;
@override final  String periodLabel;
@override final  PlanCadence cadence;
@override final  int bought;
@override final  int pending;
@override final  int deferred;
@override final  Money spent;
@override final  Money budget;

/// Create a copy of Plan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlanCopyWith<_Plan> get copyWith => __$PlanCopyWithImpl<_Plan>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Plan&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.periodLabel, periodLabel) || other.periodLabel == periodLabel)&&(identical(other.cadence, cadence) || other.cadence == cadence)&&(identical(other.bought, bought) || other.bought == bought)&&(identical(other.pending, pending) || other.pending == pending)&&(identical(other.deferred, deferred) || other.deferred == deferred)&&(identical(other.spent, spent) || other.spent == spent)&&(identical(other.budget, budget) || other.budget == budget));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,periodLabel,cadence,bought,pending,deferred,spent,budget);

@override
String toString() {
  return 'Plan(id: $id, name: $name, periodLabel: $periodLabel, cadence: $cadence, bought: $bought, pending: $pending, deferred: $deferred, spent: $spent, budget: $budget)';
}


}

/// @nodoc
abstract mixin class _$PlanCopyWith<$Res> implements $PlanCopyWith<$Res> {
  factory _$PlanCopyWith(_Plan value, $Res Function(_Plan) _then) = __$PlanCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String periodLabel, PlanCadence cadence, int bought, int pending, int deferred, Money spent, Money budget
});




}
/// @nodoc
class __$PlanCopyWithImpl<$Res>
    implements _$PlanCopyWith<$Res> {
  __$PlanCopyWithImpl(this._self, this._then);

  final _Plan _self;
  final $Res Function(_Plan) _then;

/// Create a copy of Plan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? periodLabel = null,Object? cadence = null,Object? bought = null,Object? pending = null,Object? deferred = null,Object? spent = null,Object? budget = null,}) {
  return _then(_Plan(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,periodLabel: null == periodLabel ? _self.periodLabel : periodLabel // ignore: cast_nullable_to_non_nullable
as String,cadence: null == cadence ? _self.cadence : cadence // ignore: cast_nullable_to_non_nullable
as PlanCadence,bought: null == bought ? _self.bought : bought // ignore: cast_nullable_to_non_nullable
as int,pending: null == pending ? _self.pending : pending // ignore: cast_nullable_to_non_nullable
as int,deferred: null == deferred ? _self.deferred : deferred // ignore: cast_nullable_to_non_nullable
as int,spent: null == spent ? _self.spent : spent // ignore: cast_nullable_to_non_nullable
as Money,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}


}

// dart format on
