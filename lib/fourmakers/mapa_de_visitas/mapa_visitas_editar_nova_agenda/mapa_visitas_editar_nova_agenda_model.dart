import '/backend/api_requests/api_calls.dart';
import '/components/side_bar_nav/side_bar_nav_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class MapaVisitasEditarNovaAgendaModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  dynamic meuLead;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (showMe)] action in MapaVisitasEditarNovaAgenda widget.
  ApiCallResponse? apiResultim0;
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel;
  // State field(s) for clienteNomeEditar widget.
  TextEditingController? clienteNomeEditarController;
  String? Function(BuildContext, String?)? clienteNomeEditarControllerValidator;
  // State field(s) for gestorDoClienteEditar widget.
  TextEditingController? gestorDoClienteEditarController;
  String? Function(BuildContext, String?)?
      gestorDoClienteEditarControllerValidator;
  // State field(s) for areaGestorEditar widget.
  TextEditingController? areaGestorEditarController;
  String? Function(BuildContext, String?)? areaGestorEditarControllerValidator;
  // State field(s) for cargoGestorEditar widget.
  TextEditingController? cargoGestorEditarController;
  String? Function(BuildContext, String?)? cargoGestorEditarControllerValidator;
  // State field(s) for emailEditar widget.
  TextEditingController? emailEditarController;
  String? Function(BuildContext, String?)? emailEditarControllerValidator;
  // State field(s) for telefoneEditar widget.
  TextEditingController? telefoneEditarController;
  final telefoneEditarMask = MaskTextInputFormatter(mask: '(##) #####-####');
  String? Function(BuildContext, String?)? telefoneEditarControllerValidator;
  // State field(s) for profissionalNomeEditar widget.
  TextEditingController? profissionalNomeEditarController;
  String? Function(BuildContext, String?)?
      profissionalNomeEditarControllerValidator;
  // State field(s) for assuntoPautaEditar widget.
  TextEditingController? assuntoPautaEditarController;
  String? Function(BuildContext, String?)?
      assuntoPautaEditarControllerValidator;
  // State field(s) for detalhesAssuntoEditar widget.
  TextEditingController? detalhesAssuntoEditarController;
  String? Function(BuildContext, String?)?
      detalhesAssuntoEditarControllerValidator;
  // State field(s) for dataAgendaEditar widget.
  TextEditingController? dataAgendaEditarController;
  final dataAgendaEditarMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? dataAgendaEditarControllerValidator;
  // State field(s) for horarioAgendaEditar widget.
  TextEditingController? horarioAgendaEditarController;
  final horarioAgendaEditarMask = MaskTextInputFormatter(mask: '##:##');
  String? Function(BuildContext, String?)?
      horarioAgendaEditarControllerValidator;
  // State field(s) for horaFimAgendaEditar widget.
  TextEditingController? horaFimAgendaEditarController;
  final horaFimAgendaEditarMask = MaskTextInputFormatter(mask: '##:##');
  String? Function(BuildContext, String?)?
      horaFimAgendaEditarControllerValidator;
  // State field(s) for DropDownEditar2 widget.
  String? dropDownEditar2Value;
  FormFieldController<String>? dropDownEditar2ValueController;
  // State field(s) for enderecoAgendaEditar widget.
  TextEditingController? enderecoAgendaEditarController;
  String? Function(BuildContext, String?)?
      enderecoAgendaEditarControllerValidator;
  // Stores action output result for [Backend Call - API (EditarLeads)] action in salvarButtonEditar widget.
  ApiCallResponse? apiResult7ff;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarNavModel = createModel(context, () => SideBarNavModel());
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarNavModel.dispose();
    clienteNomeEditarController?.dispose();
    gestorDoClienteEditarController?.dispose();
    areaGestorEditarController?.dispose();
    cargoGestorEditarController?.dispose();
    emailEditarController?.dispose();
    telefoneEditarController?.dispose();
    profissionalNomeEditarController?.dispose();
    assuntoPautaEditarController?.dispose();
    detalhesAssuntoEditarController?.dispose();
    dataAgendaEditarController?.dispose();
    horarioAgendaEditarController?.dispose();
    horaFimAgendaEditarController?.dispose();
    enderecoAgendaEditarController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
