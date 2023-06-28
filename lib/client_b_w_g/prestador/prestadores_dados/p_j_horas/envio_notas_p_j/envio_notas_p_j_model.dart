import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EnvioNotasPJModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (addNotaFiscal)] action in Button widget.
  ApiCallResponse? addNotas;
  // Stores action output result for [Backend Call - API (getNotaFiscalPrestador)] action in Button widget.
  ApiCallResponse? atualizouNotas;
  // Stores action output result for [Backend Call - API (getEmpresaPrestador)] action in Button widget.
  ApiCallResponse? minhasEmpresas;
  // Stores action output result for [Backend Call - API (obterAlocacoesPrestador)] action in Button widget.
  ApiCallResponse? meusProjetos;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
