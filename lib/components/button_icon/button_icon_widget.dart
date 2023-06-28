import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'button_icon_model.dart';
export 'button_icon_model.dart';

class ButtonIconWidget extends StatefulWidget {
  const ButtonIconWidget({
    Key? key,
    this.textColor,
    this.backgroundColor,
    this.iconSymbol,
    this.buttonSize,
  }) : super(key: key);

  final Color? textColor;
  final Color? backgroundColor;
  final Widget? iconSymbol;
  final int? buttonSize;

  @override
  _ButtonIconWidgetState createState() => _ButtonIconWidgetState();
}

class _ButtonIconWidgetState extends State<ButtonIconWidget> {
  late ButtonIconModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonIconModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(3.0, 3.0, 3.0, 3.0),
      child: FlutterFlowIconButton(
        borderColor: Colors.transparent,
        borderRadius: 8.0,
        borderWidth: 1.0,
        buttonSize: 42.0,
        fillColor: FlutterFlowTheme.of(context).buttonPrimary,
        icon: widget.iconSymbol!,
        onPressed: () {
          print('IconButton pressed ...');
        },
      ),
    );
  }
}
