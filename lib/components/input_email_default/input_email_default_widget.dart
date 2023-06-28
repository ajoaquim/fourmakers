import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'input_email_default_model.dart';
export 'input_email_default_model.dart';

class InputEmailDefaultWidget extends StatefulWidget {
  const InputEmailDefaultWidget({Key? key}) : super(key: key);

  @override
  _InputEmailDefaultWidgetState createState() =>
      _InputEmailDefaultWidgetState();
}

class _InputEmailDefaultWidgetState extends State<InputEmailDefaultWidget>
    with TickerProviderStateMixin {
  late InputEmailDefaultModel _model;

  final animationsMap = {
    'textFieldOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: Offset(0.0, 30.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InputEmailDefaultModel());

    _model.campoEmailController ??= TextEditingController();

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

    return
        // Campo de texto de e-mail default para formulários
        TextFormField(
      controller: _model.campoEmailController,
      obscureText: false,
      decoration: InputDecoration(
        labelText: 'E-mail',
        labelStyle: FlutterFlowTheme.of(context).bodySmall.override(
              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
              color: FlutterFlowTheme.of(context).alternate,
              useGoogleFonts: GoogleFonts.asMap()
                  .containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
            ),
        hintText: 'Digite seu e-mail',
        hintStyle: FlutterFlowTheme.of(context).bodySmall,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).primary,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(0.0),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00000000),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(0.0),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).alternate,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(0.0),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).alternate,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(0.0),
        ),
        filled: true,
        fillColor: Color(0xFFE9F1FF),
        contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
      ),
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
            useGoogleFonts: GoogleFonts.asMap()
                .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
            lineHeight: 2.0,
          ),
      validator: _model.campoEmailControllerValidator.asValidator(context),
    ).animateOnPageLoad(animationsMap['textFieldOnPageLoadAnimation']!);
  }
}
