import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ModalAdicionarFomacaoModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for inputFormacao widget.
  TextEditingController? inputFormacaoController;
  String? Function(BuildContext, String?)? inputFormacaoControllerValidator;
  // State field(s) for dropNivel widget.
  String? dropNivelValue;
  FormFieldController<String>? dropNivelValueController;
  // State field(s) for inputInstituicao widget.
  TextEditingController? inputInstituicaoController;
  String? Function(BuildContext, String?)? inputInstituicaoControllerValidator;
  // State field(s) for inputData widget.
  TextEditingController? inputDataController;
  String? Function(BuildContext, String?)? inputDataControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    inputFormacaoController?.dispose();
    inputInstituicaoController?.dispose();
    inputDataController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
