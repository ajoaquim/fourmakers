import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EnvioNotaPJmultiplaModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DropEmpresa widget.
  String? dropEmpresaValue1;
  FormFieldController<String>? dropEmpresaValueController1;
  // State field(s) for DropProjeto widget.
  String? dropProjetoValue1;
  FormFieldController<String>? dropProjetoValueController1;
  // State field(s) for inputModalidade widget.
  TextEditingController? inputModalidadeController1;
  String? Function(BuildContext, String?)? inputModalidadeController1Validator;
  // State field(s) for inputValor widget.
  TextEditingController? inputValorController1;
  String? Function(BuildContext, String?)? inputValorController1Validator;
  // State field(s) for DropMes widget.
  String? dropMesValue1;
  FormFieldController<String>? dropMesValueController1;
  // State field(s) for inputValor widget.
  TextEditingController? inputValorController2;
  String? Function(BuildContext, String?)? inputValorController2Validator;
  // State field(s) for DropEmpresa widget.
  String? dropEmpresaValue2;
  FormFieldController<String>? dropEmpresaValueController2;
  // State field(s) for DropProjeto widget.
  String? dropProjetoValue2;
  FormFieldController<String>? dropProjetoValueController2;
  // State field(s) for inputModalidade widget.
  TextEditingController? inputModalidadeController2;
  String? Function(BuildContext, String?)? inputModalidadeController2Validator;
  // State field(s) for inputValor widget.
  TextEditingController? inputValorController3;
  String? Function(BuildContext, String?)? inputValorController3Validator;
  // State field(s) for DropMes widget.
  String? dropMesValue2;
  FormFieldController<String>? dropMesValueController2;
  // State field(s) for inputValor widget.
  TextEditingController? inputValorController4;
  String? Function(BuildContext, String?)? inputValorController4Validator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    inputModalidadeController1?.dispose();
    inputValorController1?.dispose();
    inputValorController2?.dispose();
    inputModalidadeController2?.dispose();
    inputValorController3?.dispose();
    inputValorController4?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
