// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hourly_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HourlyData _$HourlyDataFromJson(Map<String, dynamic> json) {
  return _HourlyData.fromJson(json);
}

/// @nodoc
mixin _$HourlyData {
  String get time => throw _privateConstructorUsedError;
  int get temperature => throw _privateConstructorUsedError;
  int get iconCode => throw _privateConstructorUsedError;
  int get humidity => throw _privateConstructorUsedError;
  int get precipitation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HourlyDataCopyWith<HourlyData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HourlyDataCopyWith<$Res> {
  factory $HourlyDataCopyWith(
          HourlyData value, $Res Function(HourlyData) then) =
      _$HourlyDataCopyWithImpl<$Res, HourlyData>;
  @useResult
  $Res call(
      {String time,
      int temperature,
      int iconCode,
      int humidity,
      int precipitation});
}

/// @nodoc
class _$HourlyDataCopyWithImpl<$Res, $Val extends HourlyData>
    implements $HourlyDataCopyWith<$Res> {
  _$HourlyDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? temperature = null,
    Object? iconCode = null,
    Object? humidity = null,
    Object? precipitation = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as int,
      iconCode: null == iconCode
          ? _value.iconCode
          : iconCode // ignore: cast_nullable_to_non_nullable
              as int,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int,
      precipitation: null == precipitation
          ? _value.precipitation
          : precipitation // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HourlyDataCopyWith<$Res>
    implements $HourlyDataCopyWith<$Res> {
  factory _$$_HourlyDataCopyWith(
          _$_HourlyData value, $Res Function(_$_HourlyData) then) =
      __$$_HourlyDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String time,
      int temperature,
      int iconCode,
      int humidity,
      int precipitation});
}

/// @nodoc
class __$$_HourlyDataCopyWithImpl<$Res>
    extends _$HourlyDataCopyWithImpl<$Res, _$_HourlyData>
    implements _$$_HourlyDataCopyWith<$Res> {
  __$$_HourlyDataCopyWithImpl(
      _$_HourlyData _value, $Res Function(_$_HourlyData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? temperature = null,
    Object? iconCode = null,
    Object? humidity = null,
    Object? precipitation = null,
  }) {
    return _then(_$_HourlyData(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as int,
      iconCode: null == iconCode
          ? _value.iconCode
          : iconCode // ignore: cast_nullable_to_non_nullable
              as int,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int,
      precipitation: null == precipitation
          ? _value.precipitation
          : precipitation // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HourlyData implements _HourlyData {
  const _$_HourlyData(
      {this.time = "",
      this.temperature = 0,
      this.iconCode = 0,
      this.humidity = 0,
      this.precipitation = 0});

  factory _$_HourlyData.fromJson(Map<String, dynamic> json) =>
      _$$_HourlyDataFromJson(json);

  @override
  @JsonKey()
  final String time;
  @override
  @JsonKey()
  final int temperature;
  @override
  @JsonKey()
  final int iconCode;
  @override
  @JsonKey()
  final int humidity;
  @override
  @JsonKey()
  final int precipitation;

  @override
  String toString() {
    return 'HourlyData(time: $time, temperature: $temperature, iconCode: $iconCode, humidity: $humidity, precipitation: $precipitation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HourlyData &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.iconCode, iconCode) ||
                other.iconCode == iconCode) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.precipitation, precipitation) ||
                other.precipitation == precipitation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, time, temperature, iconCode, humidity, precipitation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HourlyDataCopyWith<_$_HourlyData> get copyWith =>
      __$$_HourlyDataCopyWithImpl<_$_HourlyData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HourlyDataToJson(
      this,
    );
  }
}

abstract class _HourlyData implements HourlyData {
  const factory _HourlyData(
      {final String time,
      final int temperature,
      final int iconCode,
      final int humidity,
      final int precipitation}) = _$_HourlyData;

  factory _HourlyData.fromJson(Map<String, dynamic> json) =
      _$_HourlyData.fromJson;

  @override
  String get time;
  @override
  int get temperature;
  @override
  int get iconCode;
  @override
  int get humidity;
  @override
  int get precipitation;
  @override
  @JsonKey(ignore: true)
  _$$_HourlyDataCopyWith<_$_HourlyData> get copyWith =>
      throw _privateConstructorUsedError;
}
