import '/backend/api_requests/api_calls.dart';
import '/components/side_bar_nav/side_bar_nav_widget.dart';
import '/components/the_ultimate_nav_bar/the_ultimate_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class CriarpdiModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (showMe)] action in criarpdi widget.
  ApiCallResponse? apiToken;
  // Stores action output result for [Backend Call - API (buscaHierarquia)] action in criarpdi widget.
  ApiCallResponse? apiListaHierarquia;
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel;
  // State field(s) for DropDownColab widget.
  String? dropDownColabValue;
  FormFieldController<String>? dropDownColabValueController;
  // State field(s) for DropDownPP widget.
  String? dropDownPPValue;
  FormFieldController<String>? dropDownPPValueController;
  // State field(s) for meta1 widget.
  TextEditingController? meta1Controller;
  String? Function(BuildContext, String?)? meta1ControllerValidator;
  String? _meta1ControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  DateTime? datePicked1;
  // State field(s) for meta2 widget.
  TextEditingController? meta2Controller;
  String? Function(BuildContext, String?)? meta2ControllerValidator;
  String? _meta2ControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  DateTime? datePicked2;
  // State field(s) for meta3 widget.
  TextEditingController? meta3Controller;
  String? Function(BuildContext, String?)? meta3ControllerValidator;
  String? _meta3ControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  DateTime? datePicked3;
  // Model for TheUltimateNavBar component.
  late TheUltimateNavBarModel theUltimateNavBarModel;
  // Stores action output result for [Backend Call - API (criaPDIteste)] action in Button widget.
  ApiCallResponse? apiMetasCriadas;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarNavModel = createModel(context, () => SideBarNavModel());
    meta1ControllerValidator = _meta1ControllerValidator;
    meta2ControllerValidator = _meta2ControllerValidator;
    meta3ControllerValidator = _meta3ControllerValidator;
    theUltimateNavBarModel =
        createModel(context, () => TheUltimateNavBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarNavModel.dispose();
    meta1Controller?.dispose();
    meta2Controller?.dispose();
    meta3Controller?.dispose();
    theUltimateNavBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
