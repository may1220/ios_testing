// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'heart_rate_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HeartRateState _$HeartRateStateFromJson(Map<String, dynamic> json) {
  return _HeartRateState.fromJson(json);
}

/// @nodoc
mixin _$HeartRateState {
  int? get heartRate => throw _privateConstructorUsedError; // 心拍数
  int get minHeartRate => throw _privateConstructorUsedError;
  int get maxHeartRate => throw _privateConstructorUsedError;
  String get minTime => throw _privateConstructorUsedError;
  String get maxTime => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;
  bool get isTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HeartRateStateCopyWith<HeartRateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeartRateStateCopyWith<$Res> {
  factory $HeartRateStateCopyWith(
          HeartRateState value, $Res Function(HeartRateState) then) =
      _$HeartRateStateCopyWithImpl<$Res, HeartRateState>;
  @useResult
  $Res call(
      {int? heartRate,
      int minHeartRate,
      int maxHeartRate,
      String minTime,
      String maxTime,
      String? time,
      bool isTime});
}

/// @nodoc
class _$HeartRateStateCopyWithImpl<$Res, $Val extends HeartRateState>
    implements $HeartRateStateCopyWith<$Res> {
  _$HeartRateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? heartRate = freezed,
    Object? minHeartRate = null,
    Object? maxHeartRate = null,
    Object? minTime = null,
    Object? maxTime = null,
    Object? time = freezed,
    Object? isTime = null,
  }) {
    return _then(_value.copyWith(
      heartRate: freezed == heartRate
          ? _value.heartRate
          : heartRate // ignore: cast_nullable_to_non_nullable
              as int?,
      minHeartRate: null == minHeartRate
          ? _value.minHeartRate
          : minHeartRate // ignore: cast_nullable_to_non_nullable
              as int,
      maxHeartRate: null == maxHeartRate
          ? _value.maxHeartRate
          : maxHeartRate // ignore: cast_nullable_to_non_nullable
              as int,
      minTime: null == minTime
          ? _value.minTime
          : minTime // ignore: cast_nullable_to_non_nullable
              as String,
      maxTime: null == maxTime
          ? _value.maxTime
          : maxTime // ignore: cast_nullable_to_non_nullable
              as String,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      isTime: null == isTime
          ? _value.isTime
          : isTime // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HeartRateStateCopyWith<$Res>
    implements $HeartRateStateCopyWith<$Res> {
  factory _$$_HeartRateStateCopyWith(
          _$_HeartRateState value, $Res Function(_$_HeartRateState) then) =
      __$$_HeartRateStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? heartRate,
      int minHeartRate,
      int maxHeartRate,
      String minTime,
      String maxTime,
      String? time,
      bool isTime});
}

/// @nodoc
class __$$_HeartRateStateCopyWithImpl<$Res>
    extends _$HeartRateStateCopyWithImpl<$Res, _$_HeartRateState>
    implements _$$_HeartRateStateCopyWith<$Res> {
  __$$_HeartRateStateCopyWithImpl(
      _$_HeartRateState _value, $Res Function(_$_HeartRateState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? heartRate = freezed,
    Object? minHeartRate = null,
    Object? maxHeartRate = null,
    Object? minTime = null,
    Object? maxTime = null,
    Object? time = freezed,
    Object? isTime = null,
  }) {
    return _then(_$_HeartRateState(
      heartRate: freezed == heartRate
          ? _value.heartRate
          : heartRate // ignore: cast_nullable_to_non_nullable
              as int?,
      minHeartRate: null == minHeartRate
          ? _value.minHeartRate
          : minHeartRate // ignore: cast_nullable_to_non_nullable
              as int,
      maxHeartRate: null == maxHeartRate
          ? _value.maxHeartRate
          : maxHeartRate // ignore: cast_nullable_to_non_nullable
              as int,
      minTime: null == minTime
          ? _value.minTime
          : minTime // ignore: cast_nullable_to_non_nullable
              as String,
      maxTime: null == maxTime
          ? _value.maxTime
          : maxTime // ignore: cast_nullable_to_non_nullable
              as String,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      isTime: null == isTime
          ? _value.isTime
          : isTime // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HeartRateState implements _HeartRateState {
  const _$_HeartRateState(
      {this.heartRate,
      this.minHeartRate = 999,
      this.maxHeartRate = 0,
      this.minTime = "",
      this.maxTime = "",
      this.time,
      this.isTime = false});

  factory _$_HeartRateState.fromJson(Map<String, dynamic> json) =>
      _$$_HeartRateStateFromJson(json);

  @override
  final int? heartRate;
// 心拍数
  @override
  @JsonKey()
  final int minHeartRate;
  @override
  @JsonKey()
  final int maxHeartRate;
  @override
  @JsonKey()
  final String minTime;
  @override
  @JsonKey()
  final String maxTime;
  @override
  final String? time;
  @override
  @JsonKey()
  final bool isTime;

  @override
  String toString() {
    return 'HeartRateState(heartRate: $heartRate, minHeartRate: $minHeartRate, maxHeartRate: $maxHeartRate, minTime: $minTime, maxTime: $maxTime, time: $time, isTime: $isTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HeartRateState &&
            (identical(other.heartRate, heartRate) ||
                other.heartRate == heartRate) &&
            (identical(other.minHeartRate, minHeartRate) ||
                other.minHeartRate == minHeartRate) &&
            (identical(other.maxHeartRate, maxHeartRate) ||
                other.maxHeartRate == maxHeartRate) &&
            (identical(other.minTime, minTime) || other.minTime == minTime) &&
            (identical(other.maxTime, maxTime) || other.maxTime == maxTime) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.isTime, isTime) || other.isTime == isTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, heartRate, minHeartRate,
      maxHeartRate, minTime, maxTime, time, isTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HeartRateStateCopyWith<_$_HeartRateState> get copyWith =>
      __$$_HeartRateStateCopyWithImpl<_$_HeartRateState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HeartRateStateToJson(
      this,
    );
  }
}

abstract class _HeartRateState implements HeartRateState {
  const factory _HeartRateState(
      {final int? heartRate,
      final int minHeartRate,
      final int maxHeartRate,
      final String minTime,
      final String maxTime,
      final String? time,
      final bool isTime}) = _$_HeartRateState;

  factory _HeartRateState.fromJson(Map<String, dynamic> json) =
      _$_HeartRateState.fromJson;

  @override
  int? get heartRate;
  @override // 心拍数
  int get minHeartRate;
  @override
  int get maxHeartRate;
  @override
  String get minTime;
  @override
  String get maxTime;
  @override
  String? get time;
  @override
  bool get isTime;
  @override
  @JsonKey(ignore: true)
  _$$_HeartRateStateCopyWith<_$_HeartRateState> get copyWith =>
      throw _privateConstructorUsedError;
}
