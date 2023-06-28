import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'radio_button_box_model.dart';
export 'radio_button_box_model.dart';

class RadioButtonBoxWidget extends StatefulWidget {
  const RadioButtonBoxWidget({Key? key}) : super(key: key);

  @override
  _RadioButtonBoxWidgetState createState() => _RadioButtonBoxWidgetState();
}

class _RadioButtonBoxWidgetState extends State<RadioButtonBoxWidget> {
  late RadioButtonBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RadioButtonBoxModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 8.0,
              color: FlutterFlowTheme.of(context).buttonDisabled,
              offset: Offset(0.0, 4.0),
            )
          ],
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
          child: Container(
            decoration: BoxDecoration(),
            child: FlutterFlowRadioButton(
              options: ['Opção 1', 'Opção 2', 'Opção 3', 'Opção 4'].toList(),
              onChanged: (val) => setState(() {}),
              controller: _model.radioButtonValueController ??=
                  FormFieldController<String>(null),
              optionHeight: 40.0,
              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    color: Colors.black,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyMediumFamily),
                  ),
              buttonPosition: RadioButtonPosition.left,
              direction: Axis.vertical,
              radioButtonColor: FlutterFlowTheme.of(context).interactive,
              inactiveRadioButtonColor: FlutterFlowTheme.of(context).toggleOff,
              toggleable: false,
              horizontalAlignment: WrapAlignment.start,
              verticalAlignment: WrapCrossAlignment.start,
            ),
          ),
        ),
      ),
    );
  }
}
