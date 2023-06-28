import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tag_box_model.dart';
export 'tag_box_model.dart';

class TagBoxWidget extends StatefulWidget {
  const TagBoxWidget({
    Key? key,
    this.tagText,
    this.tagBackground,
    this.tagTextColor,
  }) : super(key: key);

  final String? tagText;
  final Color? tagBackground;
  final Color? tagTextColor;

  @override
  _TagBoxWidgetState createState() => _TagBoxWidgetState();
}

class _TagBoxWidgetState extends State<TagBoxWidget> {
  late TagBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TagBoxModel());

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

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
            constraints: BoxConstraints(
              maxHeight: 30.0,
            ),
            decoration: BoxDecoration(
              color: widget.tagBackground,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                child: Text(
                  widget.tagText!,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: widget.tagTextColor,
                        fontSize: 12.0,
                        fontWeight: FontWeight.normal,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
