import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'modal_add_hard_skill_model.dart';
export 'modal_add_hard_skill_model.dart';

class ModalAddHardSkillWidget extends StatefulWidget {
  const ModalAddHardSkillWidget({Key? key}) : super(key: key);

  @override
  _ModalAddHardSkillWidgetState createState() =>
      _ModalAddHardSkillWidgetState();
}

class _ModalAddHardSkillWidgetState extends State<ModalAddHardSkillWidget> {
  late ModalAddHardSkillModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModalAddHardSkillModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.of(context).size.width * 1.0,
      height: MediaQuery.of(context).size.height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).overlay,
      ),
    );
  }
}
