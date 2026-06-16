// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_chat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GroupChatState {

 StateStatus get status; List<ChatMessageView> get messages;
/// Create a copy of GroupChatState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroupChatStateCopyWith<GroupChatState> get copyWith => _$GroupChatStateCopyWithImpl<GroupChatState>(this as GroupChatState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroupChatState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.messages, messages));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(messages));

@override
String toString() {
  return 'GroupChatState(status: $status, messages: $messages)';
}


}

/// @nodoc
abstract mixin class $GroupChatStateCopyWith<$Res>  {
  factory $GroupChatStateCopyWith(GroupChatState value, $Res Function(GroupChatState) _then) = _$GroupChatStateCopyWithImpl;
@useResult
$Res call({
 StateStatus status, List<ChatMessageView> messages
});




}
/// @nodoc
class _$GroupChatStateCopyWithImpl<$Res>
    implements $GroupChatStateCopyWith<$Res> {
  _$GroupChatStateCopyWithImpl(this._self, this._then);

  final GroupChatState _self;
  final $Res Function(GroupChatState) _then;

/// Create a copy of GroupChatState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? messages = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessageView>,
  ));
}

}


/// Adds pattern-matching-related methods to [GroupChatState].
extension GroupChatStatePatterns on GroupChatState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GroupChatState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GroupChatState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GroupChatState value)  $default,){
final _that = this;
switch (_that) {
case _GroupChatState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GroupChatState value)?  $default,){
final _that = this;
switch (_that) {
case _GroupChatState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StateStatus status,  List<ChatMessageView> messages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GroupChatState() when $default != null:
return $default(_that.status,_that.messages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StateStatus status,  List<ChatMessageView> messages)  $default,) {final _that = this;
switch (_that) {
case _GroupChatState():
return $default(_that.status,_that.messages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StateStatus status,  List<ChatMessageView> messages)?  $default,) {final _that = this;
switch (_that) {
case _GroupChatState() when $default != null:
return $default(_that.status,_that.messages);case _:
  return null;

}
}

}

/// @nodoc


class _GroupChatState implements GroupChatState {
  const _GroupChatState({this.status = StateStatus.initial, final  List<ChatMessageView> messages = const <ChatMessageView>[]}): _messages = messages;
  

@override@JsonKey() final  StateStatus status;
 final  List<ChatMessageView> _messages;
@override@JsonKey() List<ChatMessageView> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}


/// Create a copy of GroupChatState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GroupChatStateCopyWith<_GroupChatState> get copyWith => __$GroupChatStateCopyWithImpl<_GroupChatState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GroupChatState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._messages, _messages));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_messages));

@override
String toString() {
  return 'GroupChatState(status: $status, messages: $messages)';
}


}

/// @nodoc
abstract mixin class _$GroupChatStateCopyWith<$Res> implements $GroupChatStateCopyWith<$Res> {
  factory _$GroupChatStateCopyWith(_GroupChatState value, $Res Function(_GroupChatState) _then) = __$GroupChatStateCopyWithImpl;
@override @useResult
$Res call({
 StateStatus status, List<ChatMessageView> messages
});




}
/// @nodoc
class __$GroupChatStateCopyWithImpl<$Res>
    implements _$GroupChatStateCopyWith<$Res> {
  __$GroupChatStateCopyWithImpl(this._self, this._then);

  final _GroupChatState _self;
  final $Res Function(_GroupChatState) _then;

/// Create a copy of GroupChatState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? messages = null,}) {
  return _then(_GroupChatState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessageView>,
  ));
}


}

// dart format on
