import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class ModalAdicionarSalarioModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for dataAlteracao widget.
  TextEditingController? dataAlteracaoController;
  final dataAlteracaoMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? dataAlteracaoControllerValidator;
  // State field(s) for cargo widget.
  TextEditingController? cargoController;
  String? Function(BuildContext, String?)? cargoControllerValidator;
  // State field(s) for tipo widget.
  String? tipoValue;
  FormFieldController<String>? tipoValueController;
  // State field(s) for custoSalario widget.
  TextEditingController? custoSalarioController;
  String? Function(BuildContext, String?)? custoSalarioControllerValidator;
  // State field(s) for custoTotalFolha widget.
  TextEditingController? custoTotalFolhaController;
  String? Function(BuildContext, String?)? custoTotalFolhaControllerValidator;
  // State field(s) for custoBeneficios widget.
  TextEditingController? custoBeneficiosController;
  String? Function(BuildContext, String?)? custoBeneficiosControllerValidator;
  // State field(s) for custoHoraFolha widget.
  TextEditingController? custoHoraFolhaController;
  String? Function(BuildContext, String?)? custoHoraFolhaControllerValidator;
  // State field(s) for motivo widget.
  String? motivoValue;
  FormFieldController<String>? motivoValueController;
  // Stores action output result for [Backend Call - API (AddSalario)] action in Button widget.
  ApiCallResponse? apiResultz1s;
  // Stores action output result for [Backend Call - API (GetSalariosByColab)] action in Button widget.
  ApiCallResponse? apiResultbnf;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    dataAlteracaoController?.dispose();
    cargoController?.dispose();
    custoSalarioController?.dispose();
    custoTotalFolhaController?.dispose();
    custoBeneficiosController?.dispose();
    custoHoraFolhaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
