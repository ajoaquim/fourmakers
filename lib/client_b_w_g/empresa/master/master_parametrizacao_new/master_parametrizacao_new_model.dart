import '/backend/api_requests/api_calls.dart';
import '/client_b_w_g/empresa/side_bar_empresa/side_bar_empresa_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MasterParametrizacaoNewModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool tab1 = true;

  bool tab2 = false;

  bool? tab3 = false;

  bool? tab4 = false;

  dynamic parametrosMaster;

  String? irff;

  String? social;

  String? pis;

  String? cofins;

  List<dynamic> listaParametros = [];
  void addToListaParametros(dynamic item) => listaParametros.add(item);
  void removeFromListaParametros(dynamic item) => listaParametros.remove(item);
  void removeAtIndexFromListaParametros(int index) =>
      listaParametros.removeAt(index);
  void updateListaParametrosAtIndex(int index, Function(dynamic) updateFn) =>
      listaParametros[index] = updateFn(listaParametros[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideBarEmpresa component.
  late SideBarEmpresaModel sideBarEmpresaModel;
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
  Completer<ApiCallResponse>? apiRequestCompleter;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarEmpresaModel = createModel(context, () => SideBarEmpresaModel());
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarEmpresaModel.dispose();
    paraIRFFController?.dispose();
    paraSindicalController?.dispose();
    paraPISController?.dispose();
    paraCOFINSController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
