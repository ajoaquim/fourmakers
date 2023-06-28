import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'gauge_radial_model.dart';
export 'gauge_radial_model.dart';

class GaugeRadialWidget extends StatefulWidget {
  const GaugeRadialWidget({
    Key? key,
    this.textColor,
    this.textValue,
  }) : super(key: key);

  final Color? textColor;
  final String? textValue;

  @override
  _GaugeRadialWidgetState createState() => _GaugeRadialWidgetState();
}

class _GaugeRadialWidgetState extends State<GaugeRadialWidget> {
  late GaugeRadialModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GaugeRadialModel());

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
      width: 200.0,
      child: Stack(
        alignment: AlignmentDirectional(0.0, -0.35),
        children: [
          CircularPercentIndicator(
            percent: 0.5,
            radius: 100.0,
            lineWidth: 20.0,
            animation: true,
            progressColor: FlutterFlowTheme.of(context).interactive,
            backgroundColor: FlutterFlowTheme.of(context).borderDisabled,
            center: Text(
              valueOrDefault<String>(
                widget.textValue,
                '50%',
              ),
              style: FlutterFlowTheme.of(context).displaySmall.override(
                    fontFamily: FlutterFlowTheme.of(context).displaySmallFamily,
                    color: widget.textColor,
                    fontSize: 32.0,
                    fontWeight: FontWeight.w900,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).displaySmallFamily),
                  ),
            ),
            startAngle: 0.0,
          ),
          SelectionArea(
              child: Text(
            'Conclusão',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).bodyMediumFamily),
                ),
          )),
        ],
      ),
    );
  }
}
