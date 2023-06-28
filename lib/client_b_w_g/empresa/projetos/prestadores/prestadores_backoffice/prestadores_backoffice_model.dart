import '/backend/api_requests/api_calls.dart';
import '/client_b_w_g/empresa/side_bar_empresa/side_bar_empresa_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class PrestadoresBackofficeModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (getEmpresaPrestadores)] action in prestadoresBackoffice widget.
  ApiCallResponse? apiResultanm;
  // Model for sideBarEmpresa component.
  late SideBarEmpresaModel sideBarEmpresaModel;
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for FieldNome widget.
  TextEditingController? fieldNomeController;
  String? Function(BuildContext, String?)? fieldNomeControllerValidator;
  // State field(s) for fieldCPF widget.
  TextEditingController? fieldCPFController;
  final fieldCPFMask = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? fieldCPFControllerValidator;
  // Stores action output result for [Backend Call - API (prestadorExiste)] action in fieldCPF widget.
  ApiCallResponse? apiResult3c3;
  // State field(s) for FieldEmail widget.
  TextEditingController? fieldEmailController;
  String? Function(BuildContext, String?)? fieldEmailControllerValidator;
  // Stores action output result for [Backend Call - API (sendInvite)] action in Button widget.
  ApiCallResponse? sendInvite;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarEmpresaModel = createModel(context, () => SideBarEmpresaModel());
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarEmpresaModel.dispose();
    textController1?.dispose();
    fieldNomeController?.dispose();
    fieldCPFController?.dispose();
    fieldEmailController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
