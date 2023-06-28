import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'default_input_text_model.dart';
export 'default_input_text_model.dart';

class DefaultInputTextWidget extends StatefulWidget {
  const DefaultInputTextWidget({
    Key? key,
    this.inputValue,
    this.inputHint,
    this.inputBlocked,
  }) : super(key: key);

  final String? inputValue;
  final String? inputHint;
  final bool? inputBlocked;

  @override
  _DefaultInputTextWidgetState createState() => _DefaultInputTextWidgetState();
}

class _DefaultInputTextWidgetState extends State<DefaultInputTextWidget> {
  late DefaultInputTextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DefaultInputTextModel());

    _model.inputController ??= TextEditingController(text: widget.inputValue);
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

    return Stack(
      children: [
        TextFormField(
          controller: _model.inputController,
          readOnly: widget.inputBlocked!,
          obscureText: false,
          decoration: InputDecoration(
            isDense: true,
            labelStyle: FlutterFlowTheme.of(context).bodySmall.override(
                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                  color: FlutterFlowTheme.of(context).primaryText,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).bodySmallFamily),
                ),
            hintText: widget.inputHint,
            hintStyle: FlutterFlowTheme.of(context).bodySmall,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).borderSubtle01,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0x00000000),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).supportError,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).supportError,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            filled: true,
            fillColor: FlutterFlowTheme.of(context).field02,
            contentPadding:
                EdgeInsetsDirectional.fromSTEB(14.0, 18.0, 14.0, 18.0),
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                fontSize: 14.0,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
              ),
          validator: _model.inputControllerValidator.asValidator(context),
        ),
      ],
    );
  }
}
