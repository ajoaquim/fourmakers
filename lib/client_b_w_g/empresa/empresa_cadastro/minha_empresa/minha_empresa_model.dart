import '/backend/api_requests/api_calls.dart';
import '/client_b_w_g/empresa/side_bar_empresa/side_bar_empresa_widget.dart';
import '/components/default_input_text/default_input_text_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MinhaEmpresaModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (empresaShowMe)] action in minhaEmpresa widget.
  ApiCallResponse? logouEmpresa;
  // Model for sideBarEmpresa component.
  late SideBarEmpresaModel sideBarEmpresaModel;
  // Model for empresaNome.
  late DefaultInputTextModel empresaNomeModel;
  // Model for empresaRazaoSocial.
  late DefaultInputTextModel empresaRazaoSocialModel;
  // Model for empresaCNPJ.
  late DefaultInputTextModel empresaCNPJModel;
  // Model for empresaSite.
  late DefaultInputTextModel empresaSiteModel;
  // Model for empresaLinkedin.
  late DefaultInputTextModel empresaLinkedinModel;
  // State field(s) for empresaDescricao widget.
  TextEditingController? empresaDescricaoController;
  String? Function(BuildContext, String?)? empresaDescricaoControllerValidator;
  // Model for responsavelNome.
  late DefaultInputTextModel responsavelNomeModel;
  // Model for responsavelCargo.
  late DefaultInputTextModel responsavelCargoModel;
  // Model for responsavelEmail.
  late DefaultInputTextModel responsavelEmailModel;
  // Model for responsavelPhone1.
  late DefaultInputTextModel responsavelPhone1Model;
  // Model for responsavelPhone2.
  late DefaultInputTextModel responsavelPhone2Model;
  // Model for responsavelLinkedin.
  late DefaultInputTextModel responsavelLinkedinModel;
  // Stores action output result for [Backend Call - API (postOneEmpresa)] action in Button widget.
  ApiCallResponse? apiResulth4d;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarEmpresaModel = createModel(context, () => SideBarEmpresaModel());
    empresaNomeModel = createModel(context, () => DefaultInputTextModel());
    empresaRazaoSocialModel =
        createModel(context, () => DefaultInputTextModel());
    empresaCNPJModel = createModel(context, () => DefaultInputTextModel());
    empresaSiteModel = createModel(context, () => DefaultInputTextModel());
    empresaLinkedinModel = createModel(context, () => DefaultInputTextModel());
    responsavelNomeModel = createModel(context, () => DefaultInputTextModel());
    responsavelCargoModel = createModel(context, () => DefaultInputTextModel());
    responsavelEmailModel = createModel(context, () => DefaultInputTextModel());
    responsavelPhone1Model =
        createModel(context, () => DefaultInputTextModel());
    responsavelPhone2Model =
        createModel(context, () => DefaultInputTextModel());
    responsavelLinkedinModel =
        createModel(context, () => DefaultInputTextModel());
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarEmpresaModel.dispose();
    empresaNomeModel.dispose();
    empresaRazaoSocialModel.dispose();
    empresaCNPJModel.dispose();
    empresaSiteModel.dispose();
    empresaLinkedinModel.dispose();
    empresaDescricaoController?.dispose();
    responsavelNomeModel.dispose();
    responsavelCargoModel.dispose();
    responsavelEmailModel.dispose();
    responsavelPhone1Model.dispose();
    responsavelPhone2Model.dispose();
    responsavelLinkedinModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
