import '/backend/api_requests/api_calls.dart';
import '/components/listas/empty_widget/empty_widget_widget.dart';
import '/components/side_bar_nav/side_bar_nav_widget.dart';
import '/components/tag_box/tag_box_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:data_table_2/data_table_2.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class AusenciasBookModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  int inteiro1 = 1;

  int inteiro2 = 2;

  int inteiro3 = 3;

  int inteiro0 = 0;

  int inteiro4 = 4;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (showMe)] action in ausenciasBook widget.
  ApiCallResponse? showMeResponse;
  // Stores action output result for [Backend Call - API (GetAusenciaGestor)] action in ausenciasBook widget.
  ApiCallResponse? getAusenciasResponse;
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel;
  // Model for tagBox component.
  late TagBoxModel tagBoxModel1;
  // Model for tagBox component.
  late TagBoxModel tagBoxModel2;
  // Model for tagBox component.
  late TagBoxModel tagBoxModel3;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarNavModel = createModel(context, () => SideBarNavModel());
    tagBoxModel1 = createModel(context, () => TagBoxModel());
    tagBoxModel2 = createModel(context, () => TagBoxModel());
    tagBoxModel3 = createModel(context, () => TagBoxModel());
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarNavModel.dispose();
    tagBoxModel1.dispose();
    tagBoxModel2.dispose();
    tagBoxModel3.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
