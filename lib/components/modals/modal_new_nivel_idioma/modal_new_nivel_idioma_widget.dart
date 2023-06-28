import '/backend/api_requests/api_calls.dart';
import '/components/modals/modal_new_idioma/modal_new_idioma_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'modal_new_nivel_idioma_model.dart';
export 'modal_new_nivel_idioma_model.dart';

class ModalNewNivelIdiomaWidget extends StatefulWidget {
  const ModalNewNivelIdiomaWidget({
    Key? key,
    this.hardskills,
  }) : super(key: key);

  final dynamic hardskills;

  @override
  _ModalNewNivelIdiomaWidgetState createState() =>
      _ModalNewNivelIdiomaWidgetState();
}

class _ModalNewNivelIdiomaWidgetState extends State<ModalNewNivelIdiomaWidget> {
  late ModalNewNivelIdiomaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModalNewNivelIdiomaModel());

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
                                  'Nível - ${FFAppState().nomeIdioma}',
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
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                                  .atualizaNivelIdioma) {
                                                _model.lista1Idioma =
                                                    await BackendHomologGroup
                                                        .atualizaNivelIdiomaCall
                                                        .call(
                                                  id: FFAppState().idIdioma,
                                                  nivelId: 24,
                                                  cpf: FFAppState().MyCpf,
                                                  token: FFAppState().token,
                                                );
                                                if ((_model.lista1Idioma
                                                        ?.succeeded ??
                                                    true)) {
                                                  Navigator.pop(context);
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        content: Text(
                                                            'Nível do idioma atualizado com suceesso!'),
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
                                                    FFAppState().idIdioma = 0;
                                                    FFAppState().nomeIdioma =
                                                        '';
                                                    FFAppState().idNivelIdioma =
                                                        0;
                                                    FFAppState()
                                                            .atualizaNivelIdioma =
                                                        false;
                                                  });
                                                  _model.atualiza1Idioma =
                                                      await BackendHomologGroup
                                                          .listarIdiomasColaboradorCall
                                                          .call(
                                                    cpfColaborador:
                                                        FFAppState().MyCpf,
                                                    token: FFAppState().token,
                                                  );
                                                  if ((_model.atualiza1Idioma
                                                          ?.succeeded ??
                                                      true)) {
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                          .idiomas = (_model
                                                              .atualiza1Idioma
                                                              ?.jsonBody ??
                                                          '');
                                                    });
                                                  }
                                                }
                                              } else {
                                                _model.chama1Idioma =
                                                    await BackendHomologGroup
                                                        .addIdiomaColabCall
                                                        .call(
                                                  id: FFAppState().idIdioma,
                                                  nivelid: 24,
                                                  token: FFAppState().token,
                                                  cpf: FFAppState().MyCpf,
                                                );
                                                if ((_model.chama1Idioma
                                                        ?.succeeded ??
                                                    true)) {
                                                  Navigator.pop(context);
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        content: Text(
                                                            'Idioma adicionado com sucesso!'),
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
                                                    FFAppState().idIdioma = 0;
                                                    FFAppState().nomeIdioma =
                                                        '';
                                                    FFAppState().idNivelIdioma =
                                                        0;
                                                  });
                                                  _model.add1Idioma =
                                                      await BackendHomologGroup
                                                          .listarIdiomasColaboradorCall
                                                          .call(
                                                    cpfColaborador:
                                                        FFAppState().MyCpf,
                                                    token: FFAppState().token,
                                                  );
                                                  if ((_model.add1Idioma
                                                          ?.succeeded ??
                                                      true)) {
                                                    FFAppState().update(() {
                                                      FFAppState().idiomas =
                                                          (_model.add1Idioma
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
                                                          ModalNewIdiomaWidget(),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));
                                              }

                                              setState(() {});
                                            },
                                            text: 'Básico',
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
                                                  .atualizaNivelIdioma) {
                                                _model.lista2Idioma =
                                                    await BackendHomologGroup
                                                        .atualizaNivelIdiomaCall
                                                        .call(
                                                  id: FFAppState().idIdioma,
                                                  nivelId: 25,
                                                  cpf: FFAppState().MyCpf,
                                                  token: FFAppState().token,
                                                );
                                                if ((_model.lista2Idioma
                                                        ?.succeeded ??
                                                    true)) {
                                                  Navigator.pop(context);
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        content: Text(
                                                            'Nível do idioma atualizado com suceesso!'),
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
                                                    FFAppState().idIdioma = 0;
                                                    FFAppState().nomeIdioma =
                                                        '';
                                                    FFAppState().idNivelIdioma =
                                                        0;
                                                    FFAppState()
                                                            .atualizaNivelIdioma =
                                                        false;
                                                  });
                                                  _model.atualiza2Idioma =
                                                      await BackendHomologGroup
                                                          .listarIdiomasColaboradorCall
                                                          .call(
                                                    cpfColaborador:
                                                        FFAppState().MyCpf,
                                                    token: FFAppState().token,
                                                  );
                                                  if ((_model.atualiza2Idioma
                                                          ?.succeeded ??
                                                      true)) {
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                          .idiomas = (_model
                                                              .atualiza2Idioma
                                                              ?.jsonBody ??
                                                          '');
                                                    });
                                                  }
                                                }
                                              } else {
                                                _model.chama2Idioma =
                                                    await BackendHomologGroup
                                                        .addIdiomaColabCall
                                                        .call(
                                                  id: FFAppState().idIdioma,
                                                  nivelid: 25,
                                                  token: FFAppState().token,
                                                  cpf: FFAppState().MyCpf,
                                                );
                                                if ((_model.chama2Idioma
                                                        ?.succeeded ??
                                                    true)) {
                                                  Navigator.pop(context);
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        content: Text(
                                                            'Idioma adicionado com sucesso!'),
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
                                                    FFAppState().idIdioma = 0;
                                                    FFAppState().nomeIdioma =
                                                        '';
                                                    FFAppState().idNivelIdioma =
                                                        0;
                                                  });
                                                  _model.add2Idioma =
                                                      await BackendHomologGroup
                                                          .listarIdiomasColaboradorCall
                                                          .call(
                                                    cpfColaborador:
                                                        FFAppState().MyCpf,
                                                    token: FFAppState().token,
                                                  );
                                                  if ((_model.add2Idioma
                                                          ?.succeeded ??
                                                      true)) {
                                                    FFAppState().update(() {
                                                      FFAppState().idiomas =
                                                          (_model.add2Idioma
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
                                                          ModalNewIdiomaWidget(),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));
                                              }

                                              setState(() {});
                                            },
                                            text: 'Intermediário',
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
                                                  .atualizaNivelIdioma) {
                                                _model.lista3Idioma =
                                                    await BackendHomologGroup
                                                        .atualizaNivelIdiomaCall
                                                        .call(
                                                  id: FFAppState().idIdioma,
                                                  nivelId: 26,
                                                  cpf: FFAppState().MyCpf,
                                                  token: FFAppState().token,
                                                );
                                                if ((_model.lista3Idioma
                                                        ?.succeeded ??
                                                    true)) {
                                                  Navigator.pop(context);
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        content: Text(
                                                            'Nível do idioma atualizado com suceesso!'),
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
                                                    FFAppState().idIdioma = 0;
                                                    FFAppState().nomeIdioma =
                                                        '';
                                                    FFAppState().idNivelIdioma =
                                                        0;
                                                    FFAppState()
                                                            .atualizaNivelIdioma =
                                                        false;
                                                  });
                                                  _model.atualiza3Idioma =
                                                      await BackendHomologGroup
                                                          .listarIdiomasColaboradorCall
                                                          .call(
                                                    cpfColaborador:
                                                        FFAppState().MyCpf,
                                                    token: FFAppState().token,
                                                  );
                                                  if ((_model.atualiza3Idioma
                                                          ?.succeeded ??
                                                      true)) {
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                          .idiomas = (_model
                                                              .atualiza3Idioma
                                                              ?.jsonBody ??
                                                          '');
                                                    });
                                                  }
                                                }
                                              } else {
                                                _model.chama3Idioma =
                                                    await BackendHomologGroup
                                                        .addIdiomaColabCall
                                                        .call(
                                                  id: FFAppState().idIdioma,
                                                  nivelid: 26,
                                                  token: FFAppState().token,
                                                  cpf: FFAppState().MyCpf,
                                                );
                                                if ((_model.chama3Idioma
                                                        ?.succeeded ??
                                                    true)) {
                                                  Navigator.pop(context);
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        content: Text(
                                                            'Idioma adicionado com sucesso!'),
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
                                                    FFAppState().idIdioma = 0;
                                                    FFAppState().nomeIdioma =
                                                        '';
                                                    FFAppState().idNivelIdioma =
                                                        0;
                                                  });
                                                  _model.add3Idioma =
                                                      await BackendHomologGroup
                                                          .listarIdiomasColaboradorCall
                                                          .call(
                                                    cpfColaborador:
                                                        FFAppState().MyCpf,
                                                    token: FFAppState().token,
                                                  );
                                                  if ((_model.add3Idioma
                                                          ?.succeeded ??
                                                      true)) {
                                                    FFAppState().update(() {
                                                      FFAppState().idiomas =
                                                          (_model.add3Idioma
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
                                                          ModalNewIdiomaWidget(),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));
                                              }

                                              setState(() {});
                                            },
                                            text: 'Avançado',
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
                                                .atualizaNivelIdioma) {
                                              _model.lista4Idioma =
                                                  await BackendHomologGroup
                                                      .atualizaNivelIdiomaCall
                                                      .call(
                                                id: FFAppState().idIdioma,
                                                nivelId: 27,
                                                cpf: FFAppState().MyCpf,
                                                token: FFAppState().token,
                                              );
                                              if ((_model.lista4Idioma
                                                      ?.succeeded ??
                                                  true)) {
                                                Navigator.pop(context);
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      content: Text(
                                                          'Nível do idioma atualizado com suceesso!'),
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
                                                  FFAppState().idIdioma = 0;
                                                  FFAppState().nomeIdioma = '';
                                                  FFAppState().idNivelIdioma =
                                                      0;
                                                  FFAppState()
                                                          .atualizaNivelIdioma =
                                                      false;
                                                });
                                                _model.atualiza4Idioma =
                                                    await BackendHomologGroup
                                                        .listarIdiomasColaboradorCall
                                                        .call(
                                                  cpfColaborador:
                                                      FFAppState().MyCpf,
                                                  token: FFAppState().token,
                                                );
                                                if ((_model.atualiza4Idioma
                                                        ?.succeeded ??
                                                    true)) {
                                                  FFAppState().update(() {
                                                    FFAppState().idiomas =
                                                        (_model.atualiza4Idioma
                                                                ?.jsonBody ??
                                                            '');
                                                  });
                                                }
                                              }
                                            } else {
                                              _model.chama4Idioma =
                                                  await BackendHomologGroup
                                                      .addIdiomaColabCall
                                                      .call(
                                                id: FFAppState().idIdioma,
                                                nivelid: 27,
                                                token: FFAppState().token,
                                                cpf: FFAppState().MyCpf,
                                              );
                                              if ((_model.chama4Idioma
                                                      ?.succeeded ??
                                                  true)) {
                                                Navigator.pop(context);
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      content: Text(
                                                          'Idioma adicionado com sucesso!'),
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
                                                  FFAppState().idIdioma = 0;
                                                  FFAppState().nomeIdioma = '';
                                                  FFAppState().idNivelIdioma =
                                                      0;
                                                });
                                                _model.add4Idioma =
                                                    await BackendHomologGroup
                                                        .listarIdiomasColaboradorCall
                                                        .call(
                                                  cpfColaborador:
                                                      FFAppState().MyCpf,
                                                  token: FFAppState().token,
                                                );
                                                if ((_model.add4Idioma
                                                        ?.succeeded ??
                                                    true)) {
                                                  FFAppState().update(() {
                                                    FFAppState().idiomas =
                                                        (_model.add4Idioma
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
                                                        ModalNewIdiomaWidget(),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            }

                                            setState(() {});
                                          },
                                          text: 'Fluente',
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
