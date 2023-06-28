import '/backend/api_requests/api_calls.dart';
import '/components/upload_file/upload_file_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class EditarCertificadoModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for inputNome widget.
  TextEditingController? inputNomeController;
  String? Function(BuildContext, String?)? inputNomeControllerValidator;
  // State field(s) for inputEmissao widget.
  TextEditingController? inputEmissaoController;
  String? Function(BuildContext, String?)? inputEmissaoControllerValidator;
  // State field(s) for inputDataEmissao widget.
  TextEditingController? inputDataEmissaoController;
  final inputDataEmissaoMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? inputDataEmissaoControllerValidator;
  // State field(s) for inputCargaHoraria widget.
  TextEditingController? inputCargaHorariaController;
  String? Function(BuildContext, String?)? inputCargaHorariaControllerValidator;
  // Model for uploadFile component.
  late UploadFileModel uploadFileModel;
  // Stores action output result for [Backend Call - API (alterarCertificado)] action in Button widget.
  ApiCallResponse? apiResultu9h;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    uploadFileModel = createModel(context, () => UploadFileModel());
  }

  void dispose() {
    inputNomeController?.dispose();
    inputEmissaoController?.dispose();
    inputDataEmissaoController?.dispose();
    inputCargaHorariaController?.dispose();
    uploadFileModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
