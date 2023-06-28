import '/components/input_field/input_field_widget.dart';
import '/components/switch_toggle/switch_toggle_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ModalEditarLicencaModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for inputField component.
  late InputFieldModel inputFieldModel1;
  // Model for inputField component.
  late InputFieldModel inputFieldModel2;
  // Model for inputField component.
  late InputFieldModel inputFieldModel3;
  // Model for inputField component.
  late InputFieldModel inputFieldModel4;
  // Model for inputField component.
  late InputFieldModel inputFieldModel5;
  // Model for switchToggle component.
  late SwitchToggleModel switchToggleModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    inputFieldModel1 = createModel(context, () => InputFieldModel());
    inputFieldModel2 = createModel(context, () => InputFieldModel());
    inputFieldModel3 = createModel(context, () => InputFieldModel());
    inputFieldModel4 = createModel(context, () => InputFieldModel());
    inputFieldModel5 = createModel(context, () => InputFieldModel());
    switchToggleModel = createModel(context, () => SwitchToggleModel());
  }

  void dispose() {
    inputFieldModel1.dispose();
    inputFieldModel2.dispose();
    inputFieldModel3.dispose();
    inputFieldModel4.dispose();
    inputFieldModel5.dispose();
    switchToggleModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
