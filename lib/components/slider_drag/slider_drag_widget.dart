import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'slider_drag_model.dart';
export 'slider_drag_model.dart';

class SliderDragWidget extends StatefulWidget {
  const SliderDragWidget({Key? key}) : super(key: key);

  @override
  _SliderDragWidgetState createState() => _SliderDragWidgetState();
}

class _SliderDragWidgetState extends State<SliderDragWidget> {
  late SliderDragModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SliderDragModel());

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

    return SliderTheme(
      data: SliderThemeData(
        showValueIndicator: ShowValueIndicator.always,
      ),
      child: Slider(
        activeColor: FlutterFlowTheme.of(context).borderInteractive,
        inactiveColor: Color(0xFF9E9E9E),
        min: 0.0,
        max: 10.0,
        value: _model.sliderValue ??= 5.0,
        label: _model.sliderValue.toString(),
        onChanged: (newValue) {
          setState(() => _model.sliderValue = newValue);
        },
      ),
    );
  }
}
