import '/components/form_login/form_login_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginSlide1Model extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for formLogin component.
  late FormLoginModel formLoginModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    formLoginModel = createModel(context, () => FormLoginModel());
  }

  void dispose() {
    unfocusNode.dispose();
    formLoginModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
