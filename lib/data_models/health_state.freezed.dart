// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'health_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HealthState _$HealthStateFromJson(Map<String, dynamic> json) {
  return _HealthState.fromJson(json);
}

/// @nodoc
mixin _$HealthState {
  String get uName => throw _privateConstructorUsedError; // Smartfit ID
  String get sName => throw _privateConstructorUsedError; // センサID
  String get time => throw _privateConstructorUsedError; // 計測日時
//    @Default() DateTime timestamp, // 計測日時
  int? get heartRate => throw _privateConstructorUsedError; // 心拍数
  int? get heatstrokeLevel => throw _privateConstructorUsedError; // 熱中症レベル
  int? get healthLevel => throw _privateConstructorUsedError; // 体調レベル
  double get templerature => throw _privateConstructorUsedError; // 気温
  double get ralativeHumidity => throw _privateConstructorUsedError; // 湿度
  double get wbgt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HealthStateCopyWith<HealthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthStateCopyWith<$Res> {
  factory $HealthStateCopyWith(
          HealthState value, $Res Function(HealthState) then) =
      _$HealthStateCopyWithImpl<$Res, HealthState>;
  @useResult
  $Res call(
      {String uName,
      String sName,
      String time,
      int? heartRate,
      int? heatstrokeLevel,
      int? healthLevel,
      double templerature,
      double ralativeHumidity,
      double wbgt});
}

/// @nodoc
class _$HealthStateCopyWithImpl<$Res, $Val extends HealthState>
    implements $HealthStateCopyWith<$Res> {
  _$HealthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uName = null,
    Object? sName = null,
    Object? time = null,
    Object? heartRate = freezed,
    Object? heatstrokeLevel = freezed,
    Object? healthLevel = freezed,
    Object? templerature = null,
    Object? ralativeHumidity = null,
    Object? wbgt = null,
  }) {
    return _then(_value.copyWith(
      uName: null == uName
          ? _value.uName
          : uName // ignore: cast_nullable_to_non_nullable
              as String,
      sName: null == sName
          ? _value.sName
          : sName // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      heartRate: freezed == heartRate
          ? _value.heartRate
          : heartRate // ignore: cast_nullable_to_non_nullable
              as int?,
      heatstrokeLevel: freezed == heatstrokeLevel
          ? _value.heatstrokeLevel
          : heatstrokeLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      healthLevel: freezed == healthLevel
          ? _value.healthLevel
          : healthLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      templerature: null == templerature
          ? _value.templerature
          : templerature // ignore: cast_nullable_to_non_nullable
              as double,
      ralativeHumidity: null == ralativeHumidity
          ? _value.ralativeHumidity
          : ralativeHumidity // ignore: cast_nullable_to_non_nullable
              as double,
      wbgt: null == wbgt
          ? _value.wbgt
          : wbgt // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HealthStateCopyWith<$Res>
    implements $HealthStateCopyWith<$Res> {
  factory _$$_HealthStateCopyWith(
          _$_HealthState value, $Res Function(_$_HealthState) then) =
      __$$_HealthStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uName,
      String sName,
      String time,
      int? heartRate,
      int? heatstrokeLevel,
      int? healthLevel,
      double templerature,
      double ralativeHumidity,
      double wbgt});
}

/// @nodoc
class __$$_HealthStateCopyWithImpl<$Res>
    extends _$HealthStateCopyWithImpl<$Res, _$_HealthState>
    implements _$$_HealthStateCopyWith<$Res> {
  __$$_HealthStateCopyWithImpl(
      _$_HealthState _value, $Res Function(_$_HealthState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uName = null,
    Object? sName = null,
    Object? time = null,
    Object? heartRate = freezed,
    Object? heatstrokeLevel = freezed,
    Object? healthLevel = freezed,
    Object? templerature = null,
    Object? ralativeHumidity = null,
    Object? wbgt = null,
  }) {
    return _then(_$_HealthState(
      uName: null == uName
          ? _value.uName
          : uName // ignore: cast_nullable_to_non_nullable
              as String,
      sName: null == sName
          ? _value.sName
          : sName // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      heartRate: freezed == heartRate
          ? _value.heartRate
          : heartRate // ignore: cast_nullable_to_non_nullable
              as int?,
      heatstrokeLevel: freezed == heatstrokeLevel
          ? _value.heatstrokeLevel
          : heatstrokeLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      healthLevel: freezed == healthLevel
          ? _value.healthLevel
          : healthLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      templerature: null == templerature
          ? _value.templerature
          : templerature // ignore: cast_nullable_to_non_nullable
              as double,
      ralativeHumidity: null == ralativeHumidity
          ? _value.ralativeHumidity
          : ralativeHumidity // ignore: cast_nullable_to_non_nullable
              as double,
      wbgt: null == wbgt
          ? _value.wbgt
          : wbgt // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HealthState implements _HealthState {
  const _$_HealthState(
      {this.uName = "",
      this.sName = "",
      this.time = "",
      this.heartRate,
      this.heatstrokeLevel,
      this.healthLevel,
      this.templerature = 0.0,
      this.ralativeHumidity = 0.0,
      this.wbgt = 0.0});

  factory _$_HealthState.fromJson(Map<String, dynamic> json) =>
      _$$_HealthStateFromJson(json);

  @override
  @JsonKey()
  final String uName;
// Smartfit ID
  @override
  @JsonKey()
  final String sName;
// センサID
  @override
  @JsonKey()
  final String time;
// 計測日時
//    @Default() DateTime timestamp, // 計測日時
  @override
  final int? heartRate;
// 心拍数
  @override
  final int? heatstrokeLevel;
// 熱中症レベル
  @override
  final int? healthLevel;
// 体調レベル
  @override
  @JsonKey()
  final double templerature;
// 気温
  @override
  @JsonKey()
  final double ralativeHumidity;
// 湿度
  @override
  @JsonKey()
  final double wbgt;

  @override
  String toString() {
    return 'HealthState(uName: $uName, sName: $sName, time: $time, heartRate: $heartRate, heatstrokeLevel: $heatstrokeLevel, healthLevel: $healthLevel, templerature: $templerature, ralativeHumidity: $ralativeHumidity, wbgt: $wbgt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HealthState &&
            (identical(other.uName, uName) || other.uName == uName) &&
            (identical(other.sName, sName) || other.sName == sName) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.heartRate, heartRate) ||
                other.heartRate == heartRate) &&
            (identical(other.heatstrokeLevel, heatstrokeLevel) ||
                other.heatstrokeLevel == heatstrokeLevel) &&
            (identical(other.healthLevel, healthLevel) ||
                other.healthLevel == healthLevel) &&
            (identical(other.templerature, templerature) ||
                other.templerature == templerature) &&
            (identical(other.ralativeHumidity, ralativeHumidity) ||
                other.ralativeHumidity == ralativeHumidity) &&
            (identical(other.wbgt, wbgt) || other.wbgt == wbgt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uName, sName, time, heartRate,
      heatstrokeLevel, healthLevel, templerature, ralativeHumidity, wbgt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HealthStateCopyWith<_$_HealthState> get copyWith =>
      __$$_HealthStateCopyWithImpl<_$_HealthState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HealthStateToJson(
      this,
    );
  }
}

abstract class _HealthState implements HealthState {
  const factory _HealthState(
      {final String uName,
      final String sName,
      final String time,
      final int? heartRate,
      final int? heatstrokeLevel,
      final int? healthLevel,
      final double templerature,
      final double ralativeHumidity,
      final double wbgt}) = _$_HealthState;

  factory _HealthState.fromJson(Map<String, dynamic> json) =
      _$_HealthState.fromJson;

  @override
  String get uName;
  @override // Smartfit ID
  String get sName;
  @override // センサID
  String get time;
  @override // 計測日時
//    @Default() DateTime timestamp, // 計測日時
  int? get heartRate;
  @override // 心拍数
  int? get heatstrokeLevel;
  @override // 熱中症レベル
  int? get healthLevel;
  @override // 体調レベル
  double get templerature;
  @override // 気温
  double get ralativeHumidity;
  @override // 湿度
  double get wbgt;
  @override
  @JsonKey(ignore: true)
  _$$_HealthStateCopyWith<_$_HealthState> get copyWith =>
      throw _privateConstructorUsedError;
}
