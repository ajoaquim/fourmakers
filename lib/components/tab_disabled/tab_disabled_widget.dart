import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tab_disabled_model.dart';
export 'tab_disabled_model.dart';

class TabDisabledWidget extends StatefulWidget {
  const TabDisabledWidget({
    Key? key,
    this.textTab,
    this.colorTab,
    this.colorText,
    this.iconTab,
  }) : super(key: key);

  final String? textTab;
  final Color? colorTab;
  final Color? colorText;
  final Widget? iconTab;

  @override
  _TabDisabledWidgetState createState() => _TabDisabledWidgetState();
}

class _TabDisabledWidgetState extends State<TabDisabledWidget> {
  late TabDisabledModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TabDisabledModel());

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

    return FFButtonWidget(
      onPressed: () {
        print('Button pressed ...');
      },
      text: widget.textTab!,
      icon: widget.iconTab,
      options: FFButtonOptions(
        height: 40.0,
        padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: FlutterFlowTheme.of(context).buttonDisabled0,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
              color: FlutterFlowTheme.of(context).textOnColorDisabled,
              fontSize: 14.0,
              useGoogleFonts: GoogleFonts.asMap()
                  .containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
            ),
        elevation: 2.0,
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 1.0,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
      ),
    );
  }
}
