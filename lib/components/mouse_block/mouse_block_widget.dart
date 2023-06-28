import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mouse_block_model.dart';
export 'mouse_block_model.dart';

class MouseBlockWidget extends StatefulWidget {
  const MouseBlockWidget({Key? key}) : super(key: key);

  @override
  _MouseBlockWidgetState createState() => _MouseBlockWidgetState();
}

class _MouseBlockWidgetState extends State<MouseBlockWidget> {
  late MouseBlockModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MouseBlockModel());

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

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: MouseRegion(
        opaque: true,
        cursor: SystemMouseCursors.none ?? MouseCursor.defer,
        onEnter: ((event) async {
          setState(() => _model.mouseRegionHovered = true);
        }),
        onExit: ((event) async {
          setState(() => _model.mouseRegionHovered = false);
        }),
      ),
    );
  }
}
