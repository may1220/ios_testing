// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WeatherData _$WeatherDataFromJson(Map<String, dynamic> json) {
  return _WeatherData.fromJson(json);
}

/// @nodoc
mixin _$WeatherData {
// @Default(null) DateTime date,
  String get date => throw _privateConstructorUsedError; //
// OWMでも同様のもの
// 階層化するとfirestoreにstoreするときに面倒そうなのでflatに定義しておく
  int get weatherId => throw _privateConstructorUsedError;
  String get weatherMain => throw _privateConstructorUsedError;
  String get weatherDescription => throw _privateConstructorUsedError;
  String get weatherIcon => throw _privateConstructorUsedError; //
// OWMだとmain.temp
  double get temperature => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherDataCopyWith<WeatherData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherDataCopyWith<$Res> {
  factory $WeatherDataCopyWith(
          WeatherData value, $Res Function(WeatherData) then) =
      _$WeatherDataCopyWithImpl<$Res, WeatherData>;
  @useResult
  $Res call(
      {String date,
      int weatherId,
      String weatherMain,
      String weatherDescription,
      String weatherIcon,
      double temperature});
}

/// @nodoc
class _$WeatherDataCopyWithImpl<$Res, $Val extends WeatherData>
    implements $WeatherDataCopyWith<$Res> {
  _$WeatherDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? weatherId = null,
    Object? weatherMain = null,
    Object? weatherDescription = null,
    Object? weatherIcon = null,
    Object? temperature = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      weatherId: null == weatherId
          ? _value.weatherId
          : weatherId // ignore: cast_nullable_to_non_nullable
              as int,
      weatherMain: null == weatherMain
          ? _value.weatherMain
          : weatherMain // ignore: cast_nullable_to_non_nullable
              as String,
      weatherDescription: null == weatherDescription
          ? _value.weatherDescription
          : weatherDescription // ignore: cast_nullable_to_non_nullable
              as String,
      weatherIcon: null == weatherIcon
          ? _value.weatherIcon
          : weatherIcon // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WeatherDataCopyWith<$Res>
    implements $WeatherDataCopyWith<$Res> {
  factory _$$_WeatherDataCopyWith(
          _$_WeatherData value, $Res Function(_$_WeatherData) then) =
      __$$_WeatherDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String date,
      int weatherId,
      String weatherMain,
      String weatherDescription,
      String weatherIcon,
      double temperature});
}

/// @nodoc
class __$$_WeatherDataCopyWithImpl<$Res>
    extends _$WeatherDataCopyWithImpl<$Res, _$_WeatherData>
    implements _$$_WeatherDataCopyWith<$Res> {
  __$$_WeatherDataCopyWithImpl(
      _$_WeatherData _value, $Res Function(_$_WeatherData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? weatherId = null,
    Object? weatherMain = null,
    Object? weatherDescription = null,
    Object? weatherIcon = null,
    Object? temperature = null,
  }) {
    return _then(_$_WeatherData(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      weatherId: null == weatherId
          ? _value.weatherId
          : weatherId // ignore: cast_nullable_to_non_nullable
              as int,
      weatherMain: null == weatherMain
          ? _value.weatherMain
          : weatherMain // ignore: cast_nullable_to_non_nullable
              as String,
      weatherDescription: null == weatherDescription
          ? _value.weatherDescription
          : weatherDescription // ignore: cast_nullable_to_non_nullable
              as String,
      weatherIcon: null == weatherIcon
          ? _value.weatherIcon
          : weatherIcon // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WeatherData with DiagnosticableTreeMixin implements _WeatherData {
  const _$_WeatherData(
      {this.date = "",
      this.weatherId = 0,
      this.weatherMain = "",
      this.weatherDescription = "",
      this.weatherIcon = "",
      this.temperature = 0});

  factory _$_WeatherData.fromJson(Map<String, dynamic> json) =>
      _$$_WeatherDataFromJson(json);

// @Default(null) DateTime date,
  @override
  @JsonKey()
  final String date;
//
// OWMでも同様のもの
// 階層化するとfirestoreにstoreするときに面倒そうなのでflatに定義しておく
  @override
  @JsonKey()
  final int weatherId;
  @override
  @JsonKey()
  final String weatherMain;
  @override
  @JsonKey()
  final String weatherDescription;
  @override
  @JsonKey()
  final String weatherIcon;
//
// OWMだとmain.temp
  @override
  @JsonKey()
  final double temperature;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WeatherData(date: $date, weatherId: $weatherId, weatherMain: $weatherMain, weatherDescription: $weatherDescription, weatherIcon: $weatherIcon, temperature: $temperature)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WeatherData'))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('weatherId', weatherId))
      ..add(DiagnosticsProperty('weatherMain', weatherMain))
      ..add(DiagnosticsProperty('weatherDescription', weatherDescription))
      ..add(DiagnosticsProperty('weatherIcon', weatherIcon))
      ..add(DiagnosticsProperty('temperature', temperature));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherData &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.weatherId, weatherId) ||
                other.weatherId == weatherId) &&
            (identical(other.weatherMain, weatherMain) ||
                other.weatherMain == weatherMain) &&
            (identical(other.weatherDescription, weatherDescription) ||
                other.weatherDescription == weatherDescription) &&
            (identical(other.weatherIcon, weatherIcon) ||
                other.weatherIcon == weatherIcon) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, weatherId, weatherMain,
      weatherDescription, weatherIcon, temperature);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeatherDataCopyWith<_$_WeatherData> get copyWith =>
      __$$_WeatherDataCopyWithImpl<_$_WeatherData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeatherDataToJson(
      this,
    );
  }
}

abstract class _WeatherData implements WeatherData {
  const factory _WeatherData(
      {final String date,
      final int weatherId,
      final String weatherMain,
      final String weatherDescription,
      final String weatherIcon,
      final double temperature}) = _$_WeatherData;

  factory _WeatherData.fromJson(Map<String, dynamic> json) =
      _$_WeatherData.fromJson;

  @override // @Default(null) DateTime date,
  String get date;
  @override //
// OWMでも同様のもの
// 階層化するとfirestoreにstoreするときに面倒そうなのでflatに定義しておく
  int get weatherId;
  @override
  String get weatherMain;
  @override
  String get weatherDescription;
  @override
  String get weatherIcon;
  @override //
// OWMだとmain.temp
  double get temperature;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherDataCopyWith<_$_WeatherData> get copyWith =>
      throw _privateConstructorUsedError;
}
