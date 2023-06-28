import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'button_default_model.dart';
export 'button_default_model.dart';

class ButtonDefaultWidget extends StatefulWidget {
  const ButtonDefaultWidget({
    Key? key,
    this.buttonDefaultText,
    this.buttonDefaultBackground,
    this.buttonDefaultColor,
  }) : super(key: key);

  final String? buttonDefaultText;
  final Color? buttonDefaultBackground;
  final Color? buttonDefaultColor;

  @override
  _ButtonDefaultWidgetState createState() => _ButtonDefaultWidgetState();
}

class _ButtonDefaultWidgetState extends State<ButtonDefaultWidget> {
  late ButtonDefaultModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonDefaultModel());

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

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        decoration: BoxDecoration(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(3.0, 3.0, 3.0, 3.0),
          child: FFButtonWidget(
            onPressed: () {
              print('Button pressed ...');
            },
            text: widget.buttonDefaultText!,
            options: FFButtonOptions(
              height: 40.0,
              padding: EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 40.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: widget.buttonDefaultBackground,
              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    color: widget.buttonDefaultColor,
                    fontWeight: FontWeight.w600,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyMediumFamily),
                    lineHeight: 1.4,
                  ),
              elevation: 2.0,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
    );
  }
}
