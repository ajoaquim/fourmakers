import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'modal_grupo_risco_model.dart';
export 'modal_grupo_risco_model.dart';

class ModalGrupoRiscoWidget extends StatefulWidget {
  const ModalGrupoRiscoWidget({
    Key? key,
    this.manager,
    this.ancora,
    this.perfilmbti,
    this.mentor,
    this.colaborador,
    this.idcolaborador,
    this.meta1,
    this.meta2,
    this.meta3,
    this.prazo1,
    this.prazo2,
    this.prazo3,
  }) : super(key: key);

  final String? manager;
  final String? ancora;
  final String? perfilmbti;
  final String? mentor;
  final String? colaborador;
  final int? idcolaborador;
  final String? meta1;
  final String? meta2;
  final String? meta3;
  final DateTime? prazo1;
  final DateTime? prazo2;
  final DateTime? prazo3;

  @override
  _ModalGrupoRiscoWidgetState createState() => _ModalGrupoRiscoWidgetState();
}

class _ModalGrupoRiscoWidgetState extends State<ModalGrupoRiscoWidget> {
  late ModalGrupoRiscoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModalGrupoRiscoModel());

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
      decoration: BoxDecoration(),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
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
                              'Grupos de risco',
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
                        maxHeight: MediaQuery.of(context).size.height * 0.7,
                      ),
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 16.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                'Idade igual ou superior a 60 anos;\nTabagismo;\nObesidade;\nMiocardiopatias de diferentes etiologias (insuficiência cardíaca, miocardiopatia isquêmica etc.);\nHipertensão arterial;\nDoença cerebrovascular;\nPneumopatias graves ou descompensadas (asma moderada/grave, DPOC);\nImunodepressão e imunossupressão;\nDoenças renais crônicas em estágio avançado (graus 3, 4 e 5);\nDiabetes melito, conforme juízo clínico;\nDoenças cromossômicas com estado de fragilidade imunológica;\nNeoplasia maligna (exceto câncer não melanótico de pele);\nCirrose hepática;\nAlgumas doenças hematológicas (incluindo anemia falciforme e talassemia);\nGestação.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontSize: 16.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                      lineHeight: 1.5,
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
