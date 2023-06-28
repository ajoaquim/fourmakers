import '/backend/api_requests/api_calls.dart';
import '/components/side_bar_nav/side_bar_nav_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class MapaVisitasNovaAgendaModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel;
  // State field(s) for clienteNome widget.
  TextEditingController? clienteNomeController;
  String? Function(BuildContext, String?)? clienteNomeControllerValidator;
  // State field(s) for gestorDoCliente widget.
  TextEditingController? gestorDoClienteController;
  String? Function(BuildContext, String?)? gestorDoClienteControllerValidator;
  // State field(s) for areaGestor widget.
  TextEditingController? areaGestorController;
  String? Function(BuildContext, String?)? areaGestorControllerValidator;
  // State field(s) for cargoGestor widget.
  TextEditingController? cargoGestorController;
  String? Function(BuildContext, String?)? cargoGestorControllerValidator;
  // State field(s) for email widget.
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for telefone widget.
  TextEditingController? telefoneController;
  final telefoneMask = MaskTextInputFormatter(mask: '(##) #####-####');
  String? Function(BuildContext, String?)? telefoneControllerValidator;
  // State field(s) for profissionalNome widget.
  TextEditingController? profissionalNomeController;
  String? Function(BuildContext, String?)? profissionalNomeControllerValidator;
  // State field(s) for assuntoPauta widget.
  TextEditingController? assuntoPautaController;
  String? Function(BuildContext, String?)? assuntoPautaControllerValidator;
  // State field(s) for detalhesAssunto widget.
  TextEditingController? detalhesAssuntoController;
  String? Function(BuildContext, String?)? detalhesAssuntoControllerValidator;
  DateTime? datePicked;
  // State field(s) for horarioAgenda widget.
  TextEditingController? horarioAgendaController;
  final horarioAgendaMask = MaskTextInputFormatter(mask: '##:##');
  String? Function(BuildContext, String?)? horarioAgendaControllerValidator;
  // State field(s) for horaFimAgenda widget.
  TextEditingController? horaFimAgendaController;
  final horaFimAgendaMask = MaskTextInputFormatter(mask: '##:##');
  String? Function(BuildContext, String?)? horaFimAgendaControllerValidator;
  // State field(s) for DropDown2 widget.
  String? dropDown2Value;
  FormFieldController<String>? dropDown2ValueController;
  // State field(s) for enderecoAgenda widget.
  TextEditingController? enderecoAgendaController;
  String? Function(BuildContext, String?)? enderecoAgendaControllerValidator;
  // Stores action output result for [Backend Call - API (CriarLeads)] action in salvarButton widget.
  ApiCallResponse? apiResult7ff;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarNavModel = createModel(context, () => SideBarNavModel());
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarNavModel.dispose();
    clienteNomeController?.dispose();
    gestorDoClienteController?.dispose();
    areaGestorController?.dispose();
    cargoGestorController?.dispose();
    emailController?.dispose();
    telefoneController?.dispose();
    profissionalNomeController?.dispose();
    assuntoPautaController?.dispose();
    detalhesAssuntoController?.dispose();
    horarioAgendaController?.dispose();
    horaFimAgendaController?.dispose();
    enderecoAgendaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
