import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/okr_components/modal_edit_iniciativa/modal_edit_iniciativa_widget.dart';
import '/okr_components/modal_excluir/modal_excluir_widget.dart';
import '/okr_components/okr_editar/okr_editar_widget.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OkrEditModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  // Stores action output result for [Backend Call - API (pausarOKR)] action in option widget.
  ApiCallResponse? pausarokr;
  // Stores action output result for [Backend Call - API (pausarObjetivoArea)] action in option widget.
  ApiCallResponse? pausarObjetivo;
  // Stores action output result for [Backend Call - API (pausarResultado)] action in option widget.
  ApiCallResponse? pausarResultado;
  // Stores action output result for [Backend Call - API (pausarIniciativa)] action in option widget.
  ApiCallResponse? pausarInicia;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
