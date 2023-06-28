import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ModalAlterarValorApontamentoModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for supportResponse widget.
  TextEditingController? supportResponseController;
  String? Function(BuildContext, String?)? supportResponseControllerValidator;
  // Stores action output result for [Backend Call - API (editarValorApontamento)] action in Button widget.
  ApiCallResponse? apiResultksl;
  // Stores action output result for [Backend Call - API (getApontamentosPendentesEmpresa)] action in Button widget.
  ApiCallResponse? apontamentosReload1;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    supportResponseController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
