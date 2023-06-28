import '/backend/api_requests/api_calls.dart';
import '/client_b_w_g/empresa/side_bar_empresa/side_bar_empresa_widget.dart';
import '/components/modals/modal_identidade/modal_identidade_widget.dart';
import '/components/modals/modal_orientacao/modal_orientacao_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class DadosPessoaisPJBackofficeModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool dadosPessoais = true;

  bool contato = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for sideBarEmpresa component.
  late SideBarEmpresaModel sideBarEmpresaModel;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // State field(s) for colabNome widget.
  TextEditingController? colabNomeController;
  String? Function(BuildContext, String?)? colabNomeControllerValidator;
  // State field(s) for colabDatanascimento widget.
  TextEditingController? colabDatanascimentoController;
  final colabDatanascimentoMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)?
      colabDatanascimentoControllerValidator;
  // State field(s) for colabCPF widget.
  TextEditingController? colabCPFController;
  final colabCPFMask = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? colabCPFControllerValidator;
  // State field(s) for colabRG widget.
  TextEditingController? colabRGController;
  String? Function(BuildContext, String?)? colabRGControllerValidator;
  // State field(s) for colabEstadoCivil widget.
  String? colabEstadoCivilValue;
  FormFieldController<String>? colabEstadoCivilValueController;
  // State field(s) for colabEscolaridade widget.
  String? colabEscolaridadeValue;
  FormFieldController<String>? colabEscolaridadeValueController;
  // State field(s) for colabEtnia widget.
  String? colabEtniaValue;
  FormFieldController<String>? colabEtniaValueController;
  // State field(s) for colabGenero widget.
  String? colabGeneroValue;
  FormFieldController<String>? colabGeneroValueController;
  // State field(s) for colabOrientacao widget.
  String? colabOrientacaoValue;
  FormFieldController<String>? colabOrientacaoValueController;
  // State field(s) for colabRefugiada widget.
  int? colabRefugiadaValue;
  FormFieldController<int>? colabRefugiadaValueController;
  // State field(s) for colabEmailPro widget.
  TextEditingController? colabEmailProController;
  String? Function(BuildContext, String?)? colabEmailProControllerValidator;
  // State field(s) for colabEmailAlternativo widget.
  TextEditingController? colabEmailAlternativoController;
  String? Function(BuildContext, String?)?
      colabEmailAlternativoControllerValidator;
  // State field(s) for colabPhone widget.
  TextEditingController? colabPhoneController;
  final colabPhoneMask = MaskTextInputFormatter(mask: '(##)#####-####');
  String? Function(BuildContext, String?)? colabPhoneControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarEmpresaModel = createModel(context, () => SideBarEmpresaModel());
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarEmpresaModel.dispose();
    colabNomeController?.dispose();
    colabDatanascimentoController?.dispose();
    colabCPFController?.dispose();
    colabRGController?.dispose();
    colabEmailProController?.dispose();
    colabEmailAlternativoController?.dispose();
    colabPhoneController?.dispose();
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
