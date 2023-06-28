import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class ModalAddContatoEmergModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for inputNomeContato widget.
  TextEditingController? inputNomeContatoController;
  String? Function(BuildContext, String?)? inputNomeContatoControllerValidator;
  String? _inputNomeContatoControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for DropDownParentesco widget.
  String? dropDownParentescoValue;
  FormFieldController<String>? dropDownParentescoValueController;
  // State field(s) for inputTelContato widget.
  TextEditingController? inputTelContatoController;
  final inputTelContatoMask = MaskTextInputFormatter(mask: '(##)#####-####');
  String? Function(BuildContext, String?)? inputTelContatoControllerValidator;
  String? _inputTelContatoControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (listarContatoEmerg)] action in Button widget.
  ApiCallResponse? apiResultkv8;
  // Stores action output result for [Backend Call - API (inserirContatoEmerg)] action in Button widget.
  ApiCallResponse? apiResultrrg;
  // Stores action output result for [Backend Call - API (listarContatoEmerg)] action in Button widget.
  ApiCallResponse? inseriuContatoEmerg;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    inputNomeContatoControllerValidator = _inputNomeContatoControllerValidator;
    inputTelContatoControllerValidator = _inputTelContatoControllerValidator;
  }

  void dispose() {
    inputNomeContatoController?.dispose();
    inputTelContatoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
