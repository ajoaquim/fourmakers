import '/backend/api_requests/api_calls.dart';
import '/components/side_bar_nav/side_bar_nav_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/okr_components/modal_add_objetivo/modal_add_objetivo_widget.dart';
import '/okr_components/modal_add_objetivo_area/modal_add_objetivo_area_widget.dart';
import '/okr_components/objetivo_area/objetivo_area_widget.dart';
import '/okr_components/objetivo_principal/objetivo_principal_widget.dart';
import '/okr_components/resultado_chave/resultado_chave_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'okr_model.dart';
export 'okr_model.dart';

class OkrWidget extends StatefulWidget {
  const OkrWidget({Key? key}) : super(key: key);

  @override
  _OkrWidgetState createState() => _OkrWidgetState();
}

class _OkrWidgetState extends State<OkrWidget> {
  late OkrModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OkrModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultlwc = await BackendHomologGroup.showMeCall.call(
        tokenx: FFAppState().token,
      );
      if ((_model.apiResultlwc?.succeeded ?? true)) {
        _model.apiResultri9 = await OkrGroup.getAllokrCall.call();
        if ((_model.apiResultri9?.succeeded ?? true)) {
          setState(() {
            _model.loadingGeral = false;
          });
          setState(() {
            FFAppState().okrOrganizacaoOKR =
                (_model.apiResultri9?.jsonBody ?? '').toList().cast<dynamic>();
          });
        }
        _model.apiResultbb7 = await OkrGroup.getAllObjetivosAreaCall.call();
        if ((_model.apiResultbb7?.succeeded ?? true)) {
          setState(() {
            _model.loadingArea = false;
          });
          setState(() {
            FFAppState().okrOrganizacaoObjetivoArea =
                (_model.apiResultbb7?.jsonBody ?? '').toList().cast<dynamic>();
            FFAppState().okrAreaObjetivoArea =
                (_model.apiResultbb7?.jsonBody ?? '').toList().cast<dynamic>();
          });
        }
        _model.apiResulttby = await OkrGroup.getResultadosCall.call();
        if ((_model.apiResulttby?.succeeded ?? true)) {
          setState(() {
            _model.loadingResultado = false;
          });
          setState(() {
            FFAppState().okrAreaResultadoChave =
                (_model.apiResulttby?.jsonBody ?? '').toList().cast<dynamic>();
          });
        }
      } else {
        context.pushNamed('loginSlide1');

        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              content: Text('Você nao esta logado'),
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
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
                          oneBG: Colors.white,
                          oneIcon: Icon(
                            Icons.home_outlined,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                          twoBG:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                          threeBG:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                          sixBG:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 32.0),
                                        child: Text(
                                          'OKR',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLargeFamily,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(FlutterFlowTheme
                                                            .of(context)
                                                        .headlineLargeFamily),
                                              ),
                                        ),
                                      ),
                                      if (_model.area)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 30.0),
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    setState(() {
                                                      _model.area = false;
                                                      _model.organizacao = true;
                                                    });
                                                  },
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 0.0,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .borderSubtle02,
                                                            offset: Offset(
                                                                0.0, 1.0),
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
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Text(
                                                              'Organização',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: Color(
                                                                        0x8157636C),
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Material(
                                                  color: Colors.transparent,
                                                  elevation: 0.0,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .borderInteractive,
                                                          offset:
                                                              Offset(0.0, 1.0),
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
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Text(
                                                            'Área',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Color(
                                                                      0xFF181A20),
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
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
                                        ),
                                      if (_model.organizacao)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 30.0),
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Material(
                                                  color: Colors.transparent,
                                                  elevation: 0.0,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .borderInteractive,
                                                          offset:
                                                              Offset(0.0, 1.0),
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
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Text(
                                                            'Organização',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
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
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    setState(() {
                                                      _model.area = true;
                                                      _model.organizacao =
                                                          false;
                                                    });
                                                  },
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 0.0,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .borderSubtle01,
                                                            offset: Offset(
                                                                0.0, 1.0),
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
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Text(
                                                              'Área',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: Color(
                                                                        0x8157636C),
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 30.0),
                                        child: Container(
                                          height: 88.0,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .transparent,
                                            ),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, -1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 10.0, 16.0, 10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Container(
                                                  width: 350.0,
                                                  height: 40.0,
                                                  constraints: BoxConstraints(
                                                    maxWidth:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.5,
                                                  ),
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Filtrar',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLargeFamily,
                                                                  fontSize:
                                                                      18.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineLargeFamily),
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    if (_model.area)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    14.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 180.0,
                                                          height: 100.0,
                                                          constraints:
                                                              BoxConstraints(
                                                            maxHeight: 48.0,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child:
                                                                FlutterFlowDropDown<
                                                                    String>(
                                                              controller: _model
                                                                      .dropDownAreaValueController ??=
                                                                  FormFieldController<
                                                                          String>(
                                                                      null),
                                                              options: [
                                                                'Design',
                                                                'Solution',
                                                                'Pessoas&Cultura',
                                                                'Delivery',
                                                                'Governança',
                                                                'Todos'
                                                              ],
                                                              onChanged: (val) =>
                                                                  setState(() =>
                                                                      _model.dropDownAreaValue =
                                                                          val),
                                                              height: 50.0,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .textSecondary,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                              hintText:
                                                                  'Selecione',
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
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          4.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isSearchable:
                                                                  false,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    Container(
                                                      width: 180.0,
                                                      height: 100.0,
                                                      constraints:
                                                          BoxConstraints(
                                                        maxHeight: 48.0,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child:
                                                            FlutterFlowDropDown<
                                                                String>(
                                                          controller: _model
                                                                  .dropDownAnoValueController ??=
                                                              FormFieldController<
                                                                  String>(null),
                                                          options: [
                                                            'Todos',
                                                            '2023',
                                                            '2024',
                                                            '2025',
                                                            '2026',
                                                            '2027',
                                                            '2028',
                                                            '2029'
                                                          ],
                                                          onChanged: (val) =>
                                                              setState(() =>
                                                                  _model.dropDownAnoValue =
                                                                      val),
                                                          height: 50.0,
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
                                                                        .textSecondary,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                          hintText: 'Selecione',
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
                                                                      12.0,
                                                                      0.0,
                                                                      12.0,
                                                                      4.0),
                                                          hidesUnderline: true,
                                                          isSearchable: false,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  14.0,
                                                                  0.0,
                                                                  14.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 180.0,
                                                        height: 100.0,
                                                        constraints:
                                                            BoxConstraints(
                                                          maxHeight: 48.0,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child:
                                                              FlutterFlowDropDown<
                                                                  String>(
                                                            controller: _model
                                                                    .dropDownQuarterValueController ??=
                                                                FormFieldController<
                                                                        String>(
                                                                    null),
                                                            options: [
                                                              'Q1',
                                                              'Q2',
                                                              'Q3',
                                                              'Q4'
                                                            ],
                                                            onChanged: (val) =>
                                                                setState(() =>
                                                                    _model.dropDownQuarterValue =
                                                                        val),
                                                            height: 50.0,
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
                                                                          .textSecondary,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                            hintText:
                                                                'Selecione',
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
                                                                        12.0,
                                                                        0.0,
                                                                        12.0,
                                                                        4.0),
                                                            hidesUnderline:
                                                                true,
                                                            disabled: (_model
                                                                            .dropDownAnoValue ==
                                                                        null ||
                                                                    _model.dropDownAnoValue ==
                                                                        '') ||
                                                                (_model.dropDownAnoValue ==
                                                                    'Todos'),
                                                            isSearchable: false,
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
                                      if (_model.organizacao)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 24.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 24.0),
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
                                                                  20.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Objetivos principais',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLargeFamily,
                                                                  fontSize:
                                                                      20.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineLargeFamily),
                                                                ),
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
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () => FocusScope
                                                                      .of(
                                                                          context)
                                                                  .requestFocus(
                                                                      _model
                                                                          .unfocusNode),
                                                              child: Padding(
                                                                padding: MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                                child:
                                                                    ModalAddObjetivoWidget(),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            setState(() {}));
                                                      },
                                                      text: '',
                                                      icon: Icon(
                                                        Icons.add,
                                                        size: 15.0,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width: 40.0,
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
                                                                    6.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            Color(0xFF2E90FA),
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
                                                        elevation: 0.0,
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
                                              if (_model.loadingGeral)
                                                Container(
                                                  height: 400.0,
                                                  constraints: BoxConstraints(
                                                    maxWidth: 1440.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          CircularPercentIndicator(
                                                            percent: 0.7,
                                                            radius: 20.0,
                                                            lineWidth: 6.0,
                                                            animation: true,
                                                            progressColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent4,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              if (!_model.loadingGeral)
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final okr = FFAppState()
                                                                .okrOrganizacaoOKR
                                                                .where((e) =>
                                                                    (functions.isNull(_model.dropDownAnoValue)
                                                                        ? true
                                                                        : (functions.isDateInYear(
                                                                                getJsonField(
                                                                                  e,
                                                                                  r'''$.data_limite''',
                                                                                ).toString(),
                                                                                _model.dropDownAnoValue!) ==
                                                                            true)) &&
                                                                    (functions.isNull(_model.dropDownQuarterValue)
                                                                        ? true
                                                                        : functions.isDateInQuarter(
                                                                            getJsonField(
                                                                              e,
                                                                              r'''$.data_limite''',
                                                                            ).toString(),
                                                                            _model.dropDownQuarterValue!,
                                                                            _model.dropDownAnoValue!)))
                                                                .toList();
                                                            return MasonryGridView
                                                                .count(
                                                              crossAxisCount: 3,
                                                              crossAxisSpacing:
                                                                  24.0,
                                                              mainAxisSpacing:
                                                                  24.0,
                                                              itemCount:
                                                                  okr.length,
                                                              shrinkWrap: true,
                                                              itemBuilder:
                                                                  (context,
                                                                      okrIndex) {
                                                                final okrItem =
                                                                    okr[okrIndex];
                                                                return ObjetivoPrincipalWidget(
                                                                  key: Key(
                                                                      'Keym0w_${okrIndex}_of_${okr.length}'),
                                                                  codigo:
                                                                      getJsonField(
                                                                    okrItem,
                                                                    r'''$.id''',
                                                                  ),
                                                                  data:
                                                                      getJsonField(
                                                                    okrItem,
                                                                    r'''$.data_limite''',
                                                                  ).toString(),
                                                                  titulo:
                                                                      getJsonField(
                                                                    okrItem,
                                                                    r'''$.objetivo''',
                                                                  ).toString(),
                                                                  porcentagem:
                                                                      getJsonField(
                                                                    okrItem,
                                                                    r'''$.porcentagem''',
                                                                  ),
                                                                  json: okrItem,
                                                                  pausado:
                                                                      getJsonField(
                                                                    okrItem,
                                                                    r'''$.pausado''',
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 24.0, 0.0, 24.0),
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
                                                                  20.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Objetivos das áreas',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLargeFamily,
                                                                  fontSize:
                                                                      20.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineLargeFamily),
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              if (_model.loadingArea)
                                                Container(
                                                  height: 400.0,
                                                  constraints: BoxConstraints(
                                                    maxWidth: 1440.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          CircularPercentIndicator(
                                                            percent: 0.7,
                                                            radius: 20.0,
                                                            lineWidth: 6.0,
                                                            animation: true,
                                                            progressColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent4,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              if (!_model.loadingArea)
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Flexible(
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final objetivoArea = FFAppState()
                                                                .okrOrganizacaoObjetivoArea
                                                                .where((e) =>
                                                                    (functions.isNull(_model.dropDownAnoValue)
                                                                        ? true
                                                                        : (functions.isDateInYear(
                                                                                getJsonField(
                                                                                  e,
                                                                                  r'''$.data_limite''',
                                                                                ).toString(),
                                                                                _model.dropDownAnoValue!) ==
                                                                            true)) &&
                                                                    (functions.isNull(_model.dropDownQuarterValue)
                                                                        ? true
                                                                        : functions.isDateInQuarter(
                                                                            getJsonField(
                                                                              e,
                                                                              r'''$.data_limite''',
                                                                            ).toString(),
                                                                            _model.dropDownQuarterValue!,
                                                                            _model.dropDownAnoValue!)))
                                                                .toList();
                                                            return MasonryGridView
                                                                .count(
                                                              crossAxisCount: 3,
                                                              crossAxisSpacing:
                                                                  24.0,
                                                              mainAxisSpacing:
                                                                  24.0,
                                                              itemCount:
                                                                  objetivoArea
                                                                      .length,
                                                              shrinkWrap: true,
                                                              itemBuilder: (context,
                                                                  objetivoAreaIndex) {
                                                                final objetivoAreaItem =
                                                                    objetivoArea[
                                                                        objetivoAreaIndex];
                                                                return ObjetivoAreaWidget(
                                                                  key: Key(
                                                                      'Keyf2n_${objetivoAreaIndex}_of_${objetivoArea.length}'),
                                                                  codigo:
                                                                      getJsonField(
                                                                    objetivoAreaItem,
                                                                    r'''$.id''',
                                                                  ),
                                                                  area:
                                                                      getJsonField(
                                                                    objetivoAreaItem,
                                                                    r'''$.area''',
                                                                  ).toString(),
                                                                  data:
                                                                      getJsonField(
                                                                    objetivoAreaItem,
                                                                    r'''$.data_limite''',
                                                                  ).toString(),
                                                                  tituloPai:
                                                                      getJsonField(
                                                                    objetivoAreaItem,
                                                                    r'''$.okr.objetivo''',
                                                                  ).toString(),
                                                                  titulo:
                                                                      getJsonField(
                                                                    objetivoAreaItem,
                                                                    r'''$.titulo''',
                                                                  ).toString(),
                                                                  porcentagem:
                                                                      getJsonField(
                                                                    objetivoAreaItem,
                                                                    r'''$.porcentagem''',
                                                                  ),
                                                                  json:
                                                                      objetivoAreaItem,
                                                                  pausado:
                                                                      getJsonField(
                                                                    objetivoAreaItem,
                                                                    r'''$.pausado''',
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                            ],
                                          ),
                                        ),
                                      if (_model.area)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 24.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 24.0),
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
                                                                  20.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Objetivos das áreas',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLargeFamily,
                                                                  fontSize:
                                                                      20.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineLargeFamily),
                                                                ),
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
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () => FocusScope
                                                                      .of(
                                                                          context)
                                                                  .requestFocus(
                                                                      _model
                                                                          .unfocusNode),
                                                              child: Padding(
                                                                padding: MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                                child:
                                                                    ModalAddObjetivoAreaWidget(),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            setState(() {}));
                                                      },
                                                      text: '',
                                                      icon: Icon(
                                                        Icons.add,
                                                        size: 15.0,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width: 40.0,
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
                                                                    6.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            Color(0xFFD444F1),
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
                                                        elevation: 0.0,
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
                                              if (!_model.loadingArea)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 32.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Flexible(
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Builder(
                                                            builder: (context) {
                                                              final objetivoArea = FFAppState()
                                                                  .okrAreaObjetivoArea
                                                                  .where((e) =>
                                                                      (functions.isNull(_model.dropDownAnoValue)
                                                                          ? true
                                                                          : (functions.isDateInYear(
                                                                                  getJsonField(
                                                                                    e,
                                                                                    r'''$.data_limite''',
                                                                                  ).toString(),
                                                                                  _model.dropDownAnoValue!) ==
                                                                              true)) &&
                                                                      (functions.isNull(_model.dropDownQuarterValue)
                                                                          ? true
                                                                          : functions.isDateInQuarter(
                                                                              getJsonField(
                                                                                e,
                                                                                r'''$.data_limite''',
                                                                              ).toString(),
                                                                              _model.dropDownQuarterValue!,
                                                                              _model.dropDownAnoValue!)) &&
                                                                      (functions.isNull(_model.dropDownAreaValue)
                                                                          ? true
                                                                          : (getJsonField(
                                                                                e,
                                                                                r'''$.area''',
                                                                              ) ==
                                                                              _model.dropDownAreaValue)))
                                                                  .toList();
                                                              return MasonryGridView
                                                                  .count(
                                                                crossAxisCount:
                                                                    3,
                                                                crossAxisSpacing:
                                                                    24.0,
                                                                mainAxisSpacing:
                                                                    24.0,
                                                                itemCount:
                                                                    objetivoArea
                                                                        .length,
                                                                shrinkWrap:
                                                                    true,
                                                                itemBuilder:
                                                                    (context,
                                                                        objetivoAreaIndex) {
                                                                  final objetivoAreaItem =
                                                                      objetivoArea[
                                                                          objetivoAreaIndex];
                                                                  return ObjetivoAreaWidget(
                                                                    key: Key(
                                                                        'Keyi5k_${objetivoAreaIndex}_of_${objetivoArea.length}'),
                                                                    codigo:
                                                                        getJsonField(
                                                                      objetivoAreaItem,
                                                                      r'''$.id''',
                                                                    ),
                                                                    area:
                                                                        getJsonField(
                                                                      objetivoAreaItem,
                                                                      r'''$.area''',
                                                                    ).toString(),
                                                                    data:
                                                                        getJsonField(
                                                                      objetivoAreaItem,
                                                                      r'''$.data_limite''',
                                                                    ).toString(),
                                                                    tituloPai:
                                                                        getJsonField(
                                                                      objetivoAreaItem,
                                                                      r'''$.okr.objetivo''',
                                                                    ).toString(),
                                                                    titulo:
                                                                        getJsonField(
                                                                      objetivoAreaItem,
                                                                      r'''$.titulo''',
                                                                    ).toString(),
                                                                    porcentagem:
                                                                        getJsonField(
                                                                      objetivoAreaItem,
                                                                      r'''$.porcentagem''',
                                                                    ),
                                                                    json:
                                                                        objetivoAreaItem,
                                                                    pausado:
                                                                        getJsonField(
                                                                      objetivoAreaItem,
                                                                      r'''$.pausado''',
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              if (_model.loadingArea)
                                                Container(
                                                  height: 400.0,
                                                  constraints: BoxConstraints(
                                                    maxWidth: 1440.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          CircularPercentIndicator(
                                                            percent: 0.7,
                                                            radius: 20.0,
                                                            lineWidth: 6.0,
                                                            animation: true,
                                                            progressColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent4,
                                                          ),
                                                        ],
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
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  20.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Resultados chave',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLargeFamily,
                                                                  fontSize:
                                                                      20.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineLargeFamily),
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              if (_model.loadingResultado)
                                                Container(
                                                  height: 400.0,
                                                  constraints: BoxConstraints(
                                                    maxWidth: 1440.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          CircularPercentIndicator(
                                                            percent: 0.7,
                                                            radius: 20.0,
                                                            lineWidth: 6.0,
                                                            animation: true,
                                                            progressColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent4,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              if (!_model.loadingResultado)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 32.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Flexible(
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Builder(
                                                            builder: (context) {
                                                              final resultado = FFAppState()
                                                                  .okrAreaResultadoChave
                                                                  .where((e) =>
                                                                      (functions.isNull(_model.dropDownAnoValue)
                                                                          ? true
                                                                          : (functions.isDateInYear(
                                                                                  getJsonField(
                                                                                    e,
                                                                                    r'''$.data_limite''',
                                                                                  ).toString(),
                                                                                  _model.dropDownAnoValue!) ==
                                                                              true)) &&
                                                                      (functions.isNull(_model.dropDownQuarterValue)
                                                                          ? true
                                                                          : functions.isDateInQuarter(
                                                                              getJsonField(
                                                                                e,
                                                                                r'''$.data_limite''',
                                                                              ).toString(),
                                                                              _model.dropDownQuarterValue!,
                                                                              _model.dropDownAnoValue!)) &&
                                                                      (functions.isNull(_model.dropDownAreaValue)
                                                                          ? true
                                                                          : (getJsonField(
                                                                                e,
                                                                                r'''$.objetivo.area''',
                                                                              ) ==
                                                                              _model.dropDownAreaValue)))
                                                                  .toList();
                                                              return MasonryGridView
                                                                  .count(
                                                                crossAxisCount:
                                                                    3,
                                                                crossAxisSpacing:
                                                                    24.0,
                                                                mainAxisSpacing:
                                                                    24.0,
                                                                itemCount:
                                                                    resultado
                                                                        .length,
                                                                shrinkWrap:
                                                                    true,
                                                                itemBuilder:
                                                                    (context,
                                                                        resultadoIndex) {
                                                                  final resultadoItem =
                                                                      resultado[
                                                                          resultadoIndex];
                                                                  return ResultadoChaveWidget(
                                                                    key: Key(
                                                                        'Keyvgf_${resultadoIndex}_of_${resultado.length}'),
                                                                    codigo:
                                                                        getJsonField(
                                                                      resultadoItem,
                                                                      r'''$.id''',
                                                                    ),
                                                                    area:
                                                                        getJsonField(
                                                                      resultadoItem,
                                                                      r'''$.objetivo.area''',
                                                                    ).toString(),
                                                                    data:
                                                                        getJsonField(
                                                                      resultadoItem,
                                                                      r'''$.data_limite''',
                                                                    ).toString(),
                                                                    tituloPai:
                                                                        getJsonField(
                                                                      resultadoItem,
                                                                      r'''$.objetivo.titulo''',
                                                                    ).toString(),
                                                                    titulo:
                                                                        getJsonField(
                                                                      resultadoItem,
                                                                      r'''$.titulo''',
                                                                    ).toString(),
                                                                    porcentagem:
                                                                        getJsonField(
                                                                      resultadoItem,
                                                                      r'''$.porcentagem''',
                                                                    ),
                                                                    jsonIniciativas:
                                                                        getJsonField(
                                                                      resultadoItem,
                                                                      r'''$.iniciativas''',
                                                                    )!,
                                                                    pausado:
                                                                        getJsonField(
                                                                      resultadoItem,
                                                                      r'''$.pausado''',
                                                                    ),
                                                                    json:
                                                                        resultadoItem,
                                                                  );
                                                                },
                                                              );
                                                            },
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
    );
  }
}
