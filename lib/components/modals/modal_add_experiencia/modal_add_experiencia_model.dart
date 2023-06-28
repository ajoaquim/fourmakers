import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ModalAddExperienciaModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for inputEmpresax widget.
  TextEditingController? inputEmpresaxController;
  String? Function(BuildContext, String?)? inputEmpresaxControllerValidator;
  // State field(s) for inputCargo widget.
  TextEditingController? inputCargoController;
  String? Function(BuildContext, String?)? inputCargoControllerValidator;
  // State field(s) for inputDataIni widget.
  TextEditingController? inputDataIniController;
  String? Function(BuildContext, String?)? inputDataIniControllerValidator;
  // State field(s) for inputDataSaid widget.
  TextEditingController? inputDataSaidController;
  String? Function(BuildContext, String?)? inputDataSaidControllerValidator;
  // State field(s) for inputdescricao widget.
  TextEditingController? inputdescricaoController;
  String? Function(BuildContext, String?)? inputdescricaoControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    inputEmpresaxController?.dispose();
    inputCargoController?.dispose();
    inputDataIniController?.dispose();
    inputDataSaidController?.dispose();
    inputdescricaoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
