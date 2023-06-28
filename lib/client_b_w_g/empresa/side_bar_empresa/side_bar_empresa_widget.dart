import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'side_bar_empresa_model.dart';
export 'side_bar_empresa_model.dart';

class SideBarEmpresaWidget extends StatefulWidget {
  const SideBarEmpresaWidget({Key? key}) : super(key: key);

  @override
  _SideBarEmpresaWidgetState createState() => _SideBarEmpresaWidgetState();
}

class _SideBarEmpresaWidgetState extends State<SideBarEmpresaWidget> {
  late SideBarEmpresaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SideBarEmpresaModel());

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
        FFAppState().sidebarCNPJOpen == true ? 264.0 : 74.0,
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      if (FFAppState().sidebarCNPJOpen)
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
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
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
              Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
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
                            FFAppState().sidebarCNPJitem5Active = false;
                            FFAppState().sidebarCNPJitem6Active = false;
                            FFAppState().sidebarCNPJitem7Active = false;
                            FFAppState().sidebarCNPJitem8Active = false;
                            FFAppState().sidebarCNPJitem9Active = false;
                            FFAppState().sidebarCNPJitem10Active = false;
                            FFAppState().sidebarCNPJitem11Active = false;
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
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
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
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (FFAppState().sidebarCNPJOpen)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Text(
                                'Empresa',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 8.0),
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
                                  FFAppState().sidebarCNPJitem5Active = false;
                                  FFAppState().sidebarCNPJitem6Active = false;
                                  FFAppState().sidebarCNPJitem7Active = false;
                                  FFAppState().sidebarCNPJitem8Active = false;
                                  FFAppState().sidebarCNPJitem9Active = false;
                                  FFAppState().sidebarCNPJitem10Active = false;
                                  FFAppState().sidebarCNPJitem11Active = false;
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
                                        ? FlutterFlowTheme.of(context)
                                            .buttonPrimary
                                        : FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    FlutterFlowTheme.of(context)
                                        .secondaryBackground,
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
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
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
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: valueOrDefault<Color>(
                                                  FFAppState()
                                                          .sidebarCNPJitem2Active
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .textOnColor
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                                ),
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 8.0),
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
                                  FFAppState().sidebarCNPJitem5Active = false;
                                  FFAppState().sidebarCNPJitem6Active = false;
                                  FFAppState().sidebarCNPJitem7Active = false;
                                  FFAppState().sidebarCNPJitem8Active = false;
                                  FFAppState().sidebarCNPJitem9Active = false;
                                  FFAppState().sidebarCNPJitem10Active = false;
                                  FFAppState().sidebarCNPJitem11Active = false;
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
                                        ? FlutterFlowTheme.of(context)
                                            .buttonPrimary
                                        : FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    FlutterFlowTheme.of(context)
                                        .secondaryBackground,
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
                                            FFAppState().sidebarCNPJitem3Active
                                                ? FlutterFlowTheme.of(context)
                                                    .textOnColor
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
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
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: valueOrDefault<Color>(
                                                  FFAppState()
                                                          .sidebarCNPJitem3Active
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .textOnColor
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                                ),
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 8.0),
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
                                  FFAppState().sidebarCNPJitem5Active = false;
                                  FFAppState().sidebarCNPJitem6Active = false;
                                  FFAppState().sidebarCNPJitem7Active = false;
                                  FFAppState().sidebarCNPJitem8Active = false;
                                  FFAppState().sidebarCNPJitem9Active = false;
                                  FFAppState().sidebarCNPJitem10Active = false;
                                  FFAppState().sidebarCNPJitem11Active = false;
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
                                        ? FlutterFlowTheme.of(context)
                                            .buttonPrimary
                                        : FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    FlutterFlowTheme.of(context)
                                        .secondaryBackground,
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
                                            FFAppState().sidebarCNPJitem4Active
                                                ? FlutterFlowTheme.of(context)
                                                    .textOnColor
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
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
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: valueOrDefault<Color>(
                                                  FFAppState()
                                                          .sidebarCNPJitem4Active
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .textOnColor
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                                ),
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 8.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.goNamed(
                                  'apontamentosEmpresa',
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
                                  FFAppState().sidebarCNPJitem4Active = false;
                                  FFAppState().sidebarCNPJitem5Active = true;
                                  FFAppState().sidebarCNPJitem6Active = false;
                                  FFAppState().sidebarCNPJitem7Active = false;
                                  FFAppState().sidebarCNPJitem8Active = false;
                                  FFAppState().sidebarCNPJitem9Active = false;
                                  FFAppState().sidebarCNPJitem10Active = false;
                                  FFAppState().sidebarCNPJitem11Active = false;
                                });
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                width: double.infinity,
                                height: 48.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    FFAppState().sidebarCNPJitem5Active
                                        ? FlutterFlowTheme.of(context)
                                            .buttonPrimary
                                        : FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    FlutterFlowTheme.of(context)
                                        .secondaryBackground,
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
                                          Icons.access_time_rounded,
                                          color: valueOrDefault<Color>(
                                            FFAppState().sidebarCNPJitem5Active
                                                ? FlutterFlowTheme.of(context)
                                                    .textOnColor
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                          size: 24.0,
                                        ),
                                      ),
                                      if (FFAppState().sidebarCNPJOpen)
                                        Text(
                                          'Apontamentos',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: valueOrDefault<Color>(
                                                  FFAppState()
                                                          .sidebarCNPJitem5Active
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .textOnColor
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                                ),
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (FFAppState().sidebarCNPJOpen)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Text(
                                'Módulos VIP',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 8.0),
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
                                  FFAppState().sidebarCNPJitem1Active = false;
                                  FFAppState().sidebarCNPJitem2Active = false;
                                  FFAppState().sidebarCNPJitem3Active = false;
                                  FFAppState().sidebarCNPJitem4Active = false;
                                  FFAppState().sidebarCNPJitem5Active = false;
                                  FFAppState().sidebarCNPJitem6Active = true;
                                  FFAppState().sidebarCNPJitem7Active = false;
                                  FFAppState().sidebarCNPJitem8Active = false;
                                  FFAppState().sidebarCNPJitem9Active = false;
                                  FFAppState().sidebarCNPJitem10Active = false;
                                  FFAppState().sidebarCNPJitem11Active = false;
                                });
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                width: double.infinity,
                                height: 48.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    FFAppState().sidebarCNPJitem6Active
                                        ? FlutterFlowTheme.of(context)
                                            .buttonPrimary
                                        : FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    FlutterFlowTheme.of(context)
                                        .secondaryBackground,
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
                                            FFAppState().sidebarCNPJitem6Active
                                                ? FlutterFlowTheme.of(context)
                                                    .textOnColor
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                          size: 24.0,
                                        ),
                                      ),
                                      if (FFAppState().sidebarCNPJOpen)
                                        Text(
                                          'Benefícios',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: valueOrDefault<Color>(
                                                  FFAppState()
                                                          .sidebarCNPJitem6Active
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .textOnColor
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                                ),
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 8.0),
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              width: double.infinity,
                              height: 48.0,
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  FFAppState().sidebarCNPJitem7Active
                                      ? FlutterFlowTheme.of(context)
                                          .buttonPrimary
                                      : FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
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
                                        Icons.location_history_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .textOnColorDisabled,
                                        size: 24.0,
                                      ),
                                    ),
                                    if (FFAppState().sidebarCNPJOpen)
                                      Text(
                                        'Book colaborador',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .textOnColorDisabled,
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 8.0),
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              width: double.infinity,
                              height: 48.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
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
                                        Icons.school_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .textOnColorDisabled,
                                        size: 24.0,
                                      ),
                                    ),
                                    if (FFAppState().sidebarCNPJOpen)
                                      Text(
                                        'Meu PDI',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .textOnColorDisabled,
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
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (FFAppState().sidebarCNPJOpen)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Text(
                                'Administrativo',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 8.0),
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
                                  FFAppState().sidebarCNPJitem1Active = false;
                                  FFAppState().sidebarCNPJitem2Active = false;
                                  FFAppState().sidebarCNPJitem3Active = false;
                                  FFAppState().sidebarCNPJitem4Active = false;
                                  FFAppState().sidebarCNPJitem5Active = false;
                                  FFAppState().sidebarCNPJitem6Active = false;
                                  FFAppState().sidebarCNPJitem7Active = false;
                                  FFAppState().sidebarCNPJitem8Active = false;
                                  FFAppState().sidebarCNPJitem9Active = true;
                                  FFAppState().sidebarCNPJitem10Active = false;
                                  FFAppState().sidebarCNPJitem11Active = false;
                                });
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                width: double.infinity,
                                height: 48.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    FFAppState().sidebarCNPJitem9Active
                                        ? FlutterFlowTheme.of(context)
                                            .buttonPrimary
                                        : FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    FlutterFlowTheme.of(context)
                                        .secondaryBackground,
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
                                          Icons.bar_chart,
                                          color: valueOrDefault<Color>(
                                            FFAppState().sidebarCNPJitem9Active
                                                ? FlutterFlowTheme.of(context)
                                                    .textOnColor
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                          size: 24.0,
                                        ),
                                      ),
                                      if (FFAppState().sidebarCNPJOpen)
                                        Text(
                                          'Parametrização',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: valueOrDefault<Color>(
                                                  FFAppState()
                                                          .sidebarCNPJitem9Active
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .textOnColor
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                                ),
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 8.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.goNamed(
                                  'relatorioFaturamento',
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
                                  FFAppState().sidebarCNPJitem4Active = false;
                                  FFAppState().sidebarCNPJitem5Active = false;
                                  FFAppState().sidebarCNPJitem6Active = false;
                                  FFAppState().sidebarCNPJitem7Active = false;
                                  FFAppState().sidebarCNPJitem8Active = false;
                                  FFAppState().sidebarCNPJitem9Active = false;
                                  FFAppState().sidebarCNPJitem10Active = false;
                                  FFAppState().sidebarCNPJitem11Active = true;
                                });
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                width: double.infinity,
                                height: 48.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    FFAppState().sidebarCNPJitem11Active
                                        ? FlutterFlowTheme.of(context)
                                            .buttonPrimary
                                        : FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    FlutterFlowTheme.of(context)
                                        .secondaryBackground,
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
                                          Icons.bar_chart,
                                          color: valueOrDefault<Color>(
                                            FFAppState().sidebarCNPJitem11Active
                                                ? FlutterFlowTheme.of(context)
                                                    .textOnColor
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                          size: 24.0,
                                        ),
                                      ),
                                      if (FFAppState().sidebarCNPJOpen)
                                        Text(
                                          'Relatório de Faturamento',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: valueOrDefault<Color>(
                                                  FFAppState()
                                                          .sidebarCNPJitem11Active
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .textOnColor
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                                ),
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
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (FFAppState().sidebarCNPJOpen)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 8.0),
                            child: Text(
                              'Sistema',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            width: double.infinity,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: valueOrDefault<Color>(
                                FFAppState().sidebarCNPJitem10Active
                                    ? FlutterFlowTheme.of(context).buttonPrimary
                                    : FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                FlutterFlowTheme.of(context)
                                    .secondaryBackground,
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
                                      Icons.contact_support_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .textOnColorDisabled,
                                      size: 24.0,
                                    ),
                                  ),
                                  if (FFAppState().sidebarCNPJOpen)
                                    Text(
                                      'Suporte e melhoria',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
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
                  ],
                ),
              ),
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
                            if (FFAppState().sidebarCNPJOpen)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Logout',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    if (FFAppState().sidebarCNPJOpen)
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
      ),
    );
  }
}
