import '/components/loading_modal/loading_modal_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoadingPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for loadingModal component.
  late LoadingModalModel loadingModalModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    loadingModalModel = createModel(context, () => LoadingModalModel());
  }

  void dispose() {
    unfocusNode.dispose();
    loadingModalModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
