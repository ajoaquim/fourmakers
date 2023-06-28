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

class MapaAlocacaoColaboradorModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (showMe)] action in mapaAlocacaoColaborador widget.
  ApiCallResponse? apiToken;
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel;
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for formData widget.
  TextEditingController? formDataController;
  final formDataMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? formDataControllerValidator;
  // State field(s) for formPlanAcao1 widget.
  TextEditingController? formPlanAcao1Controller1;
  String? Function(BuildContext, String?)? formPlanAcao1Controller1Validator;
  // State field(s) for formPlanAcao1 widget.
  TextEditingController? formPlanAcao1Controller2;
  String? Function(BuildContext, String?)? formPlanAcao1Controller2Validator;
  // State field(s) for formPlanAcao1 widget.
  TextEditingController? formPlanAcao1Controller3;
  String? Function(BuildContext, String?)? formPlanAcao1Controller3Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarNavModel = createModel(context, () => SideBarNavModel());
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarNavModel.dispose();
    textController1?.dispose();
    formDataController?.dispose();
    formPlanAcao1Controller1?.dispose();
    formPlanAcao1Controller2?.dispose();
    formPlanAcao1Controller3?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
