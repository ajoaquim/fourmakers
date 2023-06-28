import '/backend/api_requests/api_calls.dart';
import '/client_b_w_g/empresa/apontamentos/modal_alterar_taxa_relatorio/modal_alterar_taxa_relatorio_widget.dart';
import '/client_b_w_g/empresa/apontamentos/modal_alterar_valor_taxa_relatorio/modal_alterar_valor_taxa_relatorio_widget.dart';
import '/client_b_w_g/empresa/side_bar_empresa/side_bar_empresa_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class RelatorioFaturamentoModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool procurado = false;

  dynamic consulta;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getEmpresa)] action in relatorioFaturamento widget.
  ApiCallResponse? empresas;
  // Model for sideBarEmpresa component.
  late SideBarEmpresaModel sideBarEmpresaModel;
  // State field(s) for DropEmpresa widget.
  String? dropEmpresaValue;
  FormFieldController<String>? dropEmpresaValueController;
  // State field(s) for inputInicio widget.
  TextEditingController? inputInicioController;
  final inputInicioMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? inputInicioControllerValidator;
  // State field(s) for inputFim widget.
  TextEditingController? inputFimController;
  final inputFimMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? inputFimControllerValidator;
  // Stores action output result for [Backend Call - API (relatorio)] action in Button widget.
  ApiCallResponse? apiResult1;
  // Stores action output result for [Backend Call - API (relatorio)] action in Button widget.
  ApiCallResponse? apiResult2;
  // Stores action output result for [Backend Call - API (relatorio)] action in Button widget.
  ApiCallResponse? apiResult3;
  // Stores action output result for [Backend Call - API (relatorio)] action in Button widget.
  ApiCallResponse? apiResult4;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarEmpresaModel = createModel(context, () => SideBarEmpresaModel());
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarEmpresaModel.dispose();
    inputInicioController?.dispose();
    inputFimController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
