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

class ModalAlocacaoModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for inputGestor widget.
  String? inputGestorValue;
  FormFieldController<String>? inputGestorValueController;
  // State field(s) for inputProjeto widget.
  String? inputProjetoValue;
  FormFieldController<String>? inputProjetoValueController;
  // State field(s) for inputColaborador widget.
  String? inputColaboradorValue;
  FormFieldController<String>? inputColaboradorValueController;
  // State field(s) for inputDateStart widget.
  TextEditingController? inputDateStartController;
  final inputDateStartMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? inputDateStartControllerValidator;
  // State field(s) for inputDateEnd widget.
  TextEditingController? inputDateEndController;
  final inputDateEndMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? inputDateEndControllerValidator;
  // State field(s) for inputHoraspordia widget.
  TextEditingController? inputHoraspordiaController;
  final inputHoraspordiaMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? inputHoraspordiaControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    inputDateStartController?.dispose();
    inputDateEndController?.dispose();
    inputHoraspordiaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
