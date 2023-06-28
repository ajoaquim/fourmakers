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

class ModalEditDepenModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for depend1Nome widget.
  TextEditingController? depend1NomeController;
  String? Function(BuildContext, String?)? depend1NomeControllerValidator;
  String? _depend1NomeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informação obrigatória';
    }

    return null;
  }

  // State field(s) for dependDataNascimento widget.
  TextEditingController? dependDataNascimentoController;
  final dependDataNascimentoMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)?
      dependDataNascimentoControllerValidator;
  String? _dependDataNascimentoControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informação obrigatória';
    }

    return null;
  }

  // State field(s) for depend1CPF widget.
  TextEditingController? depend1CPFController;
  String? Function(BuildContext, String?)? depend1CPFControllerValidator;
  // State field(s) for depend1RG widget.
  TextEditingController? depend1RGController;
  String? Function(BuildContext, String?)? depend1RGControllerValidator;
  // State field(s) for DropDownTipoDepend widget.
  int? dropDownTipoDependValue;
  FormFieldController<int>? dropDownTipoDependValueController;
  // State field(s) for depend1Ajuda widget.
  TextEditingController? depend1AjudaController;
  String? Function(BuildContext, String?)? depend1AjudaControllerValidator;
  // Stores action output result for [Backend Call - API (EditaDependente)] action in Button widget.
  ApiCallResponse? atualizaDependente;
  // Stores action output result for [Backend Call - API (ListaDependentesColaborador)] action in Button widget.
  ApiCallResponse? apiResultyzk;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    depend1NomeControllerValidator = _depend1NomeControllerValidator;
    dependDataNascimentoControllerValidator =
        _dependDataNascimentoControllerValidator;
  }

  void dispose() {
    depend1NomeController?.dispose();
    dependDataNascimentoController?.dispose();
    depend1CPFController?.dispose();
    depend1RGController?.dispose();
    depend1AjudaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
