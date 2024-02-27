import 'package:freezed_annotation/freezed_annotation.dart';
part 'working_state.freezed.dart';

//  作業管理
//
//

@freezed
class WorkingState with _$WorkingState {
  const factory WorkingState({
    @Default(false) bool isWorking, // Add your fields here
  }) = _WorkingState;

  // factory WorkingState.fromJson(Map<String, dynamic> json) =>
  //     _$WorkingStateFromJson(json);
}
