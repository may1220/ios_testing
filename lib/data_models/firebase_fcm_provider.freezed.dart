// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'firebase_fcm_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FcmState {
  String get token => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FcmStateCopyWith<FcmState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FcmStateCopyWith<$Res> {
  factory $FcmStateCopyWith(FcmState value, $Res Function(FcmState) then) =
      _$FcmStateCopyWithImpl<$Res, FcmState>;
  @useResult
  $Res call({String token});
}

/// @nodoc
class _$FcmStateCopyWithImpl<$Res, $Val extends FcmState>
    implements $FcmStateCopyWith<$Res> {
  _$FcmStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FcmStatCopyWith<$Res> implements $FcmStateCopyWith<$Res> {
  factory _$$_FcmStatCopyWith(
          _$_FcmStat value, $Res Function(_$_FcmStat) then) =
      __$$_FcmStatCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token});
}

/// @nodoc
class __$$_FcmStatCopyWithImpl<$Res>
    extends _$FcmStateCopyWithImpl<$Res, _$_FcmStat>
    implements _$$_FcmStatCopyWith<$Res> {
  __$$_FcmStatCopyWithImpl(_$_FcmStat _value, $Res Function(_$_FcmStat) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_$_FcmStat(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FcmStat with DiagnosticableTreeMixin implements _FcmStat {
  const _$_FcmStat({this.token = ""});

  @override
  @JsonKey()
  final String token;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FcmState(token: $token)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FcmState'))
      ..add(DiagnosticsProperty('token', token));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FcmStat &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FcmStatCopyWith<_$_FcmStat> get copyWith =>
      __$$_FcmStatCopyWithImpl<_$_FcmStat>(this, _$identity);
}

abstract class _FcmStat implements FcmState {
  const factory _FcmStat({final String token}) = _$_FcmStat;

  @override
  String get token;
  @override
  @JsonKey(ignore: true)
  _$$_FcmStatCopyWith<_$_FcmStat> get copyWith =>
      throw _privateConstructorUsedError;
}
