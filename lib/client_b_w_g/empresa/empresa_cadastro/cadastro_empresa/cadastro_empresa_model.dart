import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class CadastroEmpresaModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for empresaNome widget.
  TextEditingController? empresaNomeController;
  String? Function(BuildContext, String?)? empresaNomeControllerValidator;
  // State field(s) for empresaCNPJ widget.
  TextEditingController? empresaCNPJController;
  final empresaCNPJMask = MaskTextInputFormatter(mask: '##.###.###/####-##');
  String? Function(BuildContext, String?)? empresaCNPJControllerValidator;
  // State field(s) for empresaPass widget.
  TextEditingController? empresaPassController;
  late bool empresaPassVisibility;
  String? Function(BuildContext, String?)? empresaPassControllerValidator;
  // State field(s) for empresaPass2 widget.
  TextEditingController? empresaPass2Controller;
  late bool empresaPass2Visibility;
  String? Function(BuildContext, String?)? empresaPass2ControllerValidator;
  // Stores action output result for [Backend Call - API (addEmpresa)] action in Button widget.
  ApiCallResponse? adicionarEmpresa;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    empresaPassVisibility = false;
    empresaPass2Visibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    empresaNomeController?.dispose();
    empresaCNPJController?.dispose();
    empresaPassController?.dispose();
    empresaPass2Controller?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
