import '/backend/api_requests/api_calls.dart';
import '/components/loading_modal/loading_modal_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoadingPJModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (showMePJ)] action in loadingPJ widget.
  ApiCallResponse? loadData;
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
