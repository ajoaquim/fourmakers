import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EnvioHorasPJModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DropEmpresa widget.
  String? dropEmpresaValue;
  FormFieldController<String>? dropEmpresaValueController;
  // Stores action output result for [Backend Call - API (obterProjetosAlocados)] action in DropEmpresa widget.
  ApiCallResponse? listouProjetos;
  // State field(s) for DropProjeto widget.
  String? dropProjetoValue;
  FormFieldController<String>? dropProjetoValueController;
  // State field(s) for inputModalidade widget.
  TextEditingController? inputModalidadeController;
  String? Function(BuildContext, String?)? inputModalidadeControllerValidator;
  // State field(s) for inputValorHora widget.
  TextEditingController? inputValorHoraController;
  String? Function(BuildContext, String?)? inputValorHoraControllerValidator;
  // State field(s) for inputAno widget.
  TextEditingController? inputAnoController;
  String? Function(BuildContext, String?)? inputAnoControllerValidator;
  // State field(s) for DropMes widget.
  String? dropMesValue;
  FormFieldController<String>? dropMesValueController;
  // State field(s) for inputHoras widget.
  TextEditingController? inputHorasController;
  String? Function(BuildContext, String?)? inputHorasControllerValidator;
  // Stores action output result for [Backend Call - API (postApontamentos)] action in Button widget.
  ApiCallResponse? apontarHoras;
  // Stores action output result for [Backend Call - API (GetApontamentosPrestador)] action in Button widget.
  ApiCallResponse? atualizouHoras;
  // Stores action output result for [Backend Call - API (getEmpresaPrestador)] action in Button widget.
  ApiCallResponse? minhasEmpresas;
  // Stores action output result for [Backend Call - API (obterAlocacoesPrestador)] action in Button widget.
  ApiCallResponse? meusProjetos;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    inputModalidadeController?.dispose();
    inputValorHoraController?.dispose();
    inputAnoController?.dispose();
    inputHorasController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
