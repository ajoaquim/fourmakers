import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ModalNewExperienciaModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for inputEmpresa widget.
  TextEditingController? inputEmpresaController;
  String? Function(BuildContext, String?)? inputEmpresaControllerValidator;
  // State field(s) for inputCargo widget.
  TextEditingController? inputCargoController;
  String? Function(BuildContext, String?)? inputCargoControllerValidator;
  // State field(s) for inputAtividades widget.
  TextEditingController? inputAtividadesController;
  String? Function(BuildContext, String?)? inputAtividadesControllerValidator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Backend Call - API (AddExperienciaProfissional)] action in Button widget.
  ApiCallResponse? apiAddExpProx;
  // Stores action output result for [Backend Call - API (listaExperienciaProfissional)] action in Button widget.
  ApiCallResponse? apiAtualizaExperienciaPro2;
  // Stores action output result for [Backend Call - API (AddExperienciaProfissional)] action in Button widget.
  ApiCallResponse? apiAddExpPro;
  // Stores action output result for [Backend Call - API (listaExperienciaProfissional)] action in Button widget.
  ApiCallResponse? apiAtualizaExperienciaPro22;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    inputEmpresaController?.dispose();
    inputCargoController?.dispose();
    inputAtividadesController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
