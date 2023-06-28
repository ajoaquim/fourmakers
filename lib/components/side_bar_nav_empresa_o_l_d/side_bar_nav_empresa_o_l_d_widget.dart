import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'side_bar_nav_empresa_o_l_d_model.dart';
export 'side_bar_nav_empresa_o_l_d_model.dart';

class SideBarNavEmpresaOLDWidget extends StatefulWidget {
  const SideBarNavEmpresaOLDWidget({Key? key}) : super(key: key);

  @override
  _SideBarNavEmpresaOLDWidgetState createState() =>
      _SideBarNavEmpresaOLDWidgetState();
}

class _SideBarNavEmpresaOLDWidgetState
    extends State<SideBarNavEmpresaOLDWidget> {
  late SideBarNavEmpresaOLDModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SideBarNavEmpresaOLDModel());

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

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: valueOrDefault<double>(
        FFAppState().sidebarPJOpen == true ? 264.0 : 74.0,
        264.0,
      ),
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 32.0,
            color: Color(0x2A000000),
            offset: Offset(0.0, 16.0),
            spreadRadius: 0.0,
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(12.0),
          topLeft: Radius.circular(0.0),
          topRight: Radius.circular(12.0),
        ),
        border: Border.all(
          color: FlutterFlowTheme.of(context).borderSubtle01,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120.0,
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (FFAppState().sidebarPJOpen)
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/logo-lightmode.png',
                            width: 130.0,
                            height: 40.0,
                            fit: BoxFit.fitWidth,
                          ),
                          if (FFAppState().emHomolog)
                            Container(
                              height: 26.0,
                              decoration: BoxDecoration(
                                color: Color(0x190043CE),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    6.0, 6.0, 6.0, 6.0),
                                child: Text(
                                  'em homologação',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .supportInfo,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ToggleIcon(
                      onPressed: () async {
                        setState(() => FFAppState().sidebarCNPJOpen =
                            !FFAppState().sidebarCNPJOpen);
                      },
                      value: FFAppState().sidebarCNPJOpen,
                      onIcon: Icon(
                        Icons.chevron_left_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 22.0,
                      ),
                      offIcon: Icon(
                        Icons.chevron_right_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 22.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.goNamed(
                          'homeEmpresa',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 300),
                            ),
                          },
                        );

                        FFAppState().update(() {
                          FFAppState().sidebarCNPJitem1Active = true;
                          FFAppState().sidebarCNPJitem2Active = false;
                          FFAppState().sidebarCNPJitem3Active = false;
                          FFAppState().sidebarCNPJitem4Active = false;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        width: double.infinity,
                        height: 48.0,
                        decoration: BoxDecoration(
                          color: valueOrDefault<Color>(
                            FFAppState().sidebarCNPJitem1Active
                                ? FlutterFlowTheme.of(context).buttonPrimary
                                : FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                            FlutterFlowTheme.of(context).secondaryBackground,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 4.0, 4.0, 4.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 12.0, 0.0),
                                child: Icon(
                                  Icons.home_rounded,
                                  color: valueOrDefault<Color>(
                                    FFAppState().sidebarCNPJitem1Active
                                        ? FlutterFlowTheme.of(context)
                                            .textOnColor
                                        : FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    FlutterFlowTheme.of(context).secondaryText,
                                  ),
                                  size: 24.0,
                                ),
                              ),
                              if (FFAppState().sidebarCNPJOpen)
                                Text(
                                  'Home',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: valueOrDefault<Color>(
                                          FFAppState().sidebarCNPJitem1Active
                                              ? FlutterFlowTheme.of(context)
                                                  .textOnColor
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.goNamed(
                          'minhaEmpresa',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 300),
                            ),
                          },
                        );

                        FFAppState().update(() {
                          FFAppState().sidebarCNPJitem1Active = false;
                          FFAppState().sidebarCNPJitem2Active = true;
                          FFAppState().sidebarCNPJitem3Active = false;
                          FFAppState().sidebarCNPJitem4Active = false;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        width: double.infinity,
                        height: 48.0,
                        decoration: BoxDecoration(
                          color: valueOrDefault<Color>(
                            FFAppState().sidebarCNPJitem2Active
                                ? FlutterFlowTheme.of(context).buttonPrimary
                                : FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                            FlutterFlowTheme.of(context).secondaryBackground,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 4.0, 4.0, 4.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 12.0, 0.0),
                                child: FaIcon(
                                  FontAwesomeIcons.building,
                                  color: valueOrDefault<Color>(
                                    FFAppState().sidebarCNPJitem2Active
                                        ? FlutterFlowTheme.of(context)
                                            .textOnColor
                                        : FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    FlutterFlowTheme.of(context).secondaryText,
                                  ),
                                  size: 24.0,
                                ),
                              ),
                              if (FFAppState().sidebarCNPJOpen)
                                Text(
                                  'Minha empresa',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: valueOrDefault<Color>(
                                          FFAppState().sidebarCNPJitem2Active
                                              ? FlutterFlowTheme.of(context)
                                                  .textOnColor
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.goNamed(
                          'prestadoresBackoffice',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 300),
                            ),
                          },
                        );

                        FFAppState().update(() {
                          FFAppState().sidebarCNPJitem1Active = false;
                          FFAppState().sidebarCNPJitem2Active = false;
                          FFAppState().sidebarCNPJitem3Active = true;
                          FFAppState().sidebarCNPJitem4Active = false;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        width: double.infinity,
                        height: 48.0,
                        decoration: BoxDecoration(
                          color: valueOrDefault<Color>(
                            FFAppState().sidebarCNPJitem3Active
                                ? FlutterFlowTheme.of(context).buttonPrimary
                                : FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                            FlutterFlowTheme.of(context).secondaryBackground,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 4.0, 4.0, 4.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 12.0, 0.0),
                                child: Icon(
                                  Icons.account_circle_outlined,
                                  color: valueOrDefault<Color>(
                                    FFAppState().sidebarPJitem2Active
                                        ? FlutterFlowTheme.of(context)
                                            .textOnColor
                                        : FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    FlutterFlowTheme.of(context).secondaryText,
                                  ),
                                  size: 24.0,
                                ),
                              ),
                              if (FFAppState().sidebarCNPJOpen)
                                Text(
                                  'Prestadores',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: valueOrDefault<Color>(
                                          FFAppState().sidebarPJitem2Active
                                              ? FlutterFlowTheme.of(context)
                                                  .textOnColor
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.goNamed(
                          'projetos',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 300),
                            ),
                          },
                        );

                        FFAppState().update(() {
                          FFAppState().sidebarCNPJitem1Active = false;
                          FFAppState().sidebarCNPJitem2Active = false;
                          FFAppState().sidebarCNPJitem3Active = false;
                          FFAppState().sidebarCNPJitem4Active = true;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        width: double.infinity,
                        height: 48.0,
                        decoration: BoxDecoration(
                          color: valueOrDefault<Color>(
                            FFAppState().sidebarCNPJitem4Active
                                ? FlutterFlowTheme.of(context).buttonPrimary
                                : FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                            FlutterFlowTheme.of(context).secondaryBackground,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 4.0, 4.0, 4.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 12.0, 0.0),
                                child: Icon(
                                  Icons.work_outline_rounded,
                                  color: valueOrDefault<Color>(
                                    FFAppState().sidebarPJitem3Active
                                        ? FlutterFlowTheme.of(context)
                                            .textOnColor
                                        : FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    FlutterFlowTheme.of(context).secondaryText,
                                  ),
                                  size: 24.0,
                                ),
                              ),
                              if (FFAppState().sidebarCNPJOpen)
                                Text(
                                  'Projetos',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: valueOrDefault<Color>(
                                          FFAppState().sidebarPJitem3Active
                                              ? FlutterFlowTheme.of(context)
                                                  .textOnColor
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
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
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                    child: Text(
                      'Módulos VIP',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.goNamed(
                          'beneficios',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 300),
                            ),
                          },
                        );

                        FFAppState().update(() {
                          FFAppState().sidebarPJitem1Active = false;
                          FFAppState().sidebarPJitem2Active = false;
                          FFAppState().sidebarPJitem3Active = false;
                          FFAppState().sidebarPJitem4Active = false;
                          FFAppState().sidebarPJitem5Active = false;
                        });
                        FFAppState().update(() {
                          FFAppState().sidebarPJitem5Active = true;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        width: double.infinity,
                        height: 48.0,
                        decoration: BoxDecoration(
                          color: valueOrDefault<Color>(
                            FFAppState().sidebarPJitem5Active
                                ? FlutterFlowTheme.of(context).buttonPrimary
                                : FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                            FlutterFlowTheme.of(context).secondaryBackground,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 4.0, 4.0, 4.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 12.0, 0.0),
                                child: Icon(
                                  Icons.card_giftcard_rounded,
                                  color: valueOrDefault<Color>(
                                    FFAppState().sidebarPJitem5Active
                                        ? FlutterFlowTheme.of(context)
                                            .textOnColor
                                        : FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    FlutterFlowTheme.of(context).secondaryText,
                                  ),
                                  size: 24.0,
                                ),
                              ),
                              if (FFAppState().sidebarPJOpen)
                                Text(
                                  'Benefícios',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: valueOrDefault<Color>(
                                          FFAppState().sidebarPJitem5Active
                                              ? FlutterFlowTheme.of(context)
                                                  .textOnColor
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      width: double.infinity,
                      height: 48.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 4.0, 4.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 12.0, 0.0),
                              child: Icon(
                                Icons.school_outlined,
                                color: FlutterFlowTheme.of(context)
                                    .textOnColorDisabled,
                                size: 24.0,
                              ),
                            ),
                            if (FFAppState().sidebarPJOpen)
                              Text(
                                'Meu PDI',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .textOnColorDisabled,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      width: double.infinity,
                      height: 48.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 4.0, 4.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 12.0, 0.0),
                              child: Icon(
                                Icons.location_history_rounded,
                                color: FlutterFlowTheme.of(context)
                                    .textOnColorDisabled,
                                size: 24.0,
                              ),
                            ),
                            if (FFAppState().sidebarPJOpen)
                              Text(
                                'Book colaborador',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .textOnColorDisabled,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                    child: Text(
                      'Administrativo',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.goNamed(
                          'masterParametrizacaoNew',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 300),
                            ),
                          },
                        );

                        FFAppState().update(() {
                          FFAppState().sidebarPJitem1Active = false;
                          FFAppState().sidebarPJitem2Active = false;
                          FFAppState().sidebarPJitem3Active = false;
                          FFAppState().sidebarPJitem4Active = false;
                          FFAppState().sidebarPJitem5Active = false;
                        });
                        FFAppState().update(() {
                          FFAppState().sidebarPJitem5Active = true;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        width: double.infinity,
                        height: 48.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 4.0, 4.0, 4.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 12.0, 0.0),
                                child: Icon(
                                  Icons.bar_chart,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                              ),
                              if (FFAppState().sidebarPJOpen)
                                Text(
                                  'Parametrização',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
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
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                  child: Text(
                    'Sistema',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.goNamed(
                        'beneficios',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 300),
                          ),
                        },
                      );

                      FFAppState().update(() {
                        FFAppState().sidebarPJitem1Active = false;
                        FFAppState().sidebarPJitem2Active = false;
                        FFAppState().sidebarPJitem3Active = false;
                        FFAppState().sidebarPJitem4Active = false;
                        FFAppState().sidebarPJitem5Active = false;
                      });
                      FFAppState().update(() {
                        FFAppState().sidebarPJitem5Active = true;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      width: double.infinity,
                      height: 48.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 4.0, 4.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 12.0, 0.0),
                              child: Icon(
                                Icons.contact_support_outlined,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                            if (FFAppState().sidebarPJOpen)
                              Text(
                                'Suporte e melhoria',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
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
            Spacer(),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        FFAppState().update(() {
                          FFAppState().tokenPJ = '';
                        });

                        context.goNamed(
                          'loginPJ',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 300),
                            ),
                          },
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.logout,
                            color: Colors.black,
                            size: 24.0,
                          ),
                          if (FFAppState().sidebarPJOpen)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Logout',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  if (FFAppState().sidebarPJOpen)
                    Image.asset(
                      'assets/images/ecossistema2.png',
                      width: 80.0,
                      height: 35.0,
                      fit: BoxFit.contain,
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
