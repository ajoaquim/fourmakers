import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';

import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => appStateNotifier.showSplashImage
          ? Builder(
              builder: (context) => Container(
                color: Color(0xFF040228),
                child: Center(
                  child: Image.asset(
                    'assets/images/logo-darkmode.png',
                    width: 300.0,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            )
          : LoginSlide1Widget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.showSplashImage
              ? Builder(
                  builder: (context) => Container(
                    color: Color(0xFF040228),
                    child: Center(
                      child: Image.asset(
                        'assets/images/logo-darkmode.png',
                        width: 300.0,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                )
              : LoginSlide1Widget(),
          routes: [
            FFRoute(
              name: 'signUp',
              path: 'signUp',
              builder: (context, params) => SignUpWidget(),
            ),
            FFRoute(
              name: 'signIn',
              path: 'signIn',
              builder: (context, params) => SignInWidget(),
            ),
            FFRoute(
              name: 'phoneSignIn',
              path: 'phoneSignIn',
              builder: (context, params) => PhoneSignInWidget(),
            ),
            FFRoute(
              name: 'phoneVerify',
              path: 'phoneVerify',
              builder: (context, params) => PhoneVerifyWidget(),
            ),
            FFRoute(
              name: 'forgotPassword',
              path: 'forgotPassword',
              builder: (context, params) => ForgotPasswordWidget(),
            ),
            FFRoute(
              name: 'loadingPage',
              path: 'loading',
              builder: (context, params) => LoadingPageWidget(),
            ),
            FFRoute(
              name: 'home',
              path: 'home',
              builder: (context, params) => HomeWidget(),
            ),
            FFRoute(
              name: 'homeDashboard',
              path: 'homeDashboard',
              builder: (context, params) => HomeDashboardWidget(),
            ),
            FFRoute(
              name: 'felizometro',
              path: 'felizometro',
              builder: (context, params) => FelizometroWidget(),
            ),
            FFRoute(
              name: 'verpdi',
              path: 'verpdi',
              builder: (context, params) => VerpdiWidget(
                id: params.getParam('id', ParamType.int),
              ),
            ),
            FFRoute(
              name: 'DadosAcademicos_Formacoes',
              path: 'dadosacademicos',
              builder: (context, params) => DadosAcademicosFormacoesWidget(),
            ),
            FFRoute(
              name: 'loginSlide1',
              path: 'login1',
              builder: (context, params) => LoginSlide1Widget(),
            ),
            FFRoute(
              name: 'DadosProfissionais_Competencias',
              path: 'dadosprofissionais',
              builder: (context, params) =>
                  DadosProfissionaisCompetenciasWidget(),
            ),
            FFRoute(
              name: 'DadosPessoaisNew',
              path: 'dadospessoais',
              builder: (context, params) => DadosPessoaisNewWidget(),
            ),
            FFRoute(
              name: 'VagasPJ',
              path: 'prestador/vagas',
              builder: (context, params) => VagasPJWidget(),
            ),
            FFRoute(
              name: 'loginSlide2',
              path: 'login2',
              builder: (context, params) => LoginSlide2Widget(
                code: params.getParam('code', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Vagasv1like',
              path: 'vagaslike',
              builder: (context, params) => Vagasv1likeWidget(),
            ),
            FFRoute(
              name: 'Vagasv1modal',
              path: 'vagasmodal',
              builder: (context, params) => Vagasv1modalWidget(),
            ),
            FFRoute(
              name: 'Vagasv1modal3',
              path: 'vagasmodal3',
              builder: (context, params) => Vagasv1modal3Widget(),
            ),
            FFRoute(
              name: 'Vagasv1modal2',
              path: 'vagasmodal2',
              builder: (context, params) => Vagasv1modal2Widget(),
            ),
            FFRoute(
              name: 'Vagasv1modal1',
              path: 'vagasmodal1',
              builder: (context, params) => Vagasv1modal1Widget(),
            ),
            FFRoute(
              name: 'criarpdi',
              path: 'criarpdi',
              builder: (context, params) => CriarpdiWidget(
                id: params.getParam('id', ParamType.int),
              ),
            ),
            FFRoute(
              name: 'meuspdis',
              path: 'pdiOLD',
              builder: (context, params) => MeuspdisWidget(
                modal: params.getParam('modal', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'novoProjeto',
              path: 'empresa/projetos/novo',
              builder: (context, params) => NovoProjetoWidget(),
            ),
            FFRoute(
              name: 'projetos',
              path: 'empresa/projetos',
              builder: (context, params) => ProjetosWidget(),
            ),
            FFRoute(
              name: 'homeEmpresa',
              path: 'empresa/home',
              builder: (context, params) => HomeEmpresaWidget(),
            ),
            FFRoute(
              name: 'verprojeto',
              path: 'empresa/verprojeto',
              builder: (context, params) => VerprojetoWidget(
                projectId: params.getParam('projectId', ParamType.int),
                projectName: params.getParam('projectName', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'pditime',
              path: 'pditime',
              builder: (context, params) => PditimeWidget(
                modal: params.getParam('modal', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'apontamentoHorasPJ',
              path: 'prestador/apontamento',
              builder: (context, params) => ApontamentoHorasPJWidget(),
            ),
            FFRoute(
              name: 'DadosProfissionais_Experiencias',
              path: 'experienciasprofissionais',
              builder: (context, params) =>
                  DadosProfissionaisExperienciasWidget(),
            ),
            FFRoute(
              name: 'DadosProfissionais_Curriculo',
              path: 'curriculo',
              builder: (context, params) => DadosProfissionaisCurriculoWidget(),
            ),
            FFRoute(
              name: 'historicoPagamentoPJ',
              path: 'prestador/pagamentos',
              builder: (context, params) => HistoricoPagamentoPJWidget(),
            ),
            FFRoute(
              name: 'LandingPage',
              path: 'landingPage',
              builder: (context, params) => LandingPageWidget(),
            ),
            FFRoute(
              name: 'support',
              path: 'ajuda',
              builder: (context, params) => SupportWidget(),
            ),
            FFRoute(
              name: 'AjudaBKP',
              path: 'ajudabkp',
              builder: (context, params) => AjudaBKPWidget(),
            ),
            FFRoute(
              name: 'homeCandidato',
              path: 'homecandidato',
              builder: (context, params) => HomeCandidatoWidget(),
            ),
            FFRoute(
              name: 'prestadoresBackoffice',
              path: 'empresa/prestadores',
              builder: (context, params) => PrestadoresBackofficeWidget(),
            ),
            FFRoute(
              name: 'dadosPessoaisPJBackoffice',
              path: 'empresa/prestadores/dadospessoais',
              builder: (context, params) => DadosPessoaisPJBackofficeWidget(
                index: params.getParam('index', ParamType.int),
              ),
            ),
            FFRoute(
              name: 'dadosPJPJBackoffice',
              path: 'empresa/prestadores/dadospj',
              builder: (context, params) => DadosPJPJBackofficeWidget(
                index: params.getParam('index', ParamType.int),
              ),
            ),
            FFRoute(
              name: 'dadosProjetosPJBackoffice',
              path: 'empresa/prestadores/projetos',
              builder: (context, params) => DadosProjetosPJBackofficeWidget(
                index: params.getParam('index', ParamType.int),
              ),
            ),
            FFRoute(
              name: 'DadosPessoaisEstrangeiros',
              path: 'dadosestrangeiros',
              builder: (context, params) => DadosPessoaisEstrangeirosWidget(),
            ),
            FFRoute(
              name: 'supportBackoffice',
              path: 'ajuda/backoffice',
              builder: (context, params) => SupportBackofficeWidget(),
            ),
            FFRoute(
              name: 'dadosPessoaisPJ',
              path: 'prestador/dadospessoais',
              builder: (context, params) => DadosPessoaisPJWidget(
                index: params.getParam('index', ParamType.int),
              ),
            ),
            FFRoute(
              name: 'DadosProfissionais_Certificados',
              path: 'certificados',
              builder: (context, params) =>
                  DadosProfissionaisCertificadosWidget(),
            ),
            FFRoute(
              name: 'beneficios',
              path: 'empresa/beneficios',
              builder: (context, params) => BeneficiosWidget(),
            ),
            FFRoute(
              name: 'loginPJ',
              path: 'prestador/login',
              builder: (context, params) => LoginPJWidget(),
            ),
            FFRoute(
              name: 'homePJ',
              path: 'prestador/home',
              builder: (context, params) => HomePJWidget(),
            ),
            FFRoute(
              name: 'loginempresa',
              path: 'empresa/login',
              builder: (context, params) => LoginempresaWidget(),
            ),
            FFRoute(
              name: 'apontamentosEmpresa',
              path: 'empresa/apontamentos',
              builder: (context, params) => ApontamentosEmpresaWidget(),
            ),
            FFRoute(
              name: 'minhaEmpresa',
              path: 'empresa/perfil',
              builder: (context, params) => MinhaEmpresaWidget(),
            ),
            FFRoute(
              name: 'cadastroEmpresa',
              path: 'empresa/cadastro',
              builder: (context, params) => CadastroEmpresaWidget(),
            ),
            FFRoute(
              name: 'sendEmailPJ',
              path: 'prestador/recuperarsenha',
              builder: (context, params) => SendEmailPJWidget(),
            ),
            FFRoute(
              name: 'changePasswordPJ',
              path: 'prestador/redefinirsenha',
              builder: (context, params) => ChangePasswordPJWidget(
                token: params.getParam('token', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'cadastroPJ',
              path: 'prestador/cadastro',
              builder: (context, params) => CadastroPJWidget(
                isInvite: params.getParam('isInvite', ParamType.bool),
                token: params.getParam('token', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'sendEmailEmpresa',
              path: 'empresa/recuperarsenha',
              builder: (context, params) => SendEmailEmpresaWidget(),
            ),
            FFRoute(
              name: 'changePasswordEmpresa',
              path: 'empresa/redefinirsenha',
              builder: (context, params) => ChangePasswordEmpresaWidget(
                token: params.getParam('token', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'loadingPJ',
              path: 'prestador/loading',
              builder: (context, params) => LoadingPJWidget(),
            ),
            FFRoute(
              name: 'loadingEmpresa',
              path: 'empresa/loading',
              builder: (context, params) => LoadingEmpresaWidget(),
            ),
            FFRoute(
              name: 'envioNotaPJ',
              path: 'prestador/notafiscal',
              builder: (context, params) => EnvioNotaPJWidget(),
            ),
            FFRoute(
              name: 'aprovacaoNFs',
              path: 'empresa/nfs',
              builder: (context, params) => AprovacaoNFsWidget(
                correnteIf: params.getParam('correnteIf', ParamType.JSON),
              ),
            ),
            FFRoute(
              name: 'colaboradoresBook',
              path: 'book/colaborador',
              builder: (context, params) => ColaboradoresBookWidget(),
            ),
            FFRoute(
              name: 'pagamentosEmpresa',
              path: 'empresa/pagamentos',
              builder: (context, params) => PagamentosEmpresaWidget(),
            ),
            FFRoute(
              name: 'salariosBook',
              path: 'book/salarios',
              builder: (context, params) => SalariosBookWidget(),
            ),
            FFRoute(
              name: 'ausenciasBook',
              path: 'book/ausencias',
              builder: (context, params) => AusenciasBookWidget(),
            ),
            FFRoute(
              name: 'acompanhamentosBook',
              path: 'book/acompanhamentos',
              builder: (context, params) => AcompanhamentosBookWidget(),
            ),
            FFRoute(
              name: 'supportsColab',
              path: 'ajuda/meus-tickets',
              builder: (context, params) => SupportsColabWidget(),
            ),
            FFRoute(
              name: 'meuPDInew',
              path: 'meuPDI',
              builder: (context, params) => MeuPDInewWidget(),
            ),
            FFRoute(
              name: 'masterParametrizacao',
              path: 'master/parametrizacao',
              builder: (context, params) => MasterParametrizacaoWidget(
                index: params.getParam('index', ParamType.int),
              ),
            ),
            FFRoute(
              name: 'pditimeNEW',
              path: 'pdiequipe',
              builder: (context, params) => PditimeNEWWidget(
                modal: params.getParam('modal', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'masterParametrizacaoNew',
              path: 'empresa/parametrizacao',
              builder: (context, params) => MasterParametrizacaoNewWidget(),
            ),
            FFRoute(
              name: 'dadosJuridicosPJ',
              path: 'prestador/dadosjuridicos',
              builder: (context, params) => DadosJuridicosPJWidget(
                index: params.getParam('index', ParamType.int),
              ),
            ),
            FFRoute(
              name: 'beneficiosCriar',
              path: 'empresa/novobeneficio',
              builder: (context, params) => BeneficiosCriarWidget(),
            ),
            FFRoute(
              name: 'pagamentosEmpresaCopy',
              path: 'empresa/pagamentosNew',
              builder: (context, params) => PagamentosEmpresaCopyWidget(),
            ),
            FFRoute(
              name: 'DetalhesColaboradorBook',
              path: 'book/colaborador/dados',
              builder: (context, params) => DetalhesColaboradorBookWidget(
                colabId: params.getParam('colabId', ParamType.int),
                cpf: params.getParam('cpf', ParamType.String),
                colab: params.getParam('colab', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'DetalhesSalariosBook',
              path: 'book/colaborador/salarios',
              builder: (context, params) => DetalhesSalariosBookWidget(
                colabId: params.getParam('colabId', ParamType.int),
                cpf: params.getParam('cpf', ParamType.String),
                colab: params.getParam('colab', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'DetalhesAusenciasBook',
              path: 'book/colaborador/ausencias',
              builder: (context, params) => DetalhesAusenciasBookWidget(
                colabId: params.getParam('colabId', ParamType.int),
                cpf: params.getParam('cpf', ParamType.String),
                colab: params.getParam('colab', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'DetalhesAcompanhamentosBook',
              path: 'book/colaborador/acompanhamentos',
              builder: (context, params) => DetalhesAcompanhamentosBookWidget(
                colabId: params.getParam('colabId', ParamType.int),
                cpf: params.getParam('cpf', ParamType.String),
                colab: params.getParam('colab', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'beneficiosPrestador',
              path: 'prestador/beneficios',
              builder: (context, params) => BeneficiosPrestadorWidget(),
            ),
            FFRoute(
              name: 'mapaAlocacao',
              path: 'mapa',
              builder: (context, params) => MapaAlocacaoWidget(),
            ),
            FFRoute(
              name: 'alocacoesNoProjeto-old',
              path: 'empresa/alocacoesprojeto-old',
              builder: (context, params) => AlocacoesNoProjetoOldWidget(),
            ),
            FFRoute(
              name: 'mycv',
              path: 'mycv',
              builder: (context, params) => MycvWidget(
                id: params.getParam('id', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'mapaProjetos',
              path: 'mapaprojetos',
              builder: (context, params) => MapaProjetosWidget(),
            ),
            FFRoute(
              name: 'mapaAlocacaoProjeto',
              path: 'alocacoesnoprojeto',
              builder: (context, params) => MapaAlocacaoProjetoWidget(),
            ),
            FFRoute(
              name: 'mapaAlocacaoColaborador',
              path: 'alocacoescolaborador',
              builder: (context, params) => MapaAlocacaoColaboradorWidget(),
            ),
            FFRoute(
              name: 'beneficiosEditar',
              path: 'empresa/editarbeneficio',
              builder: (context, params) => BeneficiosEditarWidget(
                beneficioID: params.getParam('beneficioID', ParamType.int),
              ),
            ),
            FFRoute(
              name: 'relatorioFaturamento',
              path: 'empresa/relatorio-faturamento',
              builder: (context, params) => RelatorioFaturamentoWidget(),
            ),
            FFRoute(
              name: 'beneficiosAbaComerciais',
              path: 'empresa/beneficioscomerciais',
              builder: (context, params) => BeneficiosAbaComerciaisWidget(
                id: params.getParam('id', ParamType.int),
              ),
            ),
            FFRoute(
              name: 'beneficiosAbaInteressados',
              path: 'empresa/beneficiosinteressados',
              builder: (context, params) => BeneficiosAbaInteressadosWidget(
                id: params.getParam('id', ParamType.int),
              ),
            ),
            FFRoute(
              name: 'curriculonew',
              path: 'curriculonew',
              builder: (context, params) => CurriculonewWidget(
                id: params.getParam('id', ParamType.int),
              ),
            ),
            FFRoute(
              name: 'beneficiosDetalhes',
              path: 'prestador/beneficios/ver',
              builder: (context, params) => BeneficiosDetalhesWidget(
                id: params.getParam('id', ParamType.int),
              ),
            ),
            FFRoute(
              name: 'beneficiosInteressesPrestador',
              path: 'prestador/beneficios/interesses',
              builder: (context, params) =>
                  BeneficiosInteressesPrestadorWidget(),
            ),
            FFRoute(
              name: 'apontamentosEmpresaCopy',
              path: 'empresa/apontamentos2',
              builder: (context, params) => ApontamentosEmpresaCopyWidget(),
            ),
            FFRoute(
              name: 'okr',
              path: 'okr',
              builder: (context, params) => OkrWidget(),
            ),
            FFRoute(
              name: 'MapaVisitas',
              path: 'mapa/visitas',
              builder: (context, params) => MapaVisitasWidget(),
            ),
            FFRoute(
              name: 'MapaVisitasNovaAgenda',
              path: 'mapa/visitas/agenda',
              builder: (context, params) => MapaVisitasNovaAgendaWidget(),
            ),
            FFRoute(
              name: 'MapaVisitasEditarNovaAgenda',
              path: 'mapa/visitas/agenda/editar',
              builder: (context, params) => MapaVisitasEditarNovaAgendaWidget(
                leadId: params.getParam('leadId', ParamType.int),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}
