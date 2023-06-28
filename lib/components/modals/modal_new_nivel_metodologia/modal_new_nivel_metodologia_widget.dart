import '/backend/api_requests/api_calls.dart';
import '/components/modals/modal_new_metodologia/modal_new_metodologia_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'modal_new_nivel_metodologia_model.dart';
export 'modal_new_nivel_metodologia_model.dart';

class ModalNewNivelMetodologiaWidget extends StatefulWidget {
  const ModalNewNivelMetodologiaWidget({
    Key? key,
    this.hardskills,
  }) : super(key: key);

  final dynamic hardskills;

  @override
  _ModalNewNivelMetodologiaWidgetState createState() =>
      _ModalNewNivelMetodologiaWidgetState();
}

class _ModalNewNivelMetodologiaWidgetState
    extends State<ModalNewNivelMetodologiaWidget> {
  late ModalNewNivelMetodologiaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModalNewNivelMetodologiaModel());

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
      width: MediaQuery.of(context).size.width * 1.0,
      height: MediaQuery.of(context).size.height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).overlay,
      ),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
          child: Container(
            width: 450.0,
            height: double.infinity,
            constraints: BoxConstraints(
              maxWidth: 700.0,
              maxHeight: MediaQuery.of(context).size.height * 0.7,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              30.0, 0.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'Nível - ${FFAppState().nomeMetodologia}',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall,
                                ),
                              ),
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 60.0,
                                icon: Icon(
                                  Icons.close_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 30.0,
                                ),
                                onPressed: () async {
                                  Navigator.pop(context);
                                  FFAppState().update(() {
                                    FFAppState().idcompetencias = 0;
                                    FFAppState().nomecompetencia = '';
                                    FFAppState().idnivelcompetencia = 0;
                                    FFAppState().atualizaNivelHardSkill = false;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 2.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).borderSubtle01,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 16.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FFButtonWidget(
                                            onPressed: () async {
                                              if (FFAppState()
                                                  .atualizaNivelMetodologia) {
                                                _model.apiResult4q1 =
                                                    await BackendHomologGroup
                                                        .atualizaNivelMetodologiaCall
                                                        .call(
                                                  id: FFAppState()
                                                      .idMetodologia,
                                                  nivelId: 10,
                                                  cpf: FFAppState().MyCpf,
                                                  token: FFAppState().token,
                                                );
                                                if ((_model.apiResult4q1
                                                        ?.succeeded ??
                                                    true)) {
                                                  Navigator.pop(context);
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        content: Text(
                                                            'Nível da metodologia atualizada com suceesso!'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                  FFAppState().update(() {
                                                    FFAppState().idMetodologia =
                                                        0;
                                                    FFAppState()
                                                        .nomeMetodologia = '';
                                                    FFAppState()
                                                        .idNivelMetodologia = 0;
                                                    FFAppState()
                                                            .atualizaNivelMetodologia =
                                                        false;
                                                  });
                                                  _model.atualiza1Metodologias =
                                                      await BackendHomologGroup
                                                          .listarMetodologiasColaboradorCall
                                                          .call(
                                                    cpfColaborador:
                                                        FFAppState().MyCpf,
                                                    token: FFAppState().token,
                                                  );
                                                  if ((_model
                                                          .atualiza1Metodologias
                                                          ?.succeeded ??
                                                      true)) {
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                          .metodologias = (_model
                                                              .atualiza1Metodologias
                                                              ?.jsonBody ??
                                                          '');
                                                    });
                                                  }
                                                }
                                              } else {
                                                _model.addNivelCertificado =
                                                    await BackendHomologGroup
                                                        .addMetodologiaColabCall
                                                        .call(
                                                  id: FFAppState()
                                                      .idMetodologia,
                                                  nivelid: 10,
                                                  cpf: FFAppState().MyCpf,
                                                  token: FFAppState().token,
                                                );
                                                if ((_model.addNivelCertificado
                                                        ?.succeeded ??
                                                    true)) {
                                                  Navigator.pop(context);
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        content: Text(
                                                            'Metodologia adicionada com sucesso!'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                  FFAppState().update(() {
                                                    FFAppState().idMetodologia =
                                                        0;
                                                    FFAppState()
                                                        .nomeMetodologia = '';
                                                    FFAppState()
                                                        .idNivelMetodologia = 0;
                                                  });
                                                  _model.add1Metodologias =
                                                      await BackendHomologGroup
                                                          .listarMetodologiasColaboradorCall
                                                          .call(
                                                    cpfColaborador:
                                                        FFAppState().MyCpf,
                                                    token: FFAppState().token,
                                                  );
                                                  if ((_model.add1Metodologias
                                                          ?.succeeded ??
                                                      true)) {
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                          .metodologias = (_model
                                                              .add1Metodologias
                                                              ?.jsonBody ??
                                                          '');
                                                    });
                                                  }
                                                }
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  barrierColor:
                                                      Color(0x00000000),
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding:
                                                          MediaQuery.of(context)
                                                              .viewInsets,
                                                      child:
                                                          ModalNewMetodologiaWidget(),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));
                                              }

                                              setState(() {});
                                            },
                                            text: 'Certificado',
                                            options: FFButtonOptions(
                                              width: 200.0,
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .backgroundHover,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmallFamily,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .textOnColorDisabled,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily),
                                                      ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              hoverColor:
                                                  FlutterFlowTheme.of(context)
                                                      .buttonPrimary00,
                                              hoverTextColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              hoverElevation: 3.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 16.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FFButtonWidget(
                                            onPressed: () async {
                                              if (FFAppState()
                                                  .atualizaNivelMetodologia) {
                                                _model.atualizaNivelAlto =
                                                    await BackendHomologGroup
                                                        .atualizaNivelMetodologiaCall
                                                        .call(
                                                  id: FFAppState()
                                                      .idMetodologia,
                                                  nivelId: 11,
                                                  cpf: FFAppState().MyCpf,
                                                  token: FFAppState().token,
                                                );
                                                if ((_model.atualizaNivelAlto
                                                        ?.succeeded ??
                                                    true)) {
                                                  Navigator.pop(context);
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        content: Text(
                                                            'Nível da metodologia atualizada com suceesso!'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                  FFAppState().update(() {
                                                    FFAppState().idMetodologia =
                                                        0;
                                                    FFAppState()
                                                        .nomeMetodologia = '';
                                                    FFAppState()
                                                        .idNivelMetodologia = 0;
                                                    FFAppState()
                                                            .atualizaNivelMetodologia =
                                                        false;
                                                  });
                                                  _model.atualiza2Metodologias =
                                                      await BackendHomologGroup
                                                          .listarMetodologiasColaboradorCall
                                                          .call(
                                                    cpfColaborador:
                                                        FFAppState().MyCpf,
                                                    token: FFAppState().token,
                                                  );
                                                  if ((_model
                                                          .atualiza2Metodologias
                                                          ?.succeeded ??
                                                      true)) {
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                          .metodologias = (_model
                                                              .atualiza2Metodologias
                                                              ?.jsonBody ??
                                                          '');
                                                    });
                                                  }
                                                }
                                              } else {
                                                _model.addNivelAlto =
                                                    await BackendHomologGroup
                                                        .addMetodologiaColabCall
                                                        .call(
                                                  id: FFAppState()
                                                      .idMetodologia,
                                                  nivelid: 11,
                                                  cpf: FFAppState().MyCpf,
                                                  token: FFAppState().token,
                                                );
                                                if ((_model.addNivelAlto
                                                        ?.succeeded ??
                                                    true)) {
                                                  Navigator.pop(context);
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        content: Text(
                                                            'Metodologia adicionada com sucesso!'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                  FFAppState().update(() {
                                                    FFAppState().idMetodologia =
                                                        0;
                                                    FFAppState()
                                                        .nomeMetodologia = '';
                                                    FFAppState()
                                                        .idNivelMetodologia = 0;
                                                  });
                                                  _model.add2Metodologias =
                                                      await BackendHomologGroup
                                                          .listarMetodologiasColaboradorCall
                                                          .call(
                                                    cpfColaborador:
                                                        FFAppState().MyCpf,
                                                    token: FFAppState().token,
                                                  );
                                                  if ((_model.add2Metodologias
                                                          ?.succeeded ??
                                                      true)) {
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                          .metodologias = (_model
                                                              .add2Metodologias
                                                              ?.jsonBody ??
                                                          '');
                                                    });
                                                  }
                                                }
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  barrierColor:
                                                      Color(0x00000000),
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding:
                                                          MediaQuery.of(context)
                                                              .viewInsets,
                                                      child:
                                                          ModalNewMetodologiaWidget(),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));
                                              }

                                              setState(() {});
                                            },
                                            text: 'Alto',
                                            options: FFButtonOptions(
                                              width: 200.0,
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0x1F8D8D8D),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmallFamily,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .textOnColorDisabled,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily),
                                                      ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              hoverColor:
                                                  FlutterFlowTheme.of(context)
                                                      .buttonPrimary00,
                                              hoverTextColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              hoverElevation: 3.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 16.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FFButtonWidget(
                                            onPressed: () async {
                                              if (FFAppState()
                                                  .atualizaNivelMetodologia) {
                                                _model.atualizaNivelMedio =
                                                    await BackendHomologGroup
                                                        .atualizaNivelMetodologiaCall
                                                        .call(
                                                  id: FFAppState()
                                                      .idMetodologia,
                                                  nivelId: 12,
                                                  cpf: FFAppState().MyCpf,
                                                  token: FFAppState().token,
                                                );
                                                if ((_model.atualizaNivelMedio
                                                        ?.succeeded ??
                                                    true)) {
                                                  Navigator.pop(context);
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        content: Text(
                                                            'Nível da metodologia atualizada com suceesso!'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                  FFAppState().update(() {
                                                    FFAppState().idMetodologia =
                                                        0;
                                                    FFAppState()
                                                        .nomeMetodologia = '';
                                                    FFAppState()
                                                        .idNivelMetodologia = 0;
                                                    FFAppState()
                                                            .atualizaNivelMetodologia =
                                                        false;
                                                  });
                                                  _model.atualiza3Metodologias =
                                                      await BackendHomologGroup
                                                          .listarMetodologiasColaboradorCall
                                                          .call(
                                                    cpfColaborador:
                                                        FFAppState().MyCpf,
                                                    token: FFAppState().token,
                                                  );
                                                  if ((_model
                                                          .atualiza3Metodologias
                                                          ?.succeeded ??
                                                      true)) {
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                          .metodologias = (_model
                                                              .atualiza3Metodologias
                                                              ?.jsonBody ??
                                                          '');
                                                    });
                                                  }
                                                }
                                              } else {
                                                _model.addNivelMedio =
                                                    await BackendHomologGroup
                                                        .addMetodologiaColabCall
                                                        .call(
                                                  id: FFAppState()
                                                      .idMetodologia,
                                                  nivelid: 12,
                                                  cpf: FFAppState().MyCpf,
                                                  token: FFAppState().token,
                                                );
                                                if ((_model.addNivelMedio
                                                        ?.succeeded ??
                                                    true)) {
                                                  Navigator.pop(context);
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        content: Text(
                                                            'Metodologia adicionada com sucesso!'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                  FFAppState().update(() {
                                                    FFAppState().idMetodologia =
                                                        0;
                                                    FFAppState()
                                                        .nomeMetodologia = '';
                                                    FFAppState()
                                                        .idNivelMetodologia = 0;
                                                  });
                                                  _model.add3Metodologias =
                                                      await BackendHomologGroup
                                                          .listarMetodologiasColaboradorCall
                                                          .call(
                                                    cpfColaborador:
                                                        FFAppState().MyCpf,
                                                    token: FFAppState().token,
                                                  );
                                                  if ((_model.add3Metodologias
                                                          ?.succeeded ??
                                                      true)) {
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                          .metodologias = (_model
                                                              .add3Metodologias
                                                              ?.jsonBody ??
                                                          '');
                                                    });
                                                  }
                                                }
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  barrierColor:
                                                      Color(0x00000000),
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding:
                                                          MediaQuery.of(context)
                                                              .viewInsets,
                                                      child:
                                                          ModalNewMetodologiaWidget(),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));
                                              }

                                              setState(() {});
                                            },
                                            text: 'Médio',
                                            options: FFButtonOptions(
                                              width: 200.0,
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0x1F8D8D8D),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmallFamily,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .textOnColorDisabled,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily),
                                                      ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              hoverColor:
                                                  FlutterFlowTheme.of(context)
                                                      .buttonPrimary00,
                                              hoverTextColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              hoverElevation: 3.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
                                            if (FFAppState()
                                                .atualizaNivelMetodologia) {
                                              _model.atualizaNivelBaixo =
                                                  await BackendHomologGroup
                                                      .atualizaNivelMetodologiaCall
                                                      .call(
                                                id: FFAppState().idMetodologia,
                                                nivelId: 13,
                                                cpf: FFAppState().MyCpf,
                                                token: FFAppState().token,
                                              );
                                              if ((_model.atualizaNivelBaixo
                                                      ?.succeeded ??
                                                  true)) {
                                                Navigator.pop(context);
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      content: Text(
                                                          'Nível da metodologia atualizada com suceesso!'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: Text('Ok'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                                FFAppState().update(() {
                                                  FFAppState().idMetodologia =
                                                      0;
                                                  FFAppState().nomeMetodologia =
                                                      '';
                                                  FFAppState()
                                                      .idNivelMetodologia = 0;
                                                  FFAppState()
                                                          .atualizaNivelMetodologia =
                                                      false;
                                                });
                                                _model.atualiza4Metodologias =
                                                    await BackendHomologGroup
                                                        .listarMetodologiasColaboradorCall
                                                        .call(
                                                  cpfColaborador:
                                                      FFAppState().MyCpf,
                                                  token: FFAppState().token,
                                                );
                                                if ((_model
                                                        .atualiza4Metodologias
                                                        ?.succeeded ??
                                                    true)) {
                                                  FFAppState().update(() {
                                                    FFAppState()
                                                        .metodologias = (_model
                                                            .atualiza4Metodologias
                                                            ?.jsonBody ??
                                                        '');
                                                  });
                                                }
                                              }
                                            } else {
                                              _model.addNivelBaixo =
                                                  await BackendHomologGroup
                                                      .addMetodologiaColabCall
                                                      .call(
                                                id: FFAppState().idMetodologia,
                                                nivelid: 13,
                                                cpf: FFAppState().MyCpf,
                                                token: FFAppState().token,
                                              );
                                              if ((_model.addNivelBaixo
                                                      ?.succeeded ??
                                                  true)) {
                                                Navigator.pop(context);
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      content: Text(
                                                          'Metodologia adicionada com sucesso!'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: Text('Ok'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                                FFAppState().update(() {
                                                  FFAppState().idMetodologia =
                                                      0;
                                                  FFAppState().nomeMetodologia =
                                                      '';
                                                  FFAppState()
                                                      .idNivelMetodologia = 0;
                                                });
                                                _model.add4Metodologias =
                                                    await BackendHomologGroup
                                                        .listarMetodologiasColaboradorCall
                                                        .call(
                                                  cpfColaborador:
                                                      FFAppState().MyCpf,
                                                  token: FFAppState().token,
                                                );
                                                if ((_model.add4Metodologias
                                                        ?.succeeded ??
                                                    true)) {
                                                  FFAppState().update(() {
                                                    FFAppState().metodologias =
                                                        (_model.add4Metodologias
                                                                ?.jsonBody ??
                                                            '');
                                                  });
                                                }
                                              }
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                barrierColor: Color(0x00000000),
                                                enableDrag: false,
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.of(context)
                                                            .viewInsets,
                                                    child:
                                                        ModalNewMetodologiaWidget(),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            }

                                            setState(() {});
                                          },
                                          text: 'Baixo',
                                          options: FFButtonOptions(
                                            width: 200.0,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0x1F8D8D8D),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallFamily,
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .textOnColorDisabled,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily),
                                                    ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            hoverColor:
                                                FlutterFlowTheme.of(context)
                                                    .buttonPrimary00,
                                            hoverTextColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBtnText,
                                            hoverElevation: 3.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 32.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                Navigator.pop(context);
                                FFAppState().update(() {
                                  FFAppState().idcompetencias = 0;
                                  FFAppState().nomecompetencia = '';
                                  FFAppState().idnivelcompetencia = 0;
                                  FFAppState().atualizaNivelHardSkill = false;
                                });
                              },
                              text: 'Cancelar',
                              options: FFButtonOptions(
                                width: 200.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 14.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily),
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .borderSubtle01,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
