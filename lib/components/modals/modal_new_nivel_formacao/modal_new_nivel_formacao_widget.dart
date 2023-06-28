import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'modal_new_nivel_formacao_model.dart';
export 'modal_new_nivel_formacao_model.dart';

class ModalNewNivelFormacaoWidget extends StatefulWidget {
  const ModalNewNivelFormacaoWidget({
    Key? key,
    this.hardskills,
  }) : super(key: key);

  final dynamic hardskills;

  @override
  _ModalNewNivelFormacaoWidgetState createState() =>
      _ModalNewNivelFormacaoWidgetState();
}

class _ModalNewNivelFormacaoWidgetState
    extends State<ModalNewNivelFormacaoWidget> {
  late ModalNewNivelFormacaoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModalNewNivelFormacaoModel());

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
                                  'Nível - ${FFAppState().nomeformacao}',
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
                                    FFAppState().idformacao = 0;
                                    FFAppState().nomeformacao = '';
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
                                                .atualizaNivelFormacao) {
                                              _model.apiResult4q1 =
                                                  await BackendHomologGroup
                                                      .editaFormacaoColabCall
                                                      .call(
                                                token: FFAppState().token,
                                                id: FFAppState().idformacao,
                                                nivelId: 5,
                                                cpf: FFAppState().MyCpf,
                                              );
                                              if ((_model.apiResult4q1
                                                      ?.succeeded ??
                                                  true)) {
                                                _model.apiAtualizaFormacao =
                                                    await BackendHomologGroup
                                                        .listaFormacoesColaboradorCall
                                                        .call(
                                                  token: FFAppState().token,
                                                  cpfColaborador:
                                                      FFAppState().MyCpf,
                                                );
                                                Navigator.pop(context);
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      content: Text(
                                                          'Formação atualizada com suceesso!'),
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
                                                  FFAppState().idformacao = 0;
                                                  FFAppState().nomeformacao =
                                                      '';
                                                  FFAppState()
                                                      .myFormacao = (_model
                                                          .apiAtualizaFormacao
                                                          ?.jsonBody ??
                                                      '');
                                                });
                                              }
                                            } else {
                                              _model.addNivelFormacao =
                                                  await BackendHomologGroup
                                                      .addFormacaoColaboradorCall
                                                      .call(
                                                id: FFAppState().idformacao,
                                                nivelId: 5,
                                                token: FFAppState().token,
                                              );
                                              if ((_model.addNivelFormacao
                                                      ?.succeeded ??
                                                  true)) {
                                                _model.apiAtualizaFormacaoplus =
                                                    await BackendHomologGroup
                                                        .listaFormacoesColaboradorCall
                                                        .call(
                                                  token: FFAppState().token,
                                                  cpfColaborador:
                                                      FFAppState().MyCpf,
                                                );
                                                Navigator.pop(context);
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      content: Text(
                                                          'Formação adicionada com sucesso!'),
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
                                                  FFAppState().idformacao = 0;
                                                  FFAppState().nomeformacao =
                                                      '';
                                                  FFAppState()
                                                      .myFormacao = (_model
                                                          .apiAtualizaFormacaoplus
                                                          ?.jsonBody ??
                                                      '');
                                                });
                                              }
                                            }

                                            setState(() {});
                                          },
                                          text: 'Ensino médio',
                                          options: FFButtonOptions(
                                            width: 200.0,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
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
                                                .atualizaNivelFormacao) {
                                              _model.apiAtualizaGraduacao =
                                                  await BackendHomologGroup
                                                      .editaFormacaoColabCall
                                                      .call(
                                                token: FFAppState().token,
                                                id: FFAppState().idformacao,
                                                nivelId: 6,
                                                cpf: FFAppState().MyCpf,
                                              );
                                              if ((_model.apiAtualizaGraduacao
                                                      ?.succeeded ??
                                                  true)) {
                                                _model.apiAtualizaFormacaoGra =
                                                    await BackendHomologGroup
                                                        .listaFormacoesColaboradorCall
                                                        .call(
                                                  token: FFAppState().token,
                                                  cpfColaborador:
                                                      FFAppState().MyCpf,
                                                );
                                                Navigator.pop(context);
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      content: Text(
                                                          'Formação atualizada com suceesso!'),
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
                                                  FFAppState().idformacao = 0;
                                                  FFAppState().nomeformacao =
                                                      '';
                                                  FFAppState()
                                                      .myFormacao = (_model
                                                          .apiAtualizaFormacaoGra
                                                          ?.jsonBody ??
                                                      '');
                                                });
                                              }
                                            } else {
                                              _model.addNivelFormacaoGraduacao =
                                                  await BackendHomologGroup
                                                      .addFormacaoColaboradorCall
                                                      .call(
                                                id: FFAppState().idformacao,
                                                nivelId: 6,
                                                token: FFAppState().token,
                                              );
                                              if ((_model
                                                      .addNivelFormacaoGraduacao
                                                      ?.succeeded ??
                                                  true)) {
                                                _model.apiAtualizaFormacaoplus2 =
                                                    await BackendHomologGroup
                                                        .listaFormacoesColaboradorCall
                                                        .call(
                                                  token: FFAppState().token,
                                                  cpfColaborador:
                                                      FFAppState().MyCpf,
                                                );
                                                Navigator.pop(context);
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      content: Text(
                                                          'Formação adicionada com sucesso!'),
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
                                                  FFAppState().idformacao = 0;
                                                  FFAppState().nomeformacao =
                                                      '';
                                                  FFAppState()
                                                      .myFormacao = (_model
                                                          .apiAtualizaFormacaoplus2
                                                          ?.jsonBody ??
                                                      '');
                                                });
                                              }
                                            }

                                            setState(() {});
                                          },
                                          text: 'Graduação',
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
                                                .atualizaNivelFormacao) {
                                              _model.apiAtualizaPos =
                                                  await BackendHomologGroup
                                                      .editaFormacaoColabCall
                                                      .call(
                                                token: FFAppState().token,
                                                id: FFAppState().idformacao,
                                                nivelId: 7,
                                                cpf: FFAppState().MyCpf,
                                              );
                                              if ((_model.apiAtualizaPos
                                                      ?.succeeded ??
                                                  true)) {
                                                _model.apiAtualizaPos2 =
                                                    await BackendHomologGroup
                                                        .listaFormacoesColaboradorCall
                                                        .call(
                                                  token: FFAppState().token,
                                                  cpfColaborador:
                                                      FFAppState().MyCpf,
                                                );
                                                Navigator.pop(context);
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      content: Text(
                                                          'Formação atualizada com suceesso!'),
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
                                                  FFAppState().idformacao = 0;
                                                  FFAppState().nomeformacao =
                                                      '';
                                                  FFAppState().myFormacao =
                                                      (_model.apiAtualizaPos2
                                                              ?.jsonBody ??
                                                          '');
                                                });
                                              }
                                            } else {
                                              _model.addNivelFormacaoPos =
                                                  await BackendHomologGroup
                                                      .addFormacaoColaboradorCall
                                                      .call(
                                                id: FFAppState().idformacao,
                                                nivelId: 7,
                                                token: FFAppState().token,
                                              );
                                              if ((_model.addNivelFormacaoPos
                                                      ?.succeeded ??
                                                  true)) {
                                                _model.apiAtualizaFormacaoPos =
                                                    await BackendHomologGroup
                                                        .listaFormacoesColaboradorCall
                                                        .call(
                                                  token: FFAppState().token,
                                                  cpfColaborador:
                                                      FFAppState().MyCpf,
                                                );
                                                Navigator.pop(context);
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      content: Text(
                                                          'Formação adicionada com sucesso!'),
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
                                                  FFAppState().idformacao = 0;
                                                  FFAppState().nomeformacao =
                                                      '';
                                                  FFAppState()
                                                      .myFormacao = (_model
                                                          .apiAtualizaFormacaoPos
                                                          ?.jsonBody ??
                                                      '');
                                                });
                                              }
                                            }

                                            setState(() {});
                                          },
                                          text: 'Pós Graduação',
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
                                                .atualizaNivelFormacao) {
                                              _model.apiEdiaMBA =
                                                  await BackendHomologGroup
                                                      .editaFormacaoColabCall
                                                      .call(
                                                token: FFAppState().token,
                                                id: FFAppState().idformacao,
                                                nivelId: 8,
                                                cpf: FFAppState().MyCpf,
                                              );
                                              if ((_model
                                                      .apiEdiaMBA?.succeeded ??
                                                  true)) {
                                                _model.apiEditaMB2 =
                                                    await BackendHomologGroup
                                                        .listaFormacoesColaboradorCall
                                                        .call(
                                                  token: FFAppState().token,
                                                  cpfColaborador:
                                                      FFAppState().MyCpf,
                                                );
                                                Navigator.pop(context);
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      content: Text(
                                                          'Formação atualizada com suceesso!'),
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
                                                  FFAppState().idformacao = 0;
                                                  FFAppState().nomeformacao =
                                                      '';
                                                  FFAppState().myFormacao =
                                                      (_model.apiEditaMB2
                                                              ?.jsonBody ??
                                                          '');
                                                });
                                              }
                                            } else {
                                              _model.addNivelFormacaoMba =
                                                  await BackendHomologGroup
                                                      .addFormacaoColaboradorCall
                                                      .call(
                                                id: FFAppState().idformacao,
                                                nivelId: 8,
                                                token: FFAppState().token,
                                              );
                                              if ((_model.addNivelFormacaoMba
                                                      ?.succeeded ??
                                                  true)) {
                                                _model.apiAtualizaFormacaoMBA =
                                                    await BackendHomologGroup
                                                        .listaFormacoesColaboradorCall
                                                        .call(
                                                  token: FFAppState().token,
                                                  cpfColaborador:
                                                      FFAppState().MyCpf,
                                                );
                                                Navigator.pop(context);
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      content: Text(
                                                          'Formação adicionada com sucesso!'),
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
                                                  FFAppState().idformacao = 0;
                                                  FFAppState().nomeformacao =
                                                      '';
                                                  FFAppState()
                                                      .myFormacao = (_model
                                                          .apiAtualizaFormacaoMBA
                                                          ?.jsonBody ??
                                                      '');
                                                });
                                              }
                                            }

                                            setState(() {});
                                          },
                                          text: 'MBA',
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
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () async {
                                          if (FFAppState()
                                              .atualizaNivelFormacao) {
                                            _model.apiEditaDoutorado =
                                                await BackendHomologGroup
                                                    .editaFormacaoColabCall
                                                    .call(
                                              token: FFAppState().token,
                                              id: FFAppState().idformacao,
                                              nivelId: 9,
                                              cpf: FFAppState().MyCpf,
                                            );
                                            if ((_model.apiEditaDoutorado
                                                    ?.succeeded ??
                                                true)) {
                                              _model.apiEditaDoutorado2 =
                                                  await BackendHomologGroup
                                                      .listaFormacoesColaboradorCall
                                                      .call(
                                                token: FFAppState().token,
                                                cpfColaborador:
                                                    FFAppState().MyCpf,
                                              );
                                              Navigator.pop(context);
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    content: Text(
                                                        'Formação atualizada com suceesso!'),
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
                                                FFAppState().idformacao = 0;
                                                FFAppState().nomeformacao = '';
                                                FFAppState().myFormacao =
                                                    (_model.apiEditaDoutorado2
                                                            ?.jsonBody ??
                                                        '');
                                              });
                                            }
                                          } else {
                                            _model.addNiveldOUTORADO =
                                                await BackendHomologGroup
                                                    .addFormacaoColaboradorCall
                                                    .call(
                                              id: FFAppState().idformacao,
                                              nivelId: 9,
                                              token: FFAppState().token,
                                            );
                                            if ((_model.addNiveldOUTORADO
                                                    ?.jsonBody ??
                                                '')) {
                                              _model.apiAtualizaDoutorado =
                                                  await BackendHomologGroup
                                                      .listaFormacoesColaboradorCall
                                                      .call(
                                                token: FFAppState().token,
                                                cpfColaborador:
                                                    FFAppState().MyCpf,
                                              );
                                              Navigator.pop(context);
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    content: Text(
                                                        'Formação adicionada com sucesso!'),
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
                                                FFAppState().idformacao = 0;
                                                FFAppState().nomeformacao = '';
                                                FFAppState().myFormacao =
                                                    (_model.apiAtualizaDoutorado
                                                            ?.jsonBody ??
                                                        '');
                                              });
                                            }
                                          }

                                          setState(() {});
                                        },
                                        text: 'Doutorado',
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
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                  FFAppState().idformacao = 0;
                                  FFAppState().nomeformacao = '';
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
