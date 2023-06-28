import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FormLoginBackupModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for campoEmail widget.
  TextEditingController? campoEmailController;
  String? Function(BuildContext, String?)? campoEmailControllerValidator;
  // State field(s) for campoSenha widget.
  TextEditingController? campoSenhaController;
  late bool campoSenhaVisibility;
  String? Function(BuildContext, String?)? campoSenhaControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    campoSenhaVisibility = false;
  }

  void dispose() {
    campoEmailController?.dispose();
    campoSenhaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
