// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlanDto {

 String get id; String get name;@JsonKey(name: 'period_label') String get periodLabel; String get cadence;// weekly | monthly
 int get bought; int get pending; int get deferred; int get spent;// kobo
 int get budget;
/// Create a copy of PlanDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanDtoCopyWith<PlanDto> get copyWith => _$PlanDtoCopyWithImpl<PlanDto>(this as PlanDto, _$identity);

  /// Serializes this PlanDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.periodLabel, periodLabel) || other.periodLabel == periodLabel)&&(identical(other.cadence, cadence) || other.cadence == cadence)&&(identical(other.bought, bought) || other.bought == bought)&&(identical(other.pending, pending) || other.pending == pending)&&(identical(other.deferred, deferred) || other.deferred == deferred)&&(identical(other.spent, spent) || other.spent == spent)&&(identical(other.budget, budget) || other.budget == budget));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,periodLabel,cadence,bought,pending,deferred,spent,budget);

@override
String toString() {
  return 'PlanDto(id: $id, name: $name, periodLabel: $periodLabel, cadence: $cadence, bought: $bought, pending: $pending, deferred: $deferred, spent: $spent, budget: $budget)';
}


}

/// @nodoc
abstract mixin class $PlanDtoCopyWith<$Res>  {
  factory $PlanDtoCopyWith(PlanDto value, $Res Function(PlanDto) _then) = _$PlanDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name,@JsonKey(name: 'period_label') String periodLabel, String cadence, int bought, int pending, int deferred, int spent, int budget
});




}
/// @nodoc
class _$PlanDtoCopyWithImpl<$Res>
    implements $PlanDtoCopyWith<$Res> {
  _$PlanDtoCopyWithImpl(this._self, this._then);

  final PlanDto _self;
  final $Res Function(PlanDto) _then;

/// Create a copy of PlanDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? periodLabel = null,Object? cadence = null,Object? bought = null,Object? pending = null,Object? deferred = null,Object? spent = null,Object? budget = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,periodLabel: null == periodLabel ? _self.periodLabel : periodLabel // ignore: cast_nullable_to_non_nullable
as String,cadence: null == cadence ? _self.cadence : cadence // ignore: cast_nullable_to_non_nullable
as String,bought: null == bought ? _self.bought : bought // ignore: cast_nullable_to_non_nullable
as int,pending: null == pending ? _self.pending : pending // ignore: cast_nullable_to_non_nullable
as int,deferred: null == deferred ? _self.deferred : deferred // ignore: cast_nullable_to_non_nullable
as int,spent: null == spent ? _self.spent : spent // ignore: cast_nullable_to_non_nullable
as int,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PlanDto].
extension PlanDtoPatterns on PlanDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlanDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlanDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlanDto value)  $default,){
final _that = this;
switch (_that) {
case _PlanDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlanDto value)?  $default,){
final _that = this;
switch (_that) {
case _PlanDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'period_label')  String periodLabel,  String cadence,  int bought,  int pending,  int deferred,  int spent,  int budget)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlanDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'period_label')  String periodLabel,  String cadence,  int bought,  int pending,  int deferred,  int spent,  int budget)  $default,) {final _that = this;
switch (_that) {
case _PlanDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @JsonKey(name: 'period_label')  String periodLabel,  String cadence,  int bought,  int pending,  int deferred,  int spent,  int budget)?  $default,) {final _that = this;
switch (_that) {
case _PlanDto() when $default != null:
return $default(_that.id,_that.name,_that.periodLabel,_that.cadence,_that.bought,_that.pending,_that.deferred,_that.spent,_that.budget);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlanDto implements PlanDto {
  const _PlanDto({required this.id, required this.name, @JsonKey(name: 'period_label') required this.periodLabel, required this.cadence, required this.bought, required this.pending, required this.deferred, required this.spent, required this.budget});
  factory _PlanDto.fromJson(Map<String, dynamic> json) => _$PlanDtoFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey(name: 'period_label') final  String periodLabel;
@override final  String cadence;
// weekly | monthly
@override final  int bought;
@override final  int pending;
@override final  int deferred;
@override final  int spent;
// kobo
@override final  int budget;

/// Create a copy of PlanDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlanDtoCopyWith<_PlanDto> get copyWith => __$PlanDtoCopyWithImpl<_PlanDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlanDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlanDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.periodLabel, periodLabel) || other.periodLabel == periodLabel)&&(identical(other.cadence, cadence) || other.cadence == cadence)&&(identical(other.bought, bought) || other.bought == bought)&&(identical(other.pending, pending) || other.pending == pending)&&(identical(other.deferred, deferred) || other.deferred == deferred)&&(identical(other.spent, spent) || other.spent == spent)&&(identical(other.budget, budget) || other.budget == budget));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,periodLabel,cadence,bought,pending,deferred,spent,budget);

@override
String toString() {
  return 'PlanDto(id: $id, name: $name, periodLabel: $periodLabel, cadence: $cadence, bought: $bought, pending: $pending, deferred: $deferred, spent: $spent, budget: $budget)';
}


}

/// @nodoc
abstract mixin class _$PlanDtoCopyWith<$Res> implements $PlanDtoCopyWith<$Res> {
  factory _$PlanDtoCopyWith(_PlanDto value, $Res Function(_PlanDto) _then) = __$PlanDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@JsonKey(name: 'period_label') String periodLabel, String cadence, int bought, int pending, int deferred, int spent, int budget
});




}
/// @nodoc
class __$PlanDtoCopyWithImpl<$Res>
    implements _$PlanDtoCopyWith<$Res> {
  __$PlanDtoCopyWithImpl(this._self, this._then);

  final _PlanDto _self;
  final $Res Function(_PlanDto) _then;

/// Create a copy of PlanDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? periodLabel = null,Object? cadence = null,Object? bought = null,Object? pending = null,Object? deferred = null,Object? spent = null,Object? budget = null,}) {
  return _then(_PlanDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,periodLabel: null == periodLabel ? _self.periodLabel : periodLabel // ignore: cast_nullable_to_non_nullable
as String,cadence: null == cadence ? _self.cadence : cadence // ignore: cast_nullable_to_non_nullable
as String,bought: null == bought ? _self.bought : bought // ignore: cast_nullable_to_non_nullable
as int,pending: null == pending ? _self.pending : pending // ignore: cast_nullable_to_non_nullable
as int,deferred: null == deferred ? _self.deferred : deferred // ignore: cast_nullable_to_non_nullable
as int,spent: null == spent ? _self.spent : spent // ignore: cast_nullable_to_non_nullable
as int,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
