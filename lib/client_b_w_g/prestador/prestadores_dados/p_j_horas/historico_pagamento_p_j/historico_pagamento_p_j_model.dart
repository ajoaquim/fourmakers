import '/backend/api_requests/api_calls.dart';
import '/client_b_w_g/prestador/side_bar_nav_p_j/side_bar_nav_p_j_widget.dart';
import '/components/listas/aprovacao_horas_vazio/aprovacao_horas_vazio_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HistoricoPagamentoPJModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  dynamic meusPagamentos;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (getPagamentosPrestador)] action in historicoPagamentoPJ widget.
  ApiCallResponse? listarPagamentos;
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
