import '/components/login_form_modal/login_form_modal_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignInModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for loginFormModal component.
  late LoginFormModalModel loginFormModalModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    loginFormModalModel = createModel(context, () => LoginFormModalModel());
  }

  void dispose() {
    unfocusNode.dispose();
    loginFormModalModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
