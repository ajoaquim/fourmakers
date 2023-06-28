import '/backend/api_requests/api_calls.dart';
import '/client_b_w_g/prestador/prestadores_dados/p_jcadastro/modal_solicitacao_compartilhamento/modal_solicitacao_compartilhamento_widget.dart';
import '/client_b_w_g/prestador/side_bar_nav_p_j/side_bar_nav_p_j_widget.dart';
import '/components/default_input_text/default_input_text_widget.dart';
import '/components/listas/em_breve/em_breve_widget.dart';
import '/components/listas/pdivazio/pdivazio_widget.dart';
import '/components/modals/modal_identidade/modal_identidade_widget.dart';
import '/components/modals/modal_orientacao/modal_orientacao_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class DadosPessoaisPJModel extends FlutterFlowModel {
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
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (showMePJ)] action in dadosPessoaisPJ widget.
  ApiCallResponse? showPJ;
  // Model for sideBarNavPJ component.
  late SideBarNavPJModel sideBarNavPJModel;
  // State field(s) for prestaNome widget.
  TextEditingController? prestaNomeController;
  String? Function(BuildContext, String?)? prestaNomeControllerValidator;
  // State field(s) for colabDatanascimento widget.
  TextEditingController? colabDatanascimentoController;
  final colabDatanascimentoMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)?
      colabDatanascimentoControllerValidator;
  // State field(s) for prestaCPF widget.
  TextEditingController? prestaCPFController;
  final prestaCPFMask = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? prestaCPFControllerValidator;
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
  // State field(s) for prestaEmail widget.
  TextEditingController? prestaEmailController;
  String? Function(BuildContext, String?)? prestaEmailControllerValidator;
  // State field(s) for prestaLinkedin widget.
  TextEditingController? prestaLinkedinController;
  String? Function(BuildContext, String?)? prestaLinkedinControllerValidator;
  // State field(s) for prestaPhone widget.
  TextEditingController? prestaPhoneController;
  final prestaPhoneMask = MaskTextInputFormatter(mask: '(##) #####-####');
  String? Function(BuildContext, String?)? prestaPhoneControllerValidator;
  // State field(s) for colabCEP widget.
  TextEditingController? colabCEPController;
  String? Function(BuildContext, String?)? colabCEPControllerValidator;
  // State field(s) for colabEndereco widget.
  TextEditingController? colabEnderecoController;
  String? Function(BuildContext, String?)? colabEnderecoControllerValidator;
  // State field(s) for colabNumero widget.
  TextEditingController? colabNumeroController;
  String? Function(BuildContext, String?)? colabNumeroControllerValidator;
  // State field(s) for colabComplemento widget.
  TextEditingController? colabComplementoController;
  String? Function(BuildContext, String?)? colabComplementoControllerValidator;
  // State field(s) for colabBairro widget.
  TextEditingController? colabBairroController;
  String? Function(BuildContext, String?)? colabBairroControllerValidator;
  // State field(s) for colabCidade widget.
  TextEditingController? colabCidadeController;
  String? Function(BuildContext, String?)? colabCidadeControllerValidator;
  // State field(s) for colabEstado widget.
  TextEditingController? colabEstadoController;
  String? Function(BuildContext, String?)? colabEstadoControllerValidator;
  // State field(s) for colabResidentes widget.
  TextEditingController? colabResidentesController;
  String? Function(BuildContext, String?)? colabResidentesControllerValidator;
  // Model for emBreve component.
  late EmBreveModel emBreveModel1;
  // Model for emBreve component.
  late EmBreveModel emBreveModel2;
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
  // State field(s) for prestaPassOld widget.
  TextEditingController? prestaPassOldController;
  late bool prestaPassOldVisibility;
  String? Function(BuildContext, String?)? prestaPassOldControllerValidator;
  // State field(s) for prestaPassNew widget.
  TextEditingController? prestaPassNewController1;
  late bool prestaPassNewVisibility1;
  String? Function(BuildContext, String?)? prestaPassNewController1Validator;
  // State field(s) for prestaPassNew widget.
  TextEditingController? prestaPassNewController2;
  late bool prestaPassNewVisibility2;
  String? Function(BuildContext, String?)? prestaPassNewController2Validator;
  // Stores action output result for [Backend Call - API (editPrestador)] action in Button widget.
  ApiCallResponse? editarDadosPJ;
  // Stores action output result for [Backend Call - API (showMePJ)] action in Button widget.
  ApiCallResponse? atualizouDadosPJ;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarNavPJModel = createModel(context, () => SideBarNavPJModel());
    emBreveModel1 = createModel(context, () => EmBreveModel());
    emBreveModel2 = createModel(context, () => EmBreveModel());
    prestaAgenciaModel = createModel(context, () => DefaultInputTextModel());
    prestaContaModel = createModel(context, () => DefaultInputTextModel());
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
    prestaPassOldVisibility = false;
    prestaPassNewVisibility1 = false;
    prestaPassNewVisibility2 = false;
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarNavPJModel.dispose();
    prestaNomeController?.dispose();
    colabDatanascimentoController?.dispose();
    prestaCPFController?.dispose();
    colabRGController?.dispose();
    prestaEmailController?.dispose();
    prestaLinkedinController?.dispose();
    prestaPhoneController?.dispose();
    colabCEPController?.dispose();
    colabEnderecoController?.dispose();
    colabNumeroController?.dispose();
    colabComplementoController?.dispose();
    colabBairroController?.dispose();
    colabCidadeController?.dispose();
    colabEstadoController?.dispose();
    colabResidentesController?.dispose();
    emBreveModel1.dispose();
    emBreveModel2.dispose();
    prestaCNPJController?.dispose();
    prestaRazaoController?.dispose();
    prestaRegimeController?.dispose();
    prestaFantasiaController?.dispose();
    prestaAgenciaModel.dispose();
    prestaContaModel.dispose();
    prestaPassOldController?.dispose();
    prestaPassNewController1?.dispose();
    prestaPassNewController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
