import '/backend/api_requests/api_calls.dart';
import '/components/form_login/form_login_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChangePasswordPJModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String? magictoken;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (magicLoginPJ)] action in changePasswordPJ widget.
  ApiCallResponse? apiResult4js;
  // Stores action output result for [Backend Call - API (showMePJ)] action in changePasswordPJ widget.
  ApiCallResponse? apiResultzf2;
  // Model for formLogin component.
  late FormLoginModel formLoginModel;
  // State field(s) for fieldCPF widget.
  TextEditingController? fieldCPFController1;
  late bool fieldCPFVisibility1;
  String? Function(BuildContext, String?)? fieldCPFController1Validator;
  // State field(s) for fieldCPF widget.
  TextEditingController? fieldCPFController2;
  late bool fieldCPFVisibility2;
  String? Function(BuildContext, String?)? fieldCPFController2Validator;
  // Stores action output result for [Backend Call - API (changePassword)] action in Button widget.
  ApiCallResponse? apiResultdz6;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    formLoginModel = createModel(context, () => FormLoginModel());
    fieldCPFVisibility1 = false;
    fieldCPFVisibility2 = false;
  }

  void dispose() {
    unfocusNode.dispose();
    formLoginModel.dispose();
    fieldCPFController1?.dispose();
    fieldCPFController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
