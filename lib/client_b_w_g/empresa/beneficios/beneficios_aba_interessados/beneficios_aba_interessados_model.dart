import '/backend/api_requests/api_calls.dart';
import '/client_b_w_g/empresa/side_bar_empresa/side_bar_empresa_widget.dart';
import '/components/listas/empty_widget/empty_widget_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:data_table_2/data_table_2.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class BeneficiosAbaInteressadosModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<dynamic> interessados = [];
  void addToInteressados(dynamic item) => interessados.add(item);
  void removeFromInteressados(dynamic item) => interessados.remove(item);
  void removeAtIndexFromInteressados(int index) => interessados.removeAt(index);
  void updateInteressadosAtIndex(int index, Function(dynamic) updateFn) =>
      interessados[index] = updateFn(interessados[index]);

  List<dynamic> interessdadosTodos = [];
  void addToInteressdadosTodos(dynamic item) => interessdadosTodos.add(item);
  void removeFromInteressdadosTodos(dynamic item) =>
      interessdadosTodos.remove(item);
  void removeAtIndexFromInteressdadosTodos(int index) =>
      interessdadosTodos.removeAt(index);
  void updateInteressdadosTodosAtIndex(int index, Function(dynamic) updateFn) =>
      interessdadosTodos[index] = updateFn(interessdadosTodos[index]);

  bool loading = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (getBeneficioByID)] action in beneficiosAbaInteressados widget.
  ApiCallResponse? beneficiosINTERESSADOS;
  // Model for sideBarEmpresa component.
  late SideBarEmpresaModel sideBarEmpresaModel;
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
