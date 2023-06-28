import '/backend/api_requests/api_calls.dart';
import '/components/blocked_page/blocked_page_widget.dart';
import '/components/side_bar_nav/side_bar_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class HomeCandidatoModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (showMe)] action in homeCandidato widget.
  ApiCallResponse? apiToken;
  // Stores action output result for [Backend Call - API (BuscaDadosColab)] action in homeCandidato widget.
  ApiCallResponse? apiBuscaDadosColab;
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel;
  // Model for blockedPage component.
  late BlockedPageModel blockedPageModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarNavModel = createModel(context, () => SideBarNavModel());
    blockedPageModel = createModel(context, () => BlockedPageModel());
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarNavModel.dispose();
    blockedPageModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
