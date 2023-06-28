import '/backend/api_requests/api_calls.dart';
import '/components/modals/modal_nav_dados_c_o_l_a_b_o_r_a_d_o_r/modal_nav_dados_c_o_l_a_b_o_r_a_d_o_r_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'the_ultimate_nav_bar_model.dart';
export 'the_ultimate_nav_bar_model.dart';

class TheUltimateNavBarWidget extends StatefulWidget {
  const TheUltimateNavBarWidget({
    Key? key,
    Color? icone1,
    Color? texto1,
    Color? icone2,
    Color? texto2,
    Color? icone3,
    Color? texto3,
    Color? icone4,
    Color? texto4,
    Color? icone5,
    Color? texto5,
  })  : this.icone1 = icone1 ?? const Color(0xFF57636C),
        this.texto1 = texto1 ?? const Color(0xFF57636C),
        this.icone2 = icone2 ?? const Color(0xFF57636C),
        this.texto2 = texto2 ?? const Color(0xFF57636C),
        this.icone3 = icone3 ?? const Color(0xFF57636C),
        this.texto3 = texto3 ?? const Color(0xFF57636C),
        this.icone4 = icone4 ?? const Color(0xFF57636C),
        this.texto4 = texto4 ?? const Color(0xFF57636C),
        this.icone5 = icone5 ?? const Color(0xFF57636C),
        this.texto5 = texto5 ?? const Color(0xFF57636C),
        super(key: key);

  final Color icone1;
  final Color texto1;
  final Color icone2;
  final Color texto2;
  final Color icone3;
  final Color texto3;
  final Color icone4;
  final Color texto4;
  final Color icone5;
  final Color texto5;

  @override
  _TheUltimateNavBarWidgetState createState() =>
      _TheUltimateNavBarWidgetState();
}

class _TheUltimateNavBarWidgetState extends State<TheUltimateNavBarWidget> {
  late TheUltimateNavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TheUltimateNavBarModel());

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
      height: 60.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 8.0,
            color: Color(0x14000000),
            offset: Offset(0.0, 4.0),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
        border: Border.all(
          color: FlutterFlowTheme.of(context).borderSubtle01,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
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
              },
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.home,
                    color: widget.icone1,
                    size: 24.0,
                  ),
                  Text(
                    'Home',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: widget.texto1,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                ],
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.goNamed(
                  'meuPDInew',
                  extra: <String, dynamic>{
                    kTransitionInfoKey: TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                      duration: Duration(milliseconds: 300),
                    ),
                  },
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FaIcon(
                    FontAwesomeIcons.rocket,
                    color: widget.icone2,
                    size: 22.0,
                  ),
                  Text(
                    'PDI',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: widget.texto2,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                ],
              ),
            ),
            if (FFAppState().tipoColab == '0')
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.goNamed(
                    'felizometro',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 300),
                      ),
                    },
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.solidSmile,
                      color: widget.icone3,
                      size: 22.0,
                    ),
                    Text(
                      'Felizômetro',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: widget.texto3,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ],
                ),
              ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.goNamed(
                  'MapaVisitas',
                  extra: <String, dynamic>{
                    kTransitionInfoKey: TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                      duration: Duration(milliseconds: 300),
                    ),
                  },
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FaIcon(
                    FontAwesomeIcons.peopleArrows,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 22.0,
                  ),
                  Text(
                    'Leads',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: widget.texto3,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                ],
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: FlutterFlowTheme.of(context).overlay,
                  barrierColor: Color(0x00000000),
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: Container(
                        height: double.infinity,
                        child: ModalNavDadosCOLABORADORWidget(),
                      ),
                    );
                  },
                ).then((value) => setState(() {}));
              },
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.person_rounded,
                    color: widget.icone4,
                    size: 24.0,
                  ),
                  Text(
                    'Perfil',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: valueOrDefault<Color>(
                            widget.texto4,
                            FlutterFlowTheme.of(context).secondaryText,
                          ),
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                ],
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                _model.apiResultxta = await BackendHomologGroup.logoutCall.call(
                  cpfemail: FFAppState().MyCpf,
                  token: FFAppState().token,
                );
                if ((_model.apiResultxta?.succeeded ?? true)) {
                  await launchURL(
                      'https://login.microsoftonline.com/common/oauth2/logout');

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

                setState(() {});
              },
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.logout,
                    color: widget.icone5,
                    size: 24.0,
                  ),
                  Text(
                    'Sair',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: widget.texto5,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
