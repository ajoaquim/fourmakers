import '/backend/api_requests/api_calls.dart';
import '/client_b_w_g/empresa/projetos/modal_vincular_prestador_step1/modal_vincular_prestador_step1_widget.dart';
import '/client_b_w_g/empresa/side_bar_empresa/side_bar_empresa_widget.dart';
import '/components/listas/pdivazio/pdivazio_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
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
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class VerprojetoModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (obterAlocacoes)] action in verprojeto widget.
  ApiCallResponse? obterAlocacoesResult;
  // Stores action output result for [Backend Call - API (obterAlocacoes)] action in verprojeto widget.
  ApiCallResponse? apiResulttyi;
  // Model for sideBarEmpresa component.
  late SideBarEmpresaModel sideBarEmpresaModel;
  // State field(s) for projetoNome widget.
  TextEditingController? projetoNomeController;
  String? Function(BuildContext, String?)? projetoNomeControllerValidator;
  // State field(s) for dataInicial widget.
  TextEditingController? dataInicialController;
  final dataInicialMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? dataInicialControllerValidator;
  // State field(s) for dataFinal widget.
  TextEditingController? dataFinalController;
  final dataFinalMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? dataFinalControllerValidator;
  // Stores action output result for [Backend Call - API (editarProjeto)] action in salvaProjeto widget.
  ApiCallResponse? apiResultsv6;
  // State field(s) for TextField widget.
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // Stores action output result for [Backend Call - API (obterProjetos)] action in Button widget.
  ApiCallResponse? allAllocations;
  // Stores action output result for [Backend Call - API (obterProjetos)] action in Button widget.
  ApiCallResponse? activeAllocations;
  // Stores action output result for [Backend Call - API (obterProjetos)] action in Button widget.
  ApiCallResponse? completedAllocations;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarEmpresaModel = createModel(context, () => SideBarEmpresaModel());
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarEmpresaModel.dispose();
    projetoNomeController?.dispose();
    dataInicialController?.dispose();
    dataFinalController?.dispose();
    textController4?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
