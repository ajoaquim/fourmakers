import '/backend/api_requests/api_calls.dart';
import '/components/listas/sem_certificados/sem_certificados_widget.dart';
import '/components/listas/sem_dominios/sem_dominios_widget.dart';
import '/components/listas/sem_hard_skills/sem_hard_skills_widget.dart';
import '/components/listas/sem_metodologias/sem_metodologias_widget.dart';
import '/components/modal_new_nivel_hard_skills/modal_new_nivel_hard_skills_widget.dart';
import '/components/modals/modal_new_dominio/modal_new_dominio_widget.dart';
import '/components/modals/modal_new_hard_skills/modal_new_hard_skills_widget.dart';
import '/components/modals/modal_new_idioma/modal_new_idioma_widget.dart';
import '/components/modals/modal_new_metodologia/modal_new_metodologia_widget.dart';
import '/components/modals/modal_new_nivel_dominio/modal_new_nivel_dominio_widget.dart';
import '/components/modals/modal_new_nivel_idioma/modal_new_nivel_idioma_widget.dart';
import '/components/modals/modal_new_nivel_metodologia/modal_new_nivel_metodologia_widget.dart';
import '/components/modals/modal_new_nivel_soft_skill/modal_new_nivel_soft_skill_widget.dart';
import '/components/modals/modal_new_soft_skills/modal_new_soft_skills_widget.dart';
import '/components/sem_idiomas/sem_idiomas_widget.dart';
import '/components/side_bar_nav/side_bar_nav_widget.dart';
import '/components/the_ultimate_nav_bar/the_ultimate_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class DadosProfissionaisCompetenciasModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (showMe)] action in DadosProfissionais_Competencias widget.
  ApiCallResponse? apiToken;
  // Stores action output result for [Backend Call - API (ListaHardSkillsColab)] action in DadosProfissionais_Competencias widget.
  ApiCallResponse? listaHardSkill;
  // Stores action output result for [Backend Call - API (ListaSoftskillsColaborador)] action in DadosProfissionais_Competencias widget.
  ApiCallResponse? listaSoftSkill;
  // Stores action output result for [Backend Call - API (ListarMetodologiasColaborador)] action in DadosProfissionais_Competencias widget.
  ApiCallResponse? listaMetodologias;
  // Stores action output result for [Backend Call - API (ListarDominioColaborador)] action in DadosProfissionais_Competencias widget.
  ApiCallResponse? listaDominios;
  // Stores action output result for [Backend Call - API (ListarIdiomasColaborador)] action in DadosProfissionais_Competencias widget.
  ApiCallResponse? listarIdiomas;
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel;
  // Stores action output result for [Backend Call - API (removeHardSkillsColab)] action in Icon widget.
  ApiCallResponse? apiResultqre;
  // Stores action output result for [Backend Call - API (ListaHardSkillsColab)] action in Icon widget.
  ApiCallResponse? removeuHardSkill;
  // Stores action output result for [Backend Call - API (RemoveSoftSkillColab)] action in Icon widget.
  ApiCallResponse? apiResultbhn;
  // Stores action output result for [Backend Call - API (ListaSoftskillsColaborador)] action in Icon widget.
  ApiCallResponse? excluiuSoftSkills;
  // Stores action output result for [Backend Call - API (removeMetodologiaColab)] action in Icon widget.
  ApiCallResponse? excluiMetodologia;
  // Stores action output result for [Backend Call - API (ListarMetodologiasColaborador)] action in Icon widget.
  ApiCallResponse? atualizaMetodologias;
  // Stores action output result for [Backend Call - API (removeDominioColab)] action in Icon widget.
  ApiCallResponse? excluiDominio;
  // Stores action output result for [Backend Call - API (ListarDominioColaborador)] action in Icon widget.
  ApiCallResponse? atualizaDominios;
  // Stores action output result for [Backend Call - API (removeIdiomaColab)] action in Icon widget.
  ApiCallResponse? excluiIdioma;
  // Stores action output result for [Backend Call - API (ListarIdiomasColaborador)] action in Icon widget.
  ApiCallResponse? atualizaIdiomas;
  // Model for TheUltimateNavBar component.
  late TheUltimateNavBarModel theUltimateNavBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarNavModel = createModel(context, () => SideBarNavModel());
    theUltimateNavBarModel =
        createModel(context, () => TheUltimateNavBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarNavModel.dispose();
    theUltimateNavBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
