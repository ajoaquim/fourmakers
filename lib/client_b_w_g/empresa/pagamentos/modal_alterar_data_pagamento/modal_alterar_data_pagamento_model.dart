import '/backend/api_requests/api_calls.dart';
import '/client_b_w_g/empresa/pagamentos/modal_cancelar_pagamento/modal_cancelar_pagamento_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class ModalAlterarDataPagamentoModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for supportResponse widget.
  TextEditingController? supportResponseController;
  final supportResponseMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? supportResponseControllerValidator;
  // Stores action output result for [Backend Call - API (AlterarDataPagamento)] action in Button widget.
  ApiCallResponse? apiResulthuu;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    supportResponseController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
