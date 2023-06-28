import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'composite_tag_box_model.dart';
export 'composite_tag_box_model.dart';

class CompositeTagBoxWidget extends StatefulWidget {
  const CompositeTagBoxWidget({
    Key? key,
    String? tagText,
    Color? tagBackground,
    Color? tagTextColor,
    String? detailText,
  })  : this.tagText = tagText ?? 'text',
        this.tagBackground = tagBackground ?? const Color(0x0C4589FF),
        this.tagTextColor = tagTextColor ?? const Color(0xFF4589FF),
        this.detailText = detailText ?? 'Detail',
        super(key: key);

  final String tagText;
  final Color tagBackground;
  final Color tagTextColor;
  final String detailText;

  @override
  _CompositeTagBoxWidgetState createState() => _CompositeTagBoxWidgetState();
}

class _CompositeTagBoxWidgetState extends State<CompositeTagBoxWidget> {
  late CompositeTagBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompositeTagBoxModel());

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
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: widget.tagTextColor,
          width: 2.0,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
            child: Container(
              width: 130.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: widget.tagBackground,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: widget.tagTextColor,
                ),
              ),
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Text(
                  widget.tagText,
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).titleSmallFamily,
                        color: widget.tagTextColor,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).titleSmallFamily),
                      ),
                ),
              ),
            ),
          ),
          Container(
            width: 90.0,
            height: 30.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Text(
                widget.detailText,
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                      color: widget.tagTextColor,
                      fontWeight: FontWeight.bold,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).titleSmallFamily),
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
