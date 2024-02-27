// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alert_state_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AlertStateProviderParameters {
  bool get isGroupAlert => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get alertId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AlertStateProviderParametersCopyWith<AlertStateProviderParameters>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlertStateProviderParametersCopyWith<$Res> {
  factory $AlertStateProviderParametersCopyWith(
          AlertStateProviderParameters value,
          $Res Function(AlertStateProviderParameters) then) =
      _$AlertStateProviderParametersCopyWithImpl<$Res,
          AlertStateProviderParameters>;
  @useResult
  $Res call({bool isGroupAlert, String id, String alertId});
}

/// @nodoc
class _$AlertStateProviderParametersCopyWithImpl<$Res,
        $Val extends AlertStateProviderParameters>
    implements $AlertStateProviderParametersCopyWith<$Res> {
  _$AlertStateProviderParametersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isGroupAlert = null,
    Object? id = null,
    Object? alertId = null,
  }) {
    return _then(_value.copyWith(
      isGroupAlert: null == isGroupAlert
          ? _value.isGroupAlert
          : isGroupAlert // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      alertId: null == alertId
          ? _value.alertId
          : alertId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AlertStateProviderParametersCopyWith<$Res>
    implements $AlertStateProviderParametersCopyWith<$Res> {
  factory _$$_AlertStateProviderParametersCopyWith(
          _$_AlertStateProviderParameters value,
          $Res Function(_$_AlertStateProviderParameters) then) =
      __$$_AlertStateProviderParametersCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isGroupAlert, String id, String alertId});
}

/// @nodoc
class __$$_AlertStateProviderParametersCopyWithImpl<$Res>
    extends _$AlertStateProviderParametersCopyWithImpl<$Res,
        _$_AlertStateProviderParameters>
    implements _$$_AlertStateProviderParametersCopyWith<$Res> {
  __$$_AlertStateProviderParametersCopyWithImpl(
      _$_AlertStateProviderParameters _value,
      $Res Function(_$_AlertStateProviderParameters) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isGroupAlert = null,
    Object? id = null,
    Object? alertId = null,
  }) {
    return _then(_$_AlertStateProviderParameters(
      isGroupAlert: null == isGroupAlert
          ? _value.isGroupAlert
          : isGroupAlert // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      alertId: null == alertId
          ? _value.alertId
          : alertId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AlertStateProviderParameters
    with DiagnosticableTreeMixin
    implements _AlertStateProviderParameters {
  const _$_AlertStateProviderParameters(
      {this.isGroupAlert = false, required this.id, required this.alertId});

  @override
  @JsonKey()
  final bool isGroupAlert;
  @override
  final String id;
  @override
  final String alertId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AlertStateProviderParameters(isGroupAlert: $isGroupAlert, id: $id, alertId: $alertId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AlertStateProviderParameters'))
      ..add(DiagnosticsProperty('isGroupAlert', isGroupAlert))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('alertId', alertId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AlertStateProviderParameters &&
            (identical(other.isGroupAlert, isGroupAlert) ||
                other.isGroupAlert == isGroupAlert) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.alertId, alertId) || other.alertId == alertId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isGroupAlert, id, alertId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AlertStateProviderParametersCopyWith<_$_AlertStateProviderParameters>
      get copyWith => __$$_AlertStateProviderParametersCopyWithImpl<
          _$_AlertStateProviderParameters>(this, _$identity);
}

abstract class _AlertStateProviderParameters
    implements AlertStateProviderParameters {
  const factory _AlertStateProviderParameters(
      {final bool isGroupAlert,
      required final String id,
      required final String alertId}) = _$_AlertStateProviderParameters;

  @override
  bool get isGroupAlert;
  @override
  String get id;
  @override
  String get alertId;
  @override
  @JsonKey(ignore: true)
  _$$_AlertStateProviderParametersCopyWith<_$_AlertStateProviderParameters>
      get copyWith => throw _privateConstructorUsedError;
}
