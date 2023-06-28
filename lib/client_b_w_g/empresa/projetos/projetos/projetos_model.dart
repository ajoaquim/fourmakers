import '/backend/api_requests/api_calls.dart';
import '/client_b_w_g/empresa/side_bar_empresa/side_bar_empresa_widget.dart';
import '/components/listas/pdivazio/pdivazio_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProjetosModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (getEmpresaProjetos)] action in projetos widget.
  ApiCallResponse? apiMyProjects;
  // Stores action output result for [Backend Call - API (obterPrestadoresAtuantes)] action in projetos widget.
  ApiCallResponse? alocacoesResult;
  // Model for sideBarEmpresa component.
  late SideBarEmpresaModel sideBarEmpresaModel;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (obterProjetos)] action in Button widget.
  ApiCallResponse? allProjects;
  // Stores action output result for [Backend Call - API (obterProjetosFiltrados)] action in Button widget.
  ApiCallResponse? activeProjects;
  // Stores action output result for [Backend Call - API (obterProjetosFiltrados)] action in Button widget.
  ApiCallResponse? completedProjects;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarEmpresaModel = createModel(context, () => SideBarEmpresaModel());
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarEmpresaModel.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
