import '/backend/api_requests/api_calls.dart';
import '/components/loading_modal/loading_modal_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'loading_empresa_model.dart';
export 'loading_empresa_model.dart';

class LoadingEmpresaWidget extends StatefulWidget {
  const LoadingEmpresaWidget({Key? key}) : super(key: key);

  @override
  _LoadingEmpresaWidgetState createState() => _LoadingEmpresaWidgetState();
}

class _LoadingEmpresaWidgetState extends State<LoadingEmpresaWidget> {
  late LoadingEmpresaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingEmpresaModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.loadData = await EmpresaGroup.empresaShowMeCall.call(
        token: FFAppState().tokenEmpresa,
      );
      if ((_model.loadData?.succeeded ?? true)) {
        // loadJsonData
        FFAppState().update(() {
          FFAppState().showMeDataEmpresa = (_model.loadData?.jsonBody ?? '');
        });
        // getID
        FFAppState().update(() {
          FFAppState().empresaID = getJsonField(
            FFAppState().showMeDataEmpresa,
            r'''$.id''',
          ).toString().toString();
        });
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('Sessão expirada'),
              content: Text('Você está sendo redirecionado para o login.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );

        context.goNamed(
          'loginPJ',
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 300),
            ),
          },
        );
      }

      await Future.delayed(const Duration(milliseconds: 2000));

      context.goNamed(
        'homeEmpresa',
        extra: <String, dynamic>{
          kTransitionInfoKey: TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
            duration: Duration(milliseconds: 300),
          ),
        },
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).background,
        body: SafeArea(
          top: true,
          child: wrapWithModel(
            model: _model.loadingModalModel,
            updateCallback: () => setState(() {}),
            child: LoadingModalWidget(),
          ),
        ),
      ),
    );
  }
}
