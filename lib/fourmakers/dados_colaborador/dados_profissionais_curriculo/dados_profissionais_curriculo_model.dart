import '/backend/api_requests/api_calls.dart';
import '/components/side_bar_nav/side_bar_nav_widget.dart';
import '/components/the_ultimate_nav_bar/the_ultimate_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DadosProfissionaisCurriculoModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  dynamic fileCV;

  String? cv;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (showMe)] action in DadosProfissionais_Curriculo widget.
  ApiCallResponse? apiToken;
  // Stores action output result for [Backend Call - API (GetCurriculoColaborador)] action in DadosProfissionais_Curriculo widget.
  ApiCallResponse? listouCV;
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel;
  // Stores action output result for [Backend Call - API (GetCurriculoColaborador)] action in Button widget.
  ApiCallResponse? verCVATUAL;
  // Stores action output result for [Custom Action - findAndReplaceStringact] action in Button widget.
  String? linkcv;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (InsereCurriculoColaborador)] action in Button widget.
  ApiCallResponse? updateCV2Copy;
  // Stores action output result for [Backend Call - API (AlterarCurriculoColaborador)] action in Button widget.
  ApiCallResponse? updateCVCopy;
  // Model for TheUltimateNavBar component.
  late TheUltimateNavBarModel theUltimateNavBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarNavModel = createModel(context, () => SideBarNavModel());
    theUltimateNavBarModel =
        createModel(context, () => TheUltimateNavBarModel());
  }

  void dispose() {
    sideBarNavModel.dispose();
    theUltimateNavBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
