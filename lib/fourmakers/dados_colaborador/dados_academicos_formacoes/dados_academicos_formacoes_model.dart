import '/backend/api_requests/api_calls.dart';
import '/components/listas/sem_formacoes/sem_formacoes_widget.dart';
import '/components/modals/modal_edita_escolaridade/modal_edita_escolaridade_widget.dart';
import '/components/modals/modal_new_formacao/modal_new_formacao_widget.dart';
import '/components/side_bar_nav/side_bar_nav_widget.dart';
import '/components/the_ultimate_nav_bar/the_ultimate_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class DadosAcademicosFormacoesModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (showMe)] action in DadosAcademicos_Formacoes widget.
  ApiCallResponse? apiToken;
  // Stores action output result for [Backend Call - API (listarEscolaridadeColaborador)] action in DadosAcademicos_Formacoes widget.
  ApiCallResponse? apiListaFormacaoColab;
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel;
  // Model for TheUltimateNavBar component.
  late TheUltimateNavBarModel theUltimateNavBarModel;
  // Stores action output result for [Backend Call - API (removerEscolaridadeColaborador)] action in Button widget.
  ApiCallResponse? apiResult300;
  // Stores action output result for [Backend Call - API (listarEscolaridadeColaborador)] action in Button widget.
  ApiCallResponse? apiAtualizaEscolaridade;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarNavModel = createModel(context, () => SideBarNavModel());
    theUltimateNavBarModel =
        createModel(context, () => TheUltimateNavBarModel());
  }

  void dispose() {
    sideBarNavModel.dispose();
    theUltimateNavBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
