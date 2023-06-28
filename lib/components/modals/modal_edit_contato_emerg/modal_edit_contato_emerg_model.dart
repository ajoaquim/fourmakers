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

class ModalEditContatoEmergModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for contatoNome widget.
  TextEditingController? contatoNomeController;
  String? Function(BuildContext, String?)? contatoNomeControllerValidator;
  // State field(s) for contatoPhone widget.
  TextEditingController? contatoPhoneController;
  final contatoPhoneMask = MaskTextInputFormatter(mask: '(##)#####-####');
  String? Function(BuildContext, String?)? contatoPhoneControllerValidator;
  // State field(s) for DropDownParentesco widget.
  String? dropDownParentescoValue;
  FormFieldController<String>? dropDownParentescoValueController;
  // Stores action output result for [Backend Call - API (alterarContatoEmerg)] action in Button widget.
  ApiCallResponse? apiResultrrg;
  // Stores action output result for [Backend Call - API (listarContatoEmerg)] action in Button widget.
  ApiCallResponse? alterouContatoEmerg;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    contatoNomeController?.dispose();
    contatoPhoneController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
