import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dropdown_field_model.dart';
export 'dropdown_field_model.dart';

class DropdownFieldWidget extends StatefulWidget {
  const DropdownFieldWidget({
    Key? key,
    this.textHint,
    this.colorText,
    this.colorBackground,
    this.textIcon,
  }) : super(key: key);

  final String? textHint;
  final Color? colorText;
  final Color? colorBackground;
  final Widget? textIcon;

  @override
  _DropdownFieldWidgetState createState() => _DropdownFieldWidgetState();
}

class _DropdownFieldWidgetState extends State<DropdownFieldWidget> {
  late DropdownFieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DropdownFieldModel());

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
      child: FlutterFlowDropDown<String>(
        controller: _model.dropDownValueController ??=
            FormFieldController<String>(null),
        options: ['Option 1', 'Option 2', 'Option 3'],
        onChanged: (val) => setState(() => _model.dropDownValue = val),
        width: double.infinity,
        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
              color: FlutterFlowTheme.of(context).primaryText,
              useGoogleFonts: GoogleFonts.asMap()
                  .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
            ),
        hintText: widget.textHint,
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: FlutterFlowTheme.of(context).secondaryText,
          size: 15.0,
        ),
        fillColor: FlutterFlowTheme.of(context).field001,
        elevation: 2.0,
        borderColor: FlutterFlowTheme.of(context).borderStrong01,
        borderWidth: 1.0,
        borderRadius: 8.0,
        margin: EdgeInsetsDirectional.fromSTEB(14.0, 5.0, 14.0, 5.0),
        hidesUnderline: true,
        isSearchable: false,
      ),
    );
  }
}
