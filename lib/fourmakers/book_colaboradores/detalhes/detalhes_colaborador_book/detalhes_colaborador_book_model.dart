import '/backend/api_requests/api_calls.dart';
import '/components/side_bar_nav/side_bar_nav_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class DetalhesColaboradorBookModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (showMe)] action in DetalhesColaboradorBook widget.
  ApiCallResponse? apiResult2b3;
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel;
  // State field(s) for colabNome widget.
  TextEditingController? colabNomeController;
  String? Function(BuildContext, String?)? colabNomeControllerValidator;
  // State field(s) for colabDatanascimento widget.
  TextEditingController? colabDatanascimentoController1;
  final colabDatanascimentoMask1 = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)?
      colabDatanascimentoController1Validator;
  // State field(s) for colabDatanascimento widget.
  TextEditingController? colabDatanascimentoController2;
  String? Function(BuildContext, String?)?
      colabDatanascimentoController2Validator;
  // State field(s) for colabCPF widget.
  TextEditingController? colabCPFController1;
  final colabCPFMask1 = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? colabCPFController1Validator;
  // State field(s) for colabCPF widget.
  TextEditingController? colabCPFController2;
  final colabCPFMask2 = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? colabCPFController2Validator;
  // State field(s) for colabRG widget.
  TextEditingController? colabRGController;
  String? Function(BuildContext, String?)? colabRGControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarNavModel = createModel(context, () => SideBarNavModel());
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarNavModel.dispose();
    colabNomeController?.dispose();
    colabDatanascimentoController1?.dispose();
    colabDatanascimentoController2?.dispose();
    colabCPFController1?.dispose();
    colabCPFController2?.dispose();
    colabRGController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
