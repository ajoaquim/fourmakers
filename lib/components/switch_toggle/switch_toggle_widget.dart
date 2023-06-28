import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'switch_toggle_model.dart';
export 'switch_toggle_model.dart';

class SwitchToggleWidget extends StatefulWidget {
  const SwitchToggleWidget({Key? key}) : super(key: key);

  @override
  _SwitchToggleWidgetState createState() => _SwitchToggleWidgetState();
}

class _SwitchToggleWidgetState extends State<SwitchToggleWidget> {
  late SwitchToggleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwitchToggleModel());

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

    return Switch(
      value: _model.switchValue ??= false,
      onChanged: (newValue) async {
        setState(() => _model.switchValue = newValue!);
      },
      activeColor: FlutterFlowTheme.of(context).interactive,
      activeTrackColor: FlutterFlowTheme.of(context).backgroundActive,
      inactiveTrackColor: FlutterFlowTheme.of(context).backgroundActive,
      inactiveThumbColor: FlutterFlowTheme.of(context).toggleOff,
    );
  }
}
