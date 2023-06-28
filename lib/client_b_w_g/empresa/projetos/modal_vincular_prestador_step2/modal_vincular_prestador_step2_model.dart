import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class ModalVincularPrestadorStep2Model extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for inputEmpresa widget.
  TextEditingController? inputEmpresaController1;
  String? Function(BuildContext, String?)? inputEmpresaController1Validator;
  // State field(s) for inputEmpresa widget.
  TextEditingController? inputEmpresaController2;
  String? Function(BuildContext, String?)? inputEmpresaController2Validator;
  // State field(s) for inputEmpresa widget.
  TextEditingController? inputEmpresaController3;
  String? Function(BuildContext, String?)? inputEmpresaController3Validator;
  // State field(s) for inputEmpresa widget.
  TextEditingController? inputEmpresaController4;
  String? Function(BuildContext, String?)? inputEmpresaController4Validator;
  // State field(s) for inputEmpresa widget.
  TextEditingController? inputEmpresaController5;
  String? Function(BuildContext, String?)? inputEmpresaController5Validator;
  // State field(s) for inputEmpresa widget.
  TextEditingController? inputEmpresaController6;
  String? Function(BuildContext, String?)? inputEmpresaController6Validator;
  // State field(s) for inputModality widget.
  String? inputModalityValue;
  FormFieldController<String>? inputModalityValueController;
  // State field(s) for inputValue widget.
  TextEditingController? inputValueController;
  String? Function(BuildContext, String?)? inputValueControllerValidator;
  // State field(s) for inputDateStart widget.
  TextEditingController? inputDateStartController;
  final inputDateStartMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? inputDateStartControllerValidator;
  // State field(s) for inputDateEnd widget.
  TextEditingController? inputDateEndController;
  final inputDateEndMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? inputDateEndControllerValidator;
  // Stores action output result for [Backend Call - API (criarAlocacao)] action in Button widget.
  ApiCallResponse? criarAlocacaoResult;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    inputEmpresaController1?.dispose();
    inputEmpresaController2?.dispose();
    inputEmpresaController3?.dispose();
    inputEmpresaController4?.dispose();
    inputEmpresaController5?.dispose();
    inputEmpresaController6?.dispose();
    inputValueController?.dispose();
    inputDateStartController?.dispose();
    inputDateEndController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
