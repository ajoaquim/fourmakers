import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class Modal3LoginsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for prestadorCPF widget.
  TextEditingController? prestadorCPFController;
  final prestadorCPFMask = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? prestadorCPFControllerValidator;
  // State field(s) for prestadorSenha widget.
  TextEditingController? prestadorSenhaController;
  String? Function(BuildContext, String?)? prestadorSenhaControllerValidator;
  // Stores action output result for [Backend Call - API (loginPJ)] action in Button widget.
  ApiCallResponse? loginPJ;
  // State field(s) for empresaCNPJ widget.
  TextEditingController? empresaCNPJController;
  final empresaCNPJMask = MaskTextInputFormatter(mask: '##.###.###/####-##');
  String? Function(BuildContext, String?)? empresaCNPJControllerValidator;
  // State field(s) for empresaSenha widget.
  TextEditingController? empresaSenhaController;
  String? Function(BuildContext, String?)? empresaSenhaControllerValidator;
  // Stores action output result for [Backend Call - API (loginEmpresa)] action in Button widget.
  ApiCallResponse? loginEmpresa;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    prestadorCPFController?.dispose();
    prestadorSenhaController?.dispose();
    empresaCNPJController?.dispose();
    empresaSenhaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
