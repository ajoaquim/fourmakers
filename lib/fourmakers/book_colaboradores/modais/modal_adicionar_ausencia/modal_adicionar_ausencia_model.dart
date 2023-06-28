import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class ModalAdicionarAusenciaModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  bool periodo2 = false;

  bool periodo3 = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for tipo widget.
  String? tipoValue;
  FormFieldController<String>? tipoValueController;
  // State field(s) for aquisitivo1 widget.
  TextEditingController? aquisitivo1Controller;
  final aquisitivo1Mask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? aquisitivo1ControllerValidator;
  // State field(s) for aquisitivo2 widget.
  TextEditingController? aquisitivo2Controller;
  final aquisitivo2Mask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? aquisitivo2ControllerValidator;
  // State field(s) for inicioPeriodo1 widget.
  TextEditingController? inicioPeriodo1Controller;
  final inicioPeriodo1Mask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? inicioPeriodo1ControllerValidator;
  // State field(s) for fimPeriodo1 widget.
  TextEditingController? fimPeriodo1Controller;
  final fimPeriodo1Mask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? fimPeriodo1ControllerValidator;
  // State field(s) for inicioPeriodo2 widget.
  TextEditingController? inicioPeriodo2Controller;
  final inicioPeriodo2Mask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? inicioPeriodo2ControllerValidator;
  // State field(s) for fimPeriodo2 widget.
  TextEditingController? fimPeriodo2Controller;
  final fimPeriodo2Mask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? fimPeriodo2ControllerValidator;
  // State field(s) for inicioPeriodo3 widget.
  TextEditingController? inicioPeriodo3Controller;
  final inicioPeriodo3Mask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? inicioPeriodo3ControllerValidator;
  // State field(s) for fimPeriodo3 widget.
  TextEditingController? fimPeriodo3Controller;
  final fimPeriodo3Mask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? fimPeriodo3ControllerValidator;
  // State field(s) for dtInicio1 widget.
  TextEditingController? dtInicio1Controller;
  final dtInicio1Mask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? dtInicio1ControllerValidator;
  // State field(s) for dtInicio2 widget.
  TextEditingController? dtInicio2Controller;
  final dtInicio2Mask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? dtInicio2ControllerValidator;
  // Stores action output result for [Backend Call - API (AddFerias)] action in Button widget.
  ApiCallResponse? apiResultbmm;
  // Stores action output result for [Backend Call - API (AddAusencia)] action in Button widget.
  ApiCallResponse? ausenciaResponse;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    aquisitivo1Controller?.dispose();
    aquisitivo2Controller?.dispose();
    inicioPeriodo1Controller?.dispose();
    fimPeriodo1Controller?.dispose();
    inicioPeriodo2Controller?.dispose();
    fimPeriodo2Controller?.dispose();
    inicioPeriodo3Controller?.dispose();
    fimPeriodo3Controller?.dispose();
    dtInicio1Controller?.dispose();
    dtInicio2Controller?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
