import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class CadastroPJModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool? oddPassword = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (magicLoginInvite)] action in cadastroPJ widget.
  ApiCallResponse? apiResultnf6;
  // Stores action output result for [Backend Call - API (showMePJ)] action in cadastroPJ widget.
  ApiCallResponse? apiResulttvw;
  // State field(s) for prestaNome widget.
  TextEditingController? prestaNomeController;
  String? Function(BuildContext, String?)? prestaNomeControllerValidator;
  // State field(s) for prestaCPF widget.
  TextEditingController? prestaCPFController;
  final prestaCPFMask = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? prestaCPFControllerValidator;
  // State field(s) for prestaMail widget.
  TextEditingController? prestaMailController;
  String? Function(BuildContext, String?)? prestaMailControllerValidator;
  // State field(s) for prestaNome2 widget.
  TextEditingController? prestaNome2Controller;
  String? Function(BuildContext, String?)? prestaNome2ControllerValidator;
  // State field(s) for prestaCPF2 widget.
  TextEditingController? prestaCPF2Controller;
  final prestaCPF2Mask = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? prestaCPF2ControllerValidator;
  // State field(s) for prestaMail2 widget.
  TextEditingController? prestaMail2Controller;
  String? Function(BuildContext, String?)? prestaMail2ControllerValidator;
  // State field(s) for prestaPass widget.
  TextEditingController? prestaPassController;
  late bool prestaPassVisibility;
  String? Function(BuildContext, String?)? prestaPassControllerValidator;
  // State field(s) for prestaPass2 widget.
  TextEditingController? prestaPass2Controller;
  late bool prestaPass2Visibility;
  String? Function(BuildContext, String?)? prestaPass2ControllerValidator;
  // Stores action output result for [Backend Call - API (addPrestador)] action in Button widget.
  ApiCallResponse? adicionarPrestador;
  // Stores action output result for [Backend Call - API (EditPJ)] action in Button widget.
  ApiCallResponse? editarPrestador;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    prestaPassVisibility = false;
    prestaPass2Visibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    prestaNomeController?.dispose();
    prestaCPFController?.dispose();
    prestaMailController?.dispose();
    prestaNome2Controller?.dispose();
    prestaCPF2Controller?.dispose();
    prestaMail2Controller?.dispose();
    prestaPassController?.dispose();
    prestaPass2Controller?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
