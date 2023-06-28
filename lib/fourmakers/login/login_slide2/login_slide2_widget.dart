import '/backend/api_requests/api_calls.dart';
import '/components/loading_modal/loading_modal_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'login_slide2_model.dart';
export 'login_slide2_model.dart';

class LoginSlide2Widget extends StatefulWidget {
  const LoginSlide2Widget({
    Key? key,
    this.code,
  }) : super(key: key);

  final String? code;

  @override
  _LoginSlide2WidgetState createState() => _LoginSlide2WidgetState();
}

class _LoginSlide2WidgetState extends State<LoginSlide2Widget> {
  late LoginSlide2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginSlide2Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 50));
      _model.apiAccessToken = await BackendHomologGroup.getAccessTokenCall.call(
        accesscode: widget.code,
      );
      if ((_model.apiAccessToken?.succeeded ?? true)) {
        _model.apiBuscaDadosColab =
            await BackendHomologGroup.buscaDadosNewCall.call(
          token: getJsonField(
            (_model.apiAccessToken?.jsonBody ?? ''),
            r'''$.token''',
          ).toString().toString(),
        );
        if (getJsonField(
              (_model.apiAccessToken?.jsonBody ?? ''),
              r'''$.token''',
            ) !=
            null) {
          FFAppState().update(() {
            FFAppState().token = getJsonField(
              (_model.apiAccessToken?.jsonBody ?? ''),
              r'''$.token''',
            ).toString().toString();
          });
        } else {
          context.goNamed(
            'loginSlide1',
            extra: <String, dynamic>{
              kTransitionInfoKey: TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
                duration: Duration(milliseconds: 300),
              ),
            },
          );

          return;
        }

        await Future.delayed(const Duration(milliseconds: 500));
        FFAppState().update(() {
          FFAppState().MyCpf = getJsonField(
            (_model.apiAccessToken?.jsonBody ?? ''),
            r'''$.usuario.cpf''',
          ).toString().toString();
          FFAppState().isManager = valueOrDefault<bool>(
            getJsonField(
                      (_model.apiAccessToken?.jsonBody ?? ''),
                      r'''$.usuario.enumeradorDeAcesso''',
                    ) ==
                    FFAppState().colabManager
                ? true
                : false,
            false,
          );
          FFAppState().myName = valueOrDefault<String>(
            getJsonField(
              (_model.apiAccessToken?.jsonBody ?? ''),
              r'''$.usuario.colaborador.nomeCompleto''',
            ).toString().toString(),
            'Desconhecido',
          );
          FFAppState().userid = getJsonField(
            (_model.apiAccessToken?.jsonBody ?? ''),
            r'''$.usuario.codigoProfissional''',
          );
          FFAppState().perfilAcesso = getJsonField(
            (_model.apiAccessToken?.jsonBody ?? ''),
            r'''$.usuario.enumeradorDeAcesso''',
          );
          FFAppState().myManager = getJsonField(
            (_model.apiAccessToken?.jsonBody ?? ''),
            r'''$.usuario.nomeProfissionalSuperior''',
          ).toString().toString();
        });
        FFAppState().update(() {
          FFAppState().isManager = FFAppState().perfilAcesso == 0;
        });
        FFAppState().update(() {
          FFAppState().dadosColab = (_model.apiBuscaDadosColab?.jsonBody ?? '');
        });
        FFAppState().update(() {
          FFAppState().myPhoto = '${functions.urlPhoto(getJsonField(
                FFAppState().dadosColab,
                r'''$.colaborador.urlFoto''',
              ).toString().toString(), FFAppState().token)}';
        });
        // UpdateDadosPessoais
        FFAppState().update(() {
          FFAppState().myName = valueOrDefault<String>(
            getJsonField(
              FFAppState().dadosColab,
              r'''$.colaborador.nomeCompleto''',
            ).toString().toString(),
            'Sem informação',
          );
          FFAppState().myBirthday = valueOrDefault<String>(
            getJsonField(
              FFAppState().dadosColab,
              r'''$.colaborador.dataNascimento''',
            ).toString().toString(),
            'Informar data de nascimento',
          );
          FFAppState().MyRg = valueOrDefault<String>(
            getJsonField(
              FFAppState().dadosColab,
              r'''$.colaborador.rg''',
            ).toString().toString(),
            'Informa seu RG',
          );
          FFAppState().myEstadoCivil = valueOrDefault<String>(
            getJsonField(
              FFAppState().dadosColab,
              r'''$.colaborador.estadoCivil''',
            ).toString().toString(),
            'Sem informação',
          );
          FFAppState().myEscolaridade = valueOrDefault<String>(
            getJsonField(
              FFAppState().dadosColab,
              r'''$.colaborador.escolaridade''',
            ).toString().toString(),
            'Sem informação',
          );
          FFAppState().myEtnia = valueOrDefault<String>(
            getJsonField(
              FFAppState().dadosColab,
              r'''$.colaborador.etnia''',
            ).toString().toString(),
            'Sem informação',
          );
          FFAppState().myGender = valueOrDefault<String>(
            getJsonField(
              FFAppState().dadosColab,
              r'''$.colaborador.genero''',
            ).toString().toString(),
            'Sem informação',
          );
          FFAppState().myOrientacao = valueOrDefault<String>(
            getJsonField(
              FFAppState().dadosColab,
              r'''$.colaborador.orientacaoSexual''',
            ).toString().toString(),
            'Sem informação',
          );
          FFAppState().myRefugiada = getJsonField(
            FFAppState().dadosColab,
            r'''$.colaborador.pessoaRefugiada''',
          ).toString().toString();
          FFAppState().myPassaporte = getJsonField(
            FFAppState().dadosColab,
            r'''$.colaborador.passaporte''',
          ).toString().toString();
        });
        // UpdateContato
        FFAppState().update(() {
          FFAppState().myMailPro = getJsonField(
            FFAppState().dadosColab,
            r'''$.colaborador.email''',
          ).toString().toString();
          FFAppState().myMailAlternative = getJsonField(
            FFAppState().dadosColab,
            r'''$.colaborador.emailAlternativo''',
          ).toString().toString();
          FFAppState().myPhone = getJsonField(
            FFAppState().dadosColab,
            r'''$.colaborador.contatoPrincipal''',
          ).toString().toString();
        });
        // UpdateEndereco
        FFAppState().update(() {
          FFAppState().myCEP = getJsonField(
            FFAppState().dadosColab,
            r'''$.colaborador.endereco.cep''',
          ).toString().toString();
          FFAppState().myAdressNumber = valueOrDefault<String>(
            getJsonField(
              FFAppState().dadosColab,
              r'''$.colaborador.endereco.numero''',
            ).toString().toString(),
            'Informe o número',
          );
          FFAppState().myAdressComplement = valueOrDefault<String>(
            getJsonField(
              FFAppState().dadosColab,
              r'''$.colaborador.endereco.complemento''',
            ).toString().toString(),
            'Informe o complemento',
          );
          FFAppState().myAdressBairro = valueOrDefault<String>(
            getJsonField(
              FFAppState().dadosColab,
              r'''$.colaborador.endereco.bairro''',
            ).toString().toString(),
            'Informe o bairro',
          );
          FFAppState().myAdressCity = valueOrDefault<String>(
            getJsonField(
              FFAppState().dadosColab,
              r'''$.colaborador.endereco.cidade''',
            ).toString().toString(),
            'Informe a cidade',
          );
          FFAppState().myAdressState = valueOrDefault<String>(
            getJsonField(
              FFAppState().dadosColab,
              r'''$.colaborador.endereco.estado''',
            ).toString().toString(),
            'Informe a UF',
          );
          FFAppState().myResidents = valueOrDefault<String>(
            getJsonField(
              FFAppState().dadosColab,
              r'''$.colaborador.endereco.comQuemMora''',
            ).toString().toString(),
            'Informe os residentes',
          );
          FFAppState().myAddress = valueOrDefault<String>(
            getJsonField(
              FFAppState().dadosColab,
              r'''$.colaborador.endereco.endereco''',
            ).toString().toString(),
            'Informe a cidade',
          );
        });
        // UpdateSaude
        FFAppState().update(() {
          FFAppState().mySaudeRelevante = valueOrDefault<String>(
            getJsonField(
              FFAppState().dadosColab,
              r'''$.colaborador.saude.condicaoDeSaudeRelevante''',
            ).toString().toString(),
            'Nenhuma condição',
          );
          FFAppState().myPCD = valueOrDefault<String>(
            getJsonField(
              FFAppState().dadosColab,
              r'''$.colaborador.saude.pcd''',
            ).toString().toString(),
            'Nenhuma',
          );
          FFAppState().myCovidBool = valueOrDefault<bool>(
            getJsonField(
              FFAppState().dadosColab,
              r'''$.colaborador.saude.grupoDeRiscoCovid''',
            ),
            false,
          );
        });
        if (getJsonField(
              (_model.apiAccessToken?.jsonBody ?? ''),
              r'''$.primeiroAcesso''',
            ) ==
            true) {
          await Future.delayed(const Duration(milliseconds: 100));

          context.goNamed(
            'homeDashboard',
            extra: <String, dynamic>{
              kTransitionInfoKey: TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
                duration: Duration(milliseconds: 300),
              ),
            },
          );
        } else {
          await Future.delayed(const Duration(milliseconds: 100));
          setState(() {
            _model.loadingModal = false;
          });
        }
      } else {
        context.goNamed(
          'loginSlide1',
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 300),
            ),
          },
        );
      }
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondary,
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Wrap(
                            spacing: 60.0,
                            runSpacing: 16.0,
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            direction: Axis.horizontal,
                            runAlignment: WrapAlignment.center,
                            verticalDirection: VerticalDirection.down,
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: double.infinity,
                                constraints: BoxConstraints(
                                  maxWidth: 400.0,
                                ),
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 16.0, 16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 12.0),
                                        child: Image.asset(
                                          'assets/images/logo-darkmode.png',
                                          width: 250.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 32.0),
                                        child: Image.asset(
                                          'assets/images/ecossistema1.png',
                                          width: 200.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      if (responsiveVisibility(
                                        context: context,
                                        phone: false,
                                        tablet: false,
                                      ))
                                        Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          constraints: BoxConstraints(
                                            maxWidth: 400.0,
                                            maxHeight: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.7,
                                          ),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.asset(
                                                'assets/images/login2.jpg',
                                              ).image,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(30.0),
                                              bottomRight:
                                                  Radius.circular(30.0),
                                              topLeft: Radius.circular(30.0),
                                              topRight: Radius.circular(200.0),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                constraints: BoxConstraints(
                                  maxWidth: 500.0,
                                ),
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 16.0, 16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Que bom que você chegou,',
                                        style: FlutterFlowTheme.of(context)
                                            .displaySmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .displaySmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .textInverse,
                                              fontSize: 32.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .displaySmallFamily),
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 32.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            FFAppState().myName,
                                            'Colaborador',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .displaySmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmallFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .textInverse,
                                                fontSize: 28.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .displaySmallFamily),
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 32.0),
                                        child: Text(
                                          'Você sabia que o seu plano de desenvolvimento (PDI) agora é digital ? Sim, exatamente. Assim como a atualização de seus dados também é digital, seguindo todos os critérios de proteção de dados. \nEntão, vamos começar.',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .textInverse,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 16.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            FFButtonWidget(
                                              onPressed: () async {
                                                _model.apiResultwog =
                                                    await BackendHomologGroup
                                                        .primeiroAcessoCall
                                                        .call(
                                                  token: FFAppState().token,
                                                );
                                                if ((_model.apiResultwog
                                                        ?.succeeded ??
                                                    true)) {
                                                  context.goNamed(
                                                    'DadosPessoaisNew',
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .fade,
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                      ),
                                                    },
                                                  );
                                                } else {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text(
                                                            'Erro inesperado'),
                                                        content: Text(
                                                            'Por favor, contacte o administrador do sistema.'),
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

                                                  context.goNamed(
                                                    'homeDashboard',
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .fade,
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                      ),
                                                    },
                                                  );
                                                }

                                                setState(() {});
                                              },
                                              text: 'Começar\n',
                                              options: FFButtonOptions(
                                                width: 130.0,
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: Colors.white,
                                                          fontSize: 14.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                elevation: 2.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (_model.loadingModal ?? true)
                wrapWithModel(
                  model: _model.loadingModalModel,
                  updateCallback: () => setState(() {}),
                  child: LoadingModalWidget(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
