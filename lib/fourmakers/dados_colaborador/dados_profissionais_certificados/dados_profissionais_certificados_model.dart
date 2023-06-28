import '/backend/api_requests/api_calls.dart';
import '/components/editar_certificado/editar_certificado_widget.dart';
import '/components/listas/sem_certificados/sem_certificados_widget.dart';
import '/components/modals/modal_excluir_certificado/modal_excluir_certificado_widget.dart';
import '/components/novo_certificado_step1/novo_certificado_step1_widget.dart';
import '/components/side_bar_nav/side_bar_nav_widget.dart';
import '/components/the_ultimate_nav_bar/the_ultimate_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class DadosProfissionaisCertificadosModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  dynamic meusCertificados;

  String? linkcertificado;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (showMe)] action in DadosProfissionais_Certificados widget.
  ApiCallResponse? apiToken;
  // Stores action output result for [Backend Call - API (ListaHardSkillsColab)] action in DadosProfissionais_Certificados widget.
  ApiCallResponse? apiResultt17;
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel;
  // Stores action output result for [Custom Action - findAndReplaceStringact] action in Button widget.
  String? link;
  // Model for TheUltimateNavBar component.
  late TheUltimateNavBarModel theUltimateNavBarModel;

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
