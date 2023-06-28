import '/backend/api_requests/api_calls.dart';
import '/components/listas/sem_certificados2/sem_certificados2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class MycvModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool loading = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getByLink)] action in mycv widget.
  ApiCallResponse? listaDadosCv;
  // Stores action output result for [Backend Call - API (getByLink)] action in Text widget.
  ApiCallResponse? apiResulterg;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
