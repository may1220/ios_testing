// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DailyData _$DailyDataFromJson(Map<String, dynamic> json) {
  return _DailyData.fromJson(json);
}

/// @nodoc
mixin _$DailyData {
  String get time => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  int get temperature => throw _privateConstructorUsedError;
  int get iconCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DailyDataCopyWith<DailyData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyDataCopyWith<$Res> {
  factory $DailyDataCopyWith(DailyData value, $Res Function(DailyData) then) =
      _$DailyDataCopyWithImpl<$Res, DailyData>;
  @useResult
  $Res call({String time, String label, int temperature, int iconCode});
}

/// @nodoc
class _$DailyDataCopyWithImpl<$Res, $Val extends DailyData>
    implements $DailyDataCopyWith<$Res> {
  _$DailyDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? label = null,
    Object? temperature = null,
    Object? iconCode = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as int,
      iconCode: null == iconCode
          ? _value.iconCode
          : iconCode // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DailyDataCopyWith<$Res> implements $DailyDataCopyWith<$Res> {
  factory _$$_DailyDataCopyWith(
          _$_DailyData value, $Res Function(_$_DailyData) then) =
      __$$_DailyDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String time, String label, int temperature, int iconCode});
}

/// @nodoc
class __$$_DailyDataCopyWithImpl<$Res>
    extends _$DailyDataCopyWithImpl<$Res, _$_DailyData>
    implements _$$_DailyDataCopyWith<$Res> {
  __$$_DailyDataCopyWithImpl(
      _$_DailyData _value, $Res Function(_$_DailyData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? label = null,
    Object? temperature = null,
    Object? iconCode = null,
  }) {
    return _then(_$_DailyData(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as int,
      iconCode: null == iconCode
          ? _value.iconCode
          : iconCode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DailyData implements _DailyData {
  const _$_DailyData(
      {this.time = "",
      this.label = "",
      this.temperature = 0,
      this.iconCode = 0});

  factory _$_DailyData.fromJson(Map<String, dynamic> json) =>
      _$$_DailyDataFromJson(json);

  @override
  @JsonKey()
  final String time;
  @override
  @JsonKey()
  final String label;
  @override
  @JsonKey()
  final int temperature;
  @override
  @JsonKey()
  final int iconCode;

  @override
  String toString() {
    return 'DailyData(time: $time, label: $label, temperature: $temperature, iconCode: $iconCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DailyData &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.iconCode, iconCode) ||
                other.iconCode == iconCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, time, label, temperature, iconCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DailyDataCopyWith<_$_DailyData> get copyWith =>
      __$$_DailyDataCopyWithImpl<_$_DailyData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DailyDataToJson(
      this,
    );
  }
}

abstract class _DailyData implements DailyData {
  const factory _DailyData(
      {final String time,
      final String label,
      final int temperature,
      final int iconCode}) = _$_DailyData;

  factory _DailyData.fromJson(Map<String, dynamic> json) =
      _$_DailyData.fromJson;

  @override
  String get time;
  @override
  String get label;
  @override
  int get temperature;
  @override
  int get iconCode;
  @override
  @JsonKey(ignore: true)
  _$$_DailyDataCopyWith<_$_DailyData> get copyWith =>
      throw _privateConstructorUsedError;
}
