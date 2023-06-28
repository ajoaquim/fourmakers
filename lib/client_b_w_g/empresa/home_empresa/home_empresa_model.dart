import '/backend/api_requests/api_calls.dart';
import '/client_b_w_g/empresa/apontamentos/modal_alterar_valor_apontamento/modal_alterar_valor_apontamento_widget.dart';
import '/client_b_w_g/empresa/apontamentos/modal_importar_apontamentos/modal_importar_apontamentos_widget.dart';
import '/client_b_w_g/empresa/side_bar_empresa/side_bar_empresa_widget.dart';
import '/components/blocked_page/blocked_page_widget.dart';
import '/components/listas/pdivazio/pdivazio_widget.dart';
import '/components/tag_box/tag_box_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class HomeEmpresaModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (empresaShowMe)] action in homeEmpresa widget.
  ApiCallResponse? apiResultsiu;
  // Model for sideBarEmpresa component.
  late SideBarEmpresaModel sideBarEmpresaModel;
  // Model for tagBox component.
  late TagBoxModel tagBoxModel1;
  // Model for tagBox component.
  late TagBoxModel tagBoxModel2;
  // Model for tagBox component.
  late TagBoxModel tagBoxModel3;
  // Model for tagBox component.
  late TagBoxModel tagBoxModel4;
  // Model for tagBox component.
  late TagBoxModel tagBoxModel5;
  // Model for tagBox component.
  late TagBoxModel tagBoxModel6;
  // Model for blockedPage component.
  late BlockedPageModel blockedPageModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarEmpresaModel = createModel(context, () => SideBarEmpresaModel());
    tagBoxModel1 = createModel(context, () => TagBoxModel());
    tagBoxModel2 = createModel(context, () => TagBoxModel());
    tagBoxModel3 = createModel(context, () => TagBoxModel());
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
    tagBoxModel4 = createModel(context, () => TagBoxModel());
    tagBoxModel5 = createModel(context, () => TagBoxModel());
    tagBoxModel6 = createModel(context, () => TagBoxModel());
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
    blockedPageModel = createModel(context, () => BlockedPageModel());
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarEmpresaModel.dispose();
    tagBoxModel1.dispose();
    tagBoxModel2.dispose();
    tagBoxModel3.dispose();
    tagBoxModel4.dispose();
    tagBoxModel5.dispose();
    tagBoxModel6.dispose();
    blockedPageModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
