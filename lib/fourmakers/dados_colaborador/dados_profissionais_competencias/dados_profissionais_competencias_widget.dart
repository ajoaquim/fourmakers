import '/backend/api_requests/api_calls.dart';
import '/components/listas/sem_certificados/sem_certificados_widget.dart';
import '/components/listas/sem_dominios/sem_dominios_widget.dart';
import '/components/listas/sem_hard_skills/sem_hard_skills_widget.dart';
import '/components/listas/sem_metodologias/sem_metodologias_widget.dart';
import '/components/modal_new_nivel_hard_skills/modal_new_nivel_hard_skills_widget.dart';
import '/components/modals/modal_new_dominio/modal_new_dominio_widget.dart';
import '/components/modals/modal_new_hard_skills/modal_new_hard_skills_widget.dart';
import '/components/modals/modal_new_idioma/modal_new_idioma_widget.dart';
import '/components/modals/modal_new_metodologia/modal_new_metodologia_widget.dart';
import '/components/modals/modal_new_nivel_dominio/modal_new_nivel_dominio_widget.dart';
import '/components/modals/modal_new_nivel_idioma/modal_new_nivel_idioma_widget.dart';
import '/components/modals/modal_new_nivel_metodologia/modal_new_nivel_metodologia_widget.dart';
import '/components/modals/modal_new_nivel_soft_skill/modal_new_nivel_soft_skill_widget.dart';
import '/components/modals/modal_new_soft_skills/modal_new_soft_skills_widget.dart';
import '/components/sem_idiomas/sem_idiomas_widget.dart';
import '/components/side_bar_nav/side_bar_nav_widget.dart';
import '/components/the_ultimate_nav_bar/the_ultimate_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'dados_profissionais_competencias_model.dart';
export 'dados_profissionais_competencias_model.dart';

class DadosProfissionaisCompetenciasWidget extends StatefulWidget {
  const DadosProfissionaisCompetenciasWidget({Key? key}) : super(key: key);

  @override
  _DadosProfissionaisCompetenciasWidgetState createState() =>
      _DadosProfissionaisCompetenciasWidgetState();
}

class _DadosProfissionaisCompetenciasWidgetState
    extends State<DadosProfissionaisCompetenciasWidget>
    with TickerProviderStateMixin {
  late DadosProfissionaisCompetenciasModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'progressBarOnPageLoadAnimation1': AnimationInfo(
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
    'progressBarOnPageLoadAnimation2': AnimationInfo(
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
    'progressBarOnPageLoadAnimation3': AnimationInfo(
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
    'progressBarOnPageLoadAnimation4': AnimationInfo(
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
    'progressBarOnPageLoadAnimation5': AnimationInfo(
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
    _model = createModel(context, () => DadosProfissionaisCompetenciasModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 1000));
      _model.apiToken = await BackendHomologGroup.showMeCall.call(
        tokenx: FFAppState().token,
      );
      if ((_model.apiToken?.succeeded ?? true)) {
        _model.listaHardSkill =
            await BackendHomologGroup.listaHardSkillsColabCall.call(
          cpfColaborador: FFAppState().MyCpf,
          token: FFAppState().token,
        );
        if ((_model.listaHardSkill?.succeeded ?? true)) {
          FFAppState().update(() {
            FFAppState().HardSkills = (_model.listaHardSkill?.jsonBody ?? '');
          });
        }
        _model.listaSoftSkill =
            await BackendHomologGroup.listaSoftskillsColaboradorCall.call(
          cpfColaborador: FFAppState().MyCpf,
          token: FFAppState().token,
        );
        if ((_model.listaSoftSkill?.succeeded ?? true)) {
          FFAppState().update(() {
            FFAppState().SoftSkills = (_model.listaSoftSkill?.jsonBody ?? '');
          });
        }
        _model.listaMetodologias =
            await BackendHomologGroup.listarMetodologiasColaboradorCall.call(
          cpfColaborador: FFAppState().MyCpf,
          token: FFAppState().token,
        );
        if ((_model.listaMetodologias?.succeeded ?? true)) {
          setState(() {
            FFAppState().metodologias =
                (_model.listaMetodologias?.jsonBody ?? '');
          });
        }
        _model.listaDominios =
            await BackendHomologGroup.listarDominioColaboradorCall.call(
          cpfColaborador: FFAppState().MyCpf,
          token: FFAppState().token,
        );
        if ((_model.listaDominios?.succeeded ?? true)) {
          setState(() {
            FFAppState().dominios = (_model.listaDominios?.jsonBody ?? '');
          });
        }
        _model.listarIdiomas =
            await BackendHomologGroup.listarIdiomasColaboradorCall.call(
          token: FFAppState().token,
          cpfColaborador: FFAppState().MyCpf,
        );
        if ((_model.listarIdiomas?.succeeded ?? true)) {
          setState(() {
            FFAppState().idiomas = (_model.listarIdiomas?.jsonBody ?? '');
          });
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
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
                            oneBG: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            oneIcon: Icon(
                              Icons.home_outlined,
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                            twoBG: FlutterFlowTheme.of(context)
                                .secondaryBackground,
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
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                            ),
                            oneText: FlutterFlowTheme.of(context).secondaryText,
                            twoText: FlutterFlowTheme.of(context).secondaryText,
                            threeText:
                                FlutterFlowTheme.of(context).secondaryText,
                            fourText:
                                FlutterFlowTheme.of(context).primaryBtnText,
                            threeBG: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            fourBG: FlutterFlowTheme.of(context).interactive,
                            fiveIcon: Icon(
                              Icons.school_outlined,
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                            fiveText:
                                FlutterFlowTheme.of(context).secondaryText,
                            fiveBG: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            sixIcon: Icon(
                              Icons.tag_faces,
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                            sixText: FlutterFlowTheme.of(context).secondaryText,
                            sixBG: FlutterFlowTheme.of(context)
                                .secondaryBackground,
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
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                'Dados profissionais',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 32.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 24.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 0.0,
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .borderInteractive,
                                                                  offset:
                                                                      Offset(
                                                                          0.0,
                                                                          1.0),
                                                                )
                                                              ],
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
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
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                    child:
                                                                        FaIcon(
                                                                      FontAwesomeIcons
                                                                          .code,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    'Competências',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ],
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
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.goNamed(
                                                              'DadosProfissionais_Certificados',
                                                              extra: <String,
                                                                  dynamic>{
                                                                kTransitionInfoKey:
                                                                    TransitionInfo(
                                                                  hasTransition:
                                                                      true,
                                                                  transitionType:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          300),
                                                                ),
                                                              },
                                                            );
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
                                                                    offset:
                                                                        Offset(
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
                                                                          FaIcon(
                                                                        FontAwesomeIcons
                                                                            .award,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      'Certificados',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.goNamed(
                                                              'DadosProfissionais_Experiencias',
                                                              extra: <String,
                                                                  dynamic>{
                                                                kTransitionInfoKey:
                                                                    TransitionInfo(
                                                                  hasTransition:
                                                                      true,
                                                                  transitionType:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          300),
                                                                ),
                                                              },
                                                            );
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
                                                                    offset:
                                                                        Offset(
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
                                                                            .card_travel,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      'Experiências',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.goNamed(
                                                              'DadosProfissionais_Curriculo',
                                                              extra: <String,
                                                                  dynamic>{
                                                                kTransitionInfoKey:
                                                                    TransitionInfo(
                                                                  hasTransition:
                                                                      true,
                                                                  transitionType:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          300),
                                                                ),
                                                              },
                                                            );
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
                                                                    offset:
                                                                        Offset(
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
                                                                            .file_copy_outlined,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      'Currículo',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 24.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Column(
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
                                                                'Hard Skills',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall,
                                                              ),
                                                            ),
                                                            FFButtonWidget(
                                                              onPressed:
                                                                  () async {
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
                                                                    return GestureDetector(
                                                                      onTap: () => FocusScope.of(
                                                                              context)
                                                                          .requestFocus(
                                                                              _model.unfocusNode),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            MediaQuery.of(context).viewInsets,
                                                                        child:
                                                                            ModalNewHardSkillsWidget(
                                                                          hardskills:
                                                                              FFAppState().HardSkills,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    setState(
                                                                        () {}));
                                                              },
                                                              text:
                                                                  'Adicionar hard skill',
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 200.0,
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: Colors
                                                                          .white,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleSmallFamily),
                                                                    ),
                                                                elevation: 2.0,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .borderSubtle01,
                                                                ),
                                                              ),
                                                              child:
                                                                  SingleChildScrollView(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    if (FFAppState()
                                                                            .HardSkills !=
                                                                        null)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            8.0,
                                                                            8.0),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final myHardSkills2 =
                                                                                getJsonField(
                                                                              FFAppState().HardSkills,
                                                                              r'''$.competencias''',
                                                                            ).toList();
                                                                            if (myHardSkills2.isEmpty) {
                                                                              return SemHardSkillsWidget();
                                                                            }
                                                                            return Wrap(
                                                                              spacing: 8.0,
                                                                              runSpacing: 8.0,
                                                                              alignment: WrapAlignment.start,
                                                                              crossAxisAlignment: WrapCrossAlignment.start,
                                                                              direction: Axis.horizontal,
                                                                              runAlignment: WrapAlignment.start,
                                                                              verticalDirection: VerticalDirection.down,
                                                                              clipBehavior: Clip.none,
                                                                              children: List.generate(myHardSkills2.length, (myHardSkills2Index) {
                                                                                final myHardSkills2Item = myHardSkills2[myHardSkills2Index];
                                                                                return Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                                                  child: Material(
                                                                                    color: Colors.transparent,
                                                                                    elevation: 0.0,
                                                                                    shape: RoundedRectangleBorder(
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    child: Container(
                                                                                      height: 40.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        border: Border.all(
                                                                                          color: FlutterFlowTheme.of(context).supportInfo,
                                                                                        ),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              child: Container(
                                                                                                constraints: BoxConstraints(
                                                                                                  maxHeight: 30.0,
                                                                                                ),
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).highlight,
                                                                                                  borderRadius: BorderRadius.circular(4.0),
                                                                                                ),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Align(
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(6.0, 6.0, 6.0, 6.0),
                                                                                                        child: Text(
                                                                                                          getJsonField(
                                                                                                            myHardSkills2Item,
                                                                                                            r'''$.competencia..descricao''',
                                                                                                          ).toString(),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                color: FlutterFlowTheme.of(context).supportInfo,
                                                                                                                fontSize: 12.0,
                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Align(
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(2.0, 6.0, 6.0, 6.0),
                                                                                                        child: InkWell(
                                                                                                          splashColor: Colors.transparent,
                                                                                                          focusColor: Colors.transparent,
                                                                                                          hoverColor: Colors.transparent,
                                                                                                          highlightColor: Colors.transparent,
                                                                                                          onTap: () async {
                                                                                                            _model.apiResultqre = await BackendHomologGroup.removeHardSkillsColabCall.call(
                                                                                                              token: FFAppState().token,
                                                                                                              id: getJsonField(
                                                                                                                myHardSkills2Item,
                                                                                                                r'''$.competencia.id''',
                                                                                                              ),
                                                                                                            );
                                                                                                            if ((_model.apiResultqre?.succeeded ?? true)) {
                                                                                                              await showDialog(
                                                                                                                context: context,
                                                                                                                builder: (alertDialogContext) {
                                                                                                                  return AlertDialog(
                                                                                                                    content: Text('Hard skill removida com sucesso!'),
                                                                                                                    actions: [
                                                                                                                      TextButton(
                                                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                                        child: Text('Ok'),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  );
                                                                                                                },
                                                                                                              );
                                                                                                            } else {
                                                                                                              await showDialog(
                                                                                                                context: context,
                                                                                                                builder: (alertDialogContext) {
                                                                                                                  return AlertDialog(
                                                                                                                    content: Text('Erro ao remover. Por favor, contacte o administrador do sistema.'),
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

                                                                                                            _model.removeuHardSkill = await BackendHomologGroup.listaHardSkillsColabCall.call(
                                                                                                              cpfColaborador: FFAppState().MyCpf,
                                                                                                              token: FFAppState().token,
                                                                                                            );
                                                                                                            if ((_model.removeuHardSkill?.succeeded ?? true)) {
                                                                                                              FFAppState().update(() {
                                                                                                                FFAppState().HardSkills = (_model.removeuHardSkill?.jsonBody ?? '');
                                                                                                              });
                                                                                                            }

                                                                                                            setState(() {});
                                                                                                          },
                                                                                                          child: Icon(
                                                                                                            Icons.close_rounded,
                                                                                                            color: FlutterFlowTheme.of(context).supportInfo,
                                                                                                            size: 16.0,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            FFButtonWidget(
                                                                                              onPressed: () async {
                                                                                                FFAppState().update(() {
                                                                                                  FFAppState().idcompetencias = getJsonField(
                                                                                                    myHardSkills2Item,
                                                                                                    r'''$.competencia.id''',
                                                                                                  );
                                                                                                  FFAppState().idnivelcompetencia = getJsonField(
                                                                                                    myHardSkills2Item,
                                                                                                    r'''$.nivel.id''',
                                                                                                  );
                                                                                                  FFAppState().atualizaNivelHardSkill = true;
                                                                                                  FFAppState().nomecompetencia = getJsonField(
                                                                                                    myHardSkills2Item,
                                                                                                    r'''$.competencia.descricao''',
                                                                                                  ).toString();
                                                                                                });
                                                                                                await showModalBottomSheet(
                                                                                                  isScrollControlled: true,
                                                                                                  backgroundColor: Colors.transparent,
                                                                                                  barrierColor: Color(0x00000000),
                                                                                                  enableDrag: false,
                                                                                                  context: context,
                                                                                                  builder: (context) {
                                                                                                    return GestureDetector(
                                                                                                      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
                                                                                                      child: Padding(
                                                                                                        padding: MediaQuery.of(context).viewInsets,
                                                                                                        child: ModalNewNivelHardSkillsWidget(),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ).then((value) => setState(() {}));
                                                                                              },
                                                                                              text: getJsonField(
                                                                                                myHardSkills2Item,
                                                                                                r'''$.nivel..descricao''',
                                                                                              ).toString(),
                                                                                              options: FFButtonOptions(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(14.0, 14.0, 14.0, 14.0),
                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                      color: FlutterFlowTheme.of(context).supportInfo,
                                                                                                      fontSize: 12.0,
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                                    ),
                                                                                                elevation: 0.0,
                                                                                                borderSide: BorderSide(
                                                                                                  color: Colors.transparent,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                    if (valueOrDefault<
                                                                        bool>(
                                                                      FFAppState()
                                                                              .HardSkills ==
                                                                          null,
                                                                      true,
                                                                    ))
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            24.0,
                                                                            24.0,
                                                                            24.0,
                                                                            24.0),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                4.0,
                                                                                4.0,
                                                                                4.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                CircularPercentIndicator(
                                                                                  percent: 0.7,
                                                                                  radius: 12.5,
                                                                                  lineWidth: 5.0,
                                                                                  animation: false,
                                                                                  progressColor: FlutterFlowTheme.of(context).primary,
                                                                                  backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ).animateOnPageLoad(animationsMap['progressBarOnPageLoadAnimation1']!),
                                                                              ],
                                                                            ),
                                                                          ),
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
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 24.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Column(
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
                                                                'Soft Skills',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall,
                                                              ),
                                                            ),
                                                            FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .atualizaNivelSoftskill =
                                                                      false;
                                                                });
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
                                                                    return GestureDetector(
                                                                      onTap: () => FocusScope.of(
                                                                              context)
                                                                          .requestFocus(
                                                                              _model.unfocusNode),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            MediaQuery.of(context).viewInsets,
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              double.infinity,
                                                                          child:
                                                                              ModalNewSoftSkillsWidget(),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    setState(
                                                                        () {}));
                                                              },
                                                              text:
                                                                  'Adicionar soft skill',
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 200.0,
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: Colors
                                                                          .white,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleSmallFamily),
                                                                    ),
                                                                elevation: 2.0,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .borderSubtle01,
                                                                ),
                                                              ),
                                                              child:
                                                                  SingleChildScrollView(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    if (FFAppState()
                                                                            .SoftSkills !=
                                                                        null)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            8.0,
                                                                            8.0),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final mySoftSkills =
                                                                                getJsonField(
                                                                              FFAppState().SoftSkills,
                                                                              r'''$.softskills''',
                                                                            ).toList();
                                                                            if (mySoftSkills.isEmpty) {
                                                                              return SemCertificadosWidget();
                                                                            }
                                                                            return Wrap(
                                                                              spacing: 8.0,
                                                                              runSpacing: 8.0,
                                                                              alignment: WrapAlignment.start,
                                                                              crossAxisAlignment: WrapCrossAlignment.start,
                                                                              direction: Axis.horizontal,
                                                                              runAlignment: WrapAlignment.start,
                                                                              verticalDirection: VerticalDirection.down,
                                                                              clipBehavior: Clip.none,
                                                                              children: List.generate(mySoftSkills.length, (mySoftSkillsIndex) {
                                                                                final mySoftSkillsItem = mySoftSkills[mySoftSkillsIndex];
                                                                                return Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                                                  child: Material(
                                                                                    color: Colors.transparent,
                                                                                    elevation: 0.0,
                                                                                    shape: RoundedRectangleBorder(
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    child: Container(
                                                                                      height: 40.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        border: Border.all(
                                                                                          color: FlutterFlowTheme.of(context).supportInfo,
                                                                                        ),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              child: Container(
                                                                                                constraints: BoxConstraints(
                                                                                                  maxHeight: 30.0,
                                                                                                ),
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).highlight,
                                                                                                  borderRadius: BorderRadius.circular(4.0),
                                                                                                ),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Align(
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(6.0, 6.0, 6.0, 6.0),
                                                                                                        child: Text(
                                                                                                          getJsonField(
                                                                                                            mySoftSkillsItem,
                                                                                                            r'''$.softskill..descricao''',
                                                                                                          ).toString(),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                color: FlutterFlowTheme.of(context).supportInfo,
                                                                                                                fontSize: 12.0,
                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Align(
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(2.0, 6.0, 6.0, 6.0),
                                                                                                        child: InkWell(
                                                                                                          splashColor: Colors.transparent,
                                                                                                          focusColor: Colors.transparent,
                                                                                                          hoverColor: Colors.transparent,
                                                                                                          highlightColor: Colors.transparent,
                                                                                                          onTap: () async {
                                                                                                            _model.apiResultbhn = await BackendHomologGroup.removeSoftSkillColabCall.call(
                                                                                                              token: FFAppState().token,
                                                                                                              cpf: FFAppState().MyCpf,
                                                                                                              id: getJsonField(
                                                                                                                mySoftSkillsItem,
                                                                                                                r'''$.softskill.id''',
                                                                                                              ),
                                                                                                            );
                                                                                                            if ((_model.apiResultbhn?.succeeded ?? true)) {
                                                                                                              await showDialog(
                                                                                                                context: context,
                                                                                                                builder: (alertDialogContext) {
                                                                                                                  return AlertDialog(
                                                                                                                    content: Text('Removido com sucesso!'),
                                                                                                                    actions: [
                                                                                                                      TextButton(
                                                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                                        child: Text('Ok'),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  );
                                                                                                                },
                                                                                                              );
                                                                                                            } else {
                                                                                                              await showDialog(
                                                                                                                context: context,
                                                                                                                builder: (alertDialogContext) {
                                                                                                                  return AlertDialog(
                                                                                                                    content: Text('Erro ao remover soft skill'),
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

                                                                                                            _model.excluiuSoftSkills = await BackendHomologGroup.listaSoftskillsColaboradorCall.call(
                                                                                                              cpfColaborador: FFAppState().MyCpf,
                                                                                                              token: FFAppState().token,
                                                                                                            );
                                                                                                            if ((_model.excluiuSoftSkills?.succeeded ?? true)) {
                                                                                                              FFAppState().update(() {
                                                                                                                FFAppState().SoftSkills = (_model.excluiuSoftSkills?.jsonBody ?? '');
                                                                                                              });
                                                                                                            }

                                                                                                            setState(() {});
                                                                                                          },
                                                                                                          child: Icon(
                                                                                                            Icons.close_rounded,
                                                                                                            color: FlutterFlowTheme.of(context).supportInfo,
                                                                                                            size: 16.0,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            FFButtonWidget(
                                                                                              onPressed: () async {
                                                                                                FFAppState().update(() {
                                                                                                  FFAppState().idsoftskill = getJsonField(
                                                                                                    mySoftSkillsItem,
                                                                                                    r'''$.softskill.id''',
                                                                                                  );
                                                                                                  FFAppState().nomesoftskill = getJsonField(
                                                                                                    mySoftSkillsItem,
                                                                                                    r'''$.softskill.descricao''',
                                                                                                  ).toString();
                                                                                                  FFAppState().atualizaNivelSoftskill = true;
                                                                                                  FFAppState().idnivelsoftskill = getJsonField(
                                                                                                    mySoftSkillsItem,
                                                                                                    r'''$.nivel.id''',
                                                                                                  );
                                                                                                });
                                                                                                await showModalBottomSheet(
                                                                                                  isScrollControlled: true,
                                                                                                  backgroundColor: Colors.transparent,
                                                                                                  barrierColor: Color(0x00000000),
                                                                                                  enableDrag: false,
                                                                                                  context: context,
                                                                                                  builder: (context) {
                                                                                                    return GestureDetector(
                                                                                                      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
                                                                                                      child: Padding(
                                                                                                        padding: MediaQuery.of(context).viewInsets,
                                                                                                        child: ModalNewNivelSoftSkillWidget(),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ).then((value) => setState(() {}));
                                                                                              },
                                                                                              text: getJsonField(
                                                                                                mySoftSkillsItem,
                                                                                                r'''$.nivel..descricao''',
                                                                                              ).toString(),
                                                                                              options: FFButtonOptions(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(14.0, 14.0, 14.0, 14.0),
                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                      color: FlutterFlowTheme.of(context).supportInfo,
                                                                                                      fontSize: 12.0,
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                                    ),
                                                                                                elevation: 0.0,
                                                                                                borderSide: BorderSide(
                                                                                                  color: Colors.transparent,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                    if (valueOrDefault<
                                                                        bool>(
                                                                      FFAppState()
                                                                              .SoftSkills ==
                                                                          null,
                                                                      true,
                                                                    ))
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            24.0,
                                                                            24.0,
                                                                            24.0,
                                                                            24.0),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                4.0,
                                                                                4.0,
                                                                                4.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                CircularPercentIndicator(
                                                                                  percent: 0.7,
                                                                                  radius: 12.5,
                                                                                  lineWidth: 5.0,
                                                                                  animation: false,
                                                                                  progressColor: FlutterFlowTheme.of(context).primary,
                                                                                  backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ).animateOnPageLoad(animationsMap['progressBarOnPageLoadAnimation2']!),
                                                                              ],
                                                                            ),
                                                                          ),
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
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 24.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 24.0),
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
                                                            'Metodologias',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall,
                                                          ),
                                                        ),
                                                        FFButtonWidget(
                                                          onPressed: () async {
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState()
                                                                      .atualizaNivelMetodologia =
                                                                  false;
                                                            });
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              barrierColor: Color(
                                                                  0x00000000),
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return GestureDetector(
                                                                  onTap: () => FocusScope.of(
                                                                          context)
                                                                      .requestFocus(
                                                                          _model
                                                                              .unfocusNode),
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery.of(
                                                                            context)
                                                                        .viewInsets,
                                                                    child:
                                                                        Container(
                                                                      height: double
                                                                          .infinity,
                                                                      child:
                                                                          ModalNewMetodologiaWidget(),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));
                                                          },
                                                          text:
                                                              'Adicionar metodologia',
                                                          options:
                                                              FFButtonOptions(
                                                            width: 200.0,
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: Colors
                                                                          .white,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleSmallFamily),
                                                                    ),
                                                            elevation: 2.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .borderSubtle01,
                                                            ),
                                                          ),
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                if (FFAppState()
                                                                        .metodologias !=
                                                                    null)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            8.0,
                                                                            8.0),
                                                                    child:
                                                                        Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final listaDeMetodologias =
                                                                            getJsonField(
                                                                          FFAppState()
                                                                              .metodologias,
                                                                          r'''$.metodologias''',
                                                                        ).toList();
                                                                        if (listaDeMetodologias
                                                                            .isEmpty) {
                                                                          return SemMetodologiasWidget();
                                                                        }
                                                                        return Wrap(
                                                                          spacing:
                                                                              8.0,
                                                                          runSpacing:
                                                                              8.0,
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
                                                                          children: List.generate(
                                                                              listaDeMetodologias.length,
                                                                              (listaDeMetodologiasIndex) {
                                                                            final listaDeMetodologiasItem =
                                                                                listaDeMetodologias[listaDeMetodologiasIndex];
                                                                            return Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                                              child: Material(
                                                                                color: Colors.transparent,
                                                                                elevation: 0.0,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                child: Container(
                                                                                  height: 40.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).supportInfo,
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                          child: Container(
                                                                                            constraints: BoxConstraints(
                                                                                              maxHeight: 30.0,
                                                                                            ),
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).highlight,
                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                            ),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Align(
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(6.0, 6.0, 6.0, 6.0),
                                                                                                    child: Text(
                                                                                                      getJsonField(
                                                                                                        listaDeMetodologiasItem,
                                                                                                        r'''$.metodologia..descricao''',
                                                                                                      ).toString(),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                            color: FlutterFlowTheme.of(context).supportInfo,
                                                                                                            fontSize: 12.0,
                                                                                                            fontWeight: FontWeight.bold,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Align(
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(2.0, 6.0, 6.0, 6.0),
                                                                                                    child: InkWell(
                                                                                                      splashColor: Colors.transparent,
                                                                                                      focusColor: Colors.transparent,
                                                                                                      hoverColor: Colors.transparent,
                                                                                                      highlightColor: Colors.transparent,
                                                                                                      onTap: () async {
                                                                                                        _model.excluiMetodologia = await BackendHomologGroup.removeMetodologiaColabCall.call(
                                                                                                          token: FFAppState().token,
                                                                                                          id: getJsonField(
                                                                                                            listaDeMetodologiasItem,
                                                                                                            r'''$.metodologia.id''',
                                                                                                          ),
                                                                                                        );
                                                                                                        if ((_model.excluiMetodologia?.succeeded ?? true)) {
                                                                                                          await showDialog(
                                                                                                            context: context,
                                                                                                            builder: (alertDialogContext) {
                                                                                                              return AlertDialog(
                                                                                                                content: Text('Metodologia removida com sucesso!'),
                                                                                                                actions: [
                                                                                                                  TextButton(
                                                                                                                    onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                                    child: Text('Ok'),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              );
                                                                                                            },
                                                                                                          );
                                                                                                        } else {
                                                                                                          await showDialog(
                                                                                                            context: context,
                                                                                                            builder: (alertDialogContext) {
                                                                                                              return AlertDialog(
                                                                                                                content: Text('Erro ao remover. Por favor, contacte o administrador do sistema.'),
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

                                                                                                        _model.atualizaMetodologias = await BackendHomologGroup.listarMetodologiasColaboradorCall.call(
                                                                                                          cpfColaborador: FFAppState().MyCpf,
                                                                                                          token: FFAppState().token,
                                                                                                        );
                                                                                                        if ((_model.atualizaMetodologias?.succeeded ?? true)) {
                                                                                                          setState(() {
                                                                                                            FFAppState().metodologias = (_model.atualizaMetodologias?.jsonBody ?? '');
                                                                                                          });
                                                                                                        }

                                                                                                        setState(() {});
                                                                                                      },
                                                                                                      child: Icon(
                                                                                                        Icons.close_rounded,
                                                                                                        color: FlutterFlowTheme.of(context).supportInfo,
                                                                                                        size: 16.0,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        FFButtonWidget(
                                                                                          onPressed: () async {
                                                                                            FFAppState().update(() {
                                                                                              FFAppState().idMetodologia = getJsonField(
                                                                                                listaDeMetodologiasItem,
                                                                                                r'''$.metodologia.id''',
                                                                                              );
                                                                                              FFAppState().nomeMetodologia = getJsonField(
                                                                                                listaDeMetodologiasItem,
                                                                                                r'''$.metodologia.descricao''',
                                                                                              ).toString();
                                                                                              FFAppState().idNivelMetodologia = getJsonField(
                                                                                                listaDeMetodologiasItem,
                                                                                                r'''$.nivel.id''',
                                                                                              );
                                                                                              FFAppState().atualizaNivelMetodologia = true;
                                                                                            });
                                                                                            await showModalBottomSheet(
                                                                                              isScrollControlled: true,
                                                                                              backgroundColor: Colors.transparent,
                                                                                              barrierColor: Color(0x00000000),
                                                                                              enableDrag: false,
                                                                                              context: context,
                                                                                              builder: (context) {
                                                                                                return GestureDetector(
                                                                                                  onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
                                                                                                  child: Padding(
                                                                                                    padding: MediaQuery.of(context).viewInsets,
                                                                                                    child: ModalNewNivelMetodologiaWidget(),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            ).then((value) => setState(() {}));
                                                                                          },
                                                                                          text: getJsonField(
                                                                                                    listaDeMetodologiasItem,
                                                                                                    r'''$.nivel..descricao''',
                                                                                                  ) ==
                                                                                                  null
                                                                                              ? 'Informar nível'
                                                                                              : getJsonField(
                                                                                                  listaDeMetodologiasItem,
                                                                                                  r'''$.nivel..descricao''',
                                                                                                ).toString(),
                                                                                          options: FFButtonOptions(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(14.0, 14.0, 14.0, 14.0),
                                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                  color: FlutterFlowTheme.of(context).supportInfo,
                                                                                                  fontSize: 12.0,
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                                ),
                                                                                            elevation: 0.0,
                                                                                            borderSide: BorderSide(
                                                                                              color: Colors.transparent,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                if (valueOrDefault<
                                                                    bool>(
                                                                  FFAppState()
                                                                          .metodologias ==
                                                                      null,
                                                                  true,
                                                                ))
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            24.0,
                                                                            24.0,
                                                                            24.0,
                                                                            24.0),
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            4.0,
                                                                            4.0,
                                                                            4.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            CircularPercentIndicator(
                                                                              percent: 0.7,
                                                                              radius: 12.5,
                                                                              lineWidth: 5.0,
                                                                              animation: false,
                                                                              progressColor: FlutterFlowTheme.of(context).primary,
                                                                              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ).animateOnPageLoad(animationsMap['progressBarOnPageLoadAnimation3']!),
                                                                          ],
                                                                        ),
                                                                      ),
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
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 24.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 24.0),
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
                                                            'Domínios de negócio',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall,
                                                          ),
                                                        ),
                                                        FFButtonWidget(
                                                          onPressed: () async {
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState()
                                                                      .atualizaNivelDominio =
                                                                  false;
                                                            });
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              barrierColor: Color(
                                                                  0x00000000),
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return GestureDetector(
                                                                  onTap: () => FocusScope.of(
                                                                          context)
                                                                      .requestFocus(
                                                                          _model
                                                                              .unfocusNode),
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery.of(
                                                                            context)
                                                                        .viewInsets,
                                                                    child:
                                                                        Container(
                                                                      height: double
                                                                          .infinity,
                                                                      child:
                                                                          ModalNewDominioWidget(),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));
                                                          },
                                                          text:
                                                              'Adicionar domínio',
                                                          options:
                                                              FFButtonOptions(
                                                            width: 200.0,
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: Colors
                                                                          .white,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleSmallFamily),
                                                                    ),
                                                            elevation: 2.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .borderSubtle01,
                                                            ),
                                                          ),
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                if (FFAppState()
                                                                        .dominios !=
                                                                    null)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            8.0,
                                                                            8.0),
                                                                    child:
                                                                        Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final listaDeDominios =
                                                                            getJsonField(
                                                                          FFAppState()
                                                                              .dominios,
                                                                          r'''$.dominio''',
                                                                        ).toList();
                                                                        if (listaDeDominios
                                                                            .isEmpty) {
                                                                          return SemDominiosWidget();
                                                                        }
                                                                        return Wrap(
                                                                          spacing:
                                                                              8.0,
                                                                          runSpacing:
                                                                              8.0,
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
                                                                          children: List.generate(
                                                                              listaDeDominios.length,
                                                                              (listaDeDominiosIndex) {
                                                                            final listaDeDominiosItem =
                                                                                listaDeDominios[listaDeDominiosIndex];
                                                                            return Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                                              child: Material(
                                                                                color: Colors.transparent,
                                                                                elevation: 0.0,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                child: Container(
                                                                                  height: 40.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).supportInfo,
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                          child: Container(
                                                                                            constraints: BoxConstraints(
                                                                                              maxHeight: 30.0,
                                                                                            ),
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).highlight,
                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                            ),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Align(
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(6.0, 6.0, 6.0, 6.0),
                                                                                                    child: Text(
                                                                                                      getJsonField(
                                                                                                        listaDeDominiosItem,
                                                                                                        r'''$.dominio..descricao''',
                                                                                                      ).toString(),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                            color: FlutterFlowTheme.of(context).supportInfo,
                                                                                                            fontSize: 12.0,
                                                                                                            fontWeight: FontWeight.bold,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Align(
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(2.0, 6.0, 6.0, 6.0),
                                                                                                    child: InkWell(
                                                                                                      splashColor: Colors.transparent,
                                                                                                      focusColor: Colors.transparent,
                                                                                                      hoverColor: Colors.transparent,
                                                                                                      highlightColor: Colors.transparent,
                                                                                                      onTap: () async {
                                                                                                        _model.excluiDominio = await BackendHomologGroup.removeDominioColabCall.call(
                                                                                                          token: FFAppState().token,
                                                                                                          id: getJsonField(
                                                                                                            listaDeDominiosItem,
                                                                                                            r'''$.dominio.id''',
                                                                                                          ),
                                                                                                        );
                                                                                                        if ((_model.excluiDominio?.succeeded ?? true)) {
                                                                                                          await showDialog(
                                                                                                            context: context,
                                                                                                            builder: (alertDialogContext) {
                                                                                                              return AlertDialog(
                                                                                                                content: Text('Domínio de negócio removido com sucesso!'),
                                                                                                                actions: [
                                                                                                                  TextButton(
                                                                                                                    onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                                    child: Text('Ok'),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              );
                                                                                                            },
                                                                                                          );
                                                                                                        } else {
                                                                                                          await showDialog(
                                                                                                            context: context,
                                                                                                            builder: (alertDialogContext) {
                                                                                                              return AlertDialog(
                                                                                                                content: Text('Erro ao remover. Por favor, contacte o administrador do sistema.'),
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

                                                                                                        _model.atualizaDominios = await BackendHomologGroup.listarDominioColaboradorCall.call(
                                                                                                          cpfColaborador: FFAppState().MyCpf,
                                                                                                          token: FFAppState().token,
                                                                                                        );
                                                                                                        if ((_model.atualizaDominios?.succeeded ?? true)) {
                                                                                                          setState(() {
                                                                                                            FFAppState().dominios = (_model.atualizaDominios?.jsonBody ?? '');
                                                                                                          });
                                                                                                        }

                                                                                                        setState(() {});
                                                                                                      },
                                                                                                      child: Icon(
                                                                                                        Icons.close_rounded,
                                                                                                        color: FlutterFlowTheme.of(context).supportInfo,
                                                                                                        size: 16.0,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        FFButtonWidget(
                                                                                          onPressed: () async {
                                                                                            FFAppState().update(() {
                                                                                              FFAppState().idDominio = getJsonField(
                                                                                                listaDeDominiosItem,
                                                                                                r'''$.dominio.id''',
                                                                                              );
                                                                                              FFAppState().nomeDominio = getJsonField(
                                                                                                listaDeDominiosItem,
                                                                                                r'''$.dominio.descricao''',
                                                                                              ).toString();
                                                                                              FFAppState().idNivelDominio = getJsonField(
                                                                                                listaDeDominiosItem,
                                                                                                r'''$.nivel.id''',
                                                                                              );
                                                                                              FFAppState().atualizaNivelDominio = true;
                                                                                            });
                                                                                            await showModalBottomSheet(
                                                                                              isScrollControlled: true,
                                                                                              backgroundColor: Colors.transparent,
                                                                                              barrierColor: Color(0x00000000),
                                                                                              enableDrag: false,
                                                                                              context: context,
                                                                                              builder: (context) {
                                                                                                return GestureDetector(
                                                                                                  onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
                                                                                                  child: Padding(
                                                                                                    padding: MediaQuery.of(context).viewInsets,
                                                                                                    child: ModalNewNivelDominioWidget(),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            ).then((value) => setState(() {}));
                                                                                          },
                                                                                          text: getJsonField(
                                                                                                    listaDeDominiosItem,
                                                                                                    r'''$.nivel..descricao''',
                                                                                                  ) ==
                                                                                                  null
                                                                                              ? 'Informar nível'
                                                                                              : getJsonField(
                                                                                                  listaDeDominiosItem,
                                                                                                  r'''$.nivel..descricao''',
                                                                                                ).toString(),
                                                                                          options: FFButtonOptions(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(14.0, 14.0, 14.0, 14.0),
                                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                  color: FlutterFlowTheme.of(context).supportInfo,
                                                                                                  fontSize: 12.0,
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                                ),
                                                                                            elevation: 0.0,
                                                                                            borderSide: BorderSide(
                                                                                              color: Colors.transparent,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                if (valueOrDefault<
                                                                    bool>(
                                                                  FFAppState()
                                                                          .dominios ==
                                                                      null,
                                                                  true,
                                                                ))
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            24.0,
                                                                            24.0,
                                                                            24.0,
                                                                            24.0),
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            4.0,
                                                                            4.0,
                                                                            4.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            CircularPercentIndicator(
                                                                              percent: 0.7,
                                                                              radius: 12.5,
                                                                              lineWidth: 5.0,
                                                                              animation: false,
                                                                              progressColor: FlutterFlowTheme.of(context).primary,
                                                                              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ).animateOnPageLoad(animationsMap['progressBarOnPageLoadAnimation4']!),
                                                                          ],
                                                                        ),
                                                                      ),
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
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 24.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 24.0),
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
                                                            'Idiomas',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall,
                                                          ),
                                                        ),
                                                        FFButtonWidget(
                                                          onPressed: () async {
                                                            setState(() {
                                                              FFAppState()
                                                                      .atualizaNivelIdioma =
                                                                  false;
                                                            });
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              barrierColor: Color(
                                                                  0x00000000),
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return GestureDetector(
                                                                  onTap: () => FocusScope.of(
                                                                          context)
                                                                      .requestFocus(
                                                                          _model
                                                                              .unfocusNode),
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery.of(
                                                                            context)
                                                                        .viewInsets,
                                                                    child:
                                                                        ModalNewIdiomaWidget(),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));
                                                          },
                                                          text:
                                                              'Adicionar idioma',
                                                          options:
                                                              FFButtonOptions(
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: Colors
                                                                          .white,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleSmallFamily),
                                                                    ),
                                                            elevation: 2.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .borderSubtle01,
                                                            ),
                                                          ),
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                if (FFAppState()
                                                                        .idiomas !=
                                                                    null)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            8.0,
                                                                            8.0),
                                                                    child:
                                                                        Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final listaDeIdiomas =
                                                                            getJsonField(
                                                                          FFAppState()
                                                                              .idiomas,
                                                                          r'''$.Idioma''',
                                                                        ).toList();
                                                                        if (listaDeIdiomas
                                                                            .isEmpty) {
                                                                          return SemIdiomasWidget();
                                                                        }
                                                                        return Wrap(
                                                                          spacing:
                                                                              8.0,
                                                                          runSpacing:
                                                                              8.0,
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
                                                                          children: List.generate(
                                                                              listaDeIdiomas.length,
                                                                              (listaDeIdiomasIndex) {
                                                                            final listaDeIdiomasItem =
                                                                                listaDeIdiomas[listaDeIdiomasIndex];
                                                                            return Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                                              child: Material(
                                                                                color: Colors.transparent,
                                                                                elevation: 0.0,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                child: Container(
                                                                                  height: 40.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).supportInfo,
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                          child: Container(
                                                                                            constraints: BoxConstraints(
                                                                                              maxHeight: 30.0,
                                                                                            ),
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).highlight,
                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                            ),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Align(
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(6.0, 6.0, 6.0, 6.0),
                                                                                                    child: Text(
                                                                                                      getJsonField(
                                                                                                        listaDeIdiomasItem,
                                                                                                        r'''$.Idioma..descricao''',
                                                                                                      ).toString(),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                            color: FlutterFlowTheme.of(context).supportInfo,
                                                                                                            fontSize: 12.0,
                                                                                                            fontWeight: FontWeight.bold,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Align(
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(2.0, 6.0, 6.0, 6.0),
                                                                                                    child: InkWell(
                                                                                                      splashColor: Colors.transparent,
                                                                                                      focusColor: Colors.transparent,
                                                                                                      hoverColor: Colors.transparent,
                                                                                                      highlightColor: Colors.transparent,
                                                                                                      onTap: () async {
                                                                                                        _model.excluiIdioma = await BackendHomologGroup.removeIdiomaColabCall.call(
                                                                                                          token: FFAppState().token,
                                                                                                          id: getJsonField(
                                                                                                            listaDeIdiomasItem,
                                                                                                            r'''$.Idioma.id''',
                                                                                                          ),
                                                                                                        );
                                                                                                        if ((_model.excluiIdioma?.succeeded ?? true)) {
                                                                                                          await showDialog(
                                                                                                            context: context,
                                                                                                            builder: (alertDialogContext) {
                                                                                                              return AlertDialog(
                                                                                                                content: Text('Idioma removido com sucesso!'),
                                                                                                                actions: [
                                                                                                                  TextButton(
                                                                                                                    onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                                    child: Text('Ok'),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              );
                                                                                                            },
                                                                                                          );
                                                                                                        } else {
                                                                                                          await showDialog(
                                                                                                            context: context,
                                                                                                            builder: (alertDialogContext) {
                                                                                                              return AlertDialog(
                                                                                                                content: Text('Erro ao remover. Por favor, contacte o administrador do sistema.'),
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

                                                                                                        _model.atualizaIdiomas = await BackendHomologGroup.listarIdiomasColaboradorCall.call(
                                                                                                          cpfColaborador: FFAppState().MyCpf,
                                                                                                          token: FFAppState().token,
                                                                                                        );
                                                                                                        if ((_model.atualizaIdiomas?.succeeded ?? true)) {
                                                                                                          setState(() {
                                                                                                            FFAppState().idiomas = (_model.atualizaIdiomas?.jsonBody ?? '');
                                                                                                          });
                                                                                                        }

                                                                                                        setState(() {});
                                                                                                      },
                                                                                                      child: Icon(
                                                                                                        Icons.close_rounded,
                                                                                                        color: FlutterFlowTheme.of(context).supportInfo,
                                                                                                        size: 16.0,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        FFButtonWidget(
                                                                                          onPressed: () async {
                                                                                            FFAppState().update(() {
                                                                                              FFAppState().idIdioma = getJsonField(
                                                                                                listaDeIdiomasItem,
                                                                                                r'''$.Idioma.id''',
                                                                                              );
                                                                                              FFAppState().nomeIdioma = getJsonField(
                                                                                                listaDeIdiomasItem,
                                                                                                r'''$.Idioma.descricao''',
                                                                                              ).toString();
                                                                                              FFAppState().idNivelIdioma = getJsonField(
                                                                                                listaDeIdiomasItem,
                                                                                                r'''$.nivel.id''',
                                                                                              );
                                                                                              FFAppState().atualizaNivelIdioma = true;
                                                                                            });
                                                                                            await showModalBottomSheet(
                                                                                              isScrollControlled: true,
                                                                                              backgroundColor: Colors.transparent,
                                                                                              barrierColor: Color(0x00000000),
                                                                                              enableDrag: false,
                                                                                              context: context,
                                                                                              builder: (context) {
                                                                                                return GestureDetector(
                                                                                                  onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
                                                                                                  child: Padding(
                                                                                                    padding: MediaQuery.of(context).viewInsets,
                                                                                                    child: ModalNewNivelIdiomaWidget(),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            ).then((value) => setState(() {}));
                                                                                          },
                                                                                          text: getJsonField(
                                                                                                    listaDeIdiomasItem,
                                                                                                    r'''$.nivel..descricao''',
                                                                                                  ) ==
                                                                                                  null
                                                                                              ? 'Informar nível'
                                                                                              : getJsonField(
                                                                                                  listaDeIdiomasItem,
                                                                                                  r'''$.nivel..descricao''',
                                                                                                ).toString(),
                                                                                          options: FFButtonOptions(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(14.0, 14.0, 14.0, 14.0),
                                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                  color: FlutterFlowTheme.of(context).supportInfo,
                                                                                                  fontSize: 12.0,
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                                ),
                                                                                            elevation: 0.0,
                                                                                            borderSide: BorderSide(
                                                                                              color: Colors.transparent,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                if (valueOrDefault<
                                                                    bool>(
                                                                  FFAppState()
                                                                          .idiomas ==
                                                                      null,
                                                                  true,
                                                                ))
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            24.0,
                                                                            24.0,
                                                                            24.0,
                                                                            24.0),
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            4.0,
                                                                            4.0,
                                                                            4.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            CircularPercentIndicator(
                                                                              percent: 0.7,
                                                                              radius: 12.5,
                                                                              lineWidth: 5.0,
                                                                              animation: false,
                                                                              progressColor: FlutterFlowTheme.of(context).primary,
                                                                              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ).animateOnPageLoad(animationsMap['progressBarOnPageLoadAnimation5']!),
                                                                          ],
                                                                        ),
                                                                      ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
