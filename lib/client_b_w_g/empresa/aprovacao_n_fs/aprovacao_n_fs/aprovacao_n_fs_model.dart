import '/backend/api_requests/api_calls.dart';
import '/client_b_w_g/empresa/aprovacao_n_fs/modal_aprovar_todos_nota/modal_aprovar_todos_nota_widget.dart';
import '/client_b_w_g/empresa/aprovacao_n_fs/modal_grupo_apontamentos_nota/modal_grupo_apontamentos_nota_widget.dart';
import '/client_b_w_g/empresa/aprovacao_n_fs/modal_inserir_comentario_aprovar_nota_item/modal_inserir_comentario_aprovar_nota_item_widget.dart';
import '/client_b_w_g/empresa/aprovacao_n_fs/modal_processar_notas/modal_processar_notas_widget.dart';
import '/client_b_w_g/empresa/modal_recusar_todos_nota/modal_recusar_todos_nota_widget.dart';
import '/client_b_w_g/empresa/side_bar_empresa/side_bar_empresa_widget.dart';
import '/components/listas/aprovacao_horas_vazio/aprovacao_horas_vazio_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AprovacaoNFsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (notasFiscaisEmpresa)] action in aprovacaoNFs widget.
  ApiCallResponse? nfResponse;
  // Model for sideBarEmpresa component.
  late SideBarEmpresaModel sideBarEmpresaModel;
  // Stores action output result for [Backend Call - API (notasFiscaisEmpresa)] action in Icon widget.
  ApiCallResponse? nfResponse2;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for DropDown widget.
  int? dropDownValue;
  FormFieldController<int>? dropDownValueController;
  // Stores action output result for [Backend Call - API (notasFiscaisEmpresa)] action in DropDown widget.
  ApiCallResponse? nfResponse3;

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
