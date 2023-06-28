import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'modal_inserir_comentario_aprovar_horas_item_model.dart';
export 'modal_inserir_comentario_aprovar_horas_item_model.dart';

class ModalInserirComentarioAprovarHorasItemWidget extends StatefulWidget {
  const ModalInserirComentarioAprovarHorasItemWidget({
    Key? key,
    this.id,
    this.coment,
    this.obrigatorio,
    this.isNew,
  }) : super(key: key);

  final int? id;
  final String? coment;
  final bool? obrigatorio;
  final bool? isNew;

  @override
  _ModalInserirComentarioAprovarHorasItemWidgetState createState() =>
      _ModalInserirComentarioAprovarHorasItemWidgetState();
}

class _ModalInserirComentarioAprovarHorasItemWidgetState
    extends State<ModalInserirComentarioAprovarHorasItemWidget> {
  late ModalInserirComentarioAprovarHorasItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(
        context, () => ModalInserirComentarioAprovarHorasItemModel());

    _model.supportResponseController ??=
        TextEditingController(text: widget.coment);
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
        color: Color(0x00161616),
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
              color: Colors.white,
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
                            Text(
                              'Comentário',
                              style: FlutterFlowTheme.of(context).headlineSmall,
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
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 16.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 16.0),
                                child: Wrap(
                                  spacing: 16.0,
                                  runSpacing: 16.0,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Text(
                                              'Escreva abaixo',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ),
                                          TextFormField(
                                            controller: _model
                                                .supportResponseController,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                              hintText: 'Escrever aqui',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .borderSubtle01,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .supportErrorInverse,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
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
                                                    BorderRadius.circular(8.0),
                                              ),
                                              filled: true,
                                              fillColor: Color(0xFFF0F5FA),
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(14.0, 10.0,
                                                          14.0, 10.0),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                            validator: _model
                                                .supportResponseControllerValidator
                                                .asValidator(context),
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
                    Container(
                      constraints: BoxConstraints(
                        maxHeight: 80.0,
                      ),
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 16.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
                                            if (widget.obrigatorio == true) {
                                              if (_model.supportResponseController
                                                          .text ==
                                                      null ||
                                                  _model.supportResponseController
                                                          .text ==
                                                      '') {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Insira um comentário'),
                                                      content: Text(
                                                          'Comentários são obrigatórios quando um apontamento é recusado.'),
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
                                              } else {
                                                if (widget.isNew == true) {
                                                  if (functions
                                                          .checkIdAprovarHorasItem(
                                                              widget.id!,
                                                              'Aprovado',
                                                              FFAppState()
                                                                  .aprovarHorasList
                                                                  .toList()) ==
                                                      true) {
                                                    setState(() {
                                                      FFAppState()
                                                              .aprovarHorasList =
                                                          functions
                                                              .removeAprovarHorasItem(
                                                                  FFAppState()
                                                                      .aprovarHorasList
                                                                      .toList(),
                                                                  widget.id!)
                                                              .toList()
                                                              .cast<dynamic>();
                                                    });
                                                    setState(() {
                                                      FFAppState()
                                                          .addToAprovarHorasList(
                                                              functions
                                                                  .createAprovarHorasItem(
                                                                      widget
                                                                          .id!,
                                                                      'Recusado'));
                                                    });
                                                  } else {
                                                    setState(() {
                                                      FFAppState()
                                                          .addToAprovarHorasList(
                                                              functions
                                                                  .createAprovarHorasItem(
                                                                      widget
                                                                          .id!,
                                                                      'Recusado'));
                                                    });
                                                  }

                                                  FFAppState().update(() {
                                                    FFAppState()
                                                            .aprovarHorasList =
                                                        functions
                                                            .insertCommentaryAtAprovarHorasItem(
                                                                FFAppState()
                                                                    .aprovarHorasList
                                                                    .toList(),
                                                                widget.id!,
                                                                _model
                                                                    .supportResponseController
                                                                    .text)
                                                            .toList()
                                                            .cast<dynamic>();
                                                  });
                                                } else {
                                                  FFAppState().update(() {
                                                    FFAppState()
                                                            .aprovarHorasList =
                                                        functions
                                                            .insertCommentaryAtAprovarHorasItem(
                                                                FFAppState()
                                                                    .aprovarHorasList
                                                                    .toList(),
                                                                widget.id!,
                                                                _model
                                                                    .supportResponseController
                                                                    .text)
                                                            .toList()
                                                            .cast<dynamic>();
                                                  });
                                                }

                                                Navigator.pop(context);
                                              }
                                            } else {
                                              FFAppState().update(() {
                                                FFAppState().aprovarHorasList = functions
                                                    .insertCommentaryAtAprovarHorasItem(
                                                        FFAppState()
                                                            .aprovarHorasList
                                                            .toList(),
                                                        widget.id!,
                                                        _model
                                                            .supportResponseController
                                                            .text)
                                                    .toList()
                                                    .cast<dynamic>();
                                              });
                                              Navigator.pop(context);
                                            }
                                          },
                                          text: 'Salvar',
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
    );
  }
}
