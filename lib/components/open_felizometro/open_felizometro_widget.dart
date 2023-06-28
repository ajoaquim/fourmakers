import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'open_felizometro_model.dart';
export 'open_felizometro_model.dart';

class OpenFelizometroWidget extends StatefulWidget {
  const OpenFelizometroWidget({Key? key}) : super(key: key);

  @override
  _OpenFelizometroWidgetState createState() => _OpenFelizometroWidgetState();
}

class _OpenFelizometroWidgetState extends State<OpenFelizometroWidget> {
  late OpenFelizometroModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OpenFelizometroModel());

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
      child: Text(
        'Como se sente hoje?',
        style: FlutterFlowTheme.of(context).bodyMedium,
      ),
    );
  }
}
