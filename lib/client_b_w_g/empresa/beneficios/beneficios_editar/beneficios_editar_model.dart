import '/backend/api_requests/api_calls.dart';
import '/client_b_w_g/empresa/side_bar_empresa/side_bar_empresa_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BeneficiosEditarModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool? modalFAQ = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for sideBarEmpresa component.
  late SideBarEmpresaModel sideBarEmpresaModel;
  // State field(s) for toggleSituacao widget.
  bool? toggleSituacaoValue;
  // State field(s) for nomeBeneficio widget.
  TextEditingController? nomeBeneficioController;
  String? Function(BuildContext, String?)? nomeBeneficioControllerValidator;
  // State field(s) for tipoBeneficio widget.
  String? tipoBeneficioValue;
  FormFieldController<String>? tipoBeneficioValueController;
  // State field(s) for descricaoBeneficio widget.
  TextEditingController? descricaoBeneficioController;
  String? Function(BuildContext, String?)?
      descricaoBeneficioControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (addBeneficioIMG)] action in Text widget.
  ApiCallResponse? apiResultgpt;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (addBeneficioIMG)] action in Text widget.
  ApiCallResponse? apiResultgpt2;
  // Stores action output result for [Backend Call - API (deleteFAQ)] action in Icon widget.
  ApiCallResponse? apiResultbo4;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Stores action output result for [Backend Call - API (editBene)] action in Button widget.
  ApiCallResponse? apiResult8ir;
  // State field(s) for perguntaBeneficio widget.
  TextEditingController? perguntaBeneficioController;
  String? Function(BuildContext, String?)? perguntaBeneficioControllerValidator;
  // State field(s) for respostaBeneficio widget.
  TextEditingController? respostaBeneficioController;
  String? Function(BuildContext, String?)? respostaBeneficioControllerValidator;
  // Stores action output result for [Backend Call - API (addBeneficioFAQ)] action in Button widget.
  ApiCallResponse? addFAQCopy;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarEmpresaModel = createModel(context, () => SideBarEmpresaModel());
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarEmpresaModel.dispose();
    nomeBeneficioController?.dispose();
    descricaoBeneficioController?.dispose();
    perguntaBeneficioController?.dispose();
    respostaBeneficioController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
