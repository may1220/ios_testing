// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'working_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WorkingState {
  bool get isWorking => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorkingStateCopyWith<WorkingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkingStateCopyWith<$Res> {
  factory $WorkingStateCopyWith(
          WorkingState value, $Res Function(WorkingState) then) =
      _$WorkingStateCopyWithImpl<$Res, WorkingState>;
  @useResult
  $Res call({bool isWorking});
}

/// @nodoc
class _$WorkingStateCopyWithImpl<$Res, $Val extends WorkingState>
    implements $WorkingStateCopyWith<$Res> {
  _$WorkingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isWorking = null,
  }) {
    return _then(_value.copyWith(
      isWorking: null == isWorking
          ? _value.isWorking
          : isWorking // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WorkingStateCopyWith<$Res>
    implements $WorkingStateCopyWith<$Res> {
  factory _$$_WorkingStateCopyWith(
          _$_WorkingState value, $Res Function(_$_WorkingState) then) =
      __$$_WorkingStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isWorking});
}

/// @nodoc
class __$$_WorkingStateCopyWithImpl<$Res>
    extends _$WorkingStateCopyWithImpl<$Res, _$_WorkingState>
    implements _$$_WorkingStateCopyWith<$Res> {
  __$$_WorkingStateCopyWithImpl(
      _$_WorkingState _value, $Res Function(_$_WorkingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isWorking = null,
  }) {
    return _then(_$_WorkingState(
      isWorking: null == isWorking
          ? _value.isWorking
          : isWorking // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_WorkingState implements _WorkingState {
  const _$_WorkingState({this.isWorking = false});

  @override
  @JsonKey()
  final bool isWorking;

  @override
  String toString() {
    return 'WorkingState(isWorking: $isWorking)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WorkingState &&
            (identical(other.isWorking, isWorking) ||
                other.isWorking == isWorking));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isWorking);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WorkingStateCopyWith<_$_WorkingState> get copyWith =>
      __$$_WorkingStateCopyWithImpl<_$_WorkingState>(this, _$identity);
}

abstract class _WorkingState implements WorkingState {
  const factory _WorkingState({final bool isWorking}) = _$_WorkingState;

  @override
  bool get isWorking;
  @override
  @JsonKey(ignore: true)
  _$$_WorkingStateCopyWith<_$_WorkingState> get copyWith =>
      throw _privateConstructorUsedError;
}
