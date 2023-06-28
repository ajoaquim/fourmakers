import '/backend/api_requests/api_calls.dart';
import '/client_b_w_g/prestador/side_bar_nav_p_j/side_bar_nav_p_j_widget.dart';
import '/components/blocked_page/blocked_page_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class HomePJModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (showMePJ)] action in homePJ widget.
  ApiCallResponse? apiResultsiu;
  // Model for sideBarNavPJ component.
  late SideBarNavPJModel sideBarNavPJModel;
  // Model for blockedPage component.
  late BlockedPageModel blockedPageModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarNavPJModel = createModel(context, () => SideBarNavPJModel());
    blockedPageModel = createModel(context, () => BlockedPageModel());
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarNavPJModel.dispose();
    blockedPageModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
