import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ModalAdicionarAnotacaoModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for addMelhoria widget.
  TextEditingController? addMelhoriaController;
  String? Function(BuildContext, String?)? addMelhoriaControllerValidator;
  // State field(s) for addForca widget.
  TextEditingController? addForcaController;
  String? Function(BuildContext, String?)? addForcaControllerValidator;
  // State field(s) for addObservacacoes widget.
  TextEditingController? addObservacacoesController;
  String? Function(BuildContext, String?)? addObservacacoesControllerValidator;
  // Stores action output result for [Backend Call - API (AddBookAcompanhamento)] action in Button widget.
  ApiCallResponse? apiResultok2;
  // Stores action output result for [Backend Call - API (GetAcompanhamentosByColab)] action in Button widget.
  ApiCallResponse? getAcompanhamentosResponse;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    addMelhoriaController?.dispose();
    addForcaController?.dispose();
    addObservacacoesController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
