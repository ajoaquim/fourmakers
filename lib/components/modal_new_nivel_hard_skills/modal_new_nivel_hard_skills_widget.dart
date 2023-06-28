import '/backend/api_requests/api_calls.dart';
import '/components/modals/modal_new_hard_skills/modal_new_hard_skills_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'modal_new_nivel_hard_skills_model.dart';
export 'modal_new_nivel_hard_skills_model.dart';

class ModalNewNivelHardSkillsWidget extends StatefulWidget {
  const ModalNewNivelHardSkillsWidget({
    Key? key,
    this.hardskills,
  }) : super(key: key);

  final dynamic hardskills;

  @override
  _ModalNewNivelHardSkillsWidgetState createState() =>
      _ModalNewNivelHardSkillsWidgetState();
}

class _ModalNewNivelHardSkillsWidgetState
    extends State<ModalNewNivelHardSkillsWidget> {
  late ModalNewNivelHardSkillsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModalNewNivelHardSkillsModel());

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
                                  'Nível - ${FFAppState().nomecompetencia}',
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
                                                .atualizaNivelHardSkill) {
                                              _model.apiResult4q1 =
                                                  await BackendHomologGroup
                                                      .atualizaNivelHardSkillCall
                                                      .call(
                                                id: FFAppState().idcompetencias,
                                                token: FFAppState().token,
                                                cpf: FFAppState().MyCpf,
                                                nivelId: 1,
                                              );
                                              if ((_model.apiResult4q1
                                                      ?.succeeded ??
                                                  true)) {
                                                Navigator.pop(context);
                                                FFAppState().update(() {
                                                  FFAppState().idcompetencias =
                                                      0;
                                                  FFAppState().nomecompetencia =
                                                      '';
                                                  FFAppState()
                                                      .idnivelcompetencia = 0;
                                                  FFAppState()
                                                          .atualizaNivelHardSkill =
                                                      false;
                                                });
                                                _model.listouHardSkill =
                                                    await BackendHomologGroup
                                                        .listaHardSkillsColabCall
                                                        .call(
                                                  cpfColaborador:
                                                      FFAppState().MyCpf,
                                                  token: FFAppState().token,
                                                );
                                                if ((_model.listouHardSkill
                                                        ?.succeeded ??
                                                    true)) {
                                                  FFAppState().update(() {
                                                    FFAppState().HardSkills =
                                                        (_model.listouHardSkill
                                                                ?.jsonBody ??
                                                            '');
                                                  });
                                                }
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      content: Text(
                                                          'Nível da hard skill atualizado com suceesso!'),
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
                                            } else {
                                              _model.addNivelTrainee =
                                                  await BackendHomologGroup
                                                      .addCompetenciaColabCall
                                                      .call(
                                                id: FFAppState().idcompetencias,
                                                cpf: FFAppState().MyCpf,
                                                token: FFAppState().token,
                                                nivelId: 1,
                                              );
                                              if ((_model.addNivelTrainee
                                                      ?.succeeded ??
                                                  true)) {
                                                Navigator.pop(context);
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      content: Text(
                                                          'Hard Skill adicionada com sucesso!'),
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
                                                  FFAppState().idcompetencias =
                                                      0;
                                                  FFAppState().nomecompetencia =
                                                      '';
                                                  FFAppState()
                                                      .idnivelcompetencia = 0;
                                                });
                                                _model.adicionouHardSkill =
                                                    await BackendHomologGroup
                                                        .listaHardSkillsColabCall
                                                        .call(
                                                  cpfColaborador:
                                                      FFAppState().MyCpf,
                                                  token: FFAppState().token,
                                                );
                                                if ((_model.adicionouHardSkill
                                                        ?.succeeded ??
                                                    true)) {
                                                  FFAppState().update(() {
                                                    FFAppState()
                                                        .HardSkills = (_model
                                                            .adicionouHardSkill
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
                                                        ModalNewHardSkillsWidget(),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            }

                                            setState(() {});
                                          },
                                          text: 'Trainee',
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
                                                .atualizaNivelHardSkill) {
                                              _model.apiAtualizaJunior =
                                                  await BackendHomologGroup
                                                      .atualizaNivelHardSkillCall
                                                      .call(
                                                id: FFAppState().idcompetencias,
                                                nivelId: 2,
                                                token: FFAppState().token,
                                                cpf: FFAppState().MyCpf,
                                              );
                                              if ((_model.apiAtualizaJunior
                                                      ?.succeeded ??
                                                  true)) {
                                                Navigator.pop(context);
                                                FFAppState().update(() {
                                                  FFAppState().idcompetencias =
                                                      0;
                                                  FFAppState().nomecompetencia =
                                                      '';
                                                  FFAppState()
                                                      .idnivelcompetencia = 0;
                                                  FFAppState()
                                                          .atualizaNivelHardSkill =
                                                      false;
                                                });
                                                _model.listouHardSkill2 =
                                                    await BackendHomologGroup
                                                        .listaHardSkillsColabCall
                                                        .call(
                                                  cpfColaborador:
                                                      FFAppState().MyCpf,
                                                  token: FFAppState().token,
                                                );
                                                if ((_model.listouHardSkill2
                                                        ?.succeeded ??
                                                    true)) {
                                                  FFAppState().update(() {
                                                    FFAppState().HardSkills =
                                                        (_model.listouHardSkill2
                                                                ?.jsonBody ??
                                                            '');
                                                  });
                                                }
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      content: Text(
                                                          'Nível da hard skill atualizado com suceesso!'),
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
                                            } else {
                                              _model.addNivelJunior =
                                                  await BackendHomologGroup
                                                      .addCompetenciaColabCall
                                                      .call(
                                                id: FFAppState().idcompetencias,
                                                nivelId: 2,
                                                cpf: FFAppState().MyCpf,
                                                token: FFAppState().token,
                                              );
                                              if ((_model.addNivelJunior
                                                      ?.succeeded ??
                                                  true)) {
                                                Navigator.pop(context);
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      content: Text(
                                                          'Hard Skill adicionada com sucesso!'),
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
                                                  FFAppState().idcompetencias =
                                                      0;
                                                  FFAppState().nomecompetencia =
                                                      '';
                                                  FFAppState()
                                                      .idnivelcompetencia = 0;
                                                });
                                                _model.adicionouHardSkill2 =
                                                    await BackendHomologGroup
                                                        .listaHardSkillsColabCall
                                                        .call(
                                                  cpfColaborador:
                                                      FFAppState().MyCpf,
                                                  token: FFAppState().token,
                                                );
                                                if ((_model.adicionouHardSkill2
                                                        ?.succeeded ??
                                                    true)) {
                                                  FFAppState().update(() {
                                                    FFAppState()
                                                        .HardSkills = (_model
                                                            .adicionouHardSkill2
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
                                                        ModalNewHardSkillsWidget(),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            }

                                            setState(() {});
                                          },
                                          text: 'Júnior',
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
                                                .atualizaNivelHardSkill) {
                                              _model.apiAtualizaPleno =
                                                  await BackendHomologGroup
                                                      .atualizaNivelHardSkillCall
                                                      .call(
                                                id: FFAppState().idcompetencias,
                                                nivelId: 3,
                                                token: FFAppState().token,
                                                cpf: FFAppState().MyCpf,
                                              );
                                              if ((_model.apiAtualizaPleno
                                                      ?.succeeded ??
                                                  true)) {
                                                Navigator.pop(context);
                                                FFAppState().update(() {
                                                  FFAppState().idcompetencias =
                                                      0;
                                                  FFAppState().nomecompetencia =
                                                      '';
                                                  FFAppState()
                                                      .idnivelcompetencia = 0;
                                                  FFAppState()
                                                          .atualizaNivelHardSkill =
                                                      false;
                                                });
                                                _model.listouHardSkill3 =
                                                    await BackendHomologGroup
                                                        .listaHardSkillsColabCall
                                                        .call(
                                                  cpfColaborador:
                                                      FFAppState().MyCpf,
                                                  token: FFAppState().token,
                                                );
                                                if ((_model.listouHardSkill3
                                                        ?.succeeded ??
                                                    true)) {
                                                  FFAppState().update(() {
                                                    FFAppState().HardSkills =
                                                        (_model.listouHardSkill3
                                                                ?.jsonBody ??
                                                            '');
                                                  });
                                                }
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      content: Text(
                                                          'Nível da hard skill atualizado com suceesso!'),
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
                                            } else {
                                              _model.addNivelPleno =
                                                  await BackendHomologGroup
                                                      .addCompetenciaColabCall
                                                      .call(
                                                id: FFAppState().idcompetencias,
                                                nivelId: 3,
                                                cpf: FFAppState().MyCpf,
                                                token: FFAppState().token,
                                              );
                                              if ((_model.addNivelPleno
                                                      ?.succeeded ??
                                                  true)) {
                                                Navigator.pop(context);
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      content: Text(
                                                          'Hard Skill adicionada com sucesso!'),
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
                                                  FFAppState().idcompetencias =
                                                      0;
                                                  FFAppState().nomecompetencia =
                                                      '';
                                                  FFAppState()
                                                      .idnivelcompetencia = 0;
                                                });
                                                _model.adicionouHardSkill3 =
                                                    await BackendHomologGroup
                                                        .listaHardSkillsColabCall
                                                        .call(
                                                  cpfColaborador:
                                                      FFAppState().MyCpf,
                                                  token: FFAppState().token,
                                                );
                                                if ((_model.adicionouHardSkill3
                                                        ?.succeeded ??
                                                    true)) {
                                                  FFAppState().update(() {
                                                    FFAppState()
                                                        .HardSkills = (_model
                                                            .adicionouHardSkill3
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
                                                        ModalNewHardSkillsWidget(),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            }

                                            setState(() {});
                                          },
                                          text: 'Pleno',
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
                                              .atualizaNivelHardSkill) {
                                            _model.apiAtualizaSenior =
                                                await BackendHomologGroup
                                                    .atualizaNivelHardSkillCall
                                                    .call(
                                              id: FFAppState().idcompetencias,
                                              nivelId: 4,
                                              token: FFAppState().token,
                                              cpf: FFAppState().MyCpf,
                                            );
                                            if ((_model.apiAtualizaSenior
                                                    ?.succeeded ??
                                                true)) {
                                              Navigator.pop(context);
                                              FFAppState().update(() {
                                                FFAppState().idcompetencias = 0;
                                                FFAppState().nomecompetencia =
                                                    '';
                                                FFAppState()
                                                    .idnivelcompetencia = 0;
                                                FFAppState()
                                                        .atualizaNivelHardSkill =
                                                    false;
                                              });
                                              _model.listouHardSkill4 =
                                                  await BackendHomologGroup
                                                      .listaHardSkillsColabCall
                                                      .call(
                                                cpfColaborador:
                                                    FFAppState().MyCpf,
                                                token: FFAppState().token,
                                              );
                                              if ((_model.listouHardSkill4
                                                      ?.succeeded ??
                                                  true)) {
                                                FFAppState().update(() {
                                                  FFAppState().HardSkills =
                                                      (_model.listouHardSkill4
                                                              ?.jsonBody ??
                                                          '');
                                                });
                                              }
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    content: Text(
                                                        'Nível da hard skill atualizado com suceesso!'),
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
                                          } else {
                                            _model.addNivelSenior =
                                                await BackendHomologGroup
                                                    .addCompetenciaColabCall
                                                    .call(
                                              id: FFAppState().idcompetencias,
                                              nivelId: 4,
                                              cpf: FFAppState().MyCpf,
                                              token: FFAppState().token,
                                            );
                                            if ((_model.addNivelSenior
                                                    ?.succeeded ??
                                                true)) {
                                              Navigator.pop(context);
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    content: Text(
                                                        'Hard Skill adicionada com sucesso!'),
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
                                                FFAppState().idcompetencias = 0;
                                                FFAppState().nomecompetencia =
                                                    '';
                                                FFAppState()
                                                    .idnivelcompetencia = 0;
                                              });
                                              _model.adicionouHardSkill4 =
                                                  await BackendHomologGroup
                                                      .listaHardSkillsColabCall
                                                      .call(
                                                cpfColaborador:
                                                    FFAppState().MyCpf,
                                                token: FFAppState().token,
                                              );
                                              if ((_model.adicionouHardSkill4
                                                      ?.succeeded ??
                                                  true)) {
                                                FFAppState().update(() {
                                                  FFAppState()
                                                      .HardSkills = (_model
                                                          .adicionouHardSkill4
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
                                                      ModalNewHardSkillsWidget(),
                                                );
                                              },
                                            ).then((value) => setState(() {}));
                                          }

                                          setState(() {});
                                        },
                                        text: 'Sênior',
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
