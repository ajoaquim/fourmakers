import '/backend/api_requests/api_calls.dart';
import '/client_b_w_g/empresa/side_bar_empresa/side_bar_empresa_widget.dart';
import '/components/listas/empty_widget/empty_widget_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
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

class BeneficiosAbaComerciaisModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<dynamic> comerciais = [];
  void addToComerciais(dynamic item) => comerciais.add(item);
  void removeFromComerciais(dynamic item) => comerciais.remove(item);
  void removeAtIndexFromComerciais(int index) => comerciais.removeAt(index);
  void updateComerciaisAtIndex(int index, Function(dynamic) updateFn) =>
      comerciais[index] = updateFn(comerciais[index]);

  List<dynamic> comerciaisTodos = [];
  void addToComerciaisTodos(dynamic item) => comerciaisTodos.add(item);
  void removeFromComerciaisTodos(dynamic item) => comerciaisTodos.remove(item);
  void removeAtIndexFromComerciaisTodos(int index) =>
      comerciaisTodos.removeAt(index);
  void updateComerciaisTodosAtIndex(int index, Function(dynamic) updateFn) =>
      comerciaisTodos[index] = updateFn(comerciaisTodos[index]);

  bool loading = true;

  bool add = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (getBeneficioByID)] action in beneficiosAbaComerciais widget.
  ApiCallResponse? detalhesBeneficio;
  // Model for sideBarEmpresa component.
  late SideBarEmpresaModel sideBarEmpresaModel;
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for perguntaBeneficio widget.
  TextEditingController? perguntaBeneficioController1;
  String? Function(BuildContext, String?)?
      perguntaBeneficioController1Validator;
  // State field(s) for perguntaBeneficio widget.
  TextEditingController? perguntaBeneficioController2;
  String? Function(BuildContext, String?)?
      perguntaBeneficioController2Validator;
  // State field(s) for perguntaBeneficio widget.
  TextEditingController? perguntaBeneficioController3;
  String? Function(BuildContext, String?)?
      perguntaBeneficioController3Validator;
  // State field(s) for respostaBeneficio widget.
  TextEditingController? respostaBeneficioController;
  String? Function(BuildContext, String?)? respostaBeneficioControllerValidator;
  // Stores action output result for [Backend Call - API (addComercial)] action in Button widget.
  ApiCallResponse? apiResult5pb;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarEmpresaModel = createModel(context, () => SideBarEmpresaModel());
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarEmpresaModel.dispose();
    textController1?.dispose();
    perguntaBeneficioController1?.dispose();
    perguntaBeneficioController2?.dispose();
    perguntaBeneficioController3?.dispose();
    respostaBeneficioController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
