import '/backend/api_requests/api_calls.dart';
import '/client_b_w_g/empresa/apontamentos/modal_alterar_horas_apontamento/modal_alterar_horas_apontamento_widget.dart';
import '/client_b_w_g/empresa/apontamentos/modal_alterar_valor_apontamento/modal_alterar_valor_apontamento_widget.dart';
import '/client_b_w_g/empresa/apontamentos/modal_aprovar_todos/modal_aprovar_todos_widget.dart';
import '/client_b_w_g/empresa/apontamentos/modal_exportar_apontamentos/modal_exportar_apontamentos_widget.dart';
import '/client_b_w_g/empresa/apontamentos/modal_grupo_apontamentos/modal_grupo_apontamentos_widget.dart';
import '/client_b_w_g/empresa/apontamentos/modal_importar_apontamentos/modal_importar_apontamentos_widget.dart';
import '/client_b_w_g/empresa/apontamentos/modal_inserir_comentario_aprovar_horas_item/modal_inserir_comentario_aprovar_horas_item_widget.dart';
import '/client_b_w_g/empresa/apontamentos/modal_processar_horas/modal_processar_horas_widget.dart';
import '/client_b_w_g/empresa/apontamentos/modal_recusar_todos/modal_recusar_todos_widget.dart';
import '/client_b_w_g/empresa/side_bar_empresa/side_bar_empresa_widget.dart';
import '/components/listas/aprovacao_horas_vazio/aprovacao_horas_vazio_widget.dart';
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
import 'package:provider/provider.dart';

class ApontamentosEmpresaCopyModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (getApontamentosPendentesEmpresa)] action in apontamentosEmpresaCopy widget.
  ApiCallResponse? apontamentoResponse;
  // Model for sideBarEmpresa component.
  late SideBarEmpresaModel sideBarEmpresaModel;
  // Stores action output result for [Backend Call - API (getApontamentosPendentesEmpresa)] action in Icon widget.
  ApiCallResponse? apontamentoResponse2;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

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
