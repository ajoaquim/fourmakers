import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginComponentModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for campoEmail widget.
  TextEditingController? campoEmailController;
  String? Function(BuildContext, String?)? campoEmailControllerValidator;
  String? _campoEmailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for campoSenha widget.
  TextEditingController? campoSenhaController;
  late bool campoSenhaVisibility;
  String? Function(BuildContext, String?)? campoSenhaControllerValidator;
  String? _campoSenhaControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    campoEmailControllerValidator = _campoEmailControllerValidator;
    campoSenhaVisibility = false;
    campoSenhaControllerValidator = _campoSenhaControllerValidator;
  }

  void dispose() {
    campoEmailController?.dispose();
    campoSenhaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
