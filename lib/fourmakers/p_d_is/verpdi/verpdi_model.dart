import '/backend/api_requests/api_calls.dart';
import '/components/listas/pdi_sem_plano/pdi_sem_plano_widget.dart';
import '/components/modals/modal_finalizou_p_d_i/modal_finalizou_p_d_i_widget.dart';
import '/components/side_bar_nav/side_bar_nav_widget.dart';
import '/components/the_ultimate_nav_bar/the_ultimate_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class VerpdiModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  dynamic meuPlanos;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey3 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (showMe)] action in verpdi widget.
  ApiCallResponse? apiToken;
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel;
  Completer<ApiCallResponse>? apiRequestCompleter1;
  // State field(s) for formPlanAcao1 widget.
  TextEditingController? formPlanAcao1Controller;
  String? Function(BuildContext, String?)? formPlanAcao1ControllerValidator;
  String? _formPlanAcao1ControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for formData widget.
  TextEditingController? formDataController;
  final formDataMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? formDataControllerValidator;
  String? _formDataControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  DateTime? datePicked;
  // Stores action output result for [Custom Action - criaJsonObj] action in Button widget.
  dynamic? jsonMontado;
  // Stores action output result for [Custom Action - criaJsonObj2] action in Button widget.
  dynamic? planosString;
  // Model for PdiSemPlano component.
  late PdiSemPlanoModel pdiSemPlanoModel;
  // Stores action output result for [Custom Action - criaJsonObj2] action in Icon widget.
  dynamic? excluirplanosString;
  Completer<ApiCallResponse>? apiRequestCompleter2;
  // Model for TheUltimateNavBar component.
  late TheUltimateNavBarModel theUltimateNavBarModel;
  // Stores action output result for [Backend Call - API (addPlanoAcao)] action in Button widget.
  ApiCallResponse? enviaPlano;
  // Stores action output result for [Backend Call - API (editPDI)] action in Button widget.
  ApiCallResponse? apiAprovaPDI;
  // State field(s) for MotivoCancelamento widget.
  TextEditingController? motivoCancelamentoController;
  String? Function(BuildContext, String?)?
      motivoCancelamentoControllerValidator;
  String? _motivoCancelamentoControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (editPDI)] action in Button widget.
  ApiCallResponse? cancelaPDI;
  // Stores action output result for [Backend Call - API (editPlano)] action in Button widget.
  ApiCallResponse? apiTaskRealizada;
  // Stores action output result for [Backend Call - API (verPDI)] action in Button widget.
  ApiCallResponse? verpdi;
  // Stores action output result for [Backend Call - API (editPDI)] action in Button widget.
  ApiCallResponse? apiResultkow;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarNavModel = createModel(context, () => SideBarNavModel());
    formPlanAcao1ControllerValidator = _formPlanAcao1ControllerValidator;
    formDataControllerValidator = _formDataControllerValidator;
    pdiSemPlanoModel = createModel(context, () => PdiSemPlanoModel());
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
    theUltimateNavBarModel =
        createModel(context, () => TheUltimateNavBarModel());
    motivoCancelamentoControllerValidator =
        _motivoCancelamentoControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarNavModel.dispose();
    formPlanAcao1Controller?.dispose();
    formDataController?.dispose();
    pdiSemPlanoModel.dispose();
    theUltimateNavBarModel.dispose();
    motivoCancelamentoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForApiRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
