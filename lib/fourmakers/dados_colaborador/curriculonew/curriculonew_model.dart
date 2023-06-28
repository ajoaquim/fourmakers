import '/backend/api_requests/api_calls.dart';
import '/components/listas/sem_certificados2/sem_certificados2_widget.dart';
import '/components/modals/modal_gerar_link/modal_gerar_link_widget.dart';
import '/components/modals/modal_link_gerado/modal_link_gerado_widget.dart';
import '/components/side_bar_nav/side_bar_nav_widget.dart';
import '/components/the_ultimate_nav_bar/the_ultimate_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CurriculonewModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (ListaHardSkillsColab)] action in curriculonew widget.
  ApiCallResponse? listaHardSkill;
  // Stores action output result for [Backend Call - API (ListaSoftskillsColaborador)] action in curriculonew widget.
  ApiCallResponse? listaSoftSkill;
  // Stores action output result for [Backend Call - API (ListarMetodologiasColaborador)] action in curriculonew widget.
  ApiCallResponse? listaMetodologias;
  // Stores action output result for [Backend Call - API (ListarDominioColaborador)] action in curriculonew widget.
  ApiCallResponse? listaDominios;
  // Stores action output result for [Backend Call - API (ListarIdiomasColaborador)] action in curriculonew widget.
  ApiCallResponse? listarIdiomas;
  // Stores action output result for [Backend Call - API (listaExperienciaProfissional)] action in curriculonew widget.
  ApiCallResponse? listaexpprofissionais;
  // Stores action output result for [Backend Call - API (listarEscolaridadeColaborador)] action in curriculonew widget.
  ApiCallResponse? apiListaFormacaoColab;
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel;
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
