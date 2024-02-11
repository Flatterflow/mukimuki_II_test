import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'exercisecontainer_widget.dart' show ExercisecontainerWidget;
import 'package:flutter/material.dart';

class ExercisecontainerModel extends FlutterFlowModel<ExercisecontainerWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Checkbox widget.

  Map<SetStruct, bool> checkboxValueMap = {};
  List<SetStruct> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
