import '/backend/api_requests/api_calls.dart';
import '/components/loading_modal/loading_modal_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginSlide2Model extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool? loadingModal = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (GetAccessToken)] action in loginSlide2 widget.
  ApiCallResponse? apiAccessToken;
  // Stores action output result for [Backend Call - API (BuscaDadosNew)] action in loginSlide2 widget.
  ApiCallResponse? apiBuscaDadosColab;
  // Stores action output result for [Backend Call - API (PrimeiroAcesso)] action in Button widget.
  ApiCallResponse? apiResultwog;
  // Model for loadingModal component.
  late LoadingModalModel loadingModalModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    loadingModalModel = createModel(context, () => LoadingModalModel());
  }

  void dispose() {
    unfocusNode.dispose();
    loadingModalModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
