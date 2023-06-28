import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class OkrEditarModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (despausarOKR)] action in option widget.
  ApiCallResponse? despausarokr;
  // Stores action output result for [Backend Call - API (despausarObjetivoArea)] action in option widget.
  ApiCallResponse? despausarObjetivo;
  // Stores action output result for [Backend Call - API (despausarResultado)] action in option widget.
  ApiCallResponse? despausarResultado;
  // Stores action output result for [Backend Call - API (despausarIniciativa)] action in option widget.
  ApiCallResponse? despausarInicia;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  final textFieldMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (editarOKR)] action in option widget.
  ApiCallResponse? editOKR;
  // Stores action output result for [Backend Call - API (editarObjetivoArea)] action in option widget.
  ApiCallResponse? editObj;
  // Stores action output result for [Backend Call - API (editarResultadoChave)] action in option widget.
  ApiCallResponse? editResult;
  // Stores action output result for [Backend Call - API (editarIniciativa)] action in option widget.
  ApiCallResponse? editini;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
