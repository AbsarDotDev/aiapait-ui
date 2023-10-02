// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignupState {
  TextFieldState get nameState => throw _privateConstructorUsedError;
  TextFieldState get emailState => throw _privateConstructorUsedError;
  TextFieldState get passwordState => throw _privateConstructorUsedError;
  bool get isPasswordObscured => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            TextFieldState nameState,
            TextFieldState emailState,
            TextFieldState passwordState,
            bool isPasswordObscured)
        main,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TextFieldState nameState, TextFieldState emailState,
            TextFieldState passwordState, bool isPasswordObscured)?
        main,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TextFieldState nameState, TextFieldState emailState,
            TextFieldState passwordState, bool isPasswordObscured)?
        main,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Main value) main,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Main value)? main,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Main value)? main,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignupStateCopyWith<SignupState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupStateCopyWith<$Res> {
  factory $SignupStateCopyWith(
          SignupState value, $Res Function(SignupState) then) =
      _$SignupStateCopyWithImpl<$Res, SignupState>;
  @useResult
  $Res call(
      {TextFieldState nameState,
      TextFieldState emailState,
      TextFieldState passwordState,
      bool isPasswordObscured});
}

/// @nodoc
class _$SignupStateCopyWithImpl<$Res, $Val extends SignupState>
    implements $SignupStateCopyWith<$Res> {
  _$SignupStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameState = null,
    Object? emailState = null,
    Object? passwordState = null,
    Object? isPasswordObscured = null,
  }) {
    return _then(_value.copyWith(
      nameState: null == nameState
          ? _value.nameState
          : nameState // ignore: cast_nullable_to_non_nullable
              as TextFieldState,
      emailState: null == emailState
          ? _value.emailState
          : emailState // ignore: cast_nullable_to_non_nullable
              as TextFieldState,
      passwordState: null == passwordState
          ? _value.passwordState
          : passwordState // ignore: cast_nullable_to_non_nullable
              as TextFieldState,
      isPasswordObscured: null == isPasswordObscured
          ? _value.isPasswordObscured
          : isPasswordObscured // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MainCopyWith<$Res> implements $SignupStateCopyWith<$Res> {
  factory _$$_MainCopyWith(_$_Main value, $Res Function(_$_Main) then) =
      __$$_MainCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TextFieldState nameState,
      TextFieldState emailState,
      TextFieldState passwordState,
      bool isPasswordObscured});
}

/// @nodoc
class __$$_MainCopyWithImpl<$Res>
    extends _$SignupStateCopyWithImpl<$Res, _$_Main>
    implements _$$_MainCopyWith<$Res> {
  __$$_MainCopyWithImpl(_$_Main _value, $Res Function(_$_Main) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameState = null,
    Object? emailState = null,
    Object? passwordState = null,
    Object? isPasswordObscured = null,
  }) {
    return _then(_$_Main(
      nameState: null == nameState
          ? _value.nameState
          : nameState // ignore: cast_nullable_to_non_nullable
              as TextFieldState,
      emailState: null == emailState
          ? _value.emailState
          : emailState // ignore: cast_nullable_to_non_nullable
              as TextFieldState,
      passwordState: null == passwordState
          ? _value.passwordState
          : passwordState // ignore: cast_nullable_to_non_nullable
              as TextFieldState,
      isPasswordObscured: null == isPasswordObscured
          ? _value.isPasswordObscured
          : isPasswordObscured // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Main implements _Main {
  const _$_Main(
      {required this.nameState,
      required this.emailState,
      required this.passwordState,
      required this.isPasswordObscured});

  @override
  final TextFieldState nameState;
  @override
  final TextFieldState emailState;
  @override
  final TextFieldState passwordState;
  @override
  final bool isPasswordObscured;

  @override
  String toString() {
    return 'SignupState.main(nameState: $nameState, emailState: $emailState, passwordState: $passwordState, isPasswordObscured: $isPasswordObscured)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Main &&
            (identical(other.nameState, nameState) ||
                other.nameState == nameState) &&
            (identical(other.emailState, emailState) ||
                other.emailState == emailState) &&
            (identical(other.passwordState, passwordState) ||
                other.passwordState == passwordState) &&
            (identical(other.isPasswordObscured, isPasswordObscured) ||
                other.isPasswordObscured == isPasswordObscured));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, nameState, emailState, passwordState, isPasswordObscured);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MainCopyWith<_$_Main> get copyWith =>
      __$$_MainCopyWithImpl<_$_Main>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            TextFieldState nameState,
            TextFieldState emailState,
            TextFieldState passwordState,
            bool isPasswordObscured)
        main,
  }) {
    return main(nameState, emailState, passwordState, isPasswordObscured);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TextFieldState nameState, TextFieldState emailState,
            TextFieldState passwordState, bool isPasswordObscured)?
        main,
  }) {
    return main?.call(nameState, emailState, passwordState, isPasswordObscured);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TextFieldState nameState, TextFieldState emailState,
            TextFieldState passwordState, bool isPasswordObscured)?
        main,
    required TResult orElse(),
  }) {
    if (main != null) {
      return main(nameState, emailState, passwordState, isPasswordObscured);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Main value) main,
  }) {
    return main(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Main value)? main,
  }) {
    return main?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Main value)? main,
    required TResult orElse(),
  }) {
    if (main != null) {
      return main(this);
    }
    return orElse();
  }
}

abstract class _Main implements SignupState {
  const factory _Main(
      {required final TextFieldState nameState,
      required final TextFieldState emailState,
      required final TextFieldState passwordState,
      required final bool isPasswordObscured}) = _$_Main;

  @override
  TextFieldState get nameState;
  @override
  TextFieldState get emailState;
  @override
  TextFieldState get passwordState;
  @override
  bool get isPasswordObscured;
  @override
  @JsonKey(ignore: true)
  _$$_MainCopyWith<_$_Main> get copyWith => throw _privateConstructorUsedError;
}
