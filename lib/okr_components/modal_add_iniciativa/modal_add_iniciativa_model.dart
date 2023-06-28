import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class ModalAddIniciativaModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for inputColaborador widget.
  TextEditingController? inputColaboradorController;
  String? Function(BuildContext, String?)? inputColaboradorControllerValidator;
  // State field(s) for inputDataLimite widget.
  TextEditingController? inputDataLimiteController;
  final inputDataLimiteMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? inputDataLimiteControllerValidator;
  // State field(s) for DropDownStatus widget.
  String? dropDownStatusValue;
  FormFieldController<String>? dropDownStatusValueController;
  // State field(s) for inputInicitaiva widget.
  TextEditingController? inputInicitaivaController;
  String? Function(BuildContext, String?)? inputInicitaivaControllerValidator;
  // Stores action output result for [Backend Call - API (addIniciativa)] action in Button widget.
  ApiCallResponse? apiResultral;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    inputColaboradorController?.dispose();
    inputDataLimiteController?.dispose();
    inputInicitaivaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
