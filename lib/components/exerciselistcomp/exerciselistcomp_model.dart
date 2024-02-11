import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'exerciselistcomp_widget.dart' show ExerciselistcompWidget;
import 'package:flutter/material.dart';

class ExerciselistcompModel extends FlutterFlowModel<ExerciselistcompWidget> {
  ///  Local state fields for this component.

  int total = 0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for CheckboxListTile widget.

  Map<ExercisesRecord, bool> checkboxListTileValueMap = {};
  List<ExercisesRecord> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
