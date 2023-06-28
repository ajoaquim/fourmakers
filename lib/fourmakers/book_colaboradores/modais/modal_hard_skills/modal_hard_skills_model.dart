import '/components/composite_tag_box/composite_tag_box_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ModalHardSkillsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for compositeTagBox component.
  late CompositeTagBoxModel compositeTagBoxModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    compositeTagBoxModel = createModel(context, () => CompositeTagBoxModel());
  }

  void dispose() {
    compositeTagBoxModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
