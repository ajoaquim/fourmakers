import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'modal_new_nivel_soft_skill_model.dart';
export 'modal_new_nivel_soft_skill_model.dart';

class ModalNewNivelSoftSkillWidget extends StatefulWidget {
  const ModalNewNivelSoftSkillWidget({
    Key? key,
    this.softskill,
  }) : super(key: key);

  final dynamic softskill;

  @override
  _ModalNewNivelSoftSkillWidgetState createState() =>
      _ModalNewNivelSoftSkillWidgetState();
}

class _ModalNewNivelSoftSkillWidgetState
    extends State<ModalNewNivelSoftSkillWidget> {
  late ModalNewNivelSoftSkillModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModalNewNivelSoftSkillModel());

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
                                child: AutoSizeText(
                                  'Nível - ${FFAppState().nomesoftskill}',
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
                                    FFAppState().idsoftskill = 0;
                                    FFAppState().nomesoftskill = '';
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
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () async {
                                          if (FFAppState()
                                                  .atualizaNivelSoftskill ==
                                              true) {
                                            _model.apiResulteog =
                                                await BackendHomologGroup
                                                    .atualizaNivelSoftSkillCall
                                                    .call(
                                              token: FFAppState().token,
                                              id: FFAppState().idsoftskill,
                                              nivelId: 21,
                                              cpf: FFAppState().MyCpf,
                                            );
                                            if ((_model
                                                    .apiResulteog?.succeeded ??
                                                true)) {
                                              Navigator.pop(context);
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    content: Text(
                                                        'Nível atualizado com sucesso!'),
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
                                                FFAppState().idsoftskill = 0;
                                                FFAppState().nomesoftskill = '';
                                              });
                                            }
                                            await Future.delayed(const Duration(
                                                milliseconds: 100));
                                          } else {
                                            _model.apiAtualizaSKDesenvolvido =
                                                await BackendHomologGroup
                                                    .addSoftSkillColabCall
                                                    .call(
                                              token: FFAppState().token,
                                              id: FFAppState().idsoftskill,
                                              nivelId: 21,
                                              cpf: FFAppState().MyCpf,
                                            );
                                            if ((_model
                                                    .apiAtualizaSKDesenvolvido
                                                    ?.succeeded ??
                                                true)) {
                                              Navigator.pop(context);
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    content: Text(
                                                        'Soft skill adicionada com sucesso!'),
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
                                                FFAppState().idsoftskill = 0;
                                                FFAppState().nomesoftskill = '';
                                              });
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    content: Text(
                                                        'Erro ao adicionars soft skill.'),
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
                                            }

                                            await Future.delayed(const Duration(
                                                milliseconds: 100));
                                          }

                                          _model.listouSoftSkills =
                                              await BackendHomologGroup
                                                  .listaSoftskillsColaboradorCall
                                                  .call(
                                            cpfColaborador: FFAppState().MyCpf,
                                            token: FFAppState().token,
                                          );
                                          if ((_model.listouSoftSkills
                                                  ?.succeeded ??
                                              true)) {
                                            FFAppState().update(() {
                                              FFAppState().SoftSkills = (_model
                                                      .listouSoftSkills
                                                      ?.jsonBody ??
                                                  '');
                                            });
                                          }

                                          setState(() {});
                                        },
                                        text: 'Desenvolvido',
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
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () async {
                                          if (FFAppState()
                                                  .atualizaNivelSoftskill ==
                                              true) {
                                            _model.apiAtualizaSOFTSKILL =
                                                await BackendHomologGroup
                                                    .atualizaNivelSoftSkillCall
                                                    .call(
                                              token: FFAppState().token,
                                              id: FFAppState().idsoftskill,
                                              nivelId: 22,
                                              cpf: FFAppState().MyCpf,
                                            );
                                            if ((_model.apiAtualizaSOFTSKILL
                                                    ?.succeeded ??
                                                true)) {
                                              Navigator.pop(context);
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    content: Text(
                                                        'Nível atualizado com sucesso!'),
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
                                                FFAppState().idsoftskill = 0;
                                                FFAppState().nomesoftskill = '';
                                              });
                                            }
                                            await Future.delayed(const Duration(
                                                milliseconds: 100));
                                          } else {
                                            _model.apiAddSKDesenvolviMENTO =
                                                await BackendHomologGroup
                                                    .addSoftSkillColabCall
                                                    .call(
                                              token: FFAppState().token,
                                              id: FFAppState().idsoftskill,
                                              nivelId: 22,
                                              cpf: FFAppState().MyCpf,
                                            );
                                            if ((_model.apiAddSKDesenvolviMENTO
                                                    ?.succeeded ??
                                                true)) {
                                              Navigator.pop(context);
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    content: Text(
                                                        'Soft skill adicionada com sucesso!'),
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
                                                FFAppState().idsoftskill = 0;
                                                FFAppState().nomesoftskill = '';
                                              });
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    content: Text(
                                                        'Erro ao adicionars soft skill.'),
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
                                            }

                                            await Future.delayed(const Duration(
                                                milliseconds: 100));
                                          }

                                          _model.listouSoftSkills2 =
                                              await BackendHomologGroup
                                                  .listaSoftskillsColaboradorCall
                                                  .call(
                                            cpfColaborador: FFAppState().MyCpf,
                                            token: FFAppState().token,
                                          );
                                          if ((_model.listouSoftSkills2
                                                  ?.succeeded ??
                                              true)) {
                                            FFAppState().update(() {
                                              FFAppState().SoftSkills = (_model
                                                      .listouSoftSkills2
                                                      ?.jsonBody ??
                                                  '');
                                            });
                                          }

                                          setState(() {});
                                        },
                                        text: 'Em desenvolvimento',
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
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () async {
                                          if (FFAppState()
                                                  .atualizaNivelSoftskill ==
                                              true) {
                                            _model.apiaTUALIZSAAsKdESENV =
                                                await BackendHomologGroup
                                                    .atualizaNivelSoftSkillCall
                                                    .call(
                                              token: FFAppState().token,
                                              id: FFAppState().idsoftskill,
                                              nivelId: 23,
                                              cpf: FFAppState().MyCpf,
                                            );
                                            if ((_model.apiaTUALIZSAAsKdESENV
                                                    ?.succeeded ??
                                                true)) {
                                              Navigator.pop(context);
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    content: Text(
                                                        'Nível atualizado com sucesso!'),
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
                                                FFAppState().idsoftskill = 0;
                                                FFAppState().nomesoftskill = '';
                                              });
                                            }
                                            await Future.delayed(const Duration(
                                                milliseconds: 100));
                                          } else {
                                            _model.apiaTUALIZAskADESENV =
                                                await BackendHomologGroup
                                                    .addSoftSkillColabCall
                                                    .call(
                                              token: FFAppState().token,
                                              id: FFAppState().idsoftskill,
                                              nivelId: 23,
                                              cpf: FFAppState().MyCpf,
                                            );
                                            if ((_model.apiaTUALIZAskADESENV
                                                    ?.succeeded ??
                                                true)) {
                                              Navigator.pop(context);
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    content: Text(
                                                        'Soft skill adicionada com sucesso!'),
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
                                                FFAppState().idsoftskill = 0;
                                                FFAppState().nomesoftskill = '';
                                              });
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    content: Text(
                                                        'Erro ao adicionars soft skill.'),
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
                                            }

                                            await Future.delayed(const Duration(
                                                milliseconds: 100));
                                          }

                                          _model.listouSoftSkills3 =
                                              await BackendHomologGroup
                                                  .listaSoftskillsColaboradorCall
                                                  .call(
                                            cpfColaborador: FFAppState().MyCpf,
                                            token: FFAppState().token,
                                          );
                                          if ((_model.listouSoftSkills3
                                                  ?.succeeded ??
                                              true)) {
                                            FFAppState().update(() {
                                              FFAppState().SoftSkills = (_model
                                                      .listouSoftSkills3
                                                      ?.jsonBody ??
                                                  '');
                                            });
                                          }

                                          setState(() {});
                                        },
                                        text: 'A desenvolver',
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
                                ),
                              ],
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
                                  FFAppState().idsoftskill = 0;
                                  FFAppState().nomesoftskill = '';
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
