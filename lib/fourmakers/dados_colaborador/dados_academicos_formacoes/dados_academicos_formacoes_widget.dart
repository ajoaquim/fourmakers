import '/backend/api_requests/api_calls.dart';
import '/components/listas/sem_formacoes/sem_formacoes_widget.dart';
import '/components/modals/modal_edita_escolaridade/modal_edita_escolaridade_widget.dart';
import '/components/modals/modal_new_formacao/modal_new_formacao_widget.dart';
import '/components/side_bar_nav/side_bar_nav_widget.dart';
import '/components/the_ultimate_nav_bar/the_ultimate_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'dados_academicos_formacoes_model.dart';
export 'dados_academicos_formacoes_model.dart';

class DadosAcademicosFormacoesWidget extends StatefulWidget {
  const DadosAcademicosFormacoesWidget({Key? key}) : super(key: key);

  @override
  _DadosAcademicosFormacoesWidgetState createState() =>
      _DadosAcademicosFormacoesWidgetState();
}

class _DadosAcademicosFormacoesWidgetState
    extends State<DadosAcademicosFormacoesWidget>
    with TickerProviderStateMixin {
  late DadosAcademicosFormacoesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'progressBarOnPageLoadAnimation': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        RotateEffect(
          curve: Curves.linear,
          delay: 0.ms,
          duration: 1000.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DadosAcademicosFormacoesModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 1000));
      _model.apiToken = await BackendHomologGroup.showMeCall.call(
        tokenx: FFAppState().token,
      );
      if ((_model.apiToken?.succeeded ?? true)) {
        _model.apiListaFormacaoColab =
            await BackendHomologGroup.listarEscolaridadeColaboradorCall.call(
          token: FFAppState().token,
          cpfColaborador: FFAppState().MyCpf,
        );
        if ((_model.apiListaFormacaoColab?.succeeded ?? true)) {
          setState(() {
            FFAppState().myFormacao =
                (_model.apiListaFormacaoColab?.jsonBody ?? '');
          });
        } else {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                content: Text('Erro ao listar formações.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              );
            },
          );
        }
      } else {
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

        context.pushNamed('loginSlide1');
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
            Row(
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
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                      fourIcon: Icon(
                        Icons.card_travel_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                      oneText: FlutterFlowTheme.of(context).secondaryText,
                      twoText: FlutterFlowTheme.of(context).secondaryText,
                      threeText: FlutterFlowTheme.of(context).secondaryText,
                      fourText: FlutterFlowTheme.of(context).secondaryText,
                      threeBG: FlutterFlowTheme.of(context).secondaryBackground,
                      fourBG: FlutterFlowTheme.of(context).secondaryBackground,
                      fiveIcon: Icon(
                        Icons.school_outlined,
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                      ),
                      fiveText: FlutterFlowTheme.of(context).primaryBtnText,
                      fiveBG: FlutterFlowTheme.of(context).interactive,
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
                        Container(
                          width: double.infinity,
                          constraints: BoxConstraints(
                            maxWidth: FFAppState().colunaMain,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 64.0, 24.0, 64.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 24.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          'Dados acadêmicos',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 24.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          FFAppState().update(() {
                                            FFAppState().DadosAcaCertif = false;
                                            FFAppState().DadosAcaForma = false;
                                          });
                                          FFAppState().update(() {
                                            FFAppState().DadosAcaForma = true;
                                          });
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 0.0,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .borderInteractive,
                                                  offset: Offset(0.0, 1.0),
                                                )
                                              ],
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 12.0, 20.0, 12.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                12.0, 0.0),
                                                    child: Icon(
                                                      Icons.school_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Formações',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
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
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 24.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            3.0, 0.0, 0.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            setState(() {
                                              FFAppState()
                                                      .atualizaNivelFormacao =
                                                  false;
                                            });
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
                                                      ModalNewFormacaoWidget(),
                                                );
                                              },
                                            ).then((value) => setState(() {}));
                                          },
                                          text: 'Adicionar formação',
                                          options: FFButtonOptions(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 20.0, 20.0, 20.0),
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .background,
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
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (valueOrDefault<bool>(
                                      FFAppState().myFormacao == null,
                                      true,
                                    ))
                                      Container(
                                        height: 150.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 4.0, 4.0, 4.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CircularPercentIndicator(
                                                percent: 0.7,
                                                radius: 12.5,
                                                lineWidth: 5.0,
                                                animation: false,
                                                progressColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ).animateOnPageLoad(animationsMap[
                                                  'progressBarOnPageLoadAnimation']!),
                                            ],
                                          ),
                                        ),
                                      ),
                                    if (FFAppState().myFormacao != null)
                                      Builder(
                                        builder: (context) {
                                          final minhasformacoes = getJsonField(
                                            FFAppState().myFormacao,
                                            r'''$.escolaridade''',
                                          ).toList();
                                          if (minhasformacoes.isEmpty) {
                                            return SemFormacoesWidget();
                                          }
                                          return SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: List.generate(
                                                  minhasformacoes.length,
                                                  (minhasformacoesIndex) {
                                                final minhasformacoesItem =
                                                    minhasformacoes[
                                                        minhasformacoesIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 16.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    constraints: BoxConstraints(
                                                      maxWidth: 750.0,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                      child: FutureBuilder<
                                                          ApiCallResponse>(
                                                        future: BackendHomologGroup
                                                            .listaFormacaoIDCall
                                                            .call(
                                                          id: getJsonField(
                                                            minhasformacoesItem,
                                                            r'''$.formacaoId''',
                                                          ),
                                                          token: FFAppState()
                                                              .token,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          final columnListaFormacaoIDResponse =
                                                              snapshot.data!;
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
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
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        getJsonField(
                                                                          columnListaFormacaoIDResponse
                                                                              .jsonBody,
                                                                          r'''$.formacao.descricao''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleMedium,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
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
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          2.0),
                                                                      child:
                                                                          Text(
                                                                        getJsonField(
                                                                          minhasformacoesItem,
                                                                          r'''$.descricao''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleSmall,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
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
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          2.0),
                                                                      child:
                                                                          Text(
                                                                        getJsonField(
                                                                          minhasformacoesItem,
                                                                          r'''$.instituicao''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleSmall,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
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
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          2.0),
                                                                      child:
                                                                          Text(
                                                                        'Data de início: ',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleSmall,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          2.0),
                                                                      child:
                                                                          Text(
                                                                        functions
                                                                            .addDateMask(getJsonField(
                                                                          minhasformacoesItem,
                                                                          r'''$.dataInicio''',
                                                                        ).toString()),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleSmall,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
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
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          2.0),
                                                                      child:
                                                                          Text(
                                                                        'Data de conclusão: ',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleSmall,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          2.0),
                                                                      child:
                                                                          Text(
                                                                        functions
                                                                            .addDateMask(getJsonField(
                                                                          minhasformacoesItem,
                                                                          r'''$.dataTermino''',
                                                                        ).toString()),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleSmall,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
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
                                                                            FFAppState().update(() {
                                                                              FFAppState().atualizaNivelFormacao = true;
                                                                              FFAppState().idformacao = getJsonField(
                                                                                minhasformacoesItem,
                                                                                r'''$.formacaoId''',
                                                                              );
                                                                              FFAppState().nomeformacao = getJsonField(
                                                                                columnListaFormacaoIDResponse.jsonBody,
                                                                                r'''$.formacao.descricao''',
                                                                              ).toString();
                                                                              FFAppState().escolaridadeArea = getJsonField(
                                                                                columnListaFormacaoIDResponse.jsonBody,
                                                                                r'''$.formacao.descricao''',
                                                                              ).toString();
                                                                              FFAppState().escolaridadeNivel = getJsonField(
                                                                                minhasformacoesItem,
                                                                                r'''$.descricao''',
                                                                              ).toString();
                                                                              FFAppState().escolaridadeInicio = getJsonField(
                                                                                minhasformacoesItem,
                                                                                r'''$.dataInicio''',
                                                                              ).toString();
                                                                              FFAppState().escolaridadeConclusao = getJsonField(
                                                                                minhasformacoesItem,
                                                                                r'''$.dataTermino''',
                                                                              ).toString();
                                                                              FFAppState().instituicaoEscolaridade = getJsonField(
                                                                                minhasformacoesItem,
                                                                                r'''$.instituicao''',
                                                                              ).toString();
                                                                              FFAppState().escolaridadeId = getJsonField(
                                                                                minhasformacoesItem,
                                                                                r'''$.id''',
                                                                              );
                                                                            });
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              barrierColor: Color(0x00000000),
                                                                              enableDrag: false,
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return Padding(
                                                                                  padding: MediaQuery.of(context).viewInsets,
                                                                                  child: ModalEditaEscolaridadeWidget(
                                                                                    instituicaoEscolaridade: FFAppState().instituicaoEscolaridade,
                                                                                    areaEscolaridade: FFAppState().escolaridadeArea,
                                                                                    inicioEscolaridade: FFAppState().escolaridadeInicio,
                                                                                    fimEscolaridade: FFAppState().escolaridadeConclusao,
                                                                                    idEscolaridade: FFAppState().escolaridadeId,
                                                                                    nivelEscolaridade: FFAppState().escolaridadeNivel,
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                setState(() {}));
                                                                          },
                                                                          child:
                                                                              FaIcon(
                                                                            FontAwesomeIcons.solidEdit,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).layerSelectedDisabled,
                                                                            size:
                                                                                22.0,
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
                                                                          setState(
                                                                              () {
                                                                            FFAppState().modalExcluirFormacao =
                                                                                true;
                                                                            FFAppState().escolaridadeId =
                                                                                getJsonField(
                                                                              minhasformacoesItem,
                                                                              r'''$.id''',
                                                                            );
                                                                          });
                                                                        },
                                                                        child:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .trashAlt,
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
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                            ),
                                          );
                                        },
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
            if (FFAppState().modalExcluirFormacao)
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
                                            'Excluir formação',
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
                                                  .modalExcluirFormacao = false;
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
                                                              .modalExcluirFormacao =
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
                                                            .removerEscolaridadeColaboradorCall
                                                            .call(
                                                      token: FFAppState().token,
                                                      cpf: FFAppState().MyCpf,
                                                      id: FFAppState()
                                                          .escolaridadeId,
                                                    );
                                                    if ((_model.apiResult300
                                                            ?.succeeded ??
                                                        true)) {
                                                      _model.apiAtualizaEscolaridade =
                                                          await BackendHomologGroup
                                                              .listarEscolaridadeColaboradorCall
                                                              .call(
                                                        token:
                                                            FFAppState().token,
                                                        cpfColaborador:
                                                            FFAppState().MyCpf,
                                                      );
                                                      if ((_model
                                                              .apiAtualizaEscolaridade
                                                              ?.succeeded ??
                                                          true)) {
                                                        FFAppState().update(() {
                                                          FFAppState()
                                                                  .modalExcluirFormacao =
                                                              false;
                                                          FFAppState()
                                                              .myFormacao = (_model
                                                                  .apiAtualizaEscolaridade
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
                                                                'Formação excluida com sucesso!'),
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
          ],
        ),
      ),
    );
  }
}
