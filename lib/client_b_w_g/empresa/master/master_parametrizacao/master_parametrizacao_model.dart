import '/backend/api_requests/api_calls.dart';
import '/components/side_bar_nav_empresa_o_l_d/side_bar_nav_empresa_o_l_d_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MasterParametrizacaoModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool tab1 = true;

  bool tab2 = false;

  bool? tab3;

  bool? tab4;

  dynamic parametrosMaster;

  double? irff;

  double? social;

  double? pis;

  double? cofins;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (showMePJ)] action in masterParametrizacao widget.
  ApiCallResponse? showPJ;
  // Model for sideBarNavEmpresaOLD component.
  late SideBarNavEmpresaOLDModel sideBarNavEmpresaOLDModel;
  // State field(s) for paraIRFF widget.
  TextEditingController? paraIRFFController;
  String? Function(BuildContext, String?)? paraIRFFControllerValidator;
  // State field(s) for paraSindical widget.
  TextEditingController? paraSindicalController;
  String? Function(BuildContext, String?)? paraSindicalControllerValidator;
  // State field(s) for paraPIS widget.
  TextEditingController? paraPISController;
  String? Function(BuildContext, String?)? paraPISControllerValidator;
  // State field(s) for paraCOFINS widget.
  TextEditingController? paraCOFINSController;
  String? Function(BuildContext, String?)? paraCOFINSControllerValidator;
  // Stores action output result for [Backend Call - API (postParametros)] action in Button widget.
  ApiCallResponse? editarParametros;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarNavEmpresaOLDModel =
        createModel(context, () => SideBarNavEmpresaOLDModel());
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarNavEmpresaOLDModel.dispose();
    paraIRFFController?.dispose();
    paraSindicalController?.dispose();
    paraPISController?.dispose();
    paraCOFINSController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
