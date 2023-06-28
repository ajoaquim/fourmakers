import '/backend/api_requests/api_calls.dart';
import '/components/listas/aprovacao_horas_vazio/aprovacao_horas_vazio_widget.dart';
import '/components/side_bar_nav/side_bar_nav_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/mapa_alocacao/modal_alocacao/modal_alocacao_widget.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class MapaAlocacaoProjetoModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (showMe)] action in mapaAlocacaoProjeto widget.
  ApiCallResponse? apiToken;
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel;
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for formData widget.
  TextEditingController? formDataController1;
  final formDataMask1 = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? formDataController1Validator;
  // State field(s) for formData widget.
  TextEditingController? formDataController2;
  final formDataMask2 = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? formDataController2Validator;
  // State field(s) for formPlanAcao1 widget.
  TextEditingController? formPlanAcao1Controller1;
  String? Function(BuildContext, String?)? formPlanAcao1Controller1Validator;
  // State field(s) for formPlanAcao1 widget.
  TextEditingController? formPlanAcao1Controller2;
  String? Function(BuildContext, String?)? formPlanAcao1Controller2Validator;
  // State field(s) for formPlanAcao1 widget.
  TextEditingController? formPlanAcao1Controller3;
  String? Function(BuildContext, String?)? formPlanAcao1Controller3Validator;
  // State field(s) for formPlanAcao1 widget.
  TextEditingController? formPlanAcao1Controller4;
  String? Function(BuildContext, String?)? formPlanAcao1Controller4Validator;
  // State field(s) for formPlanAcao1 widget.
  TextEditingController? formPlanAcao1Controller5;
  String? Function(BuildContext, String?)? formPlanAcao1Controller5Validator;
  // State field(s) for formPlanAcao1 widget.
  TextEditingController? formPlanAcao1Controller6;
  String? Function(BuildContext, String?)? formPlanAcao1Controller6Validator;
  // State field(s) for formPlanAcao1 widget.
  TextEditingController? formPlanAcao1Controller7;
  String? Function(BuildContext, String?)? formPlanAcao1Controller7Validator;
  // State field(s) for formPlanAcao1 widget.
  TextEditingController? formPlanAcao1Controller8;
  String? Function(BuildContext, String?)? formPlanAcao1Controller8Validator;
  // State field(s) for formPlanAcao1 widget.
  TextEditingController? formPlanAcao1Controller9;
  String? Function(BuildContext, String?)? formPlanAcao1Controller9Validator;
  // State field(s) for formPlanAcao1 widget.
  TextEditingController? formPlanAcao1Controller10;
  String? Function(BuildContext, String?)? formPlanAcao1Controller10Validator;
  // State field(s) for formPlanAcao1 widget.
  TextEditingController? formPlanAcao1Controller11;
  String? Function(BuildContext, String?)? formPlanAcao1Controller11Validator;
  // State field(s) for formPlanAcao1 widget.
  TextEditingController? formPlanAcao1Controller12;
  String? Function(BuildContext, String?)? formPlanAcao1Controller12Validator;
  // State field(s) for formPlanAcao1 widget.
  TextEditingController? formPlanAcao1Controller13;
  String? Function(BuildContext, String?)? formPlanAcao1Controller13Validator;
  // State field(s) for formPlanAcao1 widget.
  TextEditingController? formPlanAcao1Controller14;
  String? Function(BuildContext, String?)? formPlanAcao1Controller14Validator;
  // State field(s) for formPlanAcao1 widget.
  TextEditingController? formPlanAcao1Controller15;
  String? Function(BuildContext, String?)? formPlanAcao1Controller15Validator;
  // State field(s) for formPlanAcao1 widget.
  TextEditingController? formPlanAcao1Controller16;
  String? Function(BuildContext, String?)? formPlanAcao1Controller16Validator;
  // State field(s) for formPlanAcao1 widget.
  TextEditingController? formPlanAcao1Controller17;
  String? Function(BuildContext, String?)? formPlanAcao1Controller17Validator;
  // State field(s) for formPlanAcao1 widget.
  TextEditingController? formPlanAcao1Controller18;
  String? Function(BuildContext, String?)? formPlanAcao1Controller18Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarNavModel = createModel(context, () => SideBarNavModel());
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarNavModel.dispose();
    textController1?.dispose();
    formDataController1?.dispose();
    formDataController2?.dispose();
    formPlanAcao1Controller1?.dispose();
    formPlanAcao1Controller2?.dispose();
    formPlanAcao1Controller3?.dispose();
    formPlanAcao1Controller4?.dispose();
    formPlanAcao1Controller5?.dispose();
    formPlanAcao1Controller6?.dispose();
    formPlanAcao1Controller7?.dispose();
    formPlanAcao1Controller8?.dispose();
    formPlanAcao1Controller9?.dispose();
    formPlanAcao1Controller10?.dispose();
    formPlanAcao1Controller11?.dispose();
    formPlanAcao1Controller12?.dispose();
    formPlanAcao1Controller13?.dispose();
    formPlanAcao1Controller14?.dispose();
    formPlanAcao1Controller15?.dispose();
    formPlanAcao1Controller16?.dispose();
    formPlanAcao1Controller17?.dispose();
    formPlanAcao1Controller18?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
