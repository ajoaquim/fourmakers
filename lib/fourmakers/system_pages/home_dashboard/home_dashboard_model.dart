import '/backend/api_requests/api_calls.dart';
import '/components/blocked_page/blocked_page_widget.dart';
import '/components/feliz_escolha/feliz_escolha_widget.dart';
import '/components/feliz_motivado/feliz_motivado_widget.dart';
import '/components/listas/pdivazio/pdivazio_widget.dart';
import '/components/side_bar_nav/side_bar_nav_widget.dart';
import '/components/the_ultimate_nav_bar/the_ultimate_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class HomeDashboardModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String? forcaPerfil1 = 'Forca 1';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (showMe)] action in homeDashboard widget.
  ApiCallResponse? apiToken;
  // Stores action output result for [Backend Call - API (listaUltimosPDIs)] action in homeDashboard widget.
  ApiCallResponse? apiListaMeusPdisx;
  // Stores action output result for [Backend Call - API (listaForcaPerfil)] action in homeDashboard widget.
  ApiCallResponse? listouForca;
  // Stores action output result for [Backend Call - API (BuscaDadosNew)] action in homeDashboard widget.
  ApiCallResponse? carregouDadosPessoais;
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel;
  // Model for TheUltimateNavBar component.
  late TheUltimateNavBarModel theUltimateNavBarModel;
  // Model for felizMotivado component.
  late FelizMotivadoModel felizMotivadoModel1;
  // Model for felizMotivado component.
  late FelizMotivadoModel felizMotivadoModel2;
  // Model for felizMotivado component.
  late FelizMotivadoModel felizMotivadoModel3;
  // Model for felizMotivado component.
  late FelizMotivadoModel felizMotivadoModel4;
  // Model for felizMotivado component.
  late FelizMotivadoModel felizMotivadoModel5;
  // Model for felizMotivado component.
  late FelizMotivadoModel felizMotivadoModel6;
  // Model for felizMotivado component.
  late FelizMotivadoModel felizMotivadoModel7;
  // Model for felizMotivado component.
  late FelizMotivadoModel felizMotivadoModel8;
  // Model for felizEscolha component.
  late FelizEscolhaModel felizEscolhaModel;
  // State field(s) for TituloOutroSentimento widget.
  TextEditingController? tituloOutroSentimentoController;
  String? Function(BuildContext, String?)?
      tituloOutroSentimentoControllerValidator;
  // State field(s) for DescricaoSentimento widget.
  TextEditingController? descricaoSentimentoController;
  String? Function(BuildContext, String?)?
      descricaoSentimentoControllerValidator;
  // Stores action output result for [Backend Call - API (criaFelizometro)] action in Button widget.
  ApiCallResponse? felizometroCriado;
  // Model for blockedPage component.
  late BlockedPageModel blockedPageModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarNavModel = createModel(context, () => SideBarNavModel());
    theUltimateNavBarModel =
        createModel(context, () => TheUltimateNavBarModel());
    felizMotivadoModel1 = createModel(context, () => FelizMotivadoModel());
    felizMotivadoModel2 = createModel(context, () => FelizMotivadoModel());
    felizMotivadoModel3 = createModel(context, () => FelizMotivadoModel());
    felizMotivadoModel4 = createModel(context, () => FelizMotivadoModel());
    felizMotivadoModel5 = createModel(context, () => FelizMotivadoModel());
    felizMotivadoModel6 = createModel(context, () => FelizMotivadoModel());
    felizMotivadoModel7 = createModel(context, () => FelizMotivadoModel());
    felizMotivadoModel8 = createModel(context, () => FelizMotivadoModel());
    felizEscolhaModel = createModel(context, () => FelizEscolhaModel());
    blockedPageModel = createModel(context, () => BlockedPageModel());
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarNavModel.dispose();
    theUltimateNavBarModel.dispose();
    felizMotivadoModel1.dispose();
    felizMotivadoModel2.dispose();
    felizMotivadoModel3.dispose();
    felizMotivadoModel4.dispose();
    felizMotivadoModel5.dispose();
    felizMotivadoModel6.dispose();
    felizMotivadoModel7.dispose();
    felizMotivadoModel8.dispose();
    felizEscolhaModel.dispose();
    tituloOutroSentimentoController?.dispose();
    descricaoSentimentoController?.dispose();
    blockedPageModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
