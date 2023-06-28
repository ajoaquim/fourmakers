import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ModalAddObjetivoModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  DateTime? datePicked;
  // State field(s) for inputObjetivo widget.
  TextEditingController? inputObjetivoController;
  String? Function(BuildContext, String?)? inputObjetivoControllerValidator;
  // Stores action output result for [Backend Call - API (addObjetivoPrincipal)] action in Button widget.
  ApiCallResponse? addObjetivo;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    inputObjetivoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
