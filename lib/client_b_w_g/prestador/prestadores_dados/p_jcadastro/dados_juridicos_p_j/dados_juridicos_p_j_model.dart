import '/backend/api_requests/api_calls.dart';
import '/client_b_w_g/prestador/side_bar_nav_p_j/side_bar_nav_p_j_widget.dart';
import '/components/default_input_text/default_input_text_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class DadosJuridicosPJModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool dadosPessoais = true;

  bool contato = false;

  bool? pessoaisActive;

  bool? contatoActive;

  bool? enderecoActive;

  bool? saudeActive;

  bool? dependentesActive;

  bool? pjActive;

  bool? compartilhamentoActive;

  bool? acessoActive;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (showMePJ)] action in dadosJuridicosPJ widget.
  ApiCallResponse? showPJ;
  // Model for sideBarNavPJ component.
  late SideBarNavPJModel sideBarNavPJModel;
  // State field(s) for prestaCNPJ widget.
  TextEditingController? prestaCNPJController;
  final prestaCNPJMask = MaskTextInputFormatter(mask: '##.###.###/####-##');
  String? Function(BuildContext, String?)? prestaCNPJControllerValidator;
  // State field(s) for prestaRazao widget.
  TextEditingController? prestaRazaoController;
  String? Function(BuildContext, String?)? prestaRazaoControllerValidator;
  // State field(s) for prestaRegime widget.
  TextEditingController? prestaRegimeController;
  String? Function(BuildContext, String?)? prestaRegimeControllerValidator;
  // State field(s) for prestaFantasia widget.
  TextEditingController? prestaFantasiaController;
  String? Function(BuildContext, String?)? prestaFantasiaControllerValidator;
  // State field(s) for prestaBanco widget.
  int? prestaBancoValue;
  FormFieldController<int>? prestaBancoValueController;
  // Model for prestaAgencia.
  late DefaultInputTextModel prestaAgenciaModel;
  // Model for prestaConta.
  late DefaultInputTextModel prestaContaModel;
  // Stores action output result for [Backend Call - API (editPrestador)] action in Button widget.
  ApiCallResponse? editarDadosPJ;
  // Stores action output result for [Backend Call - API (showMePJ)] action in Button widget.
  ApiCallResponse? atualizouDadosPJ;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarNavPJModel = createModel(context, () => SideBarNavPJModel());
    prestaAgenciaModel = createModel(context, () => DefaultInputTextModel());
    prestaContaModel = createModel(context, () => DefaultInputTextModel());
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarNavPJModel.dispose();
    prestaCNPJController?.dispose();
    prestaRazaoController?.dispose();
    prestaRegimeController?.dispose();
    prestaFantasiaController?.dispose();
    prestaAgenciaModel.dispose();
    prestaContaModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
