import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'icon_progress_model.dart';
export 'icon_progress_model.dart';

class IconProgressWidget extends StatefulWidget {
  const IconProgressWidget({
    Key? key,
    this.iconSymbol,
  }) : super(key: key);

  final Widget? iconSymbol;

  @override
  _IconProgressWidgetState createState() => _IconProgressWidgetState();
}

class _IconProgressWidgetState extends State<IconProgressWidget> {
  late IconProgressModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IconProgressModel());

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

    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: widget.iconSymbol!,
      ),
    );
  }
}
