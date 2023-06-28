import '/backend/api_requests/api_calls.dart';
import '/components/form_login/form_login_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class LoginempresaModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for formLogin component.
  late FormLoginModel formLoginModel;
  // State field(s) for fieldCNPJ widget.
  TextEditingController? fieldCNPJController;
  final fieldCNPJMask = MaskTextInputFormatter(mask: '##.###.###/####-##');
  String? Function(BuildContext, String?)? fieldCNPJControllerValidator;
  // State field(s) for fieldSenha widget.
  TextEditingController? fieldSenhaController;
  late bool fieldSenhaVisibility;
  String? Function(BuildContext, String?)? fieldSenhaControllerValidator;
  // Stores action output result for [Backend Call - API (loginEmpresa)] action in Button widget.
  ApiCallResponse? apiResultvj0;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    formLoginModel = createModel(context, () => FormLoginModel());
    fieldSenhaVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    formLoginModel.dispose();
    fieldCNPJController?.dispose();
    fieldSenhaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
