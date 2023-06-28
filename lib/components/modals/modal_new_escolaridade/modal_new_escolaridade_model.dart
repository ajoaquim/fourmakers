import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class ModalNewEscolaridadeModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for formInstituicao widget.
  TextEditingController? formInstituicaoController;
  String? Function(BuildContext, String?)? formInstituicaoControllerValidator;
  // State field(s) for formNivel widget.
  String? formNivelValue;
  FormFieldController<String>? formNivelValueController;
  // State field(s) for inputInicio widget.
  TextEditingController? inputInicioController;
  final inputInicioMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? inputInicioControllerValidator;
  // State field(s) for inputFim widget.
  TextEditingController? inputFimController;
  final inputFimMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? inputFimControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (addEscolaridadeColaborador)] action in Button widget.
  ApiCallResponse? addEscolaridade;
  // Stores action output result for [Backend Call - API (listarEscolaridadeColaborador)] action in Button widget.
  ApiCallResponse? apiAtualizaFormacaoColab;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    formInstituicaoController?.dispose();
    inputInicioController?.dispose();
    inputFimController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
