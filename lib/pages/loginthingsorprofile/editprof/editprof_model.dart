import '/flutter_flow/flutter_flow_util.dart';
import 'editprof_widget.dart' show EditprofWidget;
import 'package:flutter/material.dart';

class EditprofModel extends FlutterFlowModel<EditprofWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? emailTextController1;
  String? Function(BuildContext, String?)? emailTextController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? emailTextController2;
  String? Function(BuildContext, String?)? emailTextController2Validator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController?.dispose();

    textFieldFocusNode2?.dispose();
    emailTextController1?.dispose();

    textFieldFocusNode3?.dispose();
    emailTextController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
