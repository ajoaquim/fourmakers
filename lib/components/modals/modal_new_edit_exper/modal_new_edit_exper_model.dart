import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class ModalNewEditExperModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for inputEmpresa widget.
  TextEditingController? inputEmpresaController;
  String? Function(BuildContext, String?)? inputEmpresaControllerValidator;
  // State field(s) for inputCargo widget.
  TextEditingController? inputCargoController;
  String? Function(BuildContext, String?)? inputCargoControllerValidator;
  // State field(s) for inputAtividades widget.
  TextEditingController? inputAtividadesController;
  String? Function(BuildContext, String?)? inputAtividadesControllerValidator;
  // State field(s) for inputInicio widget.
  TextEditingController? inputInicioController;
  final inputInicioMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? inputInicioControllerValidator;
  // State field(s) for inputFim widget.
  TextEditingController? inputFimController;
  final inputFimMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? inputFimControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Backend Call - API (EditaExperienciaProfissional)] action in Button widget.
  ApiCallResponse? apiResult4dw;
  // Stores action output result for [Backend Call - API (listaExperienciaProfissional)] action in Button widget.
  ApiCallResponse? apiAtualizaExperienciaPro;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    inputEmpresaController?.dispose();
    inputCargoController?.dispose();
    inputAtividadesController?.dispose();
    inputInicioController?.dispose();
    inputFimController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
