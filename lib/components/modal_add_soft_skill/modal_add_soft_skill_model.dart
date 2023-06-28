import '/components/dropdown_field/dropdown_field_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ModalAddSoftSkillModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for dropdownField component.
  late DropdownFieldModel dropdownFieldModel1;
  // Model for dropdownField component.
  late DropdownFieldModel dropdownFieldModel2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dropdownFieldModel1 = createModel(context, () => DropdownFieldModel());
    dropdownFieldModel2 = createModel(context, () => DropdownFieldModel());
  }

  void dispose() {
    dropdownFieldModel1.dispose();
    dropdownFieldModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
