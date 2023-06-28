import '/backend/api_requests/api_calls.dart';
import '/client_b_w_g/empresa/side_bar_empresa/side_bar_empresa_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DadosProjetosPJBackofficeModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool dadosPessoais = true;

  bool contato = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (obterProjetos)] action in dadosProjetosPJBackoffice widget.
  ApiCallResponse? projetosResponse;
  // Stores action output result for [Backend Call - API (Get PJ by ID)] action in dadosProjetosPJBackoffice widget.
  ApiCallResponse? apiResulti8b;
  // Model for sideBarEmpresa component.
  late SideBarEmpresaModel sideBarEmpresaModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarEmpresaModel = createModel(context, () => SideBarEmpresaModel());
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarEmpresaModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
