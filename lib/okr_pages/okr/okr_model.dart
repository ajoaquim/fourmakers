import '/backend/api_requests/api_calls.dart';
import '/components/side_bar_nav/side_bar_nav_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/okr_components/modal_add_objetivo/modal_add_objetivo_widget.dart';
import '/okr_components/modal_add_objetivo_area/modal_add_objetivo_area_widget.dart';
import '/okr_components/objetivo_area/objetivo_area_widget.dart';
import '/okr_components/objetivo_principal/objetivo_principal_widget.dart';
import '/okr_components/resultado_chave/resultado_chave_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class OkrModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool organizacao = true;

  bool area = false;

  bool loadingGeral = true;

  bool loadingArea = true;

  bool loadingResultado = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (showMe)] action in okr widget.
  ApiCallResponse? apiResultlwc;
  // Stores action output result for [Backend Call - API (getAllokr)] action in okr widget.
  ApiCallResponse? apiResultri9;
  // Stores action output result for [Backend Call - API (getAllObjetivosArea)] action in okr widget.
  ApiCallResponse? apiResultbb7;
  // Stores action output result for [Backend Call - API (getResultados)] action in okr widget.
  ApiCallResponse? apiResulttby;
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel;
  // State field(s) for DropDownArea widget.
  String? dropDownAreaValue;
  FormFieldController<String>? dropDownAreaValueController;
  // State field(s) for DropDownAno widget.
  String? dropDownAnoValue;
  FormFieldController<String>? dropDownAnoValueController;
  // State field(s) for DropDownQuarter widget.
  String? dropDownQuarterValue;
  FormFieldController<String>? dropDownQuarterValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarNavModel = createModel(context, () => SideBarNavModel());
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarNavModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
