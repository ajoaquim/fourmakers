import '/backend/api_requests/api_calls.dart';
import '/client_b_w_g/empresa/side_bar_empresa/side_bar_empresa_widget.dart';
import '/components/listas/empty_widget/empty_widget_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:data_table_2/data_table_2.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class BeneficiosModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<dynamic> beneficiosJSON = [];
  void addToBeneficiosJSON(dynamic item) => beneficiosJSON.add(item);
  void removeFromBeneficiosJSON(dynamic item) => beneficiosJSON.remove(item);
  void removeAtIndexFromBeneficiosJSON(int index) =>
      beneficiosJSON.removeAt(index);
  void updateBeneficiosJSONAtIndex(int index, Function(dynamic) updateFn) =>
      beneficiosJSON[index] = updateFn(beneficiosJSON[index]);

  List<dynamic> beneficiosJSONTodos = [];
  void addToBeneficiosJSONTodos(dynamic item) => beneficiosJSONTodos.add(item);
  void removeFromBeneficiosJSONTodos(dynamic item) =>
      beneficiosJSONTodos.remove(item);
  void removeAtIndexFromBeneficiosJSONTodos(int index) =>
      beneficiosJSONTodos.removeAt(index);
  void updateBeneficiosJSONTodosAtIndex(
          int index, Function(dynamic) updateFn) =>
      beneficiosJSONTodos[index] = updateFn(beneficiosJSONTodos[index]);

  bool loading = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (getBeneficios)] action in beneficios widget.
  ApiCallResponse? apiResult192;
  // Model for sideBarEmpresa component.
  late SideBarEmpresaModel sideBarEmpresaModel;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (getBeneficios)] action in Button widget.
  ApiCallResponse? getAtivos;
  // Stores action output result for [Backend Call - API (getBeneficios)] action in Button widget.
  ApiCallResponse? getTodos;
  // Stores action output result for [Backend Call - API (getBeneficios)] action in Button widget.
  ApiCallResponse? getInativos;

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
