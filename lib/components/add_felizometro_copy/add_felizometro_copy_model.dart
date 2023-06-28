import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddFelizometroCopyModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for sentimento widget.
  TextEditingController? sentimentoController;
  String? Function(BuildContext, String?)? sentimentoControllerValidator;
  // State field(s) for observacao widget.
  TextEditingController? observacaoController;
  String? Function(BuildContext, String?)? observacaoControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    sentimentoController?.dispose();
    observacaoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
