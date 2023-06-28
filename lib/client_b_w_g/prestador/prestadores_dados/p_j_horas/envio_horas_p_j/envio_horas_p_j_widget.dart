import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'envio_horas_p_j_model.dart';
export 'envio_horas_p_j_model.dart';

class EnvioHorasPJWidget extends StatefulWidget {
  const EnvioHorasPJWidget({Key? key}) : super(key: key);

  @override
  _EnvioHorasPJWidgetState createState() => _EnvioHorasPJWidgetState();
}

class _EnvioHorasPJWidgetState extends State<EnvioHorasPJWidget> {
  late EnvioHorasPJModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EnvioHorasPJModel());

    _model.inputModalidadeController ??= TextEditingController(
        text: FFAppState().minhaAlocacao != null
            ? getJsonField(
                FFAppState().minhaAlocacao,
                r'''$[0].modality''',
              ).toString().toString()
            : 'Selecione o projeto');
    _model.inputValorHoraController ??= TextEditingController(
        text: FFAppState().minhaAlocacao != null
            ? getJsonField(
                FFAppState().minhaAlocacao,
                r'''$[0].value''',
              ).toString().toString()
            : 'Selecione o projeto');
    _model.inputAnoController ??= TextEditingController();
    _model.inputHorasController ??= TextEditingController();
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
            constraints: BoxConstraints(
              maxWidth: 750.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
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
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Envio de horas trabalhadas',
                                style:
                                    FlutterFlowTheme.of(context).headlineSmall,
                              ),
                            ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 60.0,
                              icon: Icon(
                                Icons.close_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 30.0,
                              ),
                              onPressed: () async {
                                Navigator.pop(context);
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
                    Container(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.5,
                      ),
                      decoration: BoxDecoration(),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Wrap(
                                    spacing: 24.0,
                                    runSpacing: 24.0,
                                    alignment: WrapAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.start,
                                    verticalDirection: VerticalDirection.down,
                                    clipBehavior: Clip.none,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Text(
                                              'Empresa',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    1.0, 1.0, 1.0, 1.0),
                                            child: FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .dropEmpresaValueController ??=
                                                  FormFieldController<String>(
                                                _model.dropEmpresaValue ??=
                                                    'Selecione a empresa',
                                              ),
                                              options: FFAppState()
                                                  .minhaEmpresa
                                                  .map((e) => getJsonField(
                                                        e,
                                                        r'''$.empresa.nomefantasia''',
                                                      ))
                                                  .toList()
                                                  .map((e) => e.toString())
                                                  .toList(),
                                              onChanged: (val) async {
                                                setState(() => _model
                                                    .dropEmpresaValue = val);
                                                FFAppState().update(() {
                                                  FFAppState().meusProjetos =
                                                      null;
                                                  FFAppState().minhaAlocacao =
                                                      null;
                                                });
                                                FFAppState().update(() {
                                                  FFAppState()
                                                          .empresaSelecionada =
                                                      functions.getIdEmpresabyName(
                                                          FFAppState()
                                                              .minhasEmpresas,
                                                          _model
                                                              .dropEmpresaValue)!;
                                                });
                                                _model.listouProjetos =
                                                    await ProjetosGroup
                                                        .obterProjetosAlocadosCall
                                                        .call(
                                                  idPrestador:
                                                      FFAppState().prestadorID,
                                                  idEmpresa: FFAppState()
                                                      .empresaSelecionada,
                                                );
                                                if ((_model.listouProjetos
                                                        ?.succeeded ??
                                                    true)) {
                                                  FFAppState().update(() {
                                                    FFAppState().meusProjetos =
                                                        (_model.listouProjetos
                                                                ?.jsonBody ??
                                                            '');
                                                    FFAppState()
                                                        .meuProjeto = (_model
                                                                .listouProjetos
                                                                ?.jsonBody ??
                                                            '')
                                                        .toList()
                                                        .cast<dynamic>();
                                                  });
                                                }

                                                setState(() {});
                                              },
                                              width: FFAppState().coluna3,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                              hintText: 'Selecione a empresa',
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .field02,
                                              elevation: 2.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .borderSubtle01,
                                              borderWidth: 0.0,
                                              borderRadius: 8.0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              hidesUnderline: true,
                                              isSearchable: false,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Text(
                                              'Projeto',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    1.0, 1.0, 1.0, 1.0),
                                            child: FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .dropProjetoValueController ??=
                                                  FormFieldController<String>(
                                                      null),
                                              options: FFAppState()
                                                  .meuProjeto
                                                  .map((e) => getJsonField(
                                                        e,
                                                        r'''$.projeto..name''',
                                                      ))
                                                  .toList()
                                                  .map((e) => e.toString())
                                                  .toList(),
                                              onChanged: (val) async {
                                                setState(() => _model
                                                    .dropProjetoValue = val);
                                                FFAppState().update(() {
                                                  FFAppState()
                                                          .projetoSelecionado =
                                                      functions.getIdProjetobyName(
                                                          FFAppState()
                                                              .meusProjetos,
                                                          _model
                                                              .dropProjetoValue)!;
                                                  FFAppState()
                                                          .projetoSelecionadoName =
                                                      _model.dropProjetoValue!;
                                                });
                                                FFAppState().update(() {
                                                  FFAppState().minhaAlocacao =
                                                      functions.getProjetoByID(
                                                          FFAppState()
                                                              .meusProjetos,
                                                          FFAppState()
                                                              .projetoSelecionado)!;
                                                });
                                                await Future.delayed(
                                                    const Duration(
                                                        milliseconds: 100));
                                                setState(() {
                                                  _model
                                                      .inputModalidadeController
                                                      ?.text = getJsonField(
                                                    FFAppState().minhaAlocacao,
                                                    r'''$[0].modality''',
                                                  ).toString();
                                                });
                                                setState(() {
                                                  _model
                                                      .inputValorHoraController
                                                      ?.text = getJsonField(
                                                    FFAppState().minhaAlocacao,
                                                    r'''$[0].value''',
                                                  ).toString();
                                                });
                                              },
                                              width: FFAppState().coluna3,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                              hintText: 'Selecione o projeto',
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .field02,
                                              elevation: 2.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .borderSubtle01,
                                              borderWidth: 0.0,
                                              borderRadius: 8.0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 12.0, 0.0),
                                              hidesUnderline: true,
                                              isSearchable: true,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Text(
                                              'Modalidade',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                            ),
                                          ),
                                          Container(
                                            width: 150.0,
                                            child: TextFormField(
                                              controller: _model
                                                  .inputModalidadeController,
                                              readOnly: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall,
                                                hintText: 'Selecione o projeto',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .borderSubtle01,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .borderSubtle01,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .supportErrorInverse,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .supportErrorInverse,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .field02,
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(20.0, 20.0,
                                                            20.0, 20.0),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .textHelper,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                              validator: _model
                                                  .inputModalidadeControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Text(
                                              'Valor Definido / Valor Hora',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                            ),
                                          ),
                                          Stack(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            children: [
                                              Container(
                                                width: 150.0,
                                                child: TextFormField(
                                                  controller: _model
                                                      .inputValorHoraController,
                                                  readOnly: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmall,
                                                    hintText:
                                                        'Selecione o projeto',
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmall,
                                                    enabledBorder:
                                                        OutlineInputBorder(
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
                                                    focusedBorder:
                                                        OutlineInputBorder(
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
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .supportErrorInverse,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .supportErrorInverse,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .field02,
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                40.0,
                                                                20.0,
                                                                20.0,
                                                                20.0),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .textHelper,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                  textAlign: TextAlign.start,
                                                  validator: _model
                                                      .inputValorHoraControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 8.0, 2.0),
                                                child: Text(
                                                  'R\$',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Text(
                                              'Ano referência',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                            ),
                                          ),
                                          Container(
                                            width: 150.0,
                                            child: TextFormField(
                                              controller:
                                                  _model.inputAnoController,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall,
                                                hintText: 'Informe o ano',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .borderSubtle01,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .borderSubtle01,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .supportErrorInverse,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .supportErrorInverse,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .field02,
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(20.0, 20.0,
                                                            20.0, 20.0),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                              validator: _model
                                                  .inputAnoControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Text(
                                              'Mês referência',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    1.0, 1.0, 1.0, 1.0),
                                            child: FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .dropMesValueController ??=
                                                  FormFieldController<String>(
                                                      null),
                                              options: [
                                                'Janeiro',
                                                'Fevereiro',
                                                'Março',
                                                'Abril',
                                                'Maio',
                                                'Junho',
                                                'Julho',
                                                'Agosto',
                                                'Setembro',
                                                'Outrubro',
                                                'Novembro',
                                                'Dezembro'
                                              ],
                                              onChanged: (val) => setState(() =>
                                                  _model.dropMesValue = val),
                                              width: 150.0,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                              hintText: 'Selecione o mês',
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .field02,
                                              elevation: 2.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .borderSubtle01,
                                              borderWidth: 0.0,
                                              borderRadius: 8.0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              hidesUnderline: true,
                                              isSearchable: false,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Text(
                                              'Horas trabalhadas',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                            ),
                                          ),
                                          Container(
                                            width: 150.0,
                                            child: TextFormField(
                                              controller:
                                                  _model.inputHorasController,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall,
                                                hintText: 'Total de horas',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .borderSubtle01,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .borderSubtle01,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .supportErrorInverse,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .supportErrorInverse,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .field02,
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(20.0, 20.0,
                                                            20.0, 20.0),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                              validator: _model
                                                  .inputHorasControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 16.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
                                            Navigator.pop(context);
                                          },
                                          text: 'Cancelar',
                                          options: FFButtonOptions(
                                            width: 130.0,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
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
                                                              .secondaryText,
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .borderSubtle01,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            _model.apontarHoras =
                                                await PrestadorGroup
                                                    .postApontamentosCall
                                                    .call(
                                              userId: FFAppState().prestadorID,
                                              totalHoras: double.tryParse(_model
                                                  .inputHorasController.text),
                                              hasCommentary: false,
                                              mes: _model.dropMesValue,
                                              ano: _model
                                                  .inputAnoController.text,
                                              valorHora: functions.valorHora(
                                                  _model
                                                      .inputValorHoraController
                                                      .text),
                                              modalidade: _model
                                                  .inputModalidadeController
                                                  .text,
                                              status: 'Pendente',
                                              empresaId: FFAppState()
                                                  .empresaSelecionada,
                                              projetoId: FFAppState()
                                                  .projetoSelecionado,
                                              regimeTributario: getJsonField(
                                                FFAppState().userData,
                                                r'''$.regimetributario''',
                                              ).toString(),
                                            );
                                            if ((_model
                                                    .apontarHoras?.succeeded ??
                                                true)) {
                                              Navigator.pop(context);
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    content: Text(
                                                        'Horas apontadas com sucesso. Aguarde o retorno da sua empresa.'),
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
                                              _model.atualizouHoras =
                                                  await PrestadorGroup
                                                      .getApontamentosPrestadorCall
                                                      .call(
                                                idPrestador:
                                                    FFAppState().prestadorID,
                                              );
                                              if ((_model.atualizouHoras
                                                      ?.succeeded ??
                                                  true)) {
                                                FFAppState().update(() {
                                                  FFAppState().prestadorHoras =
                                                      (_model.atualizouHoras
                                                              ?.jsonBody ??
                                                          '');
                                                  FFAppState().minhasHoras =
                                                      (_model.atualizouHoras
                                                                  ?.jsonBody ??
                                                              '')
                                                          .toList()
                                                          .cast<dynamic>();
                                                });
                                              }
                                              _model.minhasEmpresas =
                                                  await EmpresaGroup
                                                      .getEmpresaPrestadorCall
                                                      .call(
                                                idPrestador:
                                                    FFAppState().prestadorID,
                                              );
                                              if ((_model.minhasEmpresas
                                                      ?.succeeded ??
                                                  true)) {
                                                FFAppState().update(() {
                                                  FFAppState().minhaEmpresa =
                                                      (_model.minhasEmpresas
                                                                  ?.jsonBody ??
                                                              '')
                                                          .toList()
                                                          .cast<dynamic>();
                                                  FFAppState().minhasEmpresas =
                                                      (_model.minhasEmpresas
                                                              ?.jsonBody ??
                                                          '');
                                                });
                                              }
                                              _model.meusProjetos =
                                                  await ProjetosGroup
                                                      .obterAlocacoesPrestadorCall
                                                      .call(
                                                idPrestador:
                                                    FFAppState().prestadorID,
                                              );
                                              if ((_model.meusProjetos
                                                      ?.succeeded ??
                                                  true)) {
                                                FFAppState().update(() {
                                                  FFAppState().meuProjeto =
                                                      (_model.meusProjetos
                                                                  ?.jsonBody ??
                                                              '')
                                                          .toList()
                                                          .cast<dynamic>();
                                                  FFAppState().meusProjetos =
                                                      (_model.meusProjetos
                                                              ?.jsonBody ??
                                                          '');
                                                });
                                              }
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    content: Text(
                                                        'Falha ao apontar as horas. Contate o administrador.'),
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

                                            setState(() {});
                                          },
                                          text: 'Enviar solicitação',
                                          options: FFButtonOptions(
                                            width: 150.0,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
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
    );
  }
}
