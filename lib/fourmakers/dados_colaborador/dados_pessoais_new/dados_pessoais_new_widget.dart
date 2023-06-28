import '/backend/api_requests/api_calls.dart';
import '/components/listas/sem_contato_emergencia/sem_contato_emergencia_widget.dart';
import '/components/listas/sem_dependentes/sem_dependentes_widget.dart';
import '/components/modals/modal_add_contato_emerg/modal_add_contato_emerg_widget.dart';
import '/components/modals/modal_add_dependente/modal_add_dependente_widget.dart';
import '/components/modals/modal_edit_contato_emerg/modal_edit_contato_emerg_widget.dart';
import '/components/modals/modal_edit_depen/modal_edit_depen_widget.dart';
import '/components/modals/modal_grupo_risco/modal_grupo_risco_widget.dart';
import '/components/modals/modal_identidade/modal_identidade_widget.dart';
import '/components/modals/modal_mudar_photo/modal_mudar_photo_widget.dart';
import '/components/modals/modal_orientacao/modal_orientacao_widget.dart';
import '/components/side_bar_nav/side_bar_nav_widget.dart';
import '/components/the_ultimate_nav_bar/the_ultimate_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'dados_pessoais_new_model.dart';
export 'dados_pessoais_new_model.dart';

class DadosPessoaisNewWidget extends StatefulWidget {
  const DadosPessoaisNewWidget({Key? key}) : super(key: key);

  @override
  _DadosPessoaisNewWidgetState createState() => _DadosPessoaisNewWidgetState();
}

class _DadosPessoaisNewWidgetState extends State<DadosPessoaisNewWidget> {
  late DadosPessoaisNewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DadosPessoaisNewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 50));
      _model.apiToken = await BackendHomologGroup.showMeCall.call(
        tokenx: FFAppState().token,
      );
      if (getJsonField(
        (_model.apiToken?.jsonBody ?? ''),
        r'''$.sucesso''',
      )) {
        FFAppState().update(() {
          FFAppState().MCContato = false;
          FFAppState().MCEndereco = false;
          FFAppState().MCSaude = false;
          FFAppState().MCDependentes = false;
        });
      } else {
        context.pushNamed('loginSlide1');

        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('Sessão expirada!'),
              content: Text(
                  'Você não está logado. Por favor, efetue o login novamente.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
        return;
      }

      FFAppState().update(() {
        FFAppState().MCDadosPessoais = true;
      });
      _model.listouDadosPessoais =
          await BackendHomologGroup.buscaDadosNewCall.call(
        token: FFAppState().token,
      );
      await Future.delayed(const Duration(milliseconds: 1500));
      if ((_model.listouDadosPessoais?.succeeded ?? true)) {
        FFAppState().update(() {
          FFAppState().dadosColab =
              (_model.listouDadosPessoais?.jsonBody ?? '');
        });
      }
      _model.listaContatosResponse =
          await BackendHomologGroup.listarContatoEmergCall.call(
        token: FFAppState().token,
      );
      if ((_model.listaContatosResponse?.succeeded ?? true)) {
        FFAppState().update(() {
          FFAppState().contatoEmergJson =
              (_model.listaContatosResponse?.jsonBody ?? '');
        });
        FFAppState().update(() {
          FFAppState().numContatosEmerg = valueOrDefault<int>(
            functions.returnNumeroContatos(
                (_model.listaContatosResponse?.jsonBody ?? '')),
            0,
          );
        });
      }
      _model.listaDependentes =
          await BackendHomologGroup.listaDependentesColaboradorCall.call(
        token: FFAppState().token,
      );
      if ((_model.listaDependentes?.succeeded ?? true)) {
        FFAppState().update(() {
          FFAppState().dependenteJson =
              (_model.listaDependentes?.jsonBody ?? '');
        });
      }
      await Future.delayed(const Duration(milliseconds: 1000));
      FFAppState().update(() {
        FFAppState().dadosColab = (_model.listouDadosPessoais?.jsonBody ?? '');
      });
      // UpdateDadosPessoais
      FFAppState().update(() {
        FFAppState().myName = getJsonField(
          FFAppState().dadosColab,
          r'''$.colaborador.nomeCompleto''',
        ).toString().toString();
        FFAppState().myBirthday = valueOrDefault<String>(
          getJsonField(
            FFAppState().dadosColab,
            r'''$.colaborador.dataNascimento''',
          ).toString().toString(),
          '00/00/0000',
        );
        FFAppState().MyRg = valueOrDefault<String>(
          getJsonField(
            FFAppState().dadosColab,
            r'''$.colaborador.rg''',
          ).toString().toString(),
          'Informa seu RG',
        );
        FFAppState().myEstadoCivil = getJsonField(
          FFAppState().dadosColab,
          r'''$.colaborador.estadoCivil''',
        ).toString().toString();
        FFAppState().myEscolaridade = getJsonField(
          FFAppState().dadosColab,
          r'''$.colaborador.escolaridade''',
        ).toString().toString();
        FFAppState().myEtnia = getJsonField(
          FFAppState().dadosColab,
          r'''$.colaborador.etnia''',
        ).toString().toString();
        FFAppState().myGender = getJsonField(
          FFAppState().dadosColab,
          r'''$.colaborador.genero''',
        ).toString().toString();
        FFAppState().myOrientacao = getJsonField(
          FFAppState().dadosColab,
          r'''$.colaborador.orientacaoSexual''',
        ).toString().toString();
        FFAppState().myRefugiada = getJsonField(
          FFAppState().dadosColab,
          r'''$.colaborador.pessoaRefugiada''',
        ).toString().toString();
        FFAppState().myPassaporte = getJsonField(
          FFAppState().dadosColab,
          r'''$.colaborador.passaporte''',
        ).toString().toString();
        FFAppState().MyCpf = getJsonField(
          FFAppState().dadosColab,
          r'''$.colaborador.cpf''',
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
          'Informe o bairro',
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
        FFAppState().myCovidInt = valueOrDefault<int>(
          getJsonField(
            FFAppState().dadosColab,
            r'''$.colaborador.saude.grupoDeRiscoCovid''',
          ),
          0,
        );
      });
      FFAppState().update(() {
        FFAppState().dadosColab = (_model.listouDadosPessoais?.jsonBody ?? '');
      });
    });

    _model.colabNomeController1 ??= TextEditingController(
        text: valueOrDefault<String>(
      getJsonField(
        FFAppState().dadosColab,
        r'''$.colaborador.nomeCompleto''',
      ).toString().toString(),
      'Sem informação',
    ));
    _model.colabNomeController2 ??= TextEditingController();
    _model.colabDatanascimentoController ??= TextEditingController(
        text: valueOrDefault<String>(
      functions.addDateMask(valueOrDefault<String>(
        getJsonField(
          FFAppState().dadosColab,
          r'''$.colaborador.dataNascimento''',
        ).toString().toString(),
        'dd/mm/aaaa',
      )),
      '00/00/0000',
    ));
    _model.colabCPFController ??= TextEditingController(
        text: valueOrDefault<String>(
      functions.addCpfMask(valueOrDefault<String>(
        getJsonField(
          FFAppState().dadosColab,
          r'''$.colaborador.cpf''',
        ).toString().toString(),
        'Sem informação',
      )),
      '00000000000',
    ));
    _model.colabRGController ??= TextEditingController(
        text: valueOrDefault<String>(
      getJsonField(
        FFAppState().dadosColab,
        r'''$.colaborador.rg''',
      ).toString().toString(),
      'Sem informação',
    ));
    _model.colabEmailProController ??= TextEditingController(
        text: valueOrDefault<String>(
      getJsonField(
        FFAppState().dadosColab,
        r'''$.colaborador.email''',
      ).toString().toString(),
      'Sem informação',
    ));
    _model.colabEmailAlternativoController ??= TextEditingController(
        text: valueOrDefault<String>(
      getJsonField(
        FFAppState().dadosColab,
        r'''$.colaborador.emailAlternativo''',
      ).toString().toString(),
      'Sem informação',
    ));
    _model.colabPhoneController ??= TextEditingController(
        text: functions.addPhoneMask(valueOrDefault<String>(
      getJsonField(
        FFAppState().dadosColab,
        r'''$.colaborador.contatoPrincipal''',
      ).toString().toString(),
      'Sem informação',
    )));
    _model.colabEnderecoCEPController ??= TextEditingController(
        text: functions.addZipCodeMask(valueOrDefault<String>(
      getJsonField(
        FFAppState().dadosColab,
        r'''$.colaborador.endereco.cep''',
      ).toString().toString(),
      'Sem informação',
    )));
    _model.colabEnderecoController ??= TextEditingController(
        text: valueOrDefault<String>(
      getJsonField(
        FFAppState().dadosColab,
        r'''$.colaborador.endereco.endereco''',
      ).toString().toString(),
      'Sem informação',
    ));
    _model.colabEnderecoNumeroController ??= TextEditingController(
        text: valueOrDefault<String>(
      getJsonField(
        FFAppState().dadosColab,
        r'''$.colaborador.endereco.numero''',
      ).toString().toString(),
      'Sem informação',
    ));
    _model.colabEnderecoComplementoController ??= TextEditingController(
        text: valueOrDefault<String>(
      getJsonField(
        FFAppState().dadosColab,
        r'''$.colaborador.endereco.complemento''',
      ).toString().toString(),
      'Sem informação',
    ));
    _model.colabEnderecoBairroController ??= TextEditingController(
        text: valueOrDefault<String>(
      getJsonField(
        FFAppState().dadosColab,
        r'''$.colaborador.endereco.bairro''',
      ).toString().toString(),
      'Sem informação',
    ));
    _model.colabEnderecoCidadeController ??= TextEditingController(
        text: valueOrDefault<String>(
      getJsonField(
        FFAppState().dadosColab,
        r'''$.colaborador.endereco.cidade''',
      ).toString().toString(),
      'Sem informação',
    ));
    _model.colabEnderecoEstadoController ??= TextEditingController(
        text: valueOrDefault<String>(
      getJsonField(
        FFAppState().dadosColab,
        r'''$.colaborador.endereco.estado''',
      ).toString().toString(),
      'Sem informação',
    ));
    _model.colabFamiliaresController ??= TextEditingController(
        text: valueOrDefault<String>(
      getJsonField(
        FFAppState().dadosColab,
        r'''$.colaborador.endereco.comQuemMora''',
      ).toString().toString(),
      'Sem informação',
    ));
    _model.colabCondSaudeController ??= TextEditingController(
        text: valueOrDefault<String>(
      getJsonField(
        FFAppState().dadosColab,
        r'''$.colaborador.saude.condicaoDeSaudeRelevante''',
      ).toString().toString(),
      'Sem informação',
    ));
    _model.inputNomeContatoController ??= TextEditingController();
    _model.inputTelContatoController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _model.colabNomeController2?.text = 'Usuário';
        }));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: responsiveVisibility(
        context: context,
        tabletLandscape: false,
        desktop: false,
      )
          ? AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              title: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed('homeDashboard');
                },
                child: Image.asset(
                  'assets/images/logo-lightmode.png',
                  width: 160.0,
                  height: 30.0,
                  fit: BoxFit.contain,
                ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 4.0,
            )
          : null,
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                  ))
                    wrapWithModel(
                      model: _model.sideBarNavModel,
                      updateCallback: () => setState(() {}),
                      child: SideBarNavWidget(
                        oneBG: FlutterFlowTheme.of(context).secondaryBackground,
                        oneIcon: Icon(
                          Icons.home_outlined,
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                        twoBG: FlutterFlowTheme.of(context).secondaryBackground,
                        twoIcon: FaIcon(
                          FontAwesomeIcons.rocket,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 20.0,
                        ),
                        threeIcon: Icon(
                          Icons.emoji_people_rounded,
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                        ),
                        fourIcon: Icon(
                          Icons.card_travel_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                        oneText: FlutterFlowTheme.of(context).secondaryText,
                        twoText: FlutterFlowTheme.of(context).secondaryText,
                        threeText: FlutterFlowTheme.of(context).primaryBtnText,
                        fourText: FlutterFlowTheme.of(context).secondaryText,
                        threeBG: FlutterFlowTheme.of(context).interactive,
                        fourBG:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        fiveIcon: Icon(
                          Icons.school_outlined,
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                        fiveText: FlutterFlowTheme.of(context).secondaryText,
                        fiveBG:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        sixIcon: Icon(
                          Icons.tag_faces,
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                        sixText: FlutterFlowTheme.of(context).secondaryText,
                        sixBG: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                    ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 64.0, 24.0, 64.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: double.infinity,
                                  constraints: BoxConstraints(
                                    maxWidth: FFAppState().colunaMain,
                                  ),
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 24.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Text(
                                            'Minha Conta',
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                if (FFAppState().MCDadosPessoais)
                                  Container(
                                    width: double.infinity,
                                    constraints: BoxConstraints(
                                      maxWidth: FFAppState().colunaMain,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    alignment: AlignmentDirectional(0.0, -1.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  24.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                        .MCDadosPessoais =
                                                                    false;
                                                                FFAppState()
                                                                        .MCEndereco =
                                                                    false;
                                                                FFAppState()
                                                                        .MCSaude =
                                                                    false;
                                                                FFAppState()
                                                                        .MCDependentes =
                                                                    false;
                                                                FFAppState()
                                                                        .MCContato =
                                                                    false;
                                                              });
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                        .MCDadosPessoais =
                                                                    true;
                                                              });
                                                            },
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 0.0,
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .borderInteractive,
                                                                      offset: Offset(
                                                                          0.0,
                                                                          1.0),
                                                                    )
                                                                  ],
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          12.0,
                                                                          20.0,
                                                                          12.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .person_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        'Dados pessoais',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                        .MCDadosPessoais =
                                                                    false;
                                                                FFAppState()
                                                                        .MCEndereco =
                                                                    false;
                                                                FFAppState()
                                                                        .MCSaude =
                                                                    false;
                                                                FFAppState()
                                                                        .MCDependentes =
                                                                    false;
                                                                FFAppState()
                                                                        .MCContato =
                                                                    false;
                                                              });
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                        .MCContato =
                                                                    true;
                                                              });
                                                            },
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 0.0,
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .borderSubtle01,
                                                                      offset: Offset(
                                                                          0.0,
                                                                          1.0),
                                                                    )
                                                                  ],
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          12.0,
                                                                          20.0,
                                                                          12.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .phone_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        'Contato',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                        .MCDadosPessoais =
                                                                    false;
                                                                FFAppState()
                                                                        .MCEndereco =
                                                                    false;
                                                                FFAppState()
                                                                        .MCSaude =
                                                                    false;
                                                                FFAppState()
                                                                        .MCDependentes =
                                                                    false;
                                                                FFAppState()
                                                                        .MCContato =
                                                                    false;
                                                              });
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                        .MCEndereco =
                                                                    true;
                                                              });
                                                            },
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 0.0,
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .borderSubtle01,
                                                                      offset: Offset(
                                                                          0.0,
                                                                          1.0),
                                                                    )
                                                                  ],
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          12.0,
                                                                          20.0,
                                                                          12.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .location_pin,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        'Endereço',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                        .MCDadosPessoais =
                                                                    false;
                                                                FFAppState()
                                                                        .MCEndereco =
                                                                    false;
                                                                FFAppState()
                                                                        .MCSaude =
                                                                    false;
                                                                FFAppState()
                                                                        .MCDependentes =
                                                                    false;
                                                                FFAppState()
                                                                        .MCContato =
                                                                    false;
                                                              });
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                        .MCSaude =
                                                                    true;
                                                              });
                                                            },
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 0.0,
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .borderSubtle01,
                                                                      offset: Offset(
                                                                          0.0,
                                                                          1.0),
                                                                    )
                                                                  ],
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          12.0,
                                                                          20.0,
                                                                          12.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .medical_services_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        'Saúde',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                        .MCDadosPessoais =
                                                                    false;
                                                                FFAppState()
                                                                        .MCEndereco =
                                                                    false;
                                                                FFAppState()
                                                                        .MCSaude =
                                                                    false;
                                                                FFAppState()
                                                                        .MCDependentes =
                                                                    false;
                                                                FFAppState()
                                                                        .MCContato =
                                                                    false;
                                                              });
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                        .MCDependentes =
                                                                    true;
                                                              });
                                                            },
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 0.0,
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .borderSubtle01,
                                                                      offset: Offset(
                                                                          0.0,
                                                                          1.0),
                                                                    )
                                                                  ],
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          12.0,
                                                                          20.0,
                                                                          12.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .people_alt_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        'Dependentes',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
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
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 32.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Wrap(
                                                  spacing: 0.0,
                                                  runSpacing: 0.0,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.start,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  16.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            constraints:
                                                                BoxConstraints(
                                                              maxWidth: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width <=
                                                                      768.0
                                                                  ? 800.0
                                                                  : 200.0,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  elevation:
                                                                      5.0,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            100.0),
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        100.0,
                                                                    height:
                                                                        100.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              100.0),
                                                                    ),
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              100.0,
                                                                          height:
                                                                              100.0,
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/profile_default.jpg',
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              100.0,
                                                                          height:
                                                                              100.0,
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Image.network(
                                                                            valueOrDefault<String>(
                                                                              FFAppState().myPhoto,
                                                                              'https://fourmakers-2.flutterflow.app/assets/assets/images/profile_default.jpg',
                                                                            ),
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        8.0,
                                                                        8.0,
                                                                        8.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  barrierColor:
                                                                      Color(
                                                                          0x00000000),
                                                                  enableDrag:
                                                                      false,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return Padding(
                                                                      padding: MediaQuery.of(
                                                                              context)
                                                                          .viewInsets,
                                                                      child:
                                                                          ModalMudarPhotoWidget(),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    setState(
                                                                        () {}));
                                                              },
                                                              child: Text(
                                                                'Editar foto',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .interactive,
                                                                      decoration:
                                                                          TextDecoration
                                                                              .underline,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 750.0,
                                                      ),
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Form(
                                                            key:
                                                                _model.formKey2,
                                                            autovalidateMode:
                                                                AutovalidateMode
                                                                    .disabled,
                                                            child: Wrap(
                                                              spacing: 24.0,
                                                              runSpacing: 24.0,
                                                              alignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  WrapCrossAlignment
                                                                      .start,
                                                              direction: Axis
                                                                  .horizontal,
                                                              runAlignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              verticalDirection:
                                                                  VerticalDirection
                                                                      .down,
                                                              clipBehavior:
                                                                  Clip.none,
                                                              children: [
                                                                Container(
                                                                  width: double
                                                                      .infinity,
                                                                  constraints:
                                                                      BoxConstraints(
                                                                    maxWidth:
                                                                        350.0,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                8.0),
                                                                            child:
                                                                                Text(
                                                                              'Nome completo',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                0.0,
                                                                                0.0,
                                                                                6.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                await showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  barrierColor: Color(0x00000000),
                                                                                  enableDrag: false,
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return Padding(
                                                                                      padding: MediaQuery.of(context).viewInsets,
                                                                                      child: Container(
                                                                                        height: MediaQuery.of(context).size.height * 1.0,
                                                                                        child: ModalOrientacaoWidget(),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => setState(() {}));
                                                                              },
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.asterisk,
                                                                                color: FlutterFlowTheme.of(context).textError,
                                                                                size: 9.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      TextFormField(
                                                                        controller:
                                                                            _model.colabNomeController1,
                                                                        readOnly:
                                                                            true,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          labelStyle:
                                                                              FlutterFlowTheme.of(context).bodySmall,
                                                                          hintText:
                                                                              'Nome completo',
                                                                          hintStyle:
                                                                              FlutterFlowTheme.of(context).bodySmall,
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).borderSubtle01,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          errorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).supportErrorInverse,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).supportErrorInverse,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          filled:
                                                                              true,
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).field01,
                                                                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              20.0,
                                                                              24.0,
                                                                              20.0,
                                                                              24.0),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                        validator: _model
                                                                            .colabNomeController1Validator
                                                                            .asValidator(context),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Visibility(
                                                                  visible:
                                                                      FFAppState()
                                                                          .hideComponent,
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      maxWidth:
                                                                          350.0,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                              child: Text(
                                                                                'Nome completo',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 6.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  await showModalBottomSheet(
                                                                                    isScrollControlled: true,
                                                                                    backgroundColor: Colors.transparent,
                                                                                    barrierColor: Color(0x00000000),
                                                                                    enableDrag: false,
                                                                                    context: context,
                                                                                    builder: (context) {
                                                                                      return Padding(
                                                                                        padding: MediaQuery.of(context).viewInsets,
                                                                                        child: Container(
                                                                                          height: MediaQuery.of(context).size.height * 1.0,
                                                                                          child: ModalOrientacaoWidget(),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => setState(() {}));
                                                                                },
                                                                                child: FaIcon(
                                                                                  FontAwesomeIcons.asterisk,
                                                                                  color: FlutterFlowTheme.of(context).textError,
                                                                                  size: 9.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        TextFormField(
                                                                          controller:
                                                                              _model.colabNomeController2,
                                                                          readOnly:
                                                                              true,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelStyle:
                                                                                FlutterFlowTheme.of(context).bodySmall,
                                                                            hintText:
                                                                                'Nome completo',
                                                                            hintStyle:
                                                                                FlutterFlowTheme.of(context).bodySmall,
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).borderSubtle01,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).supportErrorInverse,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).supportErrorInverse,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            filled:
                                                                                true,
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).field01,
                                                                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                20.0,
                                                                                24.0,
                                                                                20.0,
                                                                                24.0),
                                                                          ),
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyMedium,
                                                                          validator: _model
                                                                              .colabNomeController2Validator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: 350.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                8.0),
                                                                            child:
                                                                                Text(
                                                                              'Data nascimento',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                0.0,
                                                                                0.0,
                                                                                6.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                await showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  barrierColor: Color(0x00000000),
                                                                                  enableDrag: false,
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return Padding(
                                                                                      padding: MediaQuery.of(context).viewInsets,
                                                                                      child: Container(
                                                                                        height: MediaQuery.of(context).size.height * 1.0,
                                                                                        child: ModalOrientacaoWidget(),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => setState(() {}));
                                                                              },
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.asterisk,
                                                                                color: FlutterFlowTheme.of(context).textError,
                                                                                size: 9.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      TextFormField(
                                                                        controller:
                                                                            _model.colabDatanascimentoController,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          labelStyle:
                                                                              FlutterFlowTheme.of(context).bodySmall,
                                                                          hintText:
                                                                              'dd/mm/yyyy',
                                                                          hintStyle:
                                                                              FlutterFlowTheme.of(context).bodySmall,
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).borderSubtle01,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          errorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).supportErrorInverse,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).supportErrorInverse,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          filled:
                                                                              true,
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).field01,
                                                                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              20.0,
                                                                              24.0,
                                                                              20.0,
                                                                              24.0),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                        keyboardType:
                                                                            TextInputType.datetime,
                                                                        validator: _model
                                                                            .colabDatanascimentoControllerValidator
                                                                            .asValidator(context),
                                                                        inputFormatters: [
                                                                          _model
                                                                              .colabDatanascimentoMask
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: 350.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                8.0),
                                                                            child:
                                                                                Text(
                                                                              'CPF',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                0.0,
                                                                                0.0,
                                                                                6.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                await showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  barrierColor: Color(0x00000000),
                                                                                  enableDrag: false,
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return Padding(
                                                                                      padding: MediaQuery.of(context).viewInsets,
                                                                                      child: Container(
                                                                                        height: MediaQuery.of(context).size.height * 1.0,
                                                                                        child: ModalOrientacaoWidget(),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => setState(() {}));
                                                                              },
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.asterisk,
                                                                                color: FlutterFlowTheme.of(context).textError,
                                                                                size: 9.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      TextFormField(
                                                                        controller:
                                                                            _model.colabCPFController,
                                                                        readOnly:
                                                                            true,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          labelStyle:
                                                                              FlutterFlowTheme.of(context).bodySmall,
                                                                          hintText:
                                                                              'Informar documento',
                                                                          hintStyle:
                                                                              FlutterFlowTheme.of(context).bodySmall,
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).borderSubtle01,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          errorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).supportErrorInverse,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).supportErrorInverse,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          filled:
                                                                              true,
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).field01,
                                                                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              20.0,
                                                                              24.0,
                                                                              20.0,
                                                                              24.0),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                        validator: _model
                                                                            .colabCPFControllerValidator
                                                                            .asValidator(context),
                                                                        inputFormatters: [
                                                                          _model
                                                                              .colabCPFMask
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: 350.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                8.0),
                                                                            child:
                                                                                Text(
                                                                              'RG',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                0.0,
                                                                                0.0,
                                                                                6.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                await showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  barrierColor: Color(0x00000000),
                                                                                  enableDrag: false,
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return Padding(
                                                                                      padding: MediaQuery.of(context).viewInsets,
                                                                                      child: Container(
                                                                                        height: MediaQuery.of(context).size.height * 1.0,
                                                                                        child: ModalOrientacaoWidget(),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => setState(() {}));
                                                                              },
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.asterisk,
                                                                                color: FlutterFlowTheme.of(context).textError,
                                                                                size: 9.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      TextFormField(
                                                                        controller:
                                                                            _model.colabRGController,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          labelStyle:
                                                                              FlutterFlowTheme.of(context).bodySmall,
                                                                          hintText:
                                                                              'Data de Nascimento',
                                                                          hintStyle:
                                                                              FlutterFlowTheme.of(context).bodySmall,
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).borderSubtle01,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          errorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).supportErrorInverse,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).supportErrorInverse,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          filled:
                                                                              true,
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).field01,
                                                                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              20.0,
                                                                              24.0,
                                                                              20.0,
                                                                              24.0),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                        validator: _model
                                                                            .colabRGControllerValidator
                                                                            .asValidator(context),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: 350.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                9.0),
                                                                            child:
                                                                                Text(
                                                                              'Estado civil',
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                0.0,
                                                                                0.0,
                                                                                6.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                await showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  barrierColor: Color(0x00000000),
                                                                                  enableDrag: false,
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return Padding(
                                                                                      padding: MediaQuery.of(context).viewInsets,
                                                                                      child: Container(
                                                                                        height: MediaQuery.of(context).size.height * 1.0,
                                                                                        child: ModalOrientacaoWidget(),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => setState(() {}));
                                                                              },
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.asterisk,
                                                                                color: FlutterFlowTheme.of(context).textError,
                                                                                size: 9.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      FlutterFlowDropDown<
                                                                          String>(
                                                                        controller:
                                                                            _model.colabEstadoCivilValueController ??=
                                                                                FormFieldController<String>(
                                                                          _model.colabEstadoCivilValue ??=
                                                                              valueOrDefault<String>(
                                                                            getJsonField(
                                                                              FFAppState().dadosColab,
                                                                              r'''$.colaborador.estadoCivil''',
                                                                            ).toString(),
                                                                            'Sem informação',
                                                                          ),
                                                                        ),
                                                                        options: [
                                                                          'Solteiro (a)',
                                                                          'Casado (a)',
                                                                          'Separado (a)',
                                                                          'Divorciado (a)',
                                                                          'Viúvo (a)'
                                                                        ],
                                                                        onChanged:
                                                                            (val) =>
                                                                                setState(() => _model.colabEstadoCivilValue = val),
                                                                        width: double
                                                                            .infinity,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                        hintText:
                                                                            'Selecione uma opção...',
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .keyboard_arrow_down_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              15.0,
                                                                        ),
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).field01,
                                                                        elevation:
                                                                            2.0,
                                                                        borderColor:
                                                                            FlutterFlowTheme.of(context).borderSubtle01,
                                                                        borderWidth:
                                                                            1.0,
                                                                        borderRadius:
                                                                            8.0,
                                                                        margin: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            6.0,
                                                                            16.0,
                                                                            6.0),
                                                                        hidesUnderline:
                                                                            true,
                                                                        isSearchable:
                                                                            false,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: 350.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                8.0),
                                                                            child:
                                                                                Text(
                                                                              'Escolaridade',
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                0.0,
                                                                                0.0,
                                                                                6.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                await showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  barrierColor: Color(0x00000000),
                                                                                  enableDrag: false,
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return Padding(
                                                                                      padding: MediaQuery.of(context).viewInsets,
                                                                                      child: Container(
                                                                                        height: MediaQuery.of(context).size.height * 1.0,
                                                                                        child: ModalOrientacaoWidget(),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => setState(() {}));
                                                                              },
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.asterisk,
                                                                                color: FlutterFlowTheme.of(context).textError,
                                                                                size: 9.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      FlutterFlowDropDown<
                                                                          String>(
                                                                        controller:
                                                                            _model.colabEscolaridadeValueController ??=
                                                                                FormFieldController<String>(
                                                                          _model.colabEscolaridadeValue ??=
                                                                              valueOrDefault<String>(
                                                                            getJsonField(
                                                                              FFAppState().dadosColab,
                                                                              r'''$.colaborador.escolaridade''',
                                                                            ).toString(),
                                                                            'Sem informação',
                                                                          ),
                                                                        ),
                                                                        options: [
                                                                          'Nenhum',
                                                                          'Ensino fundamental completo ou menos',
                                                                          'Ensino médio completo ou menos',
                                                                          'Ensino Superior incompleto',
                                                                          'Ensino Superior completo',
                                                                          'Pós-graduação cursando',
                                                                          'Pós-graduação completo',
                                                                          'Mestrado ou doutorado cursando',
                                                                          'Mestrado ou doutorado completo'
                                                                        ],
                                                                        onChanged:
                                                                            (val) =>
                                                                                setState(() => _model.colabEscolaridadeValue = val),
                                                                        width: double
                                                                            .infinity,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                        hintText:
                                                                            'Selecione uma opção...',
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .keyboard_arrow_down_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              15.0,
                                                                        ),
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).field01,
                                                                        elevation:
                                                                            2.0,
                                                                        borderColor:
                                                                            FlutterFlowTheme.of(context).borderSubtle01,
                                                                        borderWidth:
                                                                            1.0,
                                                                        borderRadius:
                                                                            8.0,
                                                                        margin: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            6.0,
                                                                            16.0,
                                                                            6.0),
                                                                        hidesUnderline:
                                                                            true,
                                                                        isSearchable:
                                                                            false,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: 350.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Text(
                                                                          'Etnia',
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyMedium,
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child: FlutterFlowDropDown<
                                                                            String>(
                                                                          controller: _model.colabEtniaValueController ??=
                                                                              FormFieldController<String>(
                                                                            _model.colabEtniaValue ??=
                                                                                valueOrDefault<String>(
                                                                              getJsonField(
                                                                                FFAppState().dadosColab,
                                                                                r'''$.colaborador.etnia''',
                                                                              ).toString(),
                                                                              'Sem informação',
                                                                            ),
                                                                          ),
                                                                          options: [
                                                                            'Branca',
                                                                            'Preta',
                                                                            'Parda',
                                                                            'Amarela',
                                                                            'Indígena',
                                                                            'Prefiro não responder'
                                                                          ],
                                                                          onChanged: (val) =>
                                                                              setState(() => _model.colabEtniaValue = val),
                                                                          width:
                                                                              double.infinity,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                          hintText:
                                                                              'Selecione uma opção...',
                                                                          icon:
                                                                              Icon(
                                                                            Icons.keyboard_arrow_down_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                15.0,
                                                                          ),
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).field01,
                                                                          elevation:
                                                                              2.0,
                                                                          borderColor:
                                                                              FlutterFlowTheme.of(context).borderSubtle01,
                                                                          borderWidth:
                                                                              1.0,
                                                                          borderRadius:
                                                                              8.0,
                                                                          margin: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              6.0,
                                                                              16.0,
                                                                              6.0),
                                                                          hidesUnderline:
                                                                              true,
                                                                          isSearchable:
                                                                              false,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: 350.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              'Gênero',
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  await showModalBottomSheet(
                                                                                    isScrollControlled: true,
                                                                                    backgroundColor: Colors.transparent,
                                                                                    barrierColor: Color(0x00000000),
                                                                                    enableDrag: false,
                                                                                    context: context,
                                                                                    builder: (context) {
                                                                                      return Padding(
                                                                                        padding: MediaQuery.of(context).viewInsets,
                                                                                        child: Container(
                                                                                          height: MediaQuery.of(context).size.height * 1.0,
                                                                                          child: ModalIdentidadeWidget(),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => setState(() {}));
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.info_outlined,
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  size: 16.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child: FlutterFlowDropDown<
                                                                            String>(
                                                                          controller: _model.colabGeneroValueController ??=
                                                                              FormFieldController<String>(
                                                                            _model.colabGeneroValue ??=
                                                                                valueOrDefault<String>(
                                                                              getJsonField(
                                                                                FFAppState().dadosColab,
                                                                                r'''$.colaborador.genero''',
                                                                              ).toString(),
                                                                              'Sem informação',
                                                                            ),
                                                                          ),
                                                                          options: [
                                                                            'Agênero',
                                                                            'Cisgênero',
                                                                            'Transgênero',
                                                                            'Não binária'
                                                                          ],
                                                                          onChanged: (val) =>
                                                                              setState(() => _model.colabGeneroValue = val),
                                                                          width:
                                                                              double.infinity,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                          hintText:
                                                                              'Selecione uma opção...',
                                                                          icon:
                                                                              Icon(
                                                                            Icons.keyboard_arrow_down_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                15.0,
                                                                          ),
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).field01,
                                                                          elevation:
                                                                              2.0,
                                                                          borderColor:
                                                                              FlutterFlowTheme.of(context).borderSubtle01,
                                                                          borderWidth:
                                                                              1.0,
                                                                          borderRadius:
                                                                              8.0,
                                                                          margin: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              6.0,
                                                                              16.0,
                                                                              6.0),
                                                                          hidesUnderline:
                                                                              true,
                                                                          isSearchable:
                                                                              false,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: 350.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              'Orientação sexual',
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  await showModalBottomSheet(
                                                                                    isScrollControlled: true,
                                                                                    backgroundColor: Colors.transparent,
                                                                                    barrierColor: Color(0x00000000),
                                                                                    enableDrag: false,
                                                                                    context: context,
                                                                                    builder: (context) {
                                                                                      return Padding(
                                                                                        padding: MediaQuery.of(context).viewInsets,
                                                                                        child: Container(
                                                                                          height: MediaQuery.of(context).size.height * 1.0,
                                                                                          child: ModalOrientacaoWidget(),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => setState(() {}));
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.info_outlined,
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  size: 16.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      FlutterFlowDropDown<
                                                                          String>(
                                                                        controller:
                                                                            _model.colabOrientacaoValueController ??=
                                                                                FormFieldController<String>(
                                                                          _model.colabOrientacaoValue ??=
                                                                              valueOrDefault<String>(
                                                                            getJsonField(
                                                                              FFAppState().dadosColab,
                                                                              r'''$.colaborador.orientacaoSexual''',
                                                                            ).toString(),
                                                                            'Sem informação',
                                                                          ),
                                                                        ),
                                                                        options: [
                                                                          'Homossexual',
                                                                          'Heterossexual',
                                                                          'Bissexual',
                                                                          'Pansexual',
                                                                          'Assexual',
                                                                          'Prefiro não responder'
                                                                        ],
                                                                        onChanged:
                                                                            (val) =>
                                                                                setState(() => _model.colabOrientacaoValue = val),
                                                                        width: double
                                                                            .infinity,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                        hintText:
                                                                            'Selecione uma opção...',
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .keyboard_arrow_down_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              15.0,
                                                                        ),
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).field01,
                                                                        elevation:
                                                                            2.0,
                                                                        borderColor:
                                                                            FlutterFlowTheme.of(context).borderSubtle01,
                                                                        borderWidth:
                                                                            1.0,
                                                                        borderRadius:
                                                                            8.0,
                                                                        margin: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            6.0,
                                                                            16.0,
                                                                            6.0),
                                                                        hidesUnderline:
                                                                            true,
                                                                        isSearchable:
                                                                            false,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: 350.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Text(
                                                                          'Pessoa refugiada ?',
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyMedium,
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            3.56,
                                                                            -0.73),
                                                                        child: FlutterFlowDropDown<
                                                                            int>(
                                                                          controller: _model.colabRefugiadaValueController ??=
                                                                              FormFieldController<int>(
                                                                            _model.colabRefugiadaValue ??=
                                                                                0,
                                                                          ),
                                                                          options: [
                                                                            1,
                                                                            0
                                                                          ],
                                                                          optionLabels: [
                                                                            'Sim',
                                                                            'Não'
                                                                          ],
                                                                          onChanged: (val) =>
                                                                              setState(() => _model.colabRefugiadaValue = val),
                                                                          width:
                                                                              double.infinity,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                          hintText:
                                                                              'Selecione uma opção...',
                                                                          icon:
                                                                              Icon(
                                                                            Icons.keyboard_arrow_down_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                15.0,
                                                                          ),
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).field01,
                                                                          elevation:
                                                                              2.0,
                                                                          borderColor:
                                                                              FlutterFlowTheme.of(context).borderSubtle01,
                                                                          borderWidth:
                                                                              1.0,
                                                                          borderRadius:
                                                                              8.0,
                                                                          margin: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              6.0,
                                                                              16.0,
                                                                              6.0),
                                                                          hidesUnderline:
                                                                              true,
                                                                          isSearchable:
                                                                              false,
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
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (FFAppState().hideComponent)
                                          Text(
                                            FFAppState().myPCD,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .textPlaceholder,
                                                  fontSize: 10.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                      ],
                                    ),
                                  ),
                                if (FFAppState().MCContato)
                                  Container(
                                    width: double.infinity,
                                    constraints: BoxConstraints(
                                      maxWidth: FFAppState().colunaMain,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    alignment: AlignmentDirectional(0.0, -1.0),
                                    child: Form(
                                      key: _model.formKey1,
                                      autovalidateMode:
                                          AutovalidateMode.disabled,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    24.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .MCDadosPessoais =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCEndereco =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCSaude =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCDependentes =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCContato =
                                                                      false;
                                                                });
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .MCDadosPessoais =
                                                                      true;
                                                                });
                                                              },
                                                              child: Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 0.0,
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .borderSubtle01,
                                                                        offset: Offset(
                                                                            0.0,
                                                                            1.0),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            12.0,
                                                                            20.0,
                                                                            12.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.person_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'Dados pessoais',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .MCDadosPessoais =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCEndereco =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCSaude =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCDependentes =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCContato =
                                                                      false;
                                                                });
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .MCContato =
                                                                      true;
                                                                });
                                                              },
                                                              child: Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 0.0,
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .borderInteractive,
                                                                        offset: Offset(
                                                                            0.0,
                                                                            1.0),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            12.0,
                                                                            20.0,
                                                                            12.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.phone_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'Contato',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .MCDadosPessoais =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCEndereco =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCSaude =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCDependentes =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCContato =
                                                                      false;
                                                                });
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .MCEndereco =
                                                                      true;
                                                                });
                                                              },
                                                              child: Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 0.0,
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .borderSubtle01,
                                                                        offset: Offset(
                                                                            0.0,
                                                                            1.0),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            12.0,
                                                                            20.0,
                                                                            12.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.location_pin,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'Endereço',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .MCDadosPessoais =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCEndereco =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCSaude =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCDependentes =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCContato =
                                                                      false;
                                                                });
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .MCSaude =
                                                                      true;
                                                                });
                                                              },
                                                              child: Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 0.0,
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .borderSubtle01,
                                                                        offset: Offset(
                                                                            0.0,
                                                                            1.0),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            12.0,
                                                                            20.0,
                                                                            12.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.medical_services_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'Saúde',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .MCDadosPessoais =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCEndereco =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCSaude =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCDependentes =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCContato =
                                                                      false;
                                                                });
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .MCDependentes =
                                                                      true;
                                                                });
                                                              },
                                                              child: Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 0.0,
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .borderSubtle01,
                                                                        offset: Offset(
                                                                            0.0,
                                                                            1.0),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            12.0,
                                                                            20.0,
                                                                            12.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.people_alt_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'Dependentes',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
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
                                          Wrap(
                                            spacing: 24.0,
                                            runSpacing: 24.0,
                                            alignment: WrapAlignment.start,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            direction: Axis.horizontal,
                                            runAlignment: WrapAlignment.start,
                                            verticalDirection:
                                                VerticalDirection.down,
                                            clipBehavior: Clip.none,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -0.3, 0.0),
                                                    child: Text(
                                                      'Meus contatos',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleMediumFamily),
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                width: 350.0,
                                                decoration: BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  8.0),
                                                      child: Text(
                                                        'E-mail profissional',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                    ),
                                                    TextFormField(
                                                      controller: _model
                                                          .colabEmailProController,
                                                      readOnly: true,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall,
                                                        hintText:
                                                            'Informar e-mail',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall,
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .borderSubtle01,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .supportErrorInverse,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .supportErrorInverse,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .field01,
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    24.0,
                                                                    20.0,
                                                                    24.0),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                      keyboardType:
                                                          TextInputType
                                                              .emailAddress,
                                                      validator: _model
                                                          .colabEmailProControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: 350.0,
                                                decoration: BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Text(
                                                            'E-mail alternativo',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      0.0,
                                                                      0.0,
                                                                      6.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                barrierColor: Color(
                                                                    0x00000000),
                                                                enableDrag:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return Padding(
                                                                    padding: MediaQuery.of(
                                                                            context)
                                                                        .viewInsets,
                                                                    child:
                                                                        Container(
                                                                      height: MediaQuery.of(context)
                                                                              .size
                                                                              .height *
                                                                          1.0,
                                                                      child:
                                                                          ModalOrientacaoWidget(),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  setState(
                                                                      () {}));
                                                            },
                                                            child: FaIcon(
                                                              FontAwesomeIcons
                                                                  .asterisk,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .textError,
                                                              size: 9.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    TextFormField(
                                                      controller: _model
                                                          .colabEmailAlternativoController,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall,
                                                        hintText:
                                                            'Informar e-mail',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall,
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .borderSubtle01,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .supportErrorInverse,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .supportErrorInverse,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .field01,
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    24.0,
                                                                    20.0,
                                                                    24.0),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                      keyboardType:
                                                          TextInputType
                                                              .emailAddress,
                                                      validator: _model
                                                          .colabEmailAlternativoControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: 350.0,
                                                decoration: BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Text(
                                                            'Celular',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      0.0,
                                                                      0.0,
                                                                      6.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                barrierColor: Color(
                                                                    0x00000000),
                                                                enableDrag:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return Padding(
                                                                    padding: MediaQuery.of(
                                                                            context)
                                                                        .viewInsets,
                                                                    child:
                                                                        Container(
                                                                      height: MediaQuery.of(context)
                                                                              .size
                                                                              .height *
                                                                          1.0,
                                                                      child:
                                                                          ModalOrientacaoWidget(),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  setState(
                                                                      () {}));
                                                            },
                                                            child: FaIcon(
                                                              FontAwesomeIcons
                                                                  .asterisk,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .textError,
                                                              size: 9.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    TextFormField(
                                                      controller: _model
                                                          .colabPhoneController,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall,
                                                        hintText:
                                                            'Informar número',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall,
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .borderSubtle01,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .supportErrorInverse,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .supportErrorInverse,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .field01,
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    24.0,
                                                                    20.0,
                                                                    24.0),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                      keyboardType:
                                                          TextInputType.phone,
                                                      validator: _model
                                                          .colabPhoneControllerValidator
                                                          .asValidator(context),
                                                      inputFormatters: [
                                                        _model.colabPhoneMask
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            height: 48.0,
                                            thickness: 1.0,
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 24.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Contatos de emergência',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall,
                                                      ),
                                                    ),
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          barrierColor:
                                                              Color(0x00000000),
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return Padding(
                                                              padding: MediaQuery
                                                                      .of(context)
                                                                  .viewInsets,
                                                              child:
                                                                  ModalAddContatoEmergWidget(
                                                                contactOrder:
                                                                    FFAppState()
                                                                        .numContatosEmerg,
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            setState(() {}));
                                                      },
                                                      text: 'Inserir contato',
                                                      options: FFButtonOptions(
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    0.0,
                                                                    20.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                                  color: Colors
                                                                      .white,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily),
                                                                ),
                                                        elevation: 2.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 24.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 750.0,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x1A4589FF),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    8.0,
                                                                    8.0,
                                                                    8.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .info_outline_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .supportInfo,
                                                              size: 24.0,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
                                                              child:
                                                                  AutoSizeText(
                                                                'Informe pelo menos um contato de emergência.',
                                                                maxLines: 2,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleMediumFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .supportInfo,
                                                                      fontSize:
                                                                          12.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleMediumFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if (FFAppState()
                                                          .numContatosEmerg
                                                          .toString() ==
                                                      '0')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  16.0),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .semContatoEmergenciaModel,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            SemContatoEmergenciaWidget(),
                                                      ),
                                                    ),
                                                  if (FFAppState()
                                                          .numContatosEmerg
                                                          .toString() !=
                                                      '0')
                                                    Builder(
                                                      builder: (context) {
                                                        final meuscontatos =
                                                            getJsonField(
                                                          FFAppState()
                                                              .contatoEmergJson,
                                                          r'''$.contatos''',
                                                        ).toList();
                                                        if (meuscontatos
                                                            .isEmpty) {
                                                          return SemContatoEmergenciaWidget();
                                                        }
                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              meuscontatos
                                                                  .length,
                                                          itemBuilder: (context,
                                                              meuscontatosIndex) {
                                                            final meuscontatosItem =
                                                                meuscontatos[
                                                                    meuscontatosIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          16.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                constraints:
                                                                    BoxConstraints(
                                                                  maxWidth: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      1.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .borderSubtle01,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          16.0,
                                                                          16.0,
                                                                          16.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            16.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            AutoSizeText(
                                                                              'Informações do contato',
                                                                              style: FlutterFlowTheme.of(context).headlineSmall,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Wrap(
                                                                        spacing:
                                                                            10.0,
                                                                        runSpacing:
                                                                            0.0,
                                                                        alignment:
                                                                            WrapAlignment.start,
                                                                        crossAxisAlignment:
                                                                            WrapCrossAlignment.start,
                                                                        direction:
                                                                            Axis.horizontal,
                                                                        runAlignment:
                                                                            WrapAlignment.start,
                                                                        verticalDirection:
                                                                            VerticalDirection.down,
                                                                        clipBehavior:
                                                                            Clip.none,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                double.infinity,
                                                                            constraints:
                                                                                BoxConstraints(
                                                                              maxWidth: 450.0,
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                        child: Text(
                                                                                          'Nome completo:',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                color: FlutterFlowTheme.of(context).textHelper,
                                                                                                fontSize: 16.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      AutoSizeText(
                                                                                        getJsonField(
                                                                                          meuscontatosItem,
                                                                                          r'''$.name''',
                                                                                        ).toString(),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              fontSize: 16.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                        child: Text(
                                                                                          'Grau de parentesco:',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                color: FlutterFlowTheme.of(context).textHelper,
                                                                                                fontSize: 16.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      AutoSizeText(
                                                                                        getJsonField(
                                                                                          meuscontatosItem,
                                                                                          r'''$.degree_kinship''',
                                                                                        ).toString(),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              fontSize: 16.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                        child: Text(
                                                                                          'Telefone:',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                color: FlutterFlowTheme.of(context).textHelper,
                                                                                                fontSize: 16.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        getJsonField(
                                                                                          meuscontatosItem,
                                                                                          r'''$.phone''',
                                                                                        ).toString(),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              fontSize: 16.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    await showModalBottomSheet(
                                                                                      isScrollControlled: true,
                                                                                      backgroundColor: Colors.transparent,
                                                                                      barrierColor: Color(0x00000000),
                                                                                      enableDrag: false,
                                                                                      context: context,
                                                                                      builder: (context) {
                                                                                        return Padding(
                                                                                          padding: MediaQuery.of(context).viewInsets,
                                                                                          child: ModalEditContatoEmergWidget(
                                                                                            nomecompleto: getJsonField(
                                                                                              meuscontatosItem,
                                                                                              r'''$.name''',
                                                                                            ).toString(),
                                                                                            telefone: getJsonField(
                                                                                              meuscontatosItem,
                                                                                              r'''$.phone''',
                                                                                            ).toString(),
                                                                                            parentesco: getJsonField(
                                                                                              meuscontatosItem,
                                                                                              r'''$.degree_kinship''',
                                                                                            ).toString(),
                                                                                            order: getJsonField(
                                                                                              meuscontatosItem,
                                                                                              r'''$.contact_order''',
                                                                                            ),
                                                                                            token: FFAppState().token,
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ).then((value) => setState(() {}));
                                                                                  },
                                                                                  child: FaIcon(
                                                                                    FontAwesomeIcons.solidEdit,
                                                                                    color: FlutterFlowTheme.of(context).layerSelectedDisabled,
                                                                                    size: 22.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  FFAppState().update(() {
                                                                                    FFAppState().modalExcluirContatoEmerg = true;
                                                                                    FFAppState().orderContatoEmerg = getJsonField(
                                                                                      meuscontatosItem,
                                                                                      r'''$.contact_order''',
                                                                                    );
                                                                                  });
                                                                                  _model.listaContatosResponseX = await BackendHomologGroup.listarContatoEmergCall.call(
                                                                                    token: FFAppState().token,
                                                                                  );
                                                                                  if ((_model.listaContatosResponseX?.succeeded ?? true)) {
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().contatoEmergJson = (_model.listaContatosResponse?.jsonBody ?? '');
                                                                                    });
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().numContatosEmerg = functions.returnNumeroContatos((_model.listaContatosResponse?.jsonBody ?? ''))!;
                                                                                    });
                                                                                  }

                                                                                  setState(() {});
                                                                                },
                                                                                child: FaIcon(
                                                                                  FontAwesomeIcons.trashAlt,
                                                                                  color: FlutterFlowTheme.of(context).layerSelectedDisabled,
                                                                                  size: 22.0,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                if (FFAppState().MCEndereco)
                                  Container(
                                    width: double.infinity,
                                    constraints: BoxConstraints(
                                      maxWidth: FFAppState().colunaMain,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  24.0),
                                                      child:
                                                          SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .MCDadosPessoais =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCEndereco =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCSaude =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCDependentes =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCContato =
                                                                      false;
                                                                });
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .MCDadosPessoais =
                                                                      true;
                                                                });
                                                              },
                                                              child: Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 0.0,
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .borderSubtle01,
                                                                        offset: Offset(
                                                                            0.0,
                                                                            1.0),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            12.0,
                                                                            20.0,
                                                                            12.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.person_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'Dados pessoais',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .MCDadosPessoais =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCEndereco =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCSaude =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCDependentes =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCContato =
                                                                      false;
                                                                });
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .MCContato =
                                                                      true;
                                                                });
                                                              },
                                                              child: Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 0.0,
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .borderSubtle01,
                                                                        offset: Offset(
                                                                            0.0,
                                                                            1.0),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            12.0,
                                                                            20.0,
                                                                            12.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.phone_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'Contato',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .MCDadosPessoais =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCEndereco =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCSaude =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCDependentes =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCContato =
                                                                      false;
                                                                });
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .MCEndereco =
                                                                      true;
                                                                });
                                                              },
                                                              child: Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 0.0,
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .borderInteractive,
                                                                        offset: Offset(
                                                                            0.0,
                                                                            1.0),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            12.0,
                                                                            20.0,
                                                                            12.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.location_pin,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'Endereço',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .MCDadosPessoais =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCEndereco =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCSaude =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCDependentes =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCContato =
                                                                      false;
                                                                });
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .MCSaude =
                                                                      true;
                                                                });
                                                              },
                                                              child: Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 0.0,
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .borderSubtle01,
                                                                        offset: Offset(
                                                                            0.0,
                                                                            1.0),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            12.0,
                                                                            20.0,
                                                                            12.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.medical_services_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'Saúde',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .MCDadosPessoais =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCEndereco =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCSaude =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCDependentes =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCContato =
                                                                      false;
                                                                });
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .MCDependentes =
                                                                      true;
                                                                });
                                                              },
                                                              child: Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 0.0,
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .borderSubtle01,
                                                                        offset: Offset(
                                                                            0.0,
                                                                            1.0),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            12.0,
                                                                            20.0,
                                                                            12.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.people_alt_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'Dependentes',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Form(
                                          key: _model.formKey3,
                                          autovalidateMode:
                                              AutovalidateMode.disabled,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 32.0),
                                            child: Wrap(
                                              spacing: 24.0,
                                              runSpacing: 24.0,
                                              alignment: WrapAlignment.start,
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.start,
                                              direction: Axis.horizontal,
                                              runAlignment: WrapAlignment.start,
                                              verticalDirection:
                                                  VerticalDirection.down,
                                              clipBehavior: Clip.none,
                                              children: [
                                                Container(
                                                  width: 350.0,
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        8.0),
                                                            child: Text(
                                                              'CEP',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        0.0,
                                                                        0.0,
                                                                        6.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  barrierColor:
                                                                      Color(
                                                                          0x00000000),
                                                                  enableDrag:
                                                                      false,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return Padding(
                                                                      padding: MediaQuery.of(
                                                                              context)
                                                                          .viewInsets,
                                                                      child:
                                                                          Container(
                                                                        height: MediaQuery.of(context).size.height *
                                                                            1.0,
                                                                        child:
                                                                            ModalOrientacaoWidget(),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    setState(
                                                                        () {}));
                                                              },
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .asterisk,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .textError,
                                                                size: 9.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      TextFormField(
                                                        controller: _model
                                                            .colabEnderecoCEPController,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall,
                                                          hintText:
                                                              'Informar CEP',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall,
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .borderSubtle01,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .supportErrorInverse,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .supportErrorInverse,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          filled: true,
                                                          fillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .field01,
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      24.0,
                                                                      20.0,
                                                                      24.0),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        validator: _model
                                                            .colabEnderecoCEPControllerValidator
                                                            .asValidator(
                                                                context),
                                                        inputFormatters: [
                                                          _model
                                                              .colabEnderecoCEPMask
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: 350.0,
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        8.0),
                                                            child: Text(
                                                              'Endereço',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        0.0,
                                                                        0.0,
                                                                        6.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  barrierColor:
                                                                      Color(
                                                                          0x00000000),
                                                                  enableDrag:
                                                                      false,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return Padding(
                                                                      padding: MediaQuery.of(
                                                                              context)
                                                                          .viewInsets,
                                                                      child:
                                                                          Container(
                                                                        height: MediaQuery.of(context).size.height *
                                                                            1.0,
                                                                        child:
                                                                            ModalOrientacaoWidget(),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    setState(
                                                                        () {}));
                                                              },
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .asterisk,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .textError,
                                                                size: 9.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      TextFormField(
                                                        controller: _model
                                                            .colabEnderecoController,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall,
                                                          hintText:
                                                              'Data de Nascimento',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall,
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .borderSubtle01,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .supportErrorInverse,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .supportErrorInverse,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          filled: true,
                                                          fillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .field01,
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      24.0,
                                                                      20.0,
                                                                      24.0),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                        validator: _model
                                                            .colabEnderecoControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: 350.0,
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        8.0),
                                                            child: Text(
                                                              'Número',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        0.0,
                                                                        0.0,
                                                                        6.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  barrierColor:
                                                                      Color(
                                                                          0x00000000),
                                                                  enableDrag:
                                                                      false,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return Padding(
                                                                      padding: MediaQuery.of(
                                                                              context)
                                                                          .viewInsets,
                                                                      child:
                                                                          Container(
                                                                        height: MediaQuery.of(context).size.height *
                                                                            1.0,
                                                                        child:
                                                                            ModalOrientacaoWidget(),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    setState(
                                                                        () {}));
                                                              },
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .asterisk,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .textError,
                                                                size: 9.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      TextFormField(
                                                        controller: _model
                                                            .colabEnderecoNumeroController,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall,
                                                          hintText:
                                                              'Data de Nascimento',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall,
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .borderSubtle01,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .supportErrorInverse,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .supportErrorInverse,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          filled: true,
                                                          fillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .field01,
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      24.0,
                                                                      20.0,
                                                                      24.0),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        validator: _model
                                                            .colabEnderecoNumeroControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: 350.0,
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    8.0),
                                                        child: Text(
                                                          'Complemento',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ),
                                                      TextFormField(
                                                        controller: _model
                                                            .colabEnderecoComplementoController,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall,
                                                          hintText:
                                                              'Data de Nascimento',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall,
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .borderSubtle01,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .supportErrorInverse,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .supportErrorInverse,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          filled: true,
                                                          fillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .field01,
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      24.0,
                                                                      20.0,
                                                                      24.0),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                        validator: _model
                                                            .colabEnderecoComplementoControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: 350.0,
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        8.0),
                                                            child: Text(
                                                              'Bairro',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        0.0,
                                                                        0.0,
                                                                        6.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  barrierColor:
                                                                      Color(
                                                                          0x00000000),
                                                                  enableDrag:
                                                                      false,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return Padding(
                                                                      padding: MediaQuery.of(
                                                                              context)
                                                                          .viewInsets,
                                                                      child:
                                                                          Container(
                                                                        height: MediaQuery.of(context).size.height *
                                                                            1.0,
                                                                        child:
                                                                            ModalOrientacaoWidget(),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    setState(
                                                                        () {}));
                                                              },
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .asterisk,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .textError,
                                                                size: 9.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      TextFormField(
                                                        controller: _model
                                                            .colabEnderecoBairroController,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall,
                                                          hintText:
                                                              'Data de Nascimento',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall,
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .borderSubtle01,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .supportErrorInverse,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .supportErrorInverse,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          filled: true,
                                                          fillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .field01,
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      24.0,
                                                                      20.0,
                                                                      24.0),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                        validator: _model
                                                            .colabEnderecoBairroControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: 350.0,
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        8.0),
                                                            child: Text(
                                                              'Cidade',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        0.0,
                                                                        0.0,
                                                                        6.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  barrierColor:
                                                                      Color(
                                                                          0x00000000),
                                                                  enableDrag:
                                                                      false,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return Padding(
                                                                      padding: MediaQuery.of(
                                                                              context)
                                                                          .viewInsets,
                                                                      child:
                                                                          Container(
                                                                        height: MediaQuery.of(context).size.height *
                                                                            1.0,
                                                                        child:
                                                                            ModalOrientacaoWidget(),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    setState(
                                                                        () {}));
                                                              },
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .asterisk,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .textError,
                                                                size: 9.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      TextFormField(
                                                        controller: _model
                                                            .colabEnderecoCidadeController,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall,
                                                          hintText:
                                                              'Data de Nascimento',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall,
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .borderSubtle01,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .supportErrorInverse,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .supportErrorInverse,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          filled: true,
                                                          fillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .field01,
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      24.0,
                                                                      20.0,
                                                                      24.0),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                        validator: _model
                                                            .colabEnderecoCidadeControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: 350.0,
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        8.0),
                                                            child: Text(
                                                              'UF',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        0.0,
                                                                        0.0,
                                                                        6.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  barrierColor:
                                                                      Color(
                                                                          0x00000000),
                                                                  enableDrag:
                                                                      false,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return Padding(
                                                                      padding: MediaQuery.of(
                                                                              context)
                                                                          .viewInsets,
                                                                      child:
                                                                          Container(
                                                                        height: MediaQuery.of(context).size.height *
                                                                            1.0,
                                                                        child:
                                                                            ModalOrientacaoWidget(),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    setState(
                                                                        () {}));
                                                              },
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .asterisk,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .textError,
                                                                size: 9.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      TextFormField(
                                                        controller: _model
                                                            .colabEnderecoEstadoController,
                                                        textCapitalization:
                                                            TextCapitalization
                                                                .characters,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall,
                                                          hintText:
                                                              'Data de Nascimento',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall,
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .borderSubtle01,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .supportErrorInverse,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .supportErrorInverse,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          filled: true,
                                                          fillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .field01,
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      24.0,
                                                                      20.0,
                                                                      24.0),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                        validator: _model
                                                            .colabEnderecoEstadoControllerValidator
                                                            .asValidator(
                                                                context),
                                                        inputFormatters: [
                                                          _model
                                                              .colabEnderecoEstadoMask
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: 350.0,
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    8.0),
                                                        child: Text(
                                                          'Com quem mora ?',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ),
                                                      TextFormField(
                                                        controller: _model
                                                            .colabFamiliaresController,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall,
                                                          hintText:
                                                              'Escrever aqui',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall,
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .borderSubtle01,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .supportErrorInverse,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .supportErrorInverse,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          filled: true,
                                                          fillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .field01,
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      24.0,
                                                                      20.0,
                                                                      24.0),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                        validator: _model
                                                            .colabFamiliaresControllerValidator
                                                            .asValidator(
                                                                context),
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
                                  ),
                                if (FFAppState().MCSaude)
                                  Container(
                                    width: double.infinity,
                                    constraints: BoxConstraints(
                                      maxWidth: FFAppState().colunaMain,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  24.0),
                                                      child:
                                                          SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .MCDadosPessoais =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCEndereco =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCSaude =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCDependentes =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCContato =
                                                                      false;
                                                                });
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .MCDadosPessoais =
                                                                      true;
                                                                });
                                                              },
                                                              child: Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 0.0,
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .borderSubtle01,
                                                                        offset: Offset(
                                                                            0.0,
                                                                            1.0),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            12.0,
                                                                            20.0,
                                                                            12.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.person_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'Dados pessoais',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .MCDadosPessoais =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCEndereco =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCSaude =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCDependentes =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCContato =
                                                                      false;
                                                                });
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .MCContato =
                                                                      true;
                                                                });
                                                              },
                                                              child: Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 0.0,
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .borderSubtle01,
                                                                        offset: Offset(
                                                                            0.0,
                                                                            1.0),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            12.0,
                                                                            20.0,
                                                                            12.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.phone_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'Contato',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .MCDadosPessoais =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCEndereco =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCSaude =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCDependentes =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCContato =
                                                                      false;
                                                                });
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .MCEndereco =
                                                                      true;
                                                                });
                                                              },
                                                              child: Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 0.0,
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .borderSubtle01,
                                                                        offset: Offset(
                                                                            0.0,
                                                                            1.0),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            12.0,
                                                                            20.0,
                                                                            12.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.location_pin,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'Endereço',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .MCDadosPessoais =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCEndereco =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCSaude =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCDependentes =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCContato =
                                                                      false;
                                                                });
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .MCSaude =
                                                                      true;
                                                                });
                                                              },
                                                              child: Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 0.0,
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .borderInteractive,
                                                                        offset: Offset(
                                                                            0.0,
                                                                            1.0),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            12.0,
                                                                            20.0,
                                                                            12.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.medical_services_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'Saúde',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .MCDadosPessoais =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCEndereco =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCSaude =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCDependentes =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCContato =
                                                                      false;
                                                                });
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .MCDependentes =
                                                                      true;
                                                                });
                                                              },
                                                              child: Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 0.0,
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .borderSubtle01,
                                                                        offset: Offset(
                                                                            0.0,
                                                                            1.0),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            12.0,
                                                                            20.0,
                                                                            12.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.people_alt_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'Dependentes',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 32.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 16.0),
                                                child: Wrap(
                                                  spacing: 24.0,
                                                  runSpacing: 24.0,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.start,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Container(
                                                      width: 350.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        8.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'Selecione caso tenha alguma deficiência:',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          FlutterFlowDropDown<
                                                              String>(
                                                            controller: _model
                                                                    .colabPCDValueController ??=
                                                                FormFieldController<
                                                                    String>(
                                                              _model.colabPCDValue ??=
                                                                  valueOrDefault<
                                                                      String>(
                                                                getJsonField(
                                                                  FFAppState()
                                                                      .dadosColab,
                                                                  r'''$.colaborador.saude.pcd''',
                                                                ).toString(),
                                                                'NENHUMA',
                                                              ),
                                                            ),
                                                            options: [
                                                              'NENHUMA',
                                                              'AUDITIVA',
                                                              'FÍSICA',
                                                              'INTELECTUAL',
                                                              'VISUAL',
                                                              'AUTISMO'
                                                            ],
                                                            onChanged: (val) =>
                                                                setState(() =>
                                                                    _model.colabPCDValue =
                                                                        val),
                                                            width:
                                                                double.infinity,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                            hintText:
                                                                'Selecione uma opção...',
                                                            icon: Icon(
                                                              Icons
                                                                  .keyboard_arrow_down_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 15.0,
                                                            ),
                                                            fillColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .field01,
                                                            elevation: 2.0,
                                                            borderColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .borderSubtle01,
                                                            borderWidth: 1.0,
                                                            borderRadius: 8.0,
                                                            margin:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        6.0,
                                                                        16.0,
                                                                        6.0),
                                                            hidesUnderline:
                                                                true,
                                                            isSearchable: false,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 350.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        8.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'Pertence ao grupo de risco para Covid-19 ?',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).overlay,
                                                                        barrierColor:
                                                                            Color(0x00000000),
                                                                        enableDrag:
                                                                            false,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return Padding(
                                                                            padding:
                                                                                MediaQuery.of(context).viewInsets,
                                                                            child:
                                                                                Container(
                                                                              height: MediaQuery.of(context).size.height * 1.0,
                                                                              child: ModalGrupoRiscoWidget(),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          setState(
                                                                              () {}));
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .info_outlined,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          16.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          FlutterFlowDropDown<
                                                              int>(
                                                            controller: _model
                                                                    .colabRiscoCovidValueController ??=
                                                                FormFieldController<
                                                                    int>(
                                                              _model.colabRiscoCovidValue ??=
                                                                  valueOrDefault<
                                                                      int>(
                                                                getJsonField(
                                                                  FFAppState()
                                                                      .dadosColab,
                                                                  r'''$.colaborador.saude.grupoDeRiscoCovid''',
                                                                ),
                                                                0,
                                                              ),
                                                            ),
                                                            options: [0, 1],
                                                            optionLabels: [
                                                              'Não',
                                                              'Sim'
                                                            ],
                                                            onChanged: (val) =>
                                                                setState(() =>
                                                                    _model.colabRiscoCovidValue =
                                                                        val),
                                                            width:
                                                                double.infinity,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                            hintText:
                                                                'Selecione uma opção...',
                                                            icon: Icon(
                                                              Icons
                                                                  .keyboard_arrow_down_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 15.0,
                                                            ),
                                                            fillColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .field01,
                                                            elevation: 2.0,
                                                            borderColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .borderSubtle01,
                                                            borderWidth: 1.0,
                                                            borderRadius: 8.0,
                                                            margin:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        6.0,
                                                                        16.0,
                                                                        6.0),
                                                            hidesUnderline:
                                                                true,
                                                            isSearchable: false,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 350.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        8.0),
                                                            child: Text(
                                                              'Possui alguma condição de saúde relevante ?',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                          ),
                                                          TextFormField(
                                                            controller: _model
                                                                .colabCondSaudeController,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall,
                                                              hintText:
                                                                  'Escrever aqui',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall,
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .borderSubtle01,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .supportErrorInverse,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .supportErrorInverse,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              filled: true,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .field01,
                                                              contentPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          24.0,
                                                                          20.0,
                                                                          24.0),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                            validator: _model
                                                                .colabCondSaudeControllerValidator
                                                                .asValidator(
                                                                    context),
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
                                      ],
                                    ),
                                  ),
                                if (FFAppState().MCDependentes)
                                  Container(
                                    width: double.infinity,
                                    constraints: BoxConstraints(
                                      maxWidth: FFAppState().colunaMain,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    alignment: AlignmentDirectional(0.0, -1.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  24.0),
                                                      child:
                                                          SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .MCDadosPessoais =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCEndereco =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCSaude =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCDependentes =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCContato =
                                                                      false;
                                                                });
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .MCDadosPessoais =
                                                                      true;
                                                                });
                                                              },
                                                              child: Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 0.0,
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .borderSubtle01,
                                                                        offset: Offset(
                                                                            0.0,
                                                                            1.0),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            12.0,
                                                                            20.0,
                                                                            12.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.person_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'Dados pessoais',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .MCDadosPessoais =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCEndereco =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCSaude =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCDependentes =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCContato =
                                                                      false;
                                                                });
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .MCContato =
                                                                      true;
                                                                });
                                                              },
                                                              child: Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 0.0,
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .borderSubtle01,
                                                                        offset: Offset(
                                                                            0.0,
                                                                            1.0),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            12.0,
                                                                            20.0,
                                                                            12.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.phone_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'Contato',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .MCDadosPessoais =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCEndereco =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCSaude =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCDependentes =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCContato =
                                                                      false;
                                                                });
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .MCEndereco =
                                                                      true;
                                                                });
                                                              },
                                                              child: Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 0.0,
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .borderSubtle01,
                                                                        offset: Offset(
                                                                            0.0,
                                                                            1.0),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            12.0,
                                                                            20.0,
                                                                            12.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.location_pin,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'Endereço',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .MCDadosPessoais =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCEndereco =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCSaude =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCDependentes =
                                                                      false;
                                                                  FFAppState()
                                                                          .MCContato =
                                                                      false;
                                                                });
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .MCSaude =
                                                                      true;
                                                                });
                                                              },
                                                              child: Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 0.0,
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .borderSubtle01,
                                                                        offset: Offset(
                                                                            0.0,
                                                                            1.0),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            12.0,
                                                                            20.0,
                                                                            12.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.medical_services_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'Saúde',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 0.0,
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .borderInteractive,
                                                                      offset: Offset(
                                                                          0.0,
                                                                          1.0),
                                                                    )
                                                                  ],
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          12.0,
                                                                          20.0,
                                                                          12.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .people_alt_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        'Dependentes',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Wrap(
                                            spacing: 8.0,
                                            runSpacing: 8.0,
                                            alignment: WrapAlignment.start,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            direction: Axis.horizontal,
                                            runAlignment: WrapAlignment.start,
                                            verticalDirection:
                                                VerticalDirection.down,
                                            clipBehavior: Clip.none,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 16.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Dependentes',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall,
                                                      ),
                                                    ),
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          barrierColor:
                                                              Color(0x00000000),
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return Padding(
                                                              padding: MediaQuery
                                                                      .of(context)
                                                                  .viewInsets,
                                                              child:
                                                                  ModalAddDependenteWidget(),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            setState(() {}));
                                                      },
                                                      text:
                                                          'Inserir dependente',
                                                      options: FFButtonOptions(
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    0.0,
                                                                    20.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      14.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily),
                                                                ),
                                                        elevation: 2.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Builder(
                                                builder: (context) {
                                                  final meusdependentes =
                                                      getJsonField(
                                                    FFAppState().dependenteJson,
                                                    r'''$.dependentesDTO''',
                                                  ).toList();
                                                  if (meusdependentes.isEmpty) {
                                                    return SemDependentesWidget();
                                                  }
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        meusdependentes.length,
                                                    itemBuilder: (context,
                                                        meusdependentesIndex) {
                                                      final meusdependentesItem =
                                                          meusdependentes[
                                                              meusdependentesIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    16.0),
                                                        child: Container(
                                                          constraints:
                                                              BoxConstraints(
                                                            maxWidth:
                                                                FFAppState()
                                                                    .coluna1,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .borderSubtle01,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        16.0,
                                                                        16.0,
                                                                        16.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          16.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      AutoSizeText(
                                                                        'Informações do dependente',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .headlineSmall,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Wrap(
                                                                  spacing: 10.0,
                                                                  runSpacing:
                                                                      0.0,
                                                                  alignment:
                                                                      WrapAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      WrapCrossAlignment
                                                                          .start,
                                                                  direction: Axis
                                                                      .horizontal,
                                                                  runAlignment:
                                                                      WrapAlignment
                                                                          .start,
                                                                  verticalDirection:
                                                                      VerticalDirection
                                                                          .down,
                                                                  clipBehavior:
                                                                      Clip.none,
                                                                  children: [
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      constraints:
                                                                          BoxConstraints(
                                                                        maxWidth:
                                                                            450.0,
                                                                      ),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                16.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                  child: Text(
                                                                                    'Nome completo:',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).textHelper,
                                                                                          fontSize: 16.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                AutoSizeText(
                                                                                  getJsonField(
                                                                                    meusdependentesItem,
                                                                                    r'''$.nomeCompleto''',
                                                                                  ).toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        fontSize: 16.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                16.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                  child: AutoSizeText(
                                                                                    'Grau de parentesco:',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).textHelper,
                                                                                          fontSize: 16.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                AutoSizeText(
                                                                                  getJsonField(
                                                                                    meusdependentesItem,
                                                                                    r'''$.tipoDependente.descricao''',
                                                                                  ).toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        fontSize: 16.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                16.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                  child: Text(
                                                                                    'CPF:',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).textHelper,
                                                                                          fontSize: 16.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  getJsonField(
                                                                                    meusdependentesItem,
                                                                                    r'''$.cpf''',
                                                                                  ).toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        fontSize: 16.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                16.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                  child: Text(
                                                                                    'RG:',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).textHelper,
                                                                                          fontSize: 16.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  getJsonField(
                                                                                    meusdependentesItem,
                                                                                    r'''$.rg''',
                                                                                  ).toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        fontSize: 16.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      constraints:
                                                                          BoxConstraints(
                                                                        maxWidth:
                                                                            450.0,
                                                                      ),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                16.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                  child: Text(
                                                                                    'Data de nascimento:',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).textHelper,
                                                                                          fontSize: 16.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                AutoSizeText(
                                                                                  valueOrDefault<String>(
                                                                                    functions.addDateMask(valueOrDefault<String>(
                                                                                      getJsonField(
                                                                                        meusdependentesItem,
                                                                                        r'''$.dataNascimento''',
                                                                                      ).toString(),
                                                                                      '00/00/0000',
                                                                                    )),
                                                                                    '00/00/0000',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        fontSize: 16.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                16.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                  child: Text(
                                                                                    'Requer ajuda específica:',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).textHelper,
                                                                                          fontSize: 16.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                AutoSizeText(
                                                                                  getJsonField(
                                                                                    meusdependentesItem,
                                                                                    r'''$.requerAjudaQual''',
                                                                                  ).toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        fontSize: 16.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              16.0,
                                                                              0.0),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              await showModalBottomSheet(
                                                                                isScrollControlled: true,
                                                                                backgroundColor: Colors.transparent,
                                                                                barrierColor: Color(0x00000000),
                                                                                enableDrag: false,
                                                                                context: context,
                                                                                builder: (context) {
                                                                                  return Padding(
                                                                                    padding: MediaQuery.of(context).viewInsets,
                                                                                    child: ModalEditDepenWidget(
                                                                                      nomecompleto: getJsonField(
                                                                                        meusdependentesItem,
                                                                                        r'''$.nomeCompleto''',
                                                                                      ).toString(),
                                                                                      cpf: getJsonField(
                                                                                        meusdependentesItem,
                                                                                        r'''$.cpf''',
                                                                                      ).toString(),
                                                                                      rg: getJsonField(
                                                                                        meusdependentesItem,
                                                                                        r'''$.rg''',
                                                                                      ).toString(),
                                                                                      datanascimento: getJsonField(
                                                                                        meusdependentesItem,
                                                                                        r'''$.dataNascimento''',
                                                                                      ).toString(),
                                                                                      tipodependenteid: getJsonField(
                                                                                        meusdependentesItem,
                                                                                        r'''$.tipoDependente.id''',
                                                                                      ),
                                                                                      requerajuda: getJsonField(
                                                                                        meusdependentesItem,
                                                                                        r'''$.requerAjudaQual''',
                                                                                      ).toString(),
                                                                                      id: getJsonField(
                                                                                        meusdependentesItem,
                                                                                        r'''$.id''',
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).then((value) => setState(() {}));
                                                                            },
                                                                            child:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidEdit,
                                                                              color: FlutterFlowTheme.of(context).layerSelectedDisabled,
                                                                              size: 22.0,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            FFAppState().update(() {
                                                                              FFAppState().modalExcluirDepend = true;
                                                                              FFAppState().iddependente = getJsonField(
                                                                                meusdependentesItem,
                                                                                r'''$.id''',
                                                                              );
                                                                            });
                                                                          },
                                                                          child:
                                                                              FaIcon(
                                                                            FontAwesomeIcons.trashAlt,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).layerSelectedDisabled,
                                                                            size:
                                                                                22.0,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                Container(
                                  width: double.infinity,
                                  constraints: BoxConstraints(
                                    maxWidth: FFAppState().colunaMain,
                                  ),
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 24.0, 0.0, 24.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
                                            var _shouldSetState = false;
                                            if (FFAppState().numContatosEmerg ==
                                                0) {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title:
                                                        Text('Dados faltantes'),
                                                    content: Text(
                                                        'Voce não possui contatos de emergência cadastrados. Por favor, informar pelo menos um contato.'),
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
                                                FFAppState().MCDadosPessoais =
                                                    false;
                                                FFAppState().MCEndereco = false;
                                                FFAppState().MCSaude = false;
                                                FFAppState().MCDependentes =
                                                    false;
                                                FFAppState().MCContato = false;
                                              });
                                              FFAppState().update(() {
                                                FFAppState().MCContato = true;
                                              });
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            } else {
                                              if ((_model.colabNomeController1.text == null || _model.colabNomeController1.text == '') ||
                                                  (_model.colabDatanascimentoController.text == null ||
                                                      _model.colabDatanascimentoController.text ==
                                                          '') ||
                                                  (_model.colabCPFController.text == null ||
                                                      _model.colabCPFController.text ==
                                                          '') ||
                                                  (_model.colabRGController.text == null ||
                                                      _model.colabRGController.text ==
                                                          '') ||
                                                  (_model.colabEstadoCivilValue == null ||
                                                      _model.colabEstadoCivilValue ==
                                                          '') ||
                                                  (_model.colabEscolaridadeValue == null ||
                                                      _model.colabEscolaridadeValue ==
                                                          '') ||
                                                  (/* NOT RECOMMENDED */ _model
                                                          .colabEmailAlternativoController
                                                          .text ==
                                                      'true') ||
                                                  (_model.colabPhoneController.text == null ||
                                                      _model.colabPhoneController.text ==
                                                          '') ||
                                                  (_model.colabEnderecoCEPController.text == null ||
                                                      _model.colabEnderecoCEPController.text ==
                                                          '') ||
                                                  (_model.colabEnderecoController.text == null ||
                                                      _model.colabEnderecoController.text ==
                                                          '') ||
                                                  (_model.colabEnderecoNumeroController.text == null ||
                                                      _model.colabEnderecoNumeroController.text ==
                                                          '') ||
                                                  (_model.colabEnderecoBairroController.text == null ||
                                                      _model.colabEnderecoBairroController.text ==
                                                          '') ||
                                                  (_model.colabEnderecoCidadeController.text == null ||
                                                      _model.colabEnderecoCidadeController.text ==
                                                          '') ||
                                                  (_model.colabEnderecoEstadoController.text == null ||
                                                      _model.colabEnderecoEstadoController.text == '')) {
                                                setState(() {
                                                  FFAppState().modalCamposForm =
                                                      true;
                                                });
                                              } else {
                                                if (getJsonField(
                                                      FFAppState().dadosColab,
                                                      r'''$.colaborador.saude''',
                                                    ) ==
                                                    null) {
                                                  _model.addSaude =
                                                      await BackendHomologGroup
                                                          .addDadosPCDCall
                                                          .call(
                                                    token: FFAppState().token,
                                                    pcd: _model.colabPCDValue ==
                                                                null ||
                                                            _model.colabPCDValue ==
                                                                ''
                                                        ? FFAppState().myPCD
                                                        : _model.colabPCDValue,
                                                    grupoDeRisco:
                                                        valueOrDefault<int>(
                                                      _model
                                                          .colabRiscoCovidValue,
                                                      0,
                                                    ),
                                                    descricaoCondicaoDeSaude: _model
                                                        .colabCondSaudeController
                                                        .text,
                                                  );
                                                  _shouldSetState = true;
                                                  if ((_model.addSaude
                                                          ?.succeeded ??
                                                      true)) {
                                                    _model.alterarDadosNew =
                                                        await BackendHomologGroup
                                                            .alterarDadosColabNewCall
                                                            .call(
                                                      token: FFAppState().token,
                                                      nome: _model
                                                          .colabNomeController1
                                                          .text,
                                                      datanascimento: functions
                                                          .addDateMaskReverse(_model
                                                              .colabDatanascimentoController
                                                              .text),
                                                      cpf: _model
                                                          .colabCPFController
                                                          .text,
                                                      rg: _model
                                                          .colabRGController
                                                          .text,
                                                      estadocivil: _model
                                                          .colabEstadoCivilValue,
                                                      escolaridade: _model
                                                          .colabEscolaridadeValue,
                                                      etnia: _model
                                                          .colabEtniaValue,
                                                      genero: _model
                                                          .colabGeneroValue,
                                                      orientacaosexual: _model
                                                          .colabOrientacaoValue,
                                                      pessoarefug: false,
                                                      email: _model
                                                          .colabEmailProController
                                                          .text,
                                                      emailalternativo: _model
                                                          .colabEmailAlternativoController
                                                          .text,
                                                      celular: functions
                                                          .addPhoneMaskReverse(
                                                              _model
                                                                  .colabPhoneController
                                                                  .text),
                                                      passaporte: '12345',
                                                      cep: functions
                                                          .addZipCodeMaskReverse(
                                                              valueOrDefault<
                                                                  String>(
                                                        _model
                                                            .colabEnderecoCEPController
                                                            .text,
                                                        '00000000',
                                                      )),
                                                      endereco: _model
                                                          .colabEnderecoController
                                                          .text,
                                                      complemento: _model
                                                          .colabEnderecoComplementoController
                                                          .text,
                                                      numero: int.tryParse(_model
                                                          .colabEnderecoNumeroController
                                                          .text),
                                                      bairro: _model
                                                          .colabEnderecoBairroController
                                                          .text,
                                                      cidade: _model
                                                          .colabEnderecoCidadeController
                                                          .text,
                                                      estado: _model
                                                          .colabEnderecoEstadoController
                                                          .text,
                                                      comquemmora: _model
                                                          .colabFamiliaresController
                                                          .text,
                                                    );
                                                    _shouldSetState = true;
                                                    if ((_model.alterarDadosNew
                                                            ?.succeeded ??
                                                        true)) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            content: Text(
                                                                'Dados salvos com sucesso!'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                      _model.dadosAtualizados =
                                                          await BackendHomologGroup
                                                              .buscaDadosNewCall
                                                              .call(
                                                        token:
                                                            FFAppState().token,
                                                      );
                                                      _shouldSetState = true;
                                                      if ((_model
                                                              .dadosAtualizados
                                                              ?.succeeded ??
                                                          true)) {
                                                        FFAppState().update(() {
                                                          FFAppState()
                                                              .dadosColab = (_model
                                                                  .dadosAtualizados
                                                                  ?.jsonBody ??
                                                              '');
                                                        });
                                                        // UpdateDadosPessoais
                                                        FFAppState().update(() {
                                                          FFAppState().myName =
                                                              getJsonField(
                                                            FFAppState()
                                                                .dadosColab,
                                                            r'''$.colaborador.nomeCompleto''',
                                                          ).toString();
                                                          FFAppState()
                                                                  .myBirthday =
                                                              valueOrDefault<
                                                                  String>(
                                                            getJsonField(
                                                              FFAppState()
                                                                  .dadosColab,
                                                              r'''$.colaborador.dataNascimento''',
                                                            ).toString(),
                                                            'Informar data de nascimento',
                                                          );
                                                          FFAppState().MyRg =
                                                              valueOrDefault<
                                                                  String>(
                                                            getJsonField(
                                                              FFAppState()
                                                                  .dadosColab,
                                                              r'''$.colaborador.rg''',
                                                            ).toString(),
                                                            'Informa seu RG',
                                                          );
                                                          FFAppState()
                                                                  .myEstadoCivil =
                                                              getJsonField(
                                                            FFAppState()
                                                                .dadosColab,
                                                            r'''$.colaborador.estadoCivil''',
                                                          ).toString();
                                                          FFAppState()
                                                                  .myEscolaridade =
                                                              getJsonField(
                                                            FFAppState()
                                                                .dadosColab,
                                                            r'''$.colaborador.escolaridade''',
                                                          ).toString();
                                                          FFAppState().myEtnia =
                                                              getJsonField(
                                                            FFAppState()
                                                                .dadosColab,
                                                            r'''$.colaborador.etnia''',
                                                          ).toString();
                                                          FFAppState()
                                                                  .myGender =
                                                              getJsonField(
                                                            FFAppState()
                                                                .dadosColab,
                                                            r'''$.colaborador.genero''',
                                                          ).toString();
                                                          FFAppState()
                                                                  .myOrientacao =
                                                              getJsonField(
                                                            FFAppState()
                                                                .dadosColab,
                                                            r'''$.colaborador.orientacaoSexual''',
                                                          ).toString();
                                                          FFAppState()
                                                                  .myRefugiada =
                                                              getJsonField(
                                                            FFAppState()
                                                                .dadosColab,
                                                            r'''$.colaborador.pessoaRefugiada''',
                                                          ).toString();
                                                        });
                                                        FFAppState().update(() {
                                                          FFAppState().myPhoto =
                                                              '${functions.urlPhoto(getJsonField(
                                                                    FFAppState()
                                                                        .dadosColab,
                                                                    r'''$.colaborador.urlFoto''',
                                                                  ).toString(), FFAppState().token)}';
                                                        });
                                                        // UpdateContato
                                                        FFAppState().update(() {
                                                          FFAppState()
                                                                  .myMailPro =
                                                              getJsonField(
                                                            FFAppState()
                                                                .dadosColab,
                                                            r'''$.colaborador.email''',
                                                          ).toString();
                                                          FFAppState()
                                                                  .myMailAlternative =
                                                              getJsonField(
                                                            FFAppState()
                                                                .dadosColab,
                                                            r'''$.colaborador.emailAlternativo''',
                                                          ).toString();
                                                          FFAppState().myPhone =
                                                              getJsonField(
                                                            FFAppState()
                                                                .dadosColab,
                                                            r'''$.colaborador.contatoPrincipal''',
                                                          ).toString();
                                                        });
                                                        // UpdateEndereco
                                                        FFAppState().update(() {
                                                          FFAppState().myCEP =
                                                              getJsonField(
                                                            FFAppState()
                                                                .dadosColab,
                                                            r'''$.colaborador.endereco.cep''',
                                                          ).toString();
                                                          FFAppState()
                                                                  .myAddress =
                                                              valueOrDefault<
                                                                  String>(
                                                            getJsonField(
                                                              FFAppState()
                                                                  .dadosColab,
                                                              r'''$.colaborador.endereco.endereco''',
                                                            ).toString(),
                                                            'Rua, Avenida, Alameda...',
                                                          );
                                                          FFAppState()
                                                                  .myAdressNumber =
                                                              valueOrDefault<
                                                                  String>(
                                                            getJsonField(
                                                              FFAppState()
                                                                  .dadosColab,
                                                              r'''$.colaborador.endereco.numero''',
                                                            ).toString(),
                                                            'Informe o número',
                                                          );
                                                          FFAppState()
                                                                  .myAdressComplement =
                                                              valueOrDefault<
                                                                  String>(
                                                            getJsonField(
                                                              FFAppState()
                                                                  .dadosColab,
                                                              r'''$.colaborador.endereco.complemento''',
                                                            ).toString(),
                                                            'Informe o complemento',
                                                          );
                                                          FFAppState()
                                                                  .myAdressBairro =
                                                              valueOrDefault<
                                                                  String>(
                                                            getJsonField(
                                                              FFAppState()
                                                                  .dadosColab,
                                                              r'''$.colaborador.endereco.bairro''',
                                                            ).toString(),
                                                            'Informe o bairro',
                                                          );
                                                          FFAppState()
                                                                  .myAdressCity =
                                                              valueOrDefault<
                                                                  String>(
                                                            getJsonField(
                                                              FFAppState()
                                                                  .dadosColab,
                                                              r'''$.colaborador.endereco.cidade''',
                                                            ).toString(),
                                                            'Informe a cidade',
                                                          );
                                                          FFAppState()
                                                                  .myAdressState =
                                                              valueOrDefault<
                                                                  String>(
                                                            getJsonField(
                                                              FFAppState()
                                                                  .dadosColab,
                                                              r'''$.colaborador.endereco.estado''',
                                                            ).toString(),
                                                            'Informe a UF',
                                                          );
                                                          FFAppState()
                                                                  .myResidents =
                                                              valueOrDefault<
                                                                  String>(
                                                            getJsonField(
                                                              FFAppState()
                                                                  .dadosColab,
                                                              r'''$.colaborador.endereco.comQuemMora''',
                                                            ).toString(),
                                                            'Informe os residentes',
                                                          );
                                                        });
                                                        // UpdateSaude
                                                        FFAppState().update(() {
                                                          FFAppState()
                                                                  .mySaudeRelevante =
                                                              valueOrDefault<
                                                                  String>(
                                                            getJsonField(
                                                              FFAppState()
                                                                  .dadosColab,
                                                              r'''$.colaborador.saude.condicaoDeSaudeRelevante''',
                                                            ).toString(),
                                                            'Nenhuma condição',
                                                          );
                                                          FFAppState().myPCD =
                                                              valueOrDefault<
                                                                  String>(
                                                            getJsonField(
                                                              FFAppState()
                                                                  .dadosColab,
                                                              r'''$.colaborador.saude.pcd''',
                                                            ).toString(),
                                                            'Nenhuma',
                                                          );
                                                          FFAppState()
                                                                  .myCovidBool =
                                                              getJsonField(
                                                            FFAppState()
                                                                .dadosColab,
                                                            r'''$.colaborador.saude.grupoDeRiscoCovid''',
                                                          );
                                                        });
                                                      }
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            content: Text(
                                                                'Houve um erro ao salvar os dados.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          content: Text(
                                                              'Erro ao adicionar dados de saúde. Por favor, revise os dados.'),
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
                                                      FFAppState()
                                                              .MCDadosPessoais =
                                                          false;
                                                      FFAppState().MCEndereco =
                                                          false;
                                                      FFAppState().MCSaude =
                                                          false;
                                                      FFAppState()
                                                              .MCDependentes =
                                                          false;
                                                      FFAppState().MCContato =
                                                          false;
                                                    });
                                                    FFAppState().update(() {
                                                      FFAppState().MCSaude =
                                                          true;
                                                    });
                                                  }
                                                } else {
                                                  _model.editaSaude =
                                                      await BackendHomologGroup
                                                          .editaDadosPCDCall
                                                          .call(
                                                    token: FFAppState().token,
                                                    pcd: _model.colabPCDValue ==
                                                                null ||
                                                            _model.colabPCDValue ==
                                                                ''
                                                        ? FFAppState().myPCD
                                                        : _model.colabPCDValue,
                                                    grupoDeRisco:
                                                        valueOrDefault<int>(
                                                      _model
                                                          .colabRiscoCovidValue,
                                                      0,
                                                    ),
                                                    descricaoCondicaoDeSaude: _model
                                                        .colabCondSaudeController
                                                        .text,
                                                  );
                                                  _shouldSetState = true;
                                                  if ((_model.editaSaude
                                                          ?.succeeded ??
                                                      true)) {
                                                    _model.alterarDadosNew2 =
                                                        await BackendHomologGroup
                                                            .alterarDadosColabNewCall
                                                            .call(
                                                      token: FFAppState().token,
                                                      nome: _model
                                                          .colabNomeController1
                                                          .text,
                                                      datanascimento: functions
                                                          .addDateMaskReverse(_model
                                                              .colabDatanascimentoController
                                                              .text),
                                                      cpf: _model
                                                          .colabCPFController
                                                          .text,
                                                      rg: _model
                                                          .colabRGController
                                                          .text,
                                                      estadocivil: _model
                                                          .colabEstadoCivilValue,
                                                      escolaridade: _model
                                                          .colabEscolaridadeValue,
                                                      etnia: _model
                                                          .colabEtniaValue,
                                                      genero: _model
                                                          .colabGeneroValue,
                                                      orientacaosexual: _model
                                                          .colabOrientacaoValue,
                                                      pessoarefug: false,
                                                      email: _model
                                                          .colabEmailProController
                                                          .text,
                                                      emailalternativo: _model
                                                          .colabEmailAlternativoController
                                                          .text,
                                                      celular: functions
                                                          .addPhoneMaskReverse(
                                                              _model
                                                                  .colabPhoneController
                                                                  .text),
                                                      passaporte: '12345',
                                                      cep: functions
                                                          .addZipCodeMaskReverse(
                                                              valueOrDefault<
                                                                  String>(
                                                        _model
                                                            .colabEnderecoCEPController
                                                            .text,
                                                        '00000000',
                                                      )),
                                                      endereco: _model
                                                          .colabEnderecoController
                                                          .text,
                                                      complemento: _model
                                                          .colabEnderecoComplementoController
                                                          .text,
                                                      numero: int.tryParse(_model
                                                          .colabEnderecoNumeroController
                                                          .text),
                                                      bairro: _model
                                                          .colabEnderecoBairroController
                                                          .text,
                                                      cidade: _model
                                                          .colabEnderecoCidadeController
                                                          .text,
                                                      estado: _model
                                                          .colabEnderecoEstadoController
                                                          .text,
                                                      comquemmora: _model
                                                          .colabFamiliaresController
                                                          .text,
                                                    );
                                                    _shouldSetState = true;
                                                    if ((_model.alterarDadosNew2
                                                            ?.succeeded ??
                                                        true)) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            content: Text(
                                                                'Dados salvos com sucesso!'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                      _model.dadosAtualizados2 =
                                                          await BackendHomologGroup
                                                              .buscaDadosNewCall
                                                              .call(
                                                        token:
                                                            FFAppState().token,
                                                      );
                                                      _shouldSetState = true;
                                                      if ((_model
                                                              .dadosAtualizados2
                                                              ?.succeeded ??
                                                          true)) {
                                                        FFAppState().update(() {
                                                          FFAppState()
                                                              .dadosColab = (_model
                                                                  .dadosAtualizados2
                                                                  ?.jsonBody ??
                                                              '');
                                                        });
                                                        FFAppState().update(() {
                                                          FFAppState().myPhoto =
                                                              '${functions.urlPhoto(getJsonField(
                                                                    FFAppState()
                                                                        .dadosColab,
                                                                    r'''$.colaborador.urlFoto''',
                                                                  ).toString(), FFAppState().token)}';
                                                        });
                                                        // UpdateDadosPessoais
                                                        FFAppState().update(() {
                                                          FFAppState().myName =
                                                              getJsonField(
                                                            FFAppState()
                                                                .dadosColab,
                                                            r'''$.colaborador.nomeCompleto''',
                                                          ).toString();
                                                          FFAppState()
                                                                  .myBirthday =
                                                              valueOrDefault<
                                                                  String>(
                                                            getJsonField(
                                                              FFAppState()
                                                                  .dadosColab,
                                                              r'''$.colaborador.dataNascimento''',
                                                            ).toString(),
                                                            'Informar data de nascimento',
                                                          );
                                                          FFAppState().MyRg =
                                                              valueOrDefault<
                                                                  String>(
                                                            getJsonField(
                                                              FFAppState()
                                                                  .dadosColab,
                                                              r'''$.colaborador.rg''',
                                                            ).toString(),
                                                            'Informa seu RG',
                                                          );
                                                          FFAppState()
                                                                  .myEstadoCivil =
                                                              getJsonField(
                                                            FFAppState()
                                                                .dadosColab,
                                                            r'''$.colaborador.estadoCivil''',
                                                          ).toString();
                                                          FFAppState()
                                                                  .myEscolaridade =
                                                              getJsonField(
                                                            FFAppState()
                                                                .dadosColab,
                                                            r'''$.colaborador.escolaridade''',
                                                          ).toString();
                                                          FFAppState().myEtnia =
                                                              getJsonField(
                                                            FFAppState()
                                                                .dadosColab,
                                                            r'''$.colaborador.etnia''',
                                                          ).toString();
                                                          FFAppState()
                                                                  .myGender =
                                                              getJsonField(
                                                            FFAppState()
                                                                .dadosColab,
                                                            r'''$.colaborador.genero''',
                                                          ).toString();
                                                          FFAppState()
                                                                  .myOrientacao =
                                                              getJsonField(
                                                            FFAppState()
                                                                .dadosColab,
                                                            r'''$.colaborador.orientacaoSexual''',
                                                          ).toString();
                                                          FFAppState()
                                                                  .myRefugiada =
                                                              getJsonField(
                                                            FFAppState()
                                                                .dadosColab,
                                                            r'''$.colaborador.pessoaRefugiada''',
                                                          ).toString();
                                                        });
                                                        // UpdateContato
                                                        FFAppState().update(() {
                                                          FFAppState()
                                                                  .myMailPro =
                                                              getJsonField(
                                                            FFAppState()
                                                                .dadosColab,
                                                            r'''$.colaborador.email''',
                                                          ).toString();
                                                          FFAppState()
                                                                  .myMailAlternative =
                                                              getJsonField(
                                                            FFAppState()
                                                                .dadosColab,
                                                            r'''$.colaborador.emailAlternativo''',
                                                          ).toString();
                                                          FFAppState().myPhone =
                                                              getJsonField(
                                                            FFAppState()
                                                                .dadosColab,
                                                            r'''$.colaborador.contatoPrincipal''',
                                                          ).toString();
                                                        });
                                                        // UpdateEndereco
                                                        FFAppState().update(() {
                                                          FFAppState().myCEP =
                                                              getJsonField(
                                                            FFAppState()
                                                                .dadosColab,
                                                            r'''$.colaborador.endereco.cep''',
                                                          ).toString();
                                                          FFAppState()
                                                                  .myAddress =
                                                              valueOrDefault<
                                                                  String>(
                                                            getJsonField(
                                                              FFAppState()
                                                                  .dadosColab,
                                                              r'''$.colaborador.endereco.endereco''',
                                                            ).toString(),
                                                            'Rua, Avenida, Alameda...',
                                                          );
                                                          FFAppState()
                                                                  .myAdressNumber =
                                                              valueOrDefault<
                                                                  String>(
                                                            getJsonField(
                                                              FFAppState()
                                                                  .dadosColab,
                                                              r'''$.colaborador.endereco.numero''',
                                                            ).toString(),
                                                            'Informe o número',
                                                          );
                                                          FFAppState()
                                                                  .myAdressComplement =
                                                              valueOrDefault<
                                                                  String>(
                                                            getJsonField(
                                                              FFAppState()
                                                                  .dadosColab,
                                                              r'''$.colaborador.endereco.complemento''',
                                                            ).toString(),
                                                            'Informe o complemento',
                                                          );
                                                          FFAppState()
                                                                  .myAdressBairro =
                                                              valueOrDefault<
                                                                  String>(
                                                            getJsonField(
                                                              FFAppState()
                                                                  .dadosColab,
                                                              r'''$.colaborador.endereco.bairro''',
                                                            ).toString(),
                                                            'Informe o bairro',
                                                          );
                                                          FFAppState()
                                                                  .myAdressCity =
                                                              valueOrDefault<
                                                                  String>(
                                                            getJsonField(
                                                              FFAppState()
                                                                  .dadosColab,
                                                              r'''$.colaborador.endereco.cidade''',
                                                            ).toString(),
                                                            'Informe a cidade',
                                                          );
                                                          FFAppState()
                                                                  .myAdressState =
                                                              valueOrDefault<
                                                                  String>(
                                                            getJsonField(
                                                              FFAppState()
                                                                  .dadosColab,
                                                              r'''$.colaborador.endereco.estado''',
                                                            ).toString(),
                                                            'Informe a UF',
                                                          );
                                                          FFAppState()
                                                                  .myResidents =
                                                              valueOrDefault<
                                                                  String>(
                                                            getJsonField(
                                                              FFAppState()
                                                                  .dadosColab,
                                                              r'''$.colaborador.endereco.comQuemMora''',
                                                            ).toString(),
                                                            'Informe os residentes',
                                                          );
                                                        });
                                                        // UpdateSaude
                                                        FFAppState().update(() {
                                                          FFAppState()
                                                                  .mySaudeRelevante =
                                                              valueOrDefault<
                                                                  String>(
                                                            getJsonField(
                                                              FFAppState()
                                                                  .dadosColab,
                                                              r'''$.colaborador.saude.condicaoDeSaudeRelevante''',
                                                            ).toString(),
                                                            'Nenhuma condição',
                                                          );
                                                          FFAppState().myPCD =
                                                              valueOrDefault<
                                                                  String>(
                                                            getJsonField(
                                                              FFAppState()
                                                                  .dadosColab,
                                                              r'''$.colaborador.saude.pcd''',
                                                            ).toString(),
                                                            'Nenhuma',
                                                          );
                                                          FFAppState()
                                                                  .myCovidBool =
                                                              getJsonField(
                                                            FFAppState()
                                                                .dadosColab,
                                                            r'''$.colaborador.saude.grupoDeRiscoCovid''',
                                                          );
                                                        });
                                                      }
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            content: Text(
                                                                'Houve um erro ao salvar os dados.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          content: Text(
                                                              'Erro ao editar dados de saúde. Por favor, revise os dados.'),
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
                                                      FFAppState()
                                                              .MCDadosPessoais =
                                                          false;
                                                      FFAppState().MCEndereco =
                                                          false;
                                                      FFAppState().MCSaude =
                                                          false;
                                                      FFAppState()
                                                              .MCDependentes =
                                                          false;
                                                      FFAppState().MCContato =
                                                          false;
                                                    });
                                                    FFAppState().update(() {
                                                      FFAppState().MCSaude =
                                                          true;
                                                    });
                                                  }
                                                }
                                              }
                                            }

                                            if (_shouldSetState)
                                              setState(() {});
                                          },
                                          text: 'Salvar dados',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
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
            ),
            if (responsiveVisibility(
              context: context,
              tabletLandscape: false,
              desktop: false,
            ))
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.theUltimateNavBarModel,
                  updateCallback: () => setState(() {}),
                  child: TheUltimateNavBarWidget(
                    icone2: FlutterFlowTheme.of(context).secondaryText,
                    texto2: FlutterFlowTheme.of(context).secondaryText,
                    icone3: FlutterFlowTheme.of(context).secondaryText,
                    texto3: FlutterFlowTheme.of(context).secondaryText,
                    icone4: FlutterFlowTheme.of(context).primary,
                    texto4: FlutterFlowTheme.of(context).primary,
                    icone5: FlutterFlowTheme.of(context).secondaryText,
                    texto5: FlutterFlowTheme.of(context).secondaryText,
                  ),
                ),
              ),
            if (FFAppState().modalExcluirDepend)
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: MediaQuery.of(context).size.height * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).overlay,
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: 700.0,
                        ),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Excluir dependente',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall,
                                        ),
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          buttonSize: 60.0,
                                          icon: Icon(
                                            Icons.close_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 30.0,
                                          ),
                                          onPressed: () async {
                                            setState(() {
                                              FFAppState().modalExcluirDepend =
                                                  false;
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
                                    color: FlutterFlowTheme.of(context)
                                        .borderSubtle01,
                                  ),
                                ),
                                Container(
                                  constraints: BoxConstraints(
                                    maxHeight:
                                        MediaQuery.of(context).size.height *
                                            0.7,
                                  ),
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 16.0, 16.0, 16.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Atenção!\nAo excluir, esta ação não pode ser desfeita',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 16.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 50.0, 0.0, 10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    setState(() {
                                                      FFAppState()
                                                              .modalExcluirDepend =
                                                          false;
                                                    });
                                                  },
                                                  text: 'Cancelar',
                                                  options: FFButtonOptions(
                                                    width: 130.0,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .background,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                          lineHeight: 1.4,
                                                        ),
                                                    elevation: 2.0,
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .borderSubtle01,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    _model.apiResult300 =
                                                        await BackendHomologGroup
                                                            .removerDependenteCall
                                                            .call(
                                                      token: FFAppState().token,
                                                      id: FFAppState()
                                                          .iddependente,
                                                      colaboradorCpf:
                                                          FFAppState().MyCpf,
                                                    );
                                                    if ((_model.apiResult300
                                                            ?.succeeded ??
                                                        true)) {
                                                      setState(() {
                                                        FFAppState()
                                                                .modalExcluirDepend =
                                                            false;
                                                      });
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            content: Text(
                                                                'Dependente excluido com sucesso!'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                    _model.excluiuDependentes =
                                                        await BackendHomologGroup
                                                            .listaDependentesColaboradorCall
                                                            .call(
                                                      token: FFAppState().token,
                                                    );
                                                    if ((_model
                                                            .excluiuDependentes
                                                            ?.succeeded ??
                                                        true)) {
                                                      FFAppState().update(() {
                                                        FFAppState()
                                                            .dependenteJson = (_model
                                                                .excluiuDependentes
                                                                ?.jsonBody ??
                                                            '');
                                                      });
                                                    }

                                                    setState(() {});
                                                  },
                                                  text: 'Excluir',
                                                  options: FFButtonOptions(
                                                    width: 130.0,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: Colors.white,
                                                          fontSize: 16.0,
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
                                                        BorderRadius.circular(
                                                            8.0),
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
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            if (FFAppState().modalCamposForm)
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: MediaQuery.of(context).size.height * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).overlay,
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: 700.0,
                        ),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Campos obrigatórios',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall,
                                        ),
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          buttonSize: 60.0,
                                          icon: Icon(
                                            Icons.close_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 30.0,
                                          ),
                                          onPressed: () async {
                                            setState(() {
                                              FFAppState().modalCamposForm =
                                                  false;
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
                                    color: FlutterFlowTheme.of(context)
                                        .borderSubtle01,
                                  ),
                                ),
                                Container(
                                  constraints: BoxConstraints(
                                    maxHeight:
                                        MediaQuery.of(context).size.height *
                                            0.7,
                                  ),
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 16.0, 16.0, 16.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Por favor, preencha todos os campos obrigatórios.',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                              Text(
                                                '(*)',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .supportError0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 50.0, 0.0, 10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    setState(() {
                                                      FFAppState()
                                                              .modalCamposForm =
                                                          false;
                                                    });
                                                  },
                                                  text: 'Fechar',
                                                  options: FFButtonOptions(
                                                    width: 130.0,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .background,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                          lineHeight: 1.4,
                                                        ),
                                                    elevation: 2.0,
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .borderSubtle01,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
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
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            if (FFAppState().modalExcluirContatoEmerg)
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: MediaQuery.of(context).size.height * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).overlay,
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: 700.0,
                        ),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Excluir contato de emergência',
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
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 30.0,
                                          ),
                                          onPressed: () async {
                                            setState(() {
                                              FFAppState()
                                                      .modalExcluirContatoEmerg =
                                                  false;
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
                                    color: FlutterFlowTheme.of(context)
                                        .borderSubtle01,
                                  ),
                                ),
                                Container(
                                  constraints: BoxConstraints(
                                    maxHeight:
                                        MediaQuery.of(context).size.height *
                                            0.7,
                                  ),
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 16.0, 16.0, 16.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Atenção!\nAo excluir, esta ação não pode ser desfeita',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 16.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 50.0, 0.0, 10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    setState(() {
                                                      FFAppState()
                                                              .modalExcluirContatoEmerg =
                                                          false;
                                                    });
                                                  },
                                                  text: 'Cancelar',
                                                  options: FFButtonOptions(
                                                    width: 130.0,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .background,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                          lineHeight: 1.4,
                                                        ),
                                                    elevation: 2.0,
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .borderSubtle01,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    _model.apiResult399 =
                                                        await BackendHomologGroup
                                                            .removerContatoEmergCall
                                                            .call(
                                                      order: FFAppState()
                                                          .orderContatoEmerg,
                                                      token: FFAppState().token,
                                                    );
                                                    if ((_model.apiResult399
                                                            ?.succeeded ??
                                                        true)) {
                                                      setState(() {
                                                        FFAppState()
                                                                .modalExcluirContatoEmerg =
                                                            false;
                                                      });
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            content: Text(
                                                                'Contato excluido com sucesso!'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                      _model.excluiuContatoEmerg =
                                                          await BackendHomologGroup
                                                              .listarContatoEmergCall
                                                              .call(
                                                        token:
                                                            FFAppState().token,
                                                      );
                                                      if ((_model
                                                              .excluiuContatoEmerg
                                                              ?.succeeded ??
                                                          true)) {
                                                        FFAppState().update(() {
                                                          FFAppState()
                                                              .contatoEmergJson = (_model
                                                                  .excluiuContatoEmerg
                                                                  ?.jsonBody ??
                                                              '');
                                                        });
                                                        FFAppState().update(() {
                                                          FFAppState()
                                                                  .numContatosEmerg =
                                                              functions.returnNumeroContatos((_model
                                                                      .excluiuContatoEmerg
                                                                      ?.jsonBody ??
                                                                  ''))!;
                                                        });
                                                      }
                                                    }

                                                    setState(() {});
                                                  },
                                                  text: 'Excluir',
                                                  options: FFButtonOptions(
                                                    width: 130.0,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: Colors.white,
                                                          fontSize: 16.0,
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
                                                        BorderRadius.circular(
                                                            8.0),
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
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            if (FFAppState().modalAddContatoEmerg)
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: MediaQuery.of(context).size.height * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).overlay,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: MediaQuery.of(context).size.height * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).overlay,
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 16.0),
                        child: Container(
                          width: 450.0,
                          constraints: BoxConstraints(
                            maxWidth: 700.0,
                          ),
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Adicionar contato de emergência',
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 30.0,
                                            ),
                                            onPressed: () async {
                                              setState(() {
                                                FFAppState()
                                                        .modalAddContatoEmerg =
                                                    false;
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
                                      color: FlutterFlowTheme.of(context)
                                          .borderSubtle01,
                                    ),
                                  ),
                                  Container(
                                    constraints: BoxConstraints(
                                      maxHeight:
                                          MediaQuery.of(context).size.height *
                                              0.7,
                                    ),
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 16.0, 16.0, 16.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 16.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: TextFormField(
                                                      controller: _model
                                                          .inputNomeContatoController,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall,
                                                        hintText:
                                                            'Nome do contato',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall,
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .borderSubtle01,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .supportErrorInverse,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .supportErrorInverse,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .field01,
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    24.0,
                                                                    20.0,
                                                                    24.0),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                      validator: _model
                                                          .inputNomeContatoControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 16.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: FlutterFlowDropDown<
                                                        String>(
                                                      controller: _model
                                                              .dropDownParentescoValueController ??=
                                                          FormFieldController<
                                                              String>(null),
                                                      options: [
                                                        'Cônjuge',
                                                        'Pai',
                                                        'Mãe',
                                                        'Filho(a)',
                                                        'Enteado(a)',
                                                        'Irmão(ã)',
                                                        'Sogro(a)',
                                                        'Avô(ó)',
                                                        'Bisavô(ó)',
                                                        'Primo(a)',
                                                        'Tio(a)'
                                                      ],
                                                      onChanged: (val) =>
                                                          setState(() => _model
                                                                  .dropDownParentescoValue =
                                                              val),
                                                      width: 405.0,
                                                      height: 60.0,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                      hintText:
                                                          'Grau de parentesco',
                                                      fillColor:
                                                          Color(0xFFF4F4F4),
                                                      elevation: 0.0,
                                                      borderColor:
                                                          Color(0xFFE0E0E0),
                                                      borderWidth: 1.0,
                                                      borderRadius: 8.0,
                                                      margin:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  4.0,
                                                                  12.0,
                                                                  4.0),
                                                      hidesUnderline: true,
                                                      isSearchable: false,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 16.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: TextFormField(
                                                      controller: _model
                                                          .inputTelContatoController,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall,
                                                        hintText:
                                                            'Telefone do contato',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall,
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .borderSubtle01,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .supportErrorInverse,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .supportErrorInverse,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .field01,
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    24.0,
                                                                    20.0,
                                                                    24.0),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                      validator: _model
                                                          .inputTelContatoControllerValidator
                                                          .asValidator(context),
                                                      inputFormatters: [
                                                        _model
                                                            .inputTelContatoMask
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 0.0, 16.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      setState(() {
                                                        FFAppState()
                                                                .modalAddContatoEmerg =
                                                            false;
                                                      });
                                                    },
                                                    text: 'Cancelar',
                                                    options: FFButtonOptions(
                                                      width: 130.0,
                                                      height: 40.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .buttonDisabled0,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .buttonSecondary,
                                                                fontSize: 14.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                      elevation: 2.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      _model.apiResultkv8 =
                                                          await BackendHomologGroup
                                                              .listarContatoEmergCall
                                                              .call(
                                                        token:
                                                            FFAppState().token,
                                                      );
                                                      if ((_model.apiResultkv8
                                                              ?.succeeded ??
                                                          true)) {
                                                        if (functions.returnNumeroContatos((_model
                                                                    .apiResultkv8
                                                                    ?.jsonBody ??
                                                                '')) ==
                                                            0) {
                                                          setState(() {
                                                            FFAppState()
                                                                    .contatoEmerg2 =
                                                                true;
                                                          });
                                                          _model.apiResultrrg =
                                                              await BackendHomologGroup
                                                                  .inserirContatoEmergCall
                                                                  .call(
                                                            order: 0,
                                                            name: _model
                                                                .inputNomeContatoController
                                                                .text,
                                                            parentesco: _model
                                                                .dropDownParentescoValue,
                                                            phone: _model
                                                                .inputTelContatoController
                                                                .text,
                                                            token: FFAppState()
                                                                .token,
                                                          );
                                                          if ((_model
                                                                  .apiResultrrg
                                                                  ?.succeeded ??
                                                              true)) {
                                                            setState(() {
                                                              FFAppState()
                                                                      .modalAddContatoEmerg =
                                                                  false;
                                                            });
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'Contato cadastrado com sucesso.'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          }
                                                        } else {
                                                          _model.apiResultrrgx =
                                                              await BackendHomologGroup
                                                                  .inserirContatoEmergCall
                                                                  .call(
                                                            order: 1,
                                                            name: _model
                                                                .inputNomeContatoController
                                                                .text,
                                                            parentesco: _model
                                                                .dropDownParentescoValue,
                                                            phone: _model
                                                                .inputTelContatoController
                                                                .text,
                                                            token: FFAppState()
                                                                .token,
                                                          );
                                                          if ((_model
                                                                  .apiResultrrgx
                                                                  ?.jsonBody ??
                                                              '')) {
                                                            setState(() {
                                                              FFAppState()
                                                                      .modalAddContatoEmerg =
                                                                  false;
                                                            });
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'Contato cadastrado com sucesso.'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          }
                                                        }

                                                        _model.listarContatosEmergAdicionou =
                                                            await BackendHomologGroup
                                                                .listarContatoEmergCall
                                                                .call(
                                                          token: FFAppState()
                                                              .token,
                                                        );
                                                        if ((_model
                                                                .listarContatosEmergAdicionou
                                                                ?.succeeded ??
                                                            true)) {
                                                          setState(() {
                                                            FFAppState()
                                                                    .numContatosEmerg =
                                                                functions.returnNumeroContatos((_model
                                                                        .listarContatosEmergAdicionou
                                                                        ?.jsonBody ??
                                                                    ''))!;
                                                          });
                                                        }
                                                        setState(() {
                                                          _model
                                                              .inputNomeContatoController
                                                              ?.clear();
                                                          _model
                                                              .inputTelContatoController
                                                              ?.clear();
                                                        });
                                                      }

                                                      setState(() {});
                                                    },
                                                    text: 'Salvar',
                                                    options: FFButtonOptions(
                                                      width: 130.0,
                                                      height: 40.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                      elevation: 2.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
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
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
