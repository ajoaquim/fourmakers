import '/backend/api_requests/api_calls.dart';
import '/components/side_bar_nav/side_bar_nav_widget.dart';
import '/components/the_ultimate_nav_bar/the_ultimate_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SupportModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel;
  // State field(s) for assunto widget.
  TextEditingController? assuntoController;
  String? Function(BuildContext, String?)? assuntoControllerValidator;
  // State field(s) for DropDownParentesco widget.
  String? dropDownParentescoValue;
  FormFieldController<String>? dropDownParentescoValueController;
  // State field(s) for descricao widget.
  TextEditingController? descricaoController;
  String? Function(BuildContext, String?)? descricaoControllerValidator;
  // Stores action output result for [Backend Call - API (PostTicket)] action in Button widget.
  ApiCallResponse? apiResulthkg;
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
    assuntoController?.dispose();
    descricaoController?.dispose();
    theUltimateNavBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
