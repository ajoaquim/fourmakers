import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'avatar_box_model.dart';
export 'avatar_box_model.dart';

class AvatarBoxWidget extends StatefulWidget {
  const AvatarBoxWidget({Key? key}) : super(key: key);

  @override
  _AvatarBoxWidgetState createState() => _AvatarBoxWidgetState();
}

class _AvatarBoxWidgetState extends State<AvatarBoxWidget> {
  late AvatarBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AvatarBoxModel());

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
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
          child: Container(
            decoration: BoxDecoration(),
            child: Container(
              width: 40.0,
              child: Stack(
                alignment: AlignmentDirectional(1.0, 1.0),
                children: [
                  Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(100.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).white70,
                        width: 2.0,
                      ),
                    ),
                    child: Container(
                      width: 120.0,
                      height: 120.0,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        'https://musicnonstop.uol.com.br/wp-content/uploads/2021/05/black-widow-scarlett-johansson-movie.jpg',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Container(
                    width: 15.0,
                    height: 15.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(50.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).white70,
                        width: 1.0,
                      ),
                    ),
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        'https://www.foursys.com.br/ico/apple-touch-icon-144-precomposed.png',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
              child: AutoSizeText(
                FFAppState().myName.maybeHandleOverflow(
                      maxChars: 32,
                      replacement: '…',
                    ),
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontWeight: FontWeight.bold,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodySmallFamily),
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
              child: AutoSizeText(
                FFAppState().myEmail.maybeHandleOverflow(
                      maxChars: 32,
                      replacement: '…',
                    ),
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontWeight: FontWeight.normal,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodySmallFamily),
                    ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
