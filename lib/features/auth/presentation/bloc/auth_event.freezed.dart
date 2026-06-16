// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoginRequested value)?  loginRequested,TResult Function( LogoutRequested value)?  logoutRequested,TResult Function( SessionChecked value)?  sessionChecked,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoginRequested() when loginRequested != null:
return loginRequested(_that);case LogoutRequested() when logoutRequested != null:
return logoutRequested(_that);case SessionChecked() when sessionChecked != null:
return sessionChecked(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoginRequested value)  loginRequested,required TResult Function( LogoutRequested value)  logoutRequested,required TResult Function( SessionChecked value)  sessionChecked,}){
final _that = this;
switch (_that) {
case LoginRequested():
return loginRequested(_that);case LogoutRequested():
return logoutRequested(_that);case SessionChecked():
return sessionChecked(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoginRequested value)?  loginRequested,TResult? Function( LogoutRequested value)?  logoutRequested,TResult? Function( SessionChecked value)?  sessionChecked,}){
final _that = this;
switch (_that) {
case LoginRequested() when loginRequested != null:
return loginRequested(_that);case LogoutRequested() when logoutRequested != null:
return logoutRequested(_that);case SessionChecked() when sessionChecked != null:
return sessionChecked(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String email,  String password)?  loginRequested,TResult Function()?  logoutRequested,TResult Function()?  sessionChecked,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoginRequested() when loginRequested != null:
return loginRequested(_that.email,_that.password);case LogoutRequested() when logoutRequested != null:
return logoutRequested();case SessionChecked() when sessionChecked != null:
return sessionChecked();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String email,  String password)  loginRequested,required TResult Function()  logoutRequested,required TResult Function()  sessionChecked,}) {final _that = this;
switch (_that) {
case LoginRequested():
return loginRequested(_that.email,_that.password);case LogoutRequested():
return logoutRequested();case SessionChecked():
return sessionChecked();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String email,  String password)?  loginRequested,TResult? Function()?  logoutRequested,TResult? Function()?  sessionChecked,}) {final _that = this;
switch (_that) {
case LoginRequested() when loginRequested != null:
return loginRequested(_that.email,_that.password);case LogoutRequested() when logoutRequested != null:
return logoutRequested();case SessionChecked() when sessionChecked != null:
return sessionChecked();case _:
  return null;

}
}

}

/// @nodoc


class LoginRequested implements AuthEvent {
  const LoginRequested({required this.email, required this.password});
  

 final  String email;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginRequestedCopyWith<LoginRequested> get copyWith => _$LoginRequestedCopyWithImpl<LoginRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginRequested&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'AuthEvent.loginRequested(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $LoginRequestedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $LoginRequestedCopyWith(LoginRequested value, $Res Function(LoginRequested) _then) = _$LoginRequestedCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class _$LoginRequestedCopyWithImpl<$Res>
    implements $LoginRequestedCopyWith<$Res> {
  _$LoginRequestedCopyWithImpl(this._self, this._then);

  final LoginRequested _self;
  final $Res Function(LoginRequested) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(LoginRequested(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LogoutRequested implements AuthEvent {
  const LogoutRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoutRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.logoutRequested()';
}


}




/// @nodoc


class SessionChecked implements AuthEvent {
  const SessionChecked();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionChecked);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.sessionChecked()';
}


}




// dart format on
