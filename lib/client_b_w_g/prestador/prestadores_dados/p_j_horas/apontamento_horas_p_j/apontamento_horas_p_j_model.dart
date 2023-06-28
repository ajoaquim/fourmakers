import '/backend/api_requests/api_calls.dart';
import '/client_b_w_g/prestador/prestadores_dados/p_j_horas/envio_horas_p_j/envio_horas_p_j_widget.dart';
import '/client_b_w_g/prestador/prestadores_dados/p_j_horas/envio_horas_p_jcoment/envio_horas_p_jcoment_widget.dart';
import '/client_b_w_g/prestador/side_bar_nav_p_j/side_bar_nav_p_j_widget.dart';
import '/components/listas/horas_vazias/horas_vazias_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:data_table_2/data_table_2.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ApontamentoHorasPJModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String? empresaNomeItem;

  String? projetoNomeItem;

  dynamic meusBeneficios;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (GetApontamentosPrestador)] action in apontamentoHorasPJ widget.
  ApiCallResponse? listarHoras;
  // Stores action output result for [Backend Call - API (getEmpresaPrestador)] action in apontamentoHorasPJ widget.
  ApiCallResponse? minhasEmpresas;
  // Model for sideBarNavPJ component.
  late SideBarNavPJModel sideBarNavPJModel;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarNavPJModel = createModel(context, () => SideBarNavPJModel());
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarNavPJModel.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
