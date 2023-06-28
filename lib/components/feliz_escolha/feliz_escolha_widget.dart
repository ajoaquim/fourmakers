import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'feliz_escolha_model.dart';
export 'feliz_escolha_model.dart';

class FelizEscolhaWidget extends StatefulWidget {
  const FelizEscolhaWidget({
    Key? key,
    this.felizEmoji,
    this.felizMood,
  }) : super(key: key);

  final String? felizEmoji;
  final String? felizMood;

  @override
  _FelizEscolhaWidgetState createState() => _FelizEscolhaWidgetState();
}

class _FelizEscolhaWidgetState extends State<FelizEscolhaWidget> {
  late FelizEscolhaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FelizEscolhaModel());

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

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.network(
          valueOrDefault<String>(
            widget.felizEmoji,
            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/fourmakers-2-vr1q98/assets/hjhbtyqz71sd/motivado.png',
          ),
          width: 40.0,
          fit: BoxFit.cover,
        ),
        Text(
          valueOrDefault<String>(
            widget.felizMood,
            'Motivado',
          ),
          style: FlutterFlowTheme.of(context).titleMedium,
        ),
      ],
    );
  }
}
