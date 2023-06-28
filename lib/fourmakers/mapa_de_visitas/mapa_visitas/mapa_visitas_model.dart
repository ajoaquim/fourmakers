import '/backend/api_requests/api_calls.dart';
import '/components/listas/leads_vazios/leads_vazios_widget.dart';
import '/components/side_bar_nav/side_bar_nav_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:data_table_2/data_table_2.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MapaVisitasModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<dynamic> meusLeads = [];
  void addToMeusLeads(dynamic item) => meusLeads.add(item);
  void removeFromMeusLeads(dynamic item) => meusLeads.remove(item);
  void removeAtIndexFromMeusLeads(int index) => meusLeads.removeAt(index);
  void updateMeusLeadsAtIndex(int index, Function(dynamic) updateFn) =>
      meusLeads[index] = updateFn(meusLeads[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (showMe)] action in MapaVisitas widget.
  ApiCallResponse? apiResult8bq;
  // Stores action output result for [Backend Call - API (ListarLeads)] action in MapaVisitas widget.
  ApiCallResponse? apiResultfz4;
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel;
  // State field(s) for FiltrosRapidos widget.
  TextEditingController? filtrosRapidosController;
  String? Function(BuildContext, String?)? filtrosRapidosControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarNavModel = createModel(context, () => SideBarNavModel());
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarNavModel.dispose();
    filtrosRapidosController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
