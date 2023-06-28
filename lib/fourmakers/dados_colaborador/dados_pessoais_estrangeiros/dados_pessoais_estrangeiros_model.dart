import '/backend/api_requests/api_calls.dart';
import '/components/listas/em_breve/em_breve_widget.dart';
import '/components/listas/sem_contato_emergencia/sem_contato_emergencia_widget.dart';
import '/components/listas/sem_dependentes/sem_dependentes_widget.dart';
import '/components/modals/modal_add_contato_emerg/modal_add_contato_emerg_widget.dart';
import '/components/modals/modal_add_dependente/modal_add_dependente_widget.dart';
import '/components/modals/modal_edit_contato_emerg/modal_edit_contato_emerg_widget.dart';
import '/components/modals/modal_edit_depen/modal_edit_depen_widget.dart';
import '/components/modals/modal_grupo_risco/modal_grupo_risco_widget.dart';
import '/components/modals/modal_identidade/modal_identidade_widget.dart';
import '/components/modals/modal_orientacao/modal_orientacao_widget.dart';
import '/components/side_bar_nav/side_bar_nav_widget.dart';
import '/components/the_ultimate_nav_bar/the_ultimate_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class DadosPessoaisEstrangeirosModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<dynamic> listaDeContatos = [];
  void addToListaDeContatos(dynamic item) => listaDeContatos.add(item);
  void removeFromListaDeContatos(dynamic item) => listaDeContatos.remove(item);
  void removeAtIndexFromListaDeContatos(int index) =>
      listaDeContatos.removeAt(index);
  void updateListaDeContatosAtIndex(int index, Function(dynamic) updateFn) =>
      listaDeContatos[index] = updateFn(listaDeContatos[index]);

  ///  State fields for stateful widgets in this page.

  final formKey5 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (showMe)] action in DadosPessoaisEstrangeiros widget.
  ApiCallResponse? apiToken;
  // Stores action output result for [Backend Call - API (listarContatoEmerg)] action in DadosPessoaisEstrangeiros widget.
  ApiCallResponse? listaContatosResponse;
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel;
  // State field(s) for colabNome widget.
  TextEditingController? colabNomeController;
  String? Function(BuildContext, String?)? colabNomeControllerValidator;
  // State field(s) for colabDatanascimento widget.
  TextEditingController? colabDatanascimentoController;
  final colabDatanascimentoMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)?
      colabDatanascimentoControllerValidator;
  // State field(s) for dropBrasileiro widget.
  bool? dropBrasileiroValue;
  FormFieldController<bool>? dropBrasileiroValueController;
  // State field(s) for colabCPF widget.
  TextEditingController? colabCPFController;
  final colabCPFMask = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? colabCPFControllerValidator;
  // State field(s) for colabPassaporte widget.
  TextEditingController? colabPassaporteController;
  final colabPassaporteMask = MaskTextInputFormatter(mask: '##AAAAAA');
  String? Function(BuildContext, String?)? colabPassaporteControllerValidator;
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
  Completer<ApiCallResponse>? apiRequestCompleter2;
  // Model for semContatoEmergencia component.
  late SemContatoEmergenciaModel semContatoEmergenciaModel;
  // Stores action output result for [Backend Call - API (listarContatoEmerg)] action in Icon widget.
  ApiCallResponse? listaContatosResponseX;
  // State field(s) for colabCEP widget.
  TextEditingController? colabCEPController;
  final colabCEPMask = MaskTextInputFormatter(mask: '#####-###');
  String? Function(BuildContext, String?)? colabCEPControllerValidator;
  // State field(s) for colabEndereco widget.
  TextEditingController? colabEnderecoController;
  String? Function(BuildContext, String?)? colabEnderecoControllerValidator;
  // State field(s) for colabEnderecoNumero widget.
  TextEditingController? colabEnderecoNumeroController;
  String? Function(BuildContext, String?)?
      colabEnderecoNumeroControllerValidator;
  // State field(s) for colabEnderecoComplemento widget.
  TextEditingController? colabEnderecoComplementoController;
  String? Function(BuildContext, String?)?
      colabEnderecoComplementoControllerValidator;
  // State field(s) for colabEnderecoBairro widget.
  TextEditingController? colabEnderecoBairroController;
  String? Function(BuildContext, String?)?
      colabEnderecoBairroControllerValidator;
  // State field(s) for colabEnderecoCidade widget.
  TextEditingController? colabEnderecoCidadeController;
  String? Function(BuildContext, String?)?
      colabEnderecoCidadeControllerValidator;
  // State field(s) for colabEnderecoEstado widget.
  TextEditingController? colabEnderecoEstadoController;
  String? Function(BuildContext, String?)?
      colabEnderecoEstadoControllerValidator;
  // State field(s) for colabFamiliares widget.
  TextEditingController? colabFamiliaresController;
  String? Function(BuildContext, String?)? colabFamiliaresControllerValidator;
  // State field(s) for colabUSAdressName widget.
  TextEditingController? colabUSAdressNameController;
  final colabUSAdressNameMask = MaskTextInputFormatter(mask: '#####-###');
  String? Function(BuildContext, String?)? colabUSAdressNameControllerValidator;
  // State field(s) for colabUSAdressLine1 widget.
  TextEditingController? colabUSAdressLine1Controller;
  String? Function(BuildContext, String?)?
      colabUSAdressLine1ControllerValidator;
  // State field(s) for colabUSAdressLine2 widget.
  TextEditingController? colabUSAdressLine2Controller;
  String? Function(BuildContext, String?)?
      colabUSAdressLine2ControllerValidator;
  // State field(s) for colabUSAdressCity widget.
  TextEditingController? colabUSAdressCityController;
  String? Function(BuildContext, String?)? colabUSAdressCityControllerValidator;
  // State field(s) for colabUSAdressState widget.
  TextEditingController? colabUSAdressStateController;
  String? Function(BuildContext, String?)?
      colabUSAdressStateControllerValidator;
  // State field(s) for colabUSAdressZIP widget.
  TextEditingController? colabUSAdressZIPController;
  String? Function(BuildContext, String?)? colabUSAdressZIPControllerValidator;
  // State field(s) for colabUSAdressCountry widget.
  TextEditingController? colabUSAdressCountryController;
  String? Function(BuildContext, String?)?
      colabUSAdressCountryControllerValidator;
  // State field(s) for colabUSAdressResidents widget.
  TextEditingController? colabUSAdressResidentsController;
  String? Function(BuildContext, String?)?
      colabUSAdressResidentsControllerValidator;
  // State field(s) for colabDeficiencia widget.
  List<String>? colabDeficienciaValues;
  FormFieldController<List<String>>? colabDeficienciaValueController;
  // State field(s) for colabCovid widget.
  String? colabCovidValue;
  FormFieldController<String>? colabCovidValueController;
  // State field(s) for colabCondSaude widget.
  TextEditingController? colabCondSaudeController;
  String? Function(BuildContext, String?)? colabCondSaudeControllerValidator;
  // Model for emBreve component.
  late EmBreveModel emBreveModel;
  Completer<ApiCallResponse>? apiRequestCompleter1;
  // Stores action output result for [Backend Call - API (AlterarDadosColabNew)] action in Button widget.
  ApiCallResponse? alterarDadosNew;
  // Stores action output result for [Backend Call - API (BuscaDadosNew)] action in Button widget.
  ApiCallResponse? dadosAtualizados;
  // Model for TheUltimateNavBar component.
  late TheUltimateNavBarModel theUltimateNavBarModel;
  // Stores action output result for [Backend Call - API (removerDependente)] action in Button widget.
  ApiCallResponse? apiResult300;
  // Stores action output result for [Backend Call - API (removerContatoEmerg)] action in Button widget.
  ApiCallResponse? apiResult399;
  // Stores action output result for [Backend Call - API (listarContatoEmerg)] action in Button widget.
  ApiCallResponse? listaContatoEmergExcluir;
  // State field(s) for inputNomeContato widget.
  TextEditingController? inputNomeContatoController;
  String? Function(BuildContext, String?)? inputNomeContatoControllerValidator;
  // State field(s) for DropDownParentesco widget.
  String? dropDownParentescoValue;
  FormFieldController<String>? dropDownParentescoValueController;
  // State field(s) for inputTelContato widget.
  TextEditingController? inputTelContatoController;
  final inputTelContatoMask = MaskTextInputFormatter(mask: '(##)#####-####');
  String? Function(BuildContext, String?)? inputTelContatoControllerValidator;
  // Stores action output result for [Backend Call - API (listarContatoEmerg)] action in Button widget.
  ApiCallResponse? apiResultkv8;
  // Stores action output result for [Backend Call - API (inserirContatoEmerg)] action in Button widget.
  ApiCallResponse? apiResultrrg;
  // Stores action output result for [Backend Call - API (inserirContatoEmerg)] action in Button widget.
  ApiCallResponse? apiResultrrgx;
  // Stores action output result for [Backend Call - API (listarContatoEmerg)] action in Button widget.
  ApiCallResponse? listarContatosEmergAdicionou;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarNavModel = createModel(context, () => SideBarNavModel());
    semContatoEmergenciaModel =
        createModel(context, () => SemContatoEmergenciaModel());
    emBreveModel = createModel(context, () => EmBreveModel());
    theUltimateNavBarModel =
        createModel(context, () => TheUltimateNavBarModel());
  }

  void dispose() {
    sideBarNavModel.dispose();
    colabNomeController?.dispose();
    colabDatanascimentoController?.dispose();
    colabCPFController?.dispose();
    colabPassaporteController?.dispose();
    colabRGController?.dispose();
    colabEmailProController?.dispose();
    colabEmailAlternativoController?.dispose();
    colabPhoneController?.dispose();
    semContatoEmergenciaModel.dispose();
    colabCEPController?.dispose();
    colabEnderecoController?.dispose();
    colabEnderecoNumeroController?.dispose();
    colabEnderecoComplementoController?.dispose();
    colabEnderecoBairroController?.dispose();
    colabEnderecoCidadeController?.dispose();
    colabEnderecoEstadoController?.dispose();
    colabFamiliaresController?.dispose();
    colabUSAdressNameController?.dispose();
    colabUSAdressLine1Controller?.dispose();
    colabUSAdressLine2Controller?.dispose();
    colabUSAdressCityController?.dispose();
    colabUSAdressStateController?.dispose();
    colabUSAdressZIPController?.dispose();
    colabUSAdressCountryController?.dispose();
    colabUSAdressResidentsController?.dispose();
    colabCondSaudeController?.dispose();
    emBreveModel.dispose();
    theUltimateNavBarModel.dispose();
    inputNomeContatoController?.dispose();
    inputTelContatoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForApiRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
