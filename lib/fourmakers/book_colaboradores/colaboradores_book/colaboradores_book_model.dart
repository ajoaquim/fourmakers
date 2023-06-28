import '/backend/api_requests/api_calls.dart';
import '/components/listas/empty_widget/empty_widget_widget.dart';
import '/components/side_bar_nav/side_bar_nav_widget.dart';
import '/components/tag_box/tag_box_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/fourmakers/book_colaboradores/modais/modal_projetos/modal_projetos_widget.dart';
import '/fourmakers/book_colaboradores/modais/modal_setup_inicial_book/modal_setup_inicial_book_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:data_table_2/data_table_2.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ColaboradoresBookModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (showMe)] action in colaboradoresBook widget.
  ApiCallResponse? apiResult2b3;
  // Stores action output result for [Backend Call - API (buscaHierarquia)] action in colaboradoresBook widget.
  ApiCallResponse? hierarquiaResponse;
  // Stores action output result for [Backend Call - API (Setup)] action in colaboradoresBook widget.
  ApiCallResponse? apiResultxyp;
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel;
  // Model for tagBox component.
  late TagBoxModel tagBoxModel1;
  // Model for tagBox component.
  late TagBoxModel tagBoxModel2;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarNavModel = createModel(context, () => SideBarNavModel());
    tagBoxModel1 = createModel(context, () => TagBoxModel());
    tagBoxModel2 = createModel(context, () => TagBoxModel());
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarNavModel.dispose();
    tagBoxModel1.dispose();
    tagBoxModel2.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
