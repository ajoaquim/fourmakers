import '/backend/api_requests/api_calls.dart';
import '/client_b_w_g/empresa/side_bar_empresa/side_bar_empresa_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BeneficiosCriarModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  dynamic addBeneficioResponse;

  int? beneficioID;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideBarEmpresa component.
  late SideBarEmpresaModel sideBarEmpresaModel;
  // State field(s) for toggleSituacao widget.
  bool? toggleSituacaoValue;
  // State field(s) for nomeBeneficio widget.
  TextEditingController? nomeBeneficioController;
  String? Function(BuildContext, String?)? nomeBeneficioControllerValidator;
  // State field(s) for tipoBeneficio widget.
  String? tipoBeneficioValue;
  FormFieldController<String>? tipoBeneficioValueController;
  // State field(s) for descricaoBeneficio widget.
  TextEditingController? descricaoBeneficioController;
  String? Function(BuildContext, String?)?
      descricaoBeneficioControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (addBeneficio)] action in Button widget.
  ApiCallResponse? addBeneficio;
  // Stores action output result for [Backend Call - API (addBeneficioIMG)] action in Button widget.
  ApiCallResponse? addIMG;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarEmpresaModel = createModel(context, () => SideBarEmpresaModel());
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarEmpresaModel.dispose();
    nomeBeneficioController?.dispose();
    descricaoBeneficioController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
