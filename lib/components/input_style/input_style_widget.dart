import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'input_style_model.dart';
export 'input_style_model.dart';

class InputStyleWidget extends StatefulWidget {
  const InputStyleWidget({
    Key? key,
    this.fillColor,
    this.lineColor,
  }) : super(key: key);

  final Color? fillColor;
  final Color? lineColor;

  @override
  _InputStyleWidgetState createState() => _InputStyleWidgetState();
}

class _InputStyleWidgetState extends State<InputStyleWidget> {
  late InputStyleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InputStyleModel());

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
      height: 72.0,
      decoration: BoxDecoration(
        color: widget.fillColor,
        boxShadow: [
          BoxShadow(
            color: FlutterFlowTheme.of(context).primary,
            offset: Offset(0.0, 2.0),
          )
        ],
      ),
    );
  }
}
