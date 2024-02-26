import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/play_pause_stop_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'workout_start_widget.dart' show WorkoutStartWidget;
import 'package:flutter/material.dart';

class WorkoutStartModel extends FlutterFlowModel<WorkoutStartWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for PlayPauseStop component.
  late PlayPauseStopModel playPauseStopModel;
  // State field(s) for Checkbox widget.

  Map<SetStruct, bool> checkboxValueMap = {};
  List<SetStruct> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    playPauseStopModel = createModel(context, () => PlayPauseStopModel());
  }

  @override
  void dispose() {
    playPauseStopModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
