// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_user_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthUserInfo _$AuthUserInfoFromJson(Map<String, dynamic> json) {
  return _AuthUserInfo.fromJson(json);
}

/// @nodoc
mixin _$AuthUserInfo {
  String get uId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthUserInfoCopyWith<AuthUserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthUserInfoCopyWith<$Res> {
  factory $AuthUserInfoCopyWith(
          AuthUserInfo value, $Res Function(AuthUserInfo) then) =
      _$AuthUserInfoCopyWithImpl<$Res, AuthUserInfo>;
  @useResult
  $Res call({String uId});
}

/// @nodoc
class _$AuthUserInfoCopyWithImpl<$Res, $Val extends AuthUserInfo>
    implements $AuthUserInfoCopyWith<$Res> {
  _$AuthUserInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uId = null,
  }) {
    return _then(_value.copyWith(
      uId: null == uId
          ? _value.uId
          : uId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthUserInfoCopyWith<$Res>
    implements $AuthUserInfoCopyWith<$Res> {
  factory _$$_AuthUserInfoCopyWith(
          _$_AuthUserInfo value, $Res Function(_$_AuthUserInfo) then) =
      __$$_AuthUserInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uId});
}

/// @nodoc
class __$$_AuthUserInfoCopyWithImpl<$Res>
    extends _$AuthUserInfoCopyWithImpl<$Res, _$_AuthUserInfo>
    implements _$$_AuthUserInfoCopyWith<$Res> {
  __$$_AuthUserInfoCopyWithImpl(
      _$_AuthUserInfo _value, $Res Function(_$_AuthUserInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uId = null,
  }) {
    return _then(_$_AuthUserInfo(
      uId: null == uId
          ? _value.uId
          : uId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthUserInfo with DiagnosticableTreeMixin implements _AuthUserInfo {
  const _$_AuthUserInfo({this.uId = ''});

  factory _$_AuthUserInfo.fromJson(Map<String, dynamic> json) =>
      _$$_AuthUserInfoFromJson(json);

  @override
  @JsonKey()
  final String uId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthUserInfo(uId: $uId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthUserInfo'))
      ..add(DiagnosticsProperty('uId', uId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthUserInfo &&
            (identical(other.uId, uId) || other.uId == uId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthUserInfoCopyWith<_$_AuthUserInfo> get copyWith =>
      __$$_AuthUserInfoCopyWithImpl<_$_AuthUserInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthUserInfoToJson(
      this,
    );
  }
}

abstract class _AuthUserInfo implements AuthUserInfo {
  const factory _AuthUserInfo({final String uId}) = _$_AuthUserInfo;

  factory _AuthUserInfo.fromJson(Map<String, dynamic> json) =
      _$_AuthUserInfo.fromJson;

  @override
  String get uId;
  @override
  @JsonKey(ignore: true)
  _$$_AuthUserInfoCopyWith<_$_AuthUserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
