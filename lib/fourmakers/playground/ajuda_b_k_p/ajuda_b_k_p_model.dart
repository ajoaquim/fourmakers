import '/components/side_bar_nav/side_bar_nav_widget.dart';
import '/components/the_ultimate_nav_bar/the_ultimate_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class AjudaBKPModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel;
  // State field(s) for colabPhone widget.
  TextEditingController? colabPhoneController1;
  final colabPhoneMask1 = MaskTextInputFormatter(mask: '(##)#####-####');
  String? Function(BuildContext, String?)? colabPhoneController1Validator;
  // State field(s) for colabPhone widget.
  TextEditingController? colabPhoneController2;
  final colabPhoneMask2 = MaskTextInputFormatter(mask: '(##)#####-####');
  String? Function(BuildContext, String?)? colabPhoneController2Validator;
  // State field(s) for colabPhone widget.
  TextEditingController? colabPhoneController3;
  final colabPhoneMask3 = MaskTextInputFormatter(mask: '(##)#####-####');
  String? Function(BuildContext, String?)? colabPhoneController3Validator;
  // Model for TheUltimateNavBar component.
  late TheUltimateNavBarModel theUltimateNavBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarNavModel = createModel(context, () => SideBarNavModel());
    theUltimateNavBarModel =
        createModel(context, () => TheUltimateNavBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarNavModel.dispose();
    colabPhoneController1?.dispose();
    colabPhoneController2?.dispose();
    colabPhoneController3?.dispose();
    theUltimateNavBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
