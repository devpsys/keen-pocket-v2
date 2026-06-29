// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'children_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChildrenState {

 StateStatus get status; List<ChildView> get children;
/// Create a copy of ChildrenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChildrenStateCopyWith<ChildrenState> get copyWith => _$ChildrenStateCopyWithImpl<ChildrenState>(this as ChildrenState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChildrenState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.children, children));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(children));

@override
String toString() {
  return 'ChildrenState(status: $status, children: $children)';
}


}

/// @nodoc
abstract mixin class $ChildrenStateCopyWith<$Res>  {
  factory $ChildrenStateCopyWith(ChildrenState value, $Res Function(ChildrenState) _then) = _$ChildrenStateCopyWithImpl;
@useResult
$Res call({
 StateStatus status, List<ChildView> children
});




}
/// @nodoc
class _$ChildrenStateCopyWithImpl<$Res>
    implements $ChildrenStateCopyWith<$Res> {
  _$ChildrenStateCopyWithImpl(this._self, this._then);

  final ChildrenState _self;
  final $Res Function(ChildrenState) _then;

/// Create a copy of ChildrenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? children = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,children: null == children ? _self.children : children // ignore: cast_nullable_to_non_nullable
as List<ChildView>,
  ));
}

}


/// Adds pattern-matching-related methods to [ChildrenState].
extension ChildrenStatePatterns on ChildrenState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChildrenState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChildrenState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChildrenState value)  $default,){
final _that = this;
switch (_that) {
case _ChildrenState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChildrenState value)?  $default,){
final _that = this;
switch (_that) {
case _ChildrenState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StateStatus status,  List<ChildView> children)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChildrenState() when $default != null:
return $default(_that.status,_that.children);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StateStatus status,  List<ChildView> children)  $default,) {final _that = this;
switch (_that) {
case _ChildrenState():
return $default(_that.status,_that.children);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StateStatus status,  List<ChildView> children)?  $default,) {final _that = this;
switch (_that) {
case _ChildrenState() when $default != null:
return $default(_that.status,_that.children);case _:
  return null;

}
}

}

/// @nodoc


class _ChildrenState implements ChildrenState {
  const _ChildrenState({this.status = StateStatus.initial, final  List<ChildView> children = const <ChildView>[]}): _children = children;
  

@override@JsonKey() final  StateStatus status;
 final  List<ChildView> _children;
@override@JsonKey() List<ChildView> get children {
  if (_children is EqualUnmodifiableListView) return _children;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_children);
}


/// Create a copy of ChildrenState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChildrenStateCopyWith<_ChildrenState> get copyWith => __$ChildrenStateCopyWithImpl<_ChildrenState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChildrenState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._children, _children));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_children));

@override
String toString() {
  return 'ChildrenState(status: $status, children: $children)';
}


}

/// @nodoc
abstract mixin class _$ChildrenStateCopyWith<$Res> implements $ChildrenStateCopyWith<$Res> {
  factory _$ChildrenStateCopyWith(_ChildrenState value, $Res Function(_ChildrenState) _then) = __$ChildrenStateCopyWithImpl;
@override @useResult
$Res call({
 StateStatus status, List<ChildView> children
});




}
/// @nodoc
class __$ChildrenStateCopyWithImpl<$Res>
    implements _$ChildrenStateCopyWith<$Res> {
  __$ChildrenStateCopyWithImpl(this._self, this._then);

  final _ChildrenState _self;
  final $Res Function(_ChildrenState) _then;

/// Create a copy of ChildrenState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? children = null,}) {
  return _then(_ChildrenState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,children: null == children ? _self._children : children // ignore: cast_nullable_to_non_nullable
as List<ChildView>,
  ));
}


}

// dart format on
