import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ModalAddObjetivoAreaModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  int? idOkr;

  ///  State fields for stateful widgets in this component.

  DateTime? datePicked;
  // State field(s) for DropDownArea widget.
  String? dropDownAreaValue;
  FormFieldController<String>? dropDownAreaValueController;
  // State field(s) for DropDownObjetivo widget.
  String? dropDownObjetivoValue;
  FormFieldController<String>? dropDownObjetivoValueController;
  // State field(s) for inputTitulo widget.
  TextEditingController? inputTituloController;
  String? Function(BuildContext, String?)? inputTituloControllerValidator;
  // Stores action output result for [Backend Call - API (addObjetivodaArea)] action in Button widget.
  ApiCallResponse? apiResulthzg;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    inputTituloController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
