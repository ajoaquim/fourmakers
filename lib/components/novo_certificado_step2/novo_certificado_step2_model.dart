import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class NovoCertificadoStep2Model extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for inputNome widget.
  TextEditingController? inputNomeController;
  String? Function(BuildContext, String?)? inputNomeControllerValidator;
  String? _inputNomeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for inputEmissao widget.
  TextEditingController? inputEmissaoController;
  String? Function(BuildContext, String?)? inputEmissaoControllerValidator;
  String? _inputEmissaoControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for inputDataEmissao widget.
  TextEditingController? inputDataEmissaoController;
  final inputDataEmissaoMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? inputDataEmissaoControllerValidator;
  String? _inputDataEmissaoControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for inputCargaHoraria widget.
  TextEditingController? inputCargaHorariaController;
  String? Function(BuildContext, String?)? inputCargaHorariaControllerValidator;
  String? _inputCargaHorariaControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (addCertificado)] action in Button widget.
  ApiCallResponse? apiResultdgx;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    inputNomeControllerValidator = _inputNomeControllerValidator;
    inputEmissaoControllerValidator = _inputEmissaoControllerValidator;
    inputDataEmissaoControllerValidator = _inputDataEmissaoControllerValidator;
    inputCargaHorariaControllerValidator =
        _inputCargaHorariaControllerValidator;
  }

  void dispose() {
    inputNomeController?.dispose();
    inputEmissaoController?.dispose();
    inputDataEmissaoController?.dispose();
    inputCargaHorariaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
