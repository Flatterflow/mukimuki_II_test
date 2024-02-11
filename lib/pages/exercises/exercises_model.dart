import '/components/exerciselistcomp/exerciselistcomp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'exercises_widget.dart' show ExercisesWidget;
import 'package:flutter/material.dart';

class ExercisesModel extends FlutterFlowModel<ExercisesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for exerciselistcomp component.
  late ExerciselistcompModel exerciselistcompModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    exerciselistcompModel = createModel(context, () => ExerciselistcompModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    exerciselistcompModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
