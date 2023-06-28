import '/backend/api_requests/api_calls.dart';
import '/client_b_w_g/empresa/side_bar_empresa/side_bar_empresa_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class DadosPJPJBackofficeModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool dadosPessoais = true;

  bool contato = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideBarEmpresa component.
  late SideBarEmpresaModel sideBarEmpresaModel;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // State field(s) for colabEmailPro widget.
  TextEditingController? colabEmailProController1;
  String? Function(BuildContext, String?)? colabEmailProController1Validator;
  // State field(s) for colabEmailAlternativo widget.
  TextEditingController? colabEmailAlternativoController1;
  String? Function(BuildContext, String?)?
      colabEmailAlternativoController1Validator;
  // State field(s) for colabPhone widget.
  TextEditingController? colabPhoneController1;
  String? Function(BuildContext, String?)? colabPhoneController1Validator;
  // State field(s) for colabPhone widget.
  TextEditingController? colabPhoneController2;
  String? Function(BuildContext, String?)? colabPhoneController2Validator;
  // State field(s) for colabEmailPro widget.
  TextEditingController? colabEmailProController2;
  String? Function(BuildContext, String?)? colabEmailProController2Validator;
  // State field(s) for colabEmailAlternativo widget.
  TextEditingController? colabEmailAlternativoController2;
  String? Function(BuildContext, String?)?
      colabEmailAlternativoController2Validator;
  // State field(s) for colabPhone widget.
  TextEditingController? colabPhoneController3;
  final colabPhoneMask3 = MaskTextInputFormatter(mask: '####-#');
  String? Function(BuildContext, String?)? colabPhoneController3Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarEmpresaModel = createModel(context, () => SideBarEmpresaModel());
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarEmpresaModel.dispose();
    colabEmailProController1?.dispose();
    colabEmailAlternativoController1?.dispose();
    colabPhoneController1?.dispose();
    colabPhoneController2?.dispose();
    colabEmailProController2?.dispose();
    colabEmailAlternativoController2?.dispose();
    colabPhoneController3?.dispose();
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
