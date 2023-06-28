import '/backend/api_requests/api_calls.dart';
import '/client_b_w_g/empresa/beneficios/modal_cancelar_interesse/modal_cancelar_interesse_widget.dart';
import '/client_b_w_g/empresa/beneficios/modal_selecionar_comercial/modal_selecionar_comercial_widget.dart';
import '/client_b_w_g/prestador/side_bar_nav_p_j/side_bar_nav_p_j_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class BeneficiosDetalhesModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  dynamic beneficio;

  bool loading = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getBeneficioPrestadorById)] action in beneficiosDetalhes widget.
  ApiCallResponse? apiResultshc;
  // Model for sideBarNavPJ component.
  late SideBarNavPJModel sideBarNavPJModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarNavPJModel = createModel(context, () => SideBarNavPJModel());
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarNavPJModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
