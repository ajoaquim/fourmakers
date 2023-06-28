import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'feliz_motivado_model.dart';
export 'feliz_motivado_model.dart';

class FelizMotivadoWidget extends StatefulWidget {
  const FelizMotivadoWidget({
    Key? key,
    this.felizChoiceEmoji,
    this.felizChoiceMood,
  }) : super(key: key);

  final String? felizChoiceEmoji;
  final String? felizChoiceMood;

  @override
  _FelizMotivadoWidgetState createState() => _FelizMotivadoWidgetState();
}

class _FelizMotivadoWidgetState extends State<FelizMotivadoWidget> {
  late FelizMotivadoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FelizMotivadoModel());

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
            widget.felizChoiceEmoji,
            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/fourmakers-2-vr1q98/assets/hjhbtyqz71sd/motivado.png',
          ),
          width: 40.0,
          fit: BoxFit.cover,
        ),
        Text(
          valueOrDefault<String>(
            widget.felizChoiceMood,
            'Motivado',
          ),
          style: FlutterFlowTheme.of(context).titleMedium,
        ),
      ],
    );
  }
}
