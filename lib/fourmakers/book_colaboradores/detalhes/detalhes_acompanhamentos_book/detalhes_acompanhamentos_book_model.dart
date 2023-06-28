import '/backend/api_requests/api_calls.dart';
import '/components/side_bar_nav/side_bar_nav_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/fourmakers/book_colaboradores/modais/modal_adicionar_anotacao/modal_adicionar_anotacao_widget.dart';
import '/fourmakers/book_colaboradores/modais/modal_show_observacoes/modal_show_observacoes_widget.dart';
import '/fourmakers/book_colaboradores/modais/modal_show_pontos_forca/modal_show_pontos_forca_widget.dart';
import '/fourmakers/book_colaboradores/modais/modal_show_pontos_melhoria/modal_show_pontos_melhoria_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:data_table_2/data_table_2.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetalhesAcompanhamentosBookModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (showMe)] action in DetalhesAcompanhamentosBook widget.
  ApiCallResponse? showMeResponse;
  // Stores action output result for [Backend Call - API (GetAcompanhamentosByColab)] action in DetalhesAcompanhamentosBook widget.
  ApiCallResponse? getAcompanhamentosResponse;
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarNavModel = createModel(context, () => SideBarNavModel());
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarNavModel.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
