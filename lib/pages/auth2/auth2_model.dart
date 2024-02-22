import '/flutter_flow/flutter_flow_util.dart';
import 'auth2_widget.dart' show Auth2Widget;
import 'package:flutter/material.dart';

class Auth2Model extends FlutterFlowModel<Auth2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // State field(s) for confirmpassword widget.
  FocusNode? confirmpasswordFocusNode;
  TextEditingController? confirmpasswordController;
  late bool confirmpasswordVisibility;
  String? Function(BuildContext, String?)? confirmpasswordControllerValidator;
  // State field(s) for emailAddresslog widget.
  FocusNode? emailAddresslogFocusNode;
  TextEditingController? emailAddresslogController;
  String? Function(BuildContext, String?)? emailAddresslogControllerValidator;
  // State field(s) for passwordlog widget.
  FocusNode? passwordlogFocusNode;
  TextEditingController? passwordlogController;
  late bool passwordlogVisibility;
  String? Function(BuildContext, String?)? passwordlogControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    confirmpasswordVisibility = false;
    passwordlogVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    emailAddressFocusNode?.dispose();
    emailAddressController?.dispose();

    passwordFocusNode?.dispose();
    passwordController?.dispose();

    confirmpasswordFocusNode?.dispose();
    confirmpasswordController?.dispose();

    emailAddresslogFocusNode?.dispose();
    emailAddresslogController?.dispose();

    passwordlogFocusNode?.dispose();
    passwordlogController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
