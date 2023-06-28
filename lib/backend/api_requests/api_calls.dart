import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start PDI Group Code

class PdiGroup {
  static String baseUrl = 'https://xare-axod-hky2.b2.xano.io/api:MLkFdmWD';
  static Map<String, String> headers = {};
  static CriaPDICall criaPDICall = CriaPDICall();
  static ListPDICall listPDICall = ListPDICall();
  static VerPDICall verPDICall = VerPDICall();
  static EditPDICall editPDICall = EditPDICall();
  static ListaUltimosPDIsCall listaUltimosPDIsCall = ListaUltimosPDIsCall();
}

class CriaPDICall {
  Future<ApiCallResponse> call({
    String? manager = 'Fulvio Mascara',
    String? profileMbti = '',
    String? careerAnchor = '',
    String? mentorFacilitator = '',
    String? collaborator = 'Tiago Augusto Rocha',
    int? collaboratorId,
    String? goal = '',
    String? deadline = '',
    String? status = '',
    String? peoplepartner = '',
    int? step,
    int? managerId,
  }) {
    final body = '''
{
  "manager": "${manager}",
  "profile_mbti": "${profileMbti}",
  "career_anchor": "${careerAnchor}",
  "mentor_facilitator": "${mentorFacilitator}",
  "status": "${status}",
  "comment_id": [],
  "collaborator": "${collaborator}",
  "collaborator_id": ${collaboratorId},
  "goal": "${goal}",
  "deadline": "${deadline}",
  "peoplepartner": "${peoplepartner}",
  "step": ${step},
  "manager_id": ${managerId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'criaPDI',
      apiUrl: '${PdiGroup.baseUrl}/pdi',
      callType: ApiCallType.POST,
      headers: {
        ...PdiGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ListPDICall {
  Future<ApiCallResponse> call({
    int? id,
    String? status = '',
    dynamic? externalJson,
    int? collaboratorId,
    int? managerId,
  }) {
    final external = _serializeJson(externalJson);

    return ApiManager.instance.makeApiCall(
      callName: 'listPDI',
      apiUrl: '${PdiGroup.baseUrl}/pdi',
      callType: ApiCallType.GET,
      headers: {
        ...PdiGroup.headers,
      },
      params: {
        'id': id,
        'status': status,
        'external': external,
        'collaborator_id': collaboratorId,
        'manager_id': managerId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class VerPDICall {
  Future<ApiCallResponse> call({
    int? pdiId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'verPDI',
      apiUrl: '${PdiGroup.baseUrl}/pdi/${pdiId}',
      callType: ApiCallType.GET,
      headers: {
        ...PdiGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic dateCriacao(dynamic response) => getJsonField(
        response,
        r'''$.created_at''',
      );
  dynamic gestor(dynamic response) => getJsonField(
        response,
        r'''$.manager''',
      );
  dynamic perfilMBTI(dynamic response) => getJsonField(
        response,
        r'''$.profile_mbti''',
      );
  dynamic ancoraCarreira(dynamic response) => getJsonField(
        response,
        r'''$.career_anchor''',
      );
  dynamic mentorFacilitador(dynamic response) => getJsonField(
        response,
        r'''$.mentor_facilitator''',
      );
  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  dynamic listExpectativas(dynamic response) => getJsonField(
        response,
        r'''$.expectation_pdi_id''',
        true,
      );
  dynamic listComentarios(dynamic response) => getJsonField(
        response,
        r'''$.comment_id''',
        true,
      );
  dynamic colaborador(dynamic response) => getJsonField(
        response,
        r'''$.collaborator''',
      );
  dynamic idColaborador(dynamic response) => getJsonField(
        response,
        r'''$.collaborator_id''',
      );
  dynamic meta(dynamic response) => getJsonField(
        response,
        r'''$.goal''',
      );
  dynamic prazo(dynamic response) => getJsonField(
        response,
        r'''$.deadline''',
      );
  dynamic pdiNumber(dynamic response) => getJsonField(
        response,
        r'''$.pdi_number''',
      );
  dynamic peoplePartner(dynamic response) => getJsonField(
        response,
        r'''$.peoplepartner''',
      );
  dynamic step(dynamic response) => getJsonField(
        response,
        r'''$.step''',
      );
  dynamic actionPlanId(dynamic response) => getJsonField(
        response,
        r'''$.action_plan_id''',
        true,
      );
}

class EditPDICall {
  Future<ApiCallResponse> call({
    int? pdiId,
    String? status = '',
    int? step,
    String? reason = '',
  }) {
    final body = '''
{
  "pdi_id": ${pdiId},
  "status": "${status}",
  "step": ${step},
  "reason": "${reason}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'editPDI',
      apiUrl: '${PdiGroup.baseUrl}/pdi/${pdiId}',
      callType: ApiCallType.POST,
      headers: {
        ...PdiGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ListaUltimosPDIsCall {
  Future<ApiCallResponse> call({
    int? collaboratorId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'listaUltimosPDIs',
      apiUrl: '${PdiGroup.baseUrl}/pdi-latest',
      callType: ApiCallType.GET,
      headers: {
        ...PdiGroup.headers,
      },
      params: {
        'collaborator_id': collaboratorId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End PDI Group Code

/// Start FELIZOMETRO Group Code

class FelizometroGroup {
  static String baseUrl = 'https://xare-axod-hky2.b2.xano.io/api:MLkFdmWD';
  static Map<String, String> headers = {};
  static ListFelizometroCall listFelizometroCall = ListFelizometroCall();
  static CriaFelizometroCall criaFelizometroCall = CriaFelizometroCall();
  static EditFelizometroCall editFelizometroCall = EditFelizometroCall();
}

class ListFelizometroCall {
  Future<ApiCallResponse> call({
    String? contact = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'listFelizometro',
      apiUrl: '${FelizometroGroup.baseUrl}/felizometro',
      callType: ApiCallType.GET,
      headers: {
        ...FelizometroGroup.headers,
      },
      params: {
        'contact': contact,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CriaFelizometroCall {
  Future<ApiCallResponse> call({
    int? collaboratorId,
    String? collaborator = '',
    String? manager = '',
    String? emotion = '',
    String? message = '',
    String? date = '',
    String? otherEmotion = '',
  }) {
    final body = '''
{
  "collaborator_id": ${collaboratorId},
  "collaborator": "${collaborator}",
  "manager": "${manager}",
  "emotion": "${emotion}",
  "message": "${message}",
  "date": "${date}",
  "other_emotion": "${otherEmotion}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'criaFelizometro',
      apiUrl: '${FelizometroGroup.baseUrl}/felizometro',
      callType: ApiCallType.POST,
      headers: {
        ...FelizometroGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EditFelizometroCall {
  Future<ApiCallResponse> call({
    int? felizometroId,
    String? contact = '',
    String? contactDate = '',
    String? madeByUser = '',
  }) {
    final body = '''
{
  "felizometro_id": ${felizometroId},
  "contact": "${contact}",
  "contact_date": "${contactDate}",
  "made_by_user": "${madeByUser}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'editFelizometro',
      apiUrl: '${FelizometroGroup.baseUrl}/felizometro/${felizometroId}',
      callType: ApiCallType.POST,
      headers: {
        ...FelizometroGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End FELIZOMETRO Group Code

/// Start BackendHomolog Group Code

class BackendHomologGroup {
  static String baseUrl = 'https://spw.app.foursys.com/backoffice-rf/api/';
  static Map<String, String> headers = {};
  static ListarCompetenciasCall listarCompetenciasCall =
      ListarCompetenciasCall();
  static ListarSoftSkillsCall listarSoftSkillsCall = ListarSoftSkillsCall();
  static AddCompetenciaColabCall addCompetenciaColabCall =
      AddCompetenciaColabCall();
  static ShowMeCall showMeCall = ShowMeCall();
  static LogoutCall logoutCall = LogoutCall();
  static BuscaHierarquiaCall buscaHierarquiaCall = BuscaHierarquiaCall();
  static AddSoftSkillColabCall addSoftSkillColabCall = AddSoftSkillColabCall();
  static RemoveSoftSkillColabCall removeSoftSkillColabCall =
      RemoveSoftSkillColabCall();
  static ListarMetodologiasCall listarMetodologiasCall =
      ListarMetodologiasCall();
  static AddMetodologiaColabCall addMetodologiaColabCall =
      AddMetodologiaColabCall();
  static AddDominioColabCall addDominioColabCall = AddDominioColabCall();
  static AddIdiomaColabCall addIdiomaColabCall = AddIdiomaColabCall();
  static ListarDominiosCall listarDominiosCall = ListarDominiosCall();
  static ListaIdiomasCall listaIdiomasCall = ListaIdiomasCall();
  static ListaHardSkillsColabCall listaHardSkillsColabCall =
      ListaHardSkillsColabCall();
  static ListarMetodologiasColaboradorCall listarMetodologiasColaboradorCall =
      ListarMetodologiasColaboradorCall();
  static ListarDominioColaboradorCall listarDominioColaboradorCall =
      ListarDominioColaboradorCall();
  static ListaSoftskillsColaboradorCall listaSoftskillsColaboradorCall =
      ListaSoftskillsColaboradorCall();
  static ListarIdiomasColaboradorCall listarIdiomasColaboradorCall =
      ListarIdiomasColaboradorCall();
  static AddExperienciaProfissionalCall addExperienciaProfissionalCall =
      AddExperienciaProfissionalCall();
  static EditaExperienciaProfissionalCall editaExperienciaProfissionalCall =
      EditaExperienciaProfissionalCall();
  static VerExperienciaProfissionalCall verExperienciaProfissionalCall =
      VerExperienciaProfissionalCall();
  static RemoveExperienciaProfissionalCall removeExperienciaProfissionalCall =
      RemoveExperienciaProfissionalCall();
  static ListaExperienciaProfissionalCall listaExperienciaProfissionalCall =
      ListaExperienciaProfissionalCall();
  static ListaFormacaoCall listaFormacaoCall = ListaFormacaoCall();
  static ListaFormacaoIDCall listaFormacaoIDCall = ListaFormacaoIDCall();
  static AddFormacaoColaboradorCall addFormacaoColaboradorCall =
      AddFormacaoColaboradorCall();
  static AddDadosPCDCall addDadosPCDCall = AddDadosPCDCall();
  static EditaDadosPCDCall editaDadosPCDCall = EditaDadosPCDCall();
  static AddEscolaridadeColaboradorCall addEscolaridadeColaboradorCall =
      AddEscolaridadeColaboradorCall();
  static EditaEscolaridadeColaboradorCall editaEscolaridadeColaboradorCall =
      EditaEscolaridadeColaboradorCall();
  static RemoverFormacaoColaboradorCall removerFormacaoColaboradorCall =
      RemoverFormacaoColaboradorCall();
  static RemoverEscolaridadeColaboradorCall removerEscolaridadeColaboradorCall =
      RemoverEscolaridadeColaboradorCall();
  static PrimeiroAcessoCall primeiroAcessoCall = PrimeiroAcessoCall();
  static AtualizaNivelHardSkillCall atualizaNivelHardSkillCall =
      AtualizaNivelHardSkillCall();
  static AtualizaNivelMetodologiaCall atualizaNivelMetodologiaCall =
      AtualizaNivelMetodologiaCall();
  static AtualizaNivelDominioCall atualizaNivelDominioCall =
      AtualizaNivelDominioCall();
  static AtualizaNivelIdiomaCall atualizaNivelIdiomaCall =
      AtualizaNivelIdiomaCall();
  static RemoveHardSkillsColabCall removeHardSkillsColabCall =
      RemoveHardSkillsColabCall();
  static RemoveMetodologiaColabCall removeMetodologiaColabCall =
      RemoveMetodologiaColabCall();
  static RemoveDominioColabCall removeDominioColabCall =
      RemoveDominioColabCall();
  static RemoveIdiomaColabCall removeIdiomaColabCall = RemoveIdiomaColabCall();
  static AlterarDadosColabCall alterarDadosColabCall = AlterarDadosColabCall();
  static AtualizaNivelSoftSkillCall atualizaNivelSoftSkillCall =
      AtualizaNivelSoftSkillCall();
  static ListaFormacoesColaboradorCall listaFormacoesColaboradorCall =
      ListaFormacoesColaboradorCall();
  static ListarEscolaridadeColaboradorCall listarEscolaridadeColaboradorCall =
      ListarEscolaridadeColaboradorCall();
  static AdicionaDependenteCall adicionaDependenteCall =
      AdicionaDependenteCall();
  static EditaDependenteCall editaDependenteCall = EditaDependenteCall();
  static ListaDependentesColaboradorCall listaDependentesColaboradorCall =
      ListaDependentesColaboradorCall();
  static ListaForcaPerfilCall listaForcaPerfilCall = ListaForcaPerfilCall();
  static RemoverDependenteCall removerDependenteCall = RemoverDependenteCall();
  static EditaFormacaoColabCall editaFormacaoColabCall =
      EditaFormacaoColabCall();
  static InserirContatoEmergCall inserirContatoEmergCall =
      InserirContatoEmergCall();
  static AlterarContatoEmergCall alterarContatoEmergCall =
      AlterarContatoEmergCall();
  static RemoverContatoEmergCall removerContatoEmergCall =
      RemoverContatoEmergCall();
  static ListarContatoEmergCall listarContatoEmergCall =
      ListarContatoEmergCall();
  static GetAccessTokenCall getAccessTokenCall = GetAccessTokenCall();
  static ShowmeAllCall showmeAllCall = ShowmeAllCall();
  static BuscaDadosNewCall buscaDadosNewCall = BuscaDadosNewCall();
  static BuscarDadosOldCall buscarDadosOldCall = BuscarDadosOldCall();
  static AlterarDadosColabNewCall alterarDadosColabNewCall =
      AlterarDadosColabNewCall();
  static AddCertificadoCall addCertificadoCall = AddCertificadoCall();
  static AlterarCertificadoCall alterarCertificadoCall =
      AlterarCertificadoCall();
  static EditarFotoColabCall editarFotoColabCall = EditarFotoColabCall();
  static RemoverCertificadoCall removerCertificadoCall =
      RemoverCertificadoCall();
  static GetCurriculoColaboradorCall getCurriculoColaboradorCall =
      GetCurriculoColaboradorCall();
  static InsereCurriculoColaboradorCall insereCurriculoColaboradorCall =
      InsereCurriculoColaboradorCall();
  static AlterarCurriculoColaboradorCall alterarCurriculoColaboradorCall =
      AlterarCurriculoColaboradorCall();
}

class ListarCompetenciasCall {
  Future<ApiCallResponse> call({
    String? busca = '',
    int? cursor,
    int? limite,
    String? token =
        'YOuCLyc2ipKsCZt7u/rzQ2cDqVhmDF+hKPIAE9Edv0bRbJyBZXUMxz2/uSjqICel',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'ListarCompetencias',
      apiUrl: '${BackendHomologGroup.baseUrl}Competencia/ListarCompetencia',
      callType: ApiCallType.GET,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'busca': busca,
        'cursor': cursor,
        'limite': limite,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ListarSoftSkillsCall {
  Future<ApiCallResponse> call({
    String? busca = '',
    int? cursor,
    int? limite,
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'ListarSoftSkills',
      apiUrl: '${BackendHomologGroup.baseUrl}Softskill/ListarSoftskill',
      callType: ApiCallType.GET,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'busca': busca,
        'cursor': cursor,
        'limite': limite,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddCompetenciaColabCall {
  Future<ApiCallResponse> call({
    String? token =
        'YOuCLyc2ipKsCZt7u/rzQ2cDqVhmDF+hKPIAE9Edv0bRbJyBZXUMxz2/uSjqICel',
    int? id,
    int? nivelId,
    String? cpf = '',
  }) {
    final body = '''
[
  {
    "id": ${id},
    "nivelId": ${nivelId},
    "cpf": "${cpf}"
  }
]''';
    return ApiManager.instance.makeApiCall(
      callName: 'AddCompetenciaColab',
      apiUrl:
          '${BackendHomologGroup.baseUrl}Colaborador/AdicionarCompetenciaColaborador',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ShowMeCall {
  Future<ApiCallResponse> call({
    String? tokenx = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'showMe',
      apiUrl: '${BackendHomologGroup.baseUrl}/usuario/showme',
      callType: ApiCallType.GET,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${tokenx}',
      },
      params: {
        'tokenx': tokenx,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class LogoutCall {
  Future<ApiCallResponse> call({
    String? cpfemail = '',
    String? token = '',
  }) {
    final body = '''
{
  "cpfemail": "${cpfemail}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'logout',
      apiUrl: '${BackendHomologGroup.baseUrl}Usuario/Logout',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class BuscaHierarquiaCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? cpf = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'buscaHierarquia',
      apiUrl: '${BackendHomologGroup.baseUrl}Usuario/BuscarHierarquia',
      callType: ApiCallType.GET,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'cpf': cpf,
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddSoftSkillColabCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? cpf = '',
    int? id,
    int? nivelId,
  }) {
    final body = '''
[{
  "id": ${id},
  "nivelId": ${nivelId},
  "cpf": "${cpf}"
}]''';
    return ApiManager.instance.makeApiCall(
      callName: 'AddSoftSkillColab',
      apiUrl:
          '${BackendHomologGroup.baseUrl}Colaborador/AdicionarSoftskillColaborador',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RemoveSoftSkillColabCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? cpf = '',
    int? id,
  }) {
    final body = '''
{
  "id": ${id},
  "cpf": "${cpf}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'RemoveSoftSkillColab',
      apiUrl:
          '${BackendHomologGroup.baseUrl}Softskill/RemoverSoftskillColaborador',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ListarMetodologiasCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? busca = '',
    int? limite,
    int? cursor,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'ListarMetodologias',
      apiUrl: '${BackendHomologGroup.baseUrl}Metodologia/ListarMetodologia',
      callType: ApiCallType.GET,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'busca': busca,
        'cursor': cursor,
        'limite': limite,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddMetodologiaColabCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? id,
    int? nivelid,
    String? cpf = '',
  }) {
    final body = '''
[
  {
    "id": ${id},
    "nivelId": ${nivelid},
    "cpf": "${cpf}"
  }
]''';
    return ApiManager.instance.makeApiCall(
      callName: 'AddMetodologiaColab',
      apiUrl:
          '${BackendHomologGroup.baseUrl}Colaborador/AdicionarMetodologiaColaborador',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddDominioColabCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? id,
    int? nivelid,
    String? cpf = '',
  }) {
    final body = '''
[
  {
    "id": ${id},
    "nivelId": ${nivelid},
    "cpf": "${cpf}"
  }
]''';
    return ApiManager.instance.makeApiCall(
      callName: 'AddDominioColab',
      apiUrl:
          '${BackendHomologGroup.baseUrl}Colaborador/AdicionarDominioColaborador',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddIdiomaColabCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? id,
    int? nivelid,
    String? cpf = '',
  }) {
    final body = '''
[
  {
    "id": ${id},
    "nivelId": ${nivelid},
    "cpf": "${cpf}"
  }
]''';
    return ApiManager.instance.makeApiCall(
      callName: 'AddIdiomaColab',
      apiUrl: '${BackendHomologGroup.baseUrl}Idioma/AdicionarIdiomaColaborador',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ListarDominiosCall {
  Future<ApiCallResponse> call({
    String? busca = '',
    int? cursor,
    int? limite,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'ListarDominios',
      apiUrl: '${BackendHomologGroup.baseUrl}Dominio/ListarDominio',
      callType: ApiCallType.GET,
      headers: {
        ...BackendHomologGroup.headers,
      },
      params: {
        'busca': busca,
        'cursor': cursor,
        'limite': limite,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ListaIdiomasCall {
  Future<ApiCallResponse> call({
    String? busca = '',
    int? cursor,
    int? limite,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'listaIdiomas',
      apiUrl: '${BackendHomologGroup.baseUrl}Idioma/ListarIdioma',
      callType: ApiCallType.GET,
      headers: {
        ...BackendHomologGroup.headers,
      },
      params: {
        'busca': busca,
        'cursor': cursor,
        'limite': limite,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ListaHardSkillsColabCall {
  Future<ApiCallResponse> call({
    String? cpfColaborador = '',
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'ListaHardSkillsColab',
      apiUrl:
          '${BackendHomologGroup.baseUrl}Competencia/ListarCompetenciaColaborador',
      callType: ApiCallType.GET,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'cpfColaborador': cpfColaborador,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ListarMetodologiasColaboradorCall {
  Future<ApiCallResponse> call({
    String? cpfColaborador = '',
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'ListarMetodologiasColaborador',
      apiUrl:
          '${BackendHomologGroup.baseUrl}Metodologia/ListarMetodologiasColaborador',
      callType: ApiCallType.GET,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'cpfColaborador': cpfColaborador,
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ListarDominioColaboradorCall {
  Future<ApiCallResponse> call({
    String? cpfColaborador = '',
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'ListarDominioColaborador',
      apiUrl: '${BackendHomologGroup.baseUrl}dominio/ListarDominioColaborador',
      callType: ApiCallType.GET,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'cpfColaborador': cpfColaborador,
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ListaSoftskillsColaboradorCall {
  Future<ApiCallResponse> call({
    String? cpfColaborador = '',
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'ListaSoftskillsColaborador',
      apiUrl:
          '${BackendHomologGroup.baseUrl}Softskill/ListarSoftskillColaborador',
      callType: ApiCallType.GET,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'cpfColaborador': cpfColaborador,
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ListarIdiomasColaboradorCall {
  Future<ApiCallResponse> call({
    String? cpfColaborador = '',
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'ListarIdiomasColaborador',
      apiUrl: '${BackendHomologGroup.baseUrl}Idioma/ListarIdiomaColaborador',
      callType: ApiCallType.GET,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'cpfColaborador': cpfColaborador,
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddExperienciaProfissionalCall {
  Future<ApiCallResponse> call({
    String? titulo = '',
    String? empresa = '',
    String? descricao = '',
    String? dataInicio = '',
    String? dataSaida = '',
    String? colaboradorCpf = '',
    String? token = '',
    String? cargo = '',
  }) {
    final body = '''
{
  "cargo": "${cargo}",
  "empresa": "${empresa}",
  "descricao": "${descricao}",
  "dataInicio": "${dataInicio}",
  "dataSaida": "${dataSaida}",
  "colaboradorCpf": "${colaboradorCpf}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AddExperienciaProfissional',
      apiUrl:
          '${BackendHomologGroup.baseUrl}ExperienciaProfissional/AdicionarExperienciaProfissional',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EditaExperienciaProfissionalCall {
  Future<ApiCallResponse> call({
    int? id,
    String? titulo = '',
    String? empresa = '',
    String? descricao = '',
    String? dataInicio = '',
    String? dataSaida = '',
    String? colaboradorCpf = '',
    String? token = '',
    String? cargo = '',
  }) {
    final body = '''
{
  "id": ${id},
  "cargo": "${cargo}",
  "empresa": "F${empresa}",
  "descricao": "${descricao}",
  "dataInicio": "${dataInicio}",
  "dataSaida": "${dataSaida}",
  "colaboradorCpf": "${colaboradorCpf}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'EditaExperienciaProfissional',
      apiUrl:
          '${BackendHomologGroup.baseUrl}ExperienciaProfissional/AtualizaExperienciaProfissional',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class VerExperienciaProfissionalCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? id,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'verExperienciaProfissional',
      apiUrl:
          '${BackendHomologGroup.baseUrl}ExperienciaProfissional/GetExperienciaProfissionalById',
      callType: ApiCallType.GET,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'id': id,
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RemoveExperienciaProfissionalCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? experienciaId,
  }) {
    final body = '''
{
  "experienciaId": ${experienciaId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'removeExperienciaProfissional',
      apiUrl:
          '${BackendHomologGroup.baseUrl}ExperienciaProfissional/RemoverExperienciaProfissional',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ListaExperienciaProfissionalCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? cursor,
    int? limite,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'listaExperienciaProfissional',
      apiUrl:
          '${BackendHomologGroup.baseUrl}ExperienciaProfissional/ListarExperienciaProfissionalPorCpf',
      callType: ApiCallType.GET,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'token': token,
        'cursor': cursor,
        'limite': limite,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ListaFormacaoCall {
  Future<ApiCallResponse> call({
    String? busca = '',
    int? cursor,
    int? limite,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'listaFormacao',
      apiUrl: '${BackendHomologGroup.baseUrl}Formacao/ListarFormacao',
      callType: ApiCallType.GET,
      headers: {
        ...BackendHomologGroup.headers,
      },
      params: {
        'busca': busca,
        'cursor': cursor,
        'limite': limite,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ListaFormacaoIDCall {
  Future<ApiCallResponse> call({
    int? id,
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'listaFormacaoID',
      apiUrl: '${BackendHomologGroup.baseUrl}Formacao/GetFormacaoById',
      callType: ApiCallType.GET,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'id': id,
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddFormacaoColaboradorCall {
  Future<ApiCallResponse> call({
    int? id,
    int? nivelId,
    String? token = '',
  }) {
    final body = '''
[{
"id":${id},
"nivelId":${nivelId} 
}
]''';
    return ApiManager.instance.makeApiCall(
      callName: 'addFormacaoColaborador',
      apiUrl:
          '${BackendHomologGroup.baseUrl}Colaborador/AdicionarFormacaoColaborador',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddDadosPCDCall {
  Future<ApiCallResponse> call({
    String? pcd = '',
    int? grupoDeRisco,
    String? descricaoCondicaoDeSaude = '',
    String? token = '',
  }) {
    final body = '''
{
  "pcd": "${pcd}",
  "grupoDeRisco": ${grupoDeRisco},
  "descricaoCondicaoDeSaude": "${descricaoCondicaoDeSaude}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addDadosPCD',
      apiUrl: '${BackendHomologGroup.baseUrl}Colaborador/InserirDadosPCD',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EditaDadosPCDCall {
  Future<ApiCallResponse> call({
    String? pcd = '',
    int? grupoDeRisco,
    String? descricaoCondicaoDeSaude = '',
    String? token = '',
  }) {
    final body = '''
{
  "pcd": "${pcd}",
  "grupoDeRisco": ${grupoDeRisco},
  "descricaoCondicaoDeSaude": "${descricaoCondicaoDeSaude}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'EditaDadosPCD',
      apiUrl: '${BackendHomologGroup.baseUrl}Colaborador/AlterarDadosPCD',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddEscolaridadeColaboradorCall {
  Future<ApiCallResponse> call({
    String? token = '',
    dynamic? escolaridadeParamJson,
    FFUploadedFile? arquivo,
  }) {
    final escolaridadeParam = _serializeJson(escolaridadeParamJson);

    return ApiManager.instance.makeApiCall(
      callName: 'addEscolaridadeColaborador',
      apiUrl:
          '${BackendHomologGroup.baseUrl}EscolaridadeColaborador/AdicionarEscolaridadeColaborador',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'escolaridadeParam': escolaridadeParam,
        'arquivo': arquivo,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EditaEscolaridadeColaboradorCall {
  Future<ApiCallResponse> call({
    String? token = '',
    dynamic? escolaridadeParamJson,
    FFUploadedFile? arquivo,
  }) {
    final escolaridadeParam = _serializeJson(escolaridadeParamJson);

    return ApiManager.instance.makeApiCall(
      callName: 'EditaEscolaridadeColaborador',
      apiUrl:
          '${BackendHomologGroup.baseUrl}EscolaridadeColaborador/AtualizaEscolaridadeColaborador',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'escolaridadeParam': escolaridadeParam,
        'arquivo': arquivo,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RemoverFormacaoColaboradorCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? id,
  }) {
    final body = '''
{
  "id": ${id}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'removerFormacaoColaborador',
      apiUrl:
          '${BackendHomologGroup.baseUrl}Colaborador/RemoverFormacaoColaborador',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RemoverEscolaridadeColaboradorCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? id,
    String? cpf = '',
  }) {
    final body = '''
{
  "escolaridadeId": ${id},
  "cpf": "${cpf}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'removerEscolaridadeColaborador',
      apiUrl:
          '${BackendHomologGroup.baseUrl}EscolaridadeColaborador/RemoverEscolaridadeColaborador',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PrimeiroAcessoCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) {
    final body = '''
''';
    return ApiManager.instance.makeApiCall(
      callName: 'PrimeiroAcesso',
      apiUrl:
          '${BackendHomologGroup.baseUrl}Usuario/ConfirmaPrimeiroFourmakers',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AtualizaNivelHardSkillCall {
  Future<ApiCallResponse> call({
    int? id,
    int? nivelId,
    String? cpf = '',
    String? token = '',
  }) {
    final body = '''
{
  "id": ${id},
  "nivelId": ${nivelId},
  "cpf": "${cpf}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AtualizaNivelHardSkill',
      apiUrl:
          '${BackendHomologGroup.baseUrl}Colaborador/AtualizaCompetenciaColaborador',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AtualizaNivelMetodologiaCall {
  Future<ApiCallResponse> call({
    int? id,
    int? nivelId,
    String? cpf = '',
    String? token = '',
  }) {
    final body = '''
{
  "id": ${id},
  "nivelId": ${nivelId},
  "cpf": "${cpf}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AtualizaNivelMetodologia',
      apiUrl:
          '${BackendHomologGroup.baseUrl}Colaborador/AtualizaMetodologiaColaborador',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AtualizaNivelDominioCall {
  Future<ApiCallResponse> call({
    int? id,
    int? nivelId,
    String? cpf = '',
    String? token = '',
  }) {
    final body = '''
{
  "id": ${id},
  "nivelId": ${nivelId},
  "cpf": "${cpf}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AtualizaNivelDominio',
      apiUrl:
          '${BackendHomologGroup.baseUrl}Colaborador/AtualizaDominioColaborador',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AtualizaNivelIdiomaCall {
  Future<ApiCallResponse> call({
    int? id,
    int? nivelId,
    String? cpf = '',
    String? token = '',
  }) {
    final body = '''
{
  "id": ${id},
  "nivelId": ${nivelId},
  "cpf": "${cpf}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AtualizaNivelIdioma',
      apiUrl: '${BackendHomologGroup.baseUrl}Idioma/AtualizaIdiomaColaborador',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RemoveHardSkillsColabCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? id,
  }) {
    final body = '''
{
  "id": ${id}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'removeHardSkillsColab',
      apiUrl:
          '${BackendHomologGroup.baseUrl}Colaborador/RemoverCompetenciaColaborador',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RemoveMetodologiaColabCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? id,
  }) {
    final body = '''
{
  "id": ${id}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'removeMetodologiaColab',
      apiUrl:
          '${BackendHomologGroup.baseUrl}Colaborador/RemoverMetodologiaColaborador',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RemoveDominioColabCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? id,
  }) {
    final body = '''
{
  "id": ${id}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'removeDominioColab',
      apiUrl:
          '${BackendHomologGroup.baseUrl}Colaborador/RemoverDominioColaborador',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RemoveIdiomaColabCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? id,
  }) {
    final body = '''
{
  "id": ${id}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'removeIdiomaColab',
      apiUrl: '${BackendHomologGroup.baseUrl}Idioma/RemoverIdiomaColaborador',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AlterarDadosColabCall {
  Future<ApiCallResponse> call({
    String? token = '',
    dynamic? colaboradorJson,
    dynamic? srsCandidateJson,
  }) {
    final colaborador = _serializeJson(colaboradorJson);
    final srsCandidate = _serializeJson(srsCandidateJson);

    return ApiManager.instance.makeApiCall(
      callName: 'AlterarDadosColab',
      apiUrl:
          '${BackendHomologGroup.baseUrl}Colaborador/AlterarDadosColaborador',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'colaborador': colaborador,
        'srsCandidate': srsCandidate,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AtualizaNivelSoftSkillCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? id,
    int? nivelId,
    String? cpf = '',
  }) {
    final body = '''
{
  "id": ${id},
  "nivelId": ${nivelId},
  "cpf": "${cpf}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AtualizaNivelSoftSkill',
      apiUrl:
          '${BackendHomologGroup.baseUrl}Colaborador/AtualizaSoftSkillColaborador',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ListaFormacoesColaboradorCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? cpfColaborador = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'listaFormacoesColaborador',
      apiUrl:
          '${BackendHomologGroup.baseUrl}Formacao/ListarFormacaoColaborador',
      callType: ApiCallType.GET,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'token': token,
        'cpfColaborador': cpfColaborador,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ListarEscolaridadeColaboradorCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? cpfColaborador = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'listarEscolaridadeColaborador',
      apiUrl:
          '${BackendHomologGroup.baseUrl}EscolaridadeColaborador/ListarEscolaridadeColaborador',
      callType: ApiCallType.GET,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'token': token,
        'cpfColaborador': cpfColaborador,
        'cursor': 0,
        'limite': 500,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AdicionaDependenteCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? nomeCompleto = '',
    String? dataNascimento = '',
    String? rg = '',
    String? cpf = '',
    bool? portadorDeficiencia,
    String? requerAjuda = '',
    String? colaboradorCpf = '',
    int? tipoDependenteId,
  }) {
    final body = '''
{
  "nomeCompleto": "${nomeCompleto}",
  "dataNascimento": "${dataNascimento}",
  "rg": "${rg}",
  "cpf": "${cpf}",
  "portadorDeficiencia": ${portadorDeficiencia},
  "requerAjudaQual": "${requerAjuda}",
  "colaboradorCpf": "${colaboradorCpf}",
  "TipoDependenteId": ${tipoDependenteId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AdicionaDependente',
      apiUrl:
          '${BackendHomologGroup.baseUrl}Dependente/AdicionarDadosDependentes',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EditaDependenteCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? id,
    String? nomeCompleto = '',
    String? dataNascimento = '',
    String? rg = '',
    String? cpf = '',
    String? requerAjuda = '',
    String? colaboradorCpf = '',
    int? idtipodependente,
  }) {
    final body = '''
{
    "id": ${id},
    "nomeCompleto": "${nomeCompleto}",
    "dataNascimento": "${dataNascimento}",
    "rg": "${rg}",
    "cpf": "${cpf}",
    "portadorDeficiencia": 0,
    "requerAjudaQual": "${requerAjuda}",
    "ativo": 0,
    "tipoDependente": {
        "id": ${idtipodependente},
        "descricao": "",
        "ativo": 0
    }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'EditaDependente',
      apiUrl:
          '${BackendHomologGroup.baseUrl}Dependente/AlterarDadosDependentes',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ListaDependentesColaboradorCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'ListaDependentesColaborador',
      apiUrl:
          '${BackendHomologGroup.baseUrl}Dependente/ListarDependenteColaborador',
      callType: ApiCallType.GET,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ListaForcaPerfilCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'listaForcaPerfil',
      apiUrl: '${BackendHomologGroup.baseUrl}Colaborador/BuscarForcaPerfil',
      callType: ApiCallType.GET,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RemoverDependenteCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? id,
    String? colaboradorCpf = '',
  }) {
    final body = '''
{
  "id": ${id},
  "colaboradorCpf": "${colaboradorCpf}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'removerDependente',
      apiUrl:
          '${BackendHomologGroup.baseUrl}Dependente/RemoverDadosDependentes',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EditaFormacaoColabCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? id,
    int? nivelId,
    String? cpf = '',
  }) {
    final body = '''
{
  "id": ${id},
  "nivelId": ${nivelId},
  "cpf": "${cpf}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'editaFormacaoColab',
      apiUrl:
          '${BackendHomologGroup.baseUrl}Colaborador/AtualizaFormacaoColaborador',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class InserirContatoEmergCall {
  Future<ApiCallResponse> call({
    int? order,
    String? name = '',
    String? parentesco = '',
    String? phone = '',
    String? token = '',
  }) {
    final body = '''
{
  "contact_order": ${order},
  "name": "${name}",
  "degree_kinship": "${parentesco}",
  "phone": "${phone}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'inserirContatoEmerg',
      apiUrl:
          '${BackendHomologGroup.baseUrl}Colaborador/InserirContatoDeEmergencia',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AlterarContatoEmergCall {
  Future<ApiCallResponse> call({
    int? order,
    String? name = '',
    String? parentesco = '',
    String? phone = '',
    String? token = '',
  }) {
    final body = '''
{
  "contact_order": ${order},
  "name": "${name}",
  "degree_kinship": "${parentesco}",
  "phone": "${phone}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'alterarContatoEmerg',
      apiUrl:
          '${BackendHomologGroup.baseUrl}Colaborador/AlterarContatoDeEmergencia',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RemoverContatoEmergCall {
  Future<ApiCallResponse> call({
    int? order,
    String? token = '',
  }) {
    final body = '''
{
  "contact_order": ${order}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'removerContatoEmerg',
      apiUrl:
          '${BackendHomologGroup.baseUrl}Colaborador/RemoverContatoDeEmergencia',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ListarContatoEmergCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'listarContatoEmerg',
      apiUrl:
          '${BackendHomologGroup.baseUrl}Colaborador/ListarContatoDeEmergencia',
      callType: ApiCallType.GET,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetAccessTokenCall {
  Future<ApiCallResponse> call({
    String? accesscode = '',
  }) {
    final body = '''
{
  "AccessCode": "${accesscode}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetAccessToken',
      apiUrl: '${BackendHomologGroup.baseUrl}Usuario/GetAccessToken',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Cache-Control': 'no-cache',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ShowmeAllCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'ShowmeAll',
      apiUrl: '${BackendHomologGroup.baseUrl}/usuario/showmeall',
      callType: ApiCallType.GET,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class BuscaDadosNewCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'BuscaDadosNew',
      apiUrl:
          '${BackendHomologGroup.baseUrl}Colaborador/BuscarFormularioColaborador',
      callType: ApiCallType.GET,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class BuscarDadosOldCall {
  Future<ApiCallResponse> call({
    String? cpf = '',
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'BuscarDadosOld',
      apiUrl:
          '${BackendHomologGroup.baseUrl}Colaborador/BuscarDadosColaborador',
      callType: ApiCallType.GET,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'cpf': cpf,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AlterarDadosColabNewCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? nome = '',
    String? datanascimento = '',
    String? cpf = '',
    String? rg = '',
    String? estadocivil = '',
    String? escolaridade = '',
    String? etnia = '',
    String? genero = '',
    String? orientacaosexual = '',
    bool? pessoarefug,
    String? email = '',
    String? emailalternativo = '',
    String? celular = '',
    String? passaporte = '',
    String? cep = '',
    String? endereco = '',
    String? complemento = '',
    int? numero,
    String? bairro = '',
    String? cidade = '',
    String? estado = '',
    String? comquemmora = '',
  }) {
    final body = '''
{
  "nome": "${nome}",
  "data_nascimento": "${datanascimento}",
  "cpf": "${cpf}",
  "rg": "${rg}",
  "estado_civil": "${estadocivil}",
  "escolaridade": "${escolaridade}",
  "etnia": "${etnia}",
  "genero": "${genero}",
  "orientacao_sexual": "${orientacaosexual}",
  "pessoa_refugiada": ${pessoarefug},
  "email": "${email}",
  "emailAlternativo": "${emailalternativo}",
  "celular": "${celular}",
  "passaporte": "${passaporte}",
  "endereco": {
    "cep": "${cep}",
    "endereco": "${endereco}",
    "complemento": "${complemento}",
    "numero": ${numero},
    "bairro": "${bairro}",
    "cidade": "${cidade}",
    "estado": "${estado}",
    "comQuemMora": "${comquemmora}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AlterarDadosColabNew',
      apiUrl:
          '${BackendHomologGroup.baseUrl}Colaborador/AlterarFormularioColaborador',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddCertificadoCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? pdf,
    String? token = '',
    String? cpf = '',
    int? idcompetencia,
    String? instituicao = '',
    String? conclusao = '',
    String? descricao = '',
    int? horas,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'addCertificado',
      apiUrl:
          '${BackendHomologGroup.baseUrl}Competencia/InserirCertificadoCompetenciaColaborador',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'cpfRequest': cpf,
        'competenciaColaboradorId': idcompetencia,
        'tipo': 1,
        'instituicao': instituicao,
        'dataConclusao': conclusao,
        'descricao': descricao,
        'cargaHoraria': horas,
        'file': pdf,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AlterarCertificadoCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? pdf,
    String? token = '',
    String? cpf = '',
    int? idcertificado,
    String? instituicao = '',
    String? conclusao = '',
    String? descricao = '',
    int? horas,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'alterarCertificado',
      apiUrl: '${BackendHomologGroup.baseUrl}Competencia/AlterarCertificado',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'cpfRequest': cpf,
        'idCertificado': idcertificado,
        'tipo': "PDF",
        'instituicao': instituicao,
        'dataConclusao': conclusao,
        'descricao': descricao,
        'cargaHoraria': horas,
        'file': pdf,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EditarFotoColabCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? foto,
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'editarFotoColab',
      apiUrl:
          '${BackendHomologGroup.baseUrl}Colaborador/AlterarFotoColaborador',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'token': token,
        'foto': foto,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RemoverCertificadoCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? id,
  }) {
    final body = '''
{
  "certificadoId": ${id}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'removerCertificado',
      apiUrl: '${BackendHomologGroup.baseUrl}/Competencia/RemoverCertificado',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetCurriculoColaboradorCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetCurriculoColaborador',
      apiUrl: '${BackendHomologGroup.baseUrl}Curriculo/GetCurriculoColaborador',
      callType: ApiCallType.GET,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class InsereCurriculoColaboradorCall {
  Future<ApiCallResponse> call({
    String? token = '',
    FFUploadedFile? pdf,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'InsereCurriculoColaborador',
      apiUrl:
          '${BackendHomologGroup.baseUrl}Curriculo/InsereCurriculoColaborador',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'token': token,
        'pdf': pdf,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AlterarCurriculoColaboradorCall {
  Future<ApiCallResponse> call({
    String? token = '',
    FFUploadedFile? pdf,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'AlterarCurriculoColaborador',
      apiUrl:
          '${BackendHomologGroup.baseUrl}Curriculo/AlterarCurriculoColaborador',
      callType: ApiCallType.POST,
      headers: {
        ...BackendHomologGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'token': token,
        'pdf': pdf,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End BackendHomolog Group Code

/// Start PLANO DE ACAO Group Code

class PlanoDeAcaoGroup {
  static String baseUrl = 'https://xare-axod-hky2.b2.xano.io/api:MLkFdmWD/';
  static Map<String, String> headers = {};
  static AddPlanoAcaoCall addPlanoAcaoCall = AddPlanoAcaoCall();
  static EditPlanoCall editPlanoCall = EditPlanoCall();
}

class AddPlanoAcaoCall {
  Future<ApiCallResponse> call({
    List<String>? jsonmontadoList,
    int? idpdi,
  }) {
    final jsonmontado = _serializeList(jsonmontadoList);

    final body = '''
{
  "items": ${jsonmontado},
  "idpdi": ${idpdi}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addPlanoAcao',
      apiUrl: '${PlanoDeAcaoGroup.baseUrl}action_plan',
      callType: ApiCallType.POST,
      headers: {
        ...PlanoDeAcaoGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EditPlanoCall {
  Future<ApiCallResponse> call({
    int? actionPlanId,
    bool? done,
  }) {
    final body = '''
{
  "action_plan_id": ${actionPlanId},
  "done": ${done}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'editPlano',
      apiUrl: '${PlanoDeAcaoGroup.baseUrl}action_plan/${actionPlanId}',
      callType: ApiCallType.POST,
      headers: {
        ...PlanoDeAcaoGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End PLANO DE ACAO Group Code

/// Start PROJETOS Group Code

class ProjetosGroup {
  static String baseUrl = 'https://xare-axod-hky2.b2.xano.io/api:itPnww4x';
  static Map<String, String> headers = {};
  static ObterProjetosCall obterProjetosCall = ObterProjetosCall();
  static VerProjetoCall verProjetoCall = VerProjetoCall();
  static CriarProjetoCall criarProjetoCall = CriarProjetoCall();
  static ObterAlocacoesCall obterAlocacoesCall = ObterAlocacoesCall();
  static ObterProjetosAlocadosCall obterProjetosAlocadosCall =
      ObterProjetosAlocadosCall();
  static ObterAlocacoesPrestadorCall obterAlocacoesPrestadorCall =
      ObterAlocacoesPrestadorCall();
  static ObterPjVinculadosCall obterPjVinculadosCall = ObterPjVinculadosCall();
  static CriarAlocacaoCall criarAlocacaoCall = CriarAlocacaoCall();
  static EditarProjetoCall editarProjetoCall = EditarProjetoCall();
  static ObterProjetosFiltradosCall obterProjetosFiltradosCall =
      ObterProjetosFiltradosCall();
  static BuscarProjetoCall buscarProjetoCall = BuscarProjetoCall();
  static ObterPrestadoresAtuantesCall obterPrestadoresAtuantesCall =
      ObterPrestadoresAtuantesCall();
}

class ObterProjetosCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'obterProjetos',
      apiUrl: '${ProjetosGroup.baseUrl}/projeto',
      callType: ApiCallType.GET,
      headers: {
        ...ProjetosGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class VerProjetoCall {
  Future<ApiCallResponse> call({
    int? projetoId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'verProjeto',
      apiUrl: '${ProjetosGroup.baseUrl}/projeto/${projetoId}',
      callType: ApiCallType.GET,
      headers: {
        ...ProjetosGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CriarProjetoCall {
  Future<ApiCallResponse> call({
    String? name = '',
    int? empresaId,
    String? datestart = '',
    String? dateend = '',
  }) {
    final body = '''
{
  "name": "${name}",
  "empresa_id": ${empresaId},
  "datestart": "${datestart}",
  "dateend": "${dateend}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'criarProjeto',
      apiUrl: '${ProjetosGroup.baseUrl}/projeto',
      callType: ApiCallType.POST,
      headers: {
        ...ProjetosGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ObterAlocacoesCall {
  Future<ApiCallResponse> call({
    int? projectId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'obterAlocacoes',
      apiUrl: '${ProjetosGroup.baseUrl}/alocacoes/projeto/${projectId}',
      callType: ApiCallType.GET,
      headers: {
        ...ProjetosGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ObterProjetosAlocadosCall {
  Future<ApiCallResponse> call({
    int? idPrestador,
    int? idEmpresa,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'obterProjetosAlocados',
      apiUrl:
          '${ProjetosGroup.baseUrl}/alocacoes/prestador/empresa/?id_prestador=${idPrestador}&id_empresa=${idEmpresa}',
      callType: ApiCallType.GET,
      headers: {
        ...ProjetosGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ObterAlocacoesPrestadorCall {
  Future<ApiCallResponse> call({
    int? idPrestador,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'obterAlocacoesPrestador',
      apiUrl: '${ProjetosGroup.baseUrl}/alocacoes/prestador/${idPrestador}',
      callType: ApiCallType.GET,
      headers: {
        ...ProjetosGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ObterPjVinculadosCall {
  Future<ApiCallResponse> call({
    int? userId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'obterPjVinculados',
      apiUrl: '${ProjetosGroup.baseUrl}/user_id/${userId}',
      callType: ApiCallType.GET,
      headers: {
        ...ProjetosGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CriarAlocacaoCall {
  Future<ApiCallResponse> call({
    int? projetoId,
    int? userIdId,
    String? modality = '',
    int? value,
    String? datestart = '',
    String? dateend = '',
  }) {
    final body = '''
{
  "projeto_id": ${projetoId},
  "user_id_id": ${userIdId},
  "modality": "${modality}",
  "value": ${value},
  "datestart": "${datestart}",
  "dateend": "${dateend}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'criarAlocacao',
      apiUrl: '${ProjetosGroup.baseUrl}/alocacoes',
      callType: ApiCallType.POST,
      headers: {
        ...ProjetosGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EditarProjetoCall {
  Future<ApiCallResponse> call({
    String? name = '',
    int? empresaId,
    String? datestart = '',
    String? dateend = '',
    int? projetoId,
  }) {
    final body = '''
{
  "projeto_id": ${projetoId},
  "name": "${name}",
  "empresa_id": ${empresaId},
  "datestart": "${datestart}",
  "dateend": "${dateend}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'editarProjeto',
      apiUrl: '${ProjetosGroup.baseUrl}/projeto/${projetoId}',
      callType: ApiCallType.POST,
      headers: {
        ...ProjetosGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ObterProjetosFiltradosCall {
  Future<ApiCallResponse> call({
    String? situacao = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'obterProjetosFiltrados',
      apiUrl: '${ProjetosGroup.baseUrl}/projetoSituacao',
      callType: ApiCallType.GET,
      headers: {
        ...ProjetosGroup.headers,
      },
      params: {
        'situacao': situacao,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class BuscarProjetoCall {
  Future<ApiCallResponse> call({
    String? busca = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'buscarProjeto',
      apiUrl: '${ProjetosGroup.baseUrl}/projetoBusca',
      callType: ApiCallType.GET,
      headers: {
        ...ProjetosGroup.headers,
      },
      params: {
        'busca': busca,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ObterPrestadoresAtuantesCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'obterPrestadoresAtuantes',
      apiUrl: '${ProjetosGroup.baseUrl}/alocacoes',
      callType: ApiCallType.GET,
      headers: {
        ...ProjetosGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End PROJETOS Group Code

/// Start Empresa Group Code

class EmpresaGroup {
  static String baseUrl = 'https://xare-axod-hky2.b2.xano.io/api:itPnww4x';
  static Map<String, String> headers = {};
  static GetEmpresaCall getEmpresaCall = GetEmpresaCall();
  static GetEmpresaPrestadorCall getEmpresaPrestadorCall =
      GetEmpresaPrestadorCall();
  static GetEmpresaPrestadoresCall getEmpresaPrestadoresCall =
      GetEmpresaPrestadoresCall();
  static GetEmpresaPrestadoresDisponiveisCall
      getEmpresaPrestadoresDisponiveisCall =
      GetEmpresaPrestadoresDisponiveisCall();
  static GetEmpresaProjetosCall getEmpresaProjetosCall =
      GetEmpresaProjetosCall();
  static GetOneEmpresaCall getOneEmpresaCall = GetOneEmpresaCall();
  static PostEmpresaCall postEmpresaCall = PostEmpresaCall();
  static AddEmpresaCall addEmpresaCall = AddEmpresaCall();
  static PostOneEmpresaCall postOneEmpresaCall = PostOneEmpresaCall();
  static DeleteEmpresaCall deleteEmpresaCall = DeleteEmpresaCall();
  static GetUserCall getUserCall = GetUserCall();
  static GetOneUserCall getOneUserCall = GetOneUserCall();
  static LoginEmpresaCall loginEmpresaCall = LoginEmpresaCall();
  static EmpresaShowMeCall empresaShowMeCall = EmpresaShowMeCall();
  static ChangePasswordEmpresaCall changePasswordEmpresaCall =
      ChangePasswordEmpresaCall();
  static GetApontamentosEmpresaCall getApontamentosEmpresaCall =
      GetApontamentosEmpresaCall();
  static GetApontamentosPendentesEmpresaCall
      getApontamentosPendentesEmpresaCall =
      GetApontamentosPendentesEmpresaCall();
  static ProcessarHorasCall processarHorasCall = ProcessarHorasCall();
  static EnviarInstruProcessarCall enviarInstruProcessarCall =
      EnviarInstruProcessarCall();
  static ProcessarNotasCall processarNotasCall = ProcessarNotasCall();
  static AlterarDataPagamentoCall alterarDataPagamentoCall =
      AlterarDataPagamentoCall();
  static EditarValorApontamentoCall editarValorApontamentoCall =
      EditarValorApontamentoCall();
  static EditarHorasApontamentoCall editarHorasApontamentoCall =
      EditarHorasApontamentoCall();
  static GetGrupoApontamentoIDCall getGrupoApontamentoIDCall =
      GetGrupoApontamentoIDCall();
  static RemoverApontamentoGrupoCall removerApontamentoGrupoCall =
      RemoverApontamentoGrupoCall();
  static NotasFiscaisEmpresaCall notasFiscaisEmpresaCall =
      NotasFiscaisEmpresaCall();
  static PagamentosEmpresaCall pagamentosEmpresaCall = PagamentosEmpresaCall();
  static CancelarPagamentoCall cancelarPagamentoCall = CancelarPagamentoCall();
  static CancelarNotaFiscalCall cancelarNotaFiscalCall =
      CancelarNotaFiscalCall();
  static GetParametrosCall getParametrosCall = GetParametrosCall();
  static PostParametrosCall postParametrosCall = PostParametrosCall();
  static RelatorioCall relatorioCall = RelatorioCall();
}

class GetEmpresaCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getEmpresa',
      apiUrl: '${EmpresaGroup.baseUrl}/empresa',
      callType: ApiCallType.GET,
      headers: {
        ...EmpresaGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetEmpresaPrestadorCall {
  Future<ApiCallResponse> call({
    int? idPrestador,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getEmpresaPrestador',
      apiUrl: '${EmpresaGroup.baseUrl}/empresa/prestador/${idPrestador}',
      callType: ApiCallType.GET,
      headers: {
        ...EmpresaGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetEmpresaPrestadoresCall {
  Future<ApiCallResponse> call({
    int? empresaId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getEmpresaPrestadores',
      apiUrl: '${EmpresaGroup.baseUrl}/user_id/empresa/${empresaId}',
      callType: ApiCallType.GET,
      headers: {
        ...EmpresaGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetEmpresaPrestadoresDisponiveisCall {
  Future<ApiCallResponse> call({
    int? empresaId,
    int? projetoId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getEmpresaPrestadoresDisponiveis',
      apiUrl:
          '${EmpresaGroup.baseUrl}/user_id/disponiveis-projeto/?empresa_id=${empresaId}&id_projeto=${projetoId}',
      callType: ApiCallType.GET,
      headers: {
        ...EmpresaGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetEmpresaProjetosCall {
  Future<ApiCallResponse> call({
    int? empresaId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getEmpresaProjetos',
      apiUrl: '${EmpresaGroup.baseUrl}/projeto/empresa/${empresaId}',
      callType: ApiCallType.GET,
      headers: {
        ...EmpresaGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetOneEmpresaCall {
  Future<ApiCallResponse> call({
    int? empresaId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getOneEmpresa',
      apiUrl: '${EmpresaGroup.baseUrl}/empresa/${empresaId}',
      callType: ApiCallType.GET,
      headers: {
        ...EmpresaGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PostEmpresaCall {
  Future<ApiCallResponse> call({
    String? nomefantasia = '',
    String? razaosocial = '',
    String? cnpj = '',
    String? site = '',
    String? linkedin = '',
    String? descricao = '',
    int? userIdId,
    int? projetoId,
  }) {
    final body = '''
{
  "nomefantasia": "${nomefantasia}",
  "razaosocial": "${razaosocial}",
  "cnpj": "${cnpj}",
  "site": "${site}",
  "linkedin": "${linkedin}",
  "descricao": "${descricao}",
  "user_id_id": [
    ${userIdId}
  ],
  "projeto_id": [
    ${projetoId}
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'postEmpresa',
      apiUrl: '${EmpresaGroup.baseUrl}/empresa',
      callType: ApiCallType.POST,
      headers: {
        ...EmpresaGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddEmpresaCall {
  Future<ApiCallResponse> call({
    String? nomefantasia = '',
    String? razaosocial = '',
    String? cnpj = '',
    String? site = '',
    String? linkedin = '',
    String? descricao = '',
    String? respNome = '',
    String? respCargo = '',
    String? respEmail = '',
    String? respPhone1 = '',
    String? respPhone2 = '',
    String? respLinkedin = '',
    String? password = '',
  }) {
    final body = '''
{
  "nomefantasia": "${nomefantasia}",
  "razaosocial": "${razaosocial}",
  "cnpj": "${cnpj}",
  "site": "${site}",
  "linkedin": "${linkedin}",
  "descricao": "${descricao}",
  "password": "${password}",
  "responsavel": {
    "nome": "${respNome}",
    "cargo": "${respCargo}",
    "email": "${respEmail}",
    "phone1": "${respPhone1}",
    "phone2": "${respPhone2}",
    "linkedin": "${respLinkedin}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addEmpresa',
      apiUrl: '${EmpresaGroup.baseUrl}/empresa/auth/signup',
      callType: ApiCallType.POST,
      headers: {
        ...EmpresaGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PostOneEmpresaCall {
  Future<ApiCallResponse> call({
    String? nomefantasia = '',
    String? razaosocial = '',
    String? cnpj = '',
    String? site = '',
    String? linkedin = '',
    String? descricao = '',
    int? empresaId,
    String? responsavelNome = '',
    String? phone1 = '',
    String? phone2 = '',
    String? responsavelLinkedin = '',
    String? responsavelEmail = '',
    String? responsavelCargo = '',
  }) {
    final body = '''
{
  "nomefantasia": "${nomefantasia}",
  "razaosocial": "${razaosocial}",
  "cnpj": "${cnpj}",
  "site": "${site}",
  "linkedin": "${linkedin}",
  "descricao": "${descricao}",
  "responsavel": {
    "nome": "${responsavelNome}",
    "cargo": "${responsavelCargo}",
    "email": "${responsavelEmail}",
    "phone1": "${phone1}",
    "phone2": "${phone2}",
    "linkedin": "${responsavelLinkedin}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'postOneEmpresa',
      apiUrl: '${EmpresaGroup.baseUrl}/empresa/${empresaId}',
      callType: ApiCallType.POST,
      headers: {
        ...EmpresaGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DeleteEmpresaCall {
  Future<ApiCallResponse> call({
    int? empresaId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteEmpresa',
      apiUrl: '${EmpresaGroup.baseUrl}/empresa/${empresaId}',
      callType: ApiCallType.DELETE,
      headers: {
        ...EmpresaGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetUserCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getUser',
      apiUrl: '${EmpresaGroup.baseUrl}/user_id',
      callType: ApiCallType.GET,
      headers: {
        ...EmpresaGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetOneUserCall {
  Future<ApiCallResponse> call({
    int? userIdId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getOneUser',
      apiUrl: '${EmpresaGroup.baseUrl}/user_id/${userIdId}',
      callType: ApiCallType.GET,
      headers: {
        ...EmpresaGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class LoginEmpresaCall {
  Future<ApiCallResponse> call({
    String? cnpj = '',
    String? password = '',
  }) {
    final body = '''
{
  "cnpj": "${cnpj}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'loginEmpresa',
      apiUrl: '${EmpresaGroup.baseUrl}/empresa/auth/login',
      callType: ApiCallType.POST,
      headers: {
        ...EmpresaGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EmpresaShowMeCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'empresaShowMe',
      apiUrl: '${EmpresaGroup.baseUrl}/empresa/auth/me',
      callType: ApiCallType.GET,
      headers: {
        ...EmpresaGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ChangePasswordEmpresaCall {
  Future<ApiCallResponse> call({
    String? senha = '',
    int? id,
    String? token = '',
  }) {
    final body = '''
{
  "password": "${senha}",
  "id": ${id}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'changePasswordEmpresa',
      apiUrl: '${EmpresaGroup.baseUrl}/empresa/auth/updatepassword',
      callType: ApiCallType.POST,
      headers: {
        ...EmpresaGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetApontamentosEmpresaCall {
  Future<ApiCallResponse> call({
    int? idEmpresa,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getApontamentosEmpresa',
      apiUrl: '${EmpresaGroup.baseUrl}/apontamentos/empresa/${idEmpresa}',
      callType: ApiCallType.GET,
      headers: {
        ...EmpresaGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetApontamentosPendentesEmpresaCall {
  Future<ApiCallResponse> call({
    int? idEmpresa,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getApontamentosPendentesEmpresa',
      apiUrl:
          '${EmpresaGroup.baseUrl}/apontamentos/empresa/pendentes/${idEmpresa}',
      callType: ApiCallType.GET,
      headers: {
        ...EmpresaGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ProcessarHorasCall {
  Future<ApiCallResponse> call({
    dynamic? listJson,
  }) {
    final list = _serializeJson(listJson);
    final body = '''
{
  "itens": ${list}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ProcessarHoras',
      apiUrl: '${EmpresaGroup.baseUrl}/apontamentos/alterarStatus/',
      callType: ApiCallType.POST,
      headers: {
        ...EmpresaGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EnviarInstruProcessarCall {
  Future<ApiCallResponse> call({
    dynamic? listJson,
    String? mensagem = '',
  }) {
    final list = _serializeJson(listJson);
    final body = '''
{
  "aprovar-horas-list": ${list},
  "mensagem": "${mensagem}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'EnviarInstruProcessar',
      apiUrl: '${EmpresaGroup.baseUrl}/apontamentos/enviar-instrucoes-email/',
      callType: ApiCallType.POST,
      headers: {
        ...EmpresaGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ProcessarNotasCall {
  Future<ApiCallResponse> call({
    dynamic? listJson,
    String? pagamento = '',
  }) {
    final list = _serializeJson(listJson);
    final body = '''
{
  "itens": ${list},
  "data_pagamento": "${pagamento}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ProcessarNotas',
      apiUrl: '${EmpresaGroup.baseUrl}/nota_fiscal/alterarStatus/',
      callType: ApiCallType.POST,
      headers: {
        ...EmpresaGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AlterarDataPagamentoCall {
  Future<ApiCallResponse> call({
    int? id,
    String? data = '',
  }) {
    final body = '''
{
  "id": ${id},
  "data": "${data}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AlterarDataPagamento',
      apiUrl: '${EmpresaGroup.baseUrl}/pagamento/alterarDataPagamento/',
      callType: ApiCallType.POST,
      headers: {
        ...EmpresaGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EditarValorApontamentoCall {
  Future<ApiCallResponse> call({
    int? idApontamento,
    String? nomeDado = '',
    double? valorNovo,
    String? regimeTributario = '',
    String? modalidade = '',
  }) {
    final body = '''
{
  "nome_dado": "${nomeDado}",
  "id_apontamento": ${idApontamento},
  "valor_novo": ${valorNovo},
  "regime_tributario": "${regimeTributario}",
  "modalidade": "${modalidade}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'editarValorApontamento',
      apiUrl: '${EmpresaGroup.baseUrl}/apontamentos/editar/',
      callType: ApiCallType.POST,
      headers: {
        ...EmpresaGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EditarHorasApontamentoCall {
  Future<ApiCallResponse> call({
    int? idApontamento,
    String? nomeDado = 'horas',
    int? horas,
    String? regimeTributario = '',
    String? modalidade = '',
  }) {
    final body = '''
{
  "nome_dado": "${nomeDado}",
  "id_apontamento": ${idApontamento},
  "regime_tributario": "${regimeTributario}",
  "horas": ${horas},
  "modalidade": "${modalidade}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'editarHorasApontamento',
      apiUrl: '${EmpresaGroup.baseUrl}/apontamentos/editar/',
      callType: ApiCallType.POST,
      headers: {
        ...EmpresaGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetGrupoApontamentoIDCall {
  Future<ApiCallResponse> call({
    int? id,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetGrupoApontamentoID',
      apiUrl: '${EmpresaGroup.baseUrl}/apontamentos_grupo/${id}',
      callType: ApiCallType.GET,
      headers: {
        ...EmpresaGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RemoverApontamentoGrupoCall {
  Future<ApiCallResponse> call({
    int? apontamentoId,
    int? grupoId,
  }) {
    final body = '''
{
  "apontamento_id": ${apontamentoId},
  "grupo_id": ${grupoId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'RemoverApontamentoGrupo',
      apiUrl: '${EmpresaGroup.baseUrl}/apontamentos_grupo/removerApontamento/',
      callType: ApiCallType.POST,
      headers: {
        ...EmpresaGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class NotasFiscaisEmpresaCall {
  Future<ApiCallResponse> call({
    int? id,
    int? situacao = 0,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'notasFiscaisEmpresa',
      apiUrl:
          '${EmpresaGroup.baseUrl}/nota_fiscal/empresa/?id=${id}&situacao=${situacao}',
      callType: ApiCallType.GET,
      headers: {
        ...EmpresaGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PagamentosEmpresaCall {
  Future<ApiCallResponse> call({
    int? id,
    int? situacao = 0,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'pagamentosEmpresa',
      apiUrl:
          '${EmpresaGroup.baseUrl}/pagamento/empresa/?id=${id}&situacao=${situacao}',
      callType: ApiCallType.GET,
      headers: {
        ...EmpresaGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CancelarPagamentoCall {
  Future<ApiCallResponse> call({
    int? id,
  }) {
    final body = '''
{
  "id": ${id}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'cancelarPagamento',
      apiUrl: '${EmpresaGroup.baseUrl}/pagamento/cancelar/',
      callType: ApiCallType.POST,
      headers: {
        ...EmpresaGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CancelarNotaFiscalCall {
  Future<ApiCallResponse> call({
    int? id,
    String? commentary = '',
  }) {
    final body = '''
{
  "id": ${id},
  "commentary": "${commentary}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'cancelarNotaFiscal',
      apiUrl: '${EmpresaGroup.baseUrl}/nota_fiscal/cancelar/',
      callType: ApiCallType.POST,
      headers: {
        ...EmpresaGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetParametrosCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getParametros',
      apiUrl: '${EmpresaGroup.baseUrl}/parametros',
      callType: ApiCallType.GET,
      headers: {
        ...EmpresaGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PostParametrosCall {
  Future<ApiCallResponse> call({
    int? parametrosId,
    double? irff,
    double? contribuicaoSocial,
    double? pis,
    double? cofins,
  }) {
    final body = '''
{
  "lucro_real": {
    "irff": ${irff},
    "contribuicao_social": ${contribuicaoSocial},
    "pis": ${pis},
    "cofins": ${cofins} 
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'postParametros',
      apiUrl: '${EmpresaGroup.baseUrl}/parametros/${parametrosId}',
      callType: ApiCallType.POST,
      headers: {
        ...EmpresaGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RelatorioCall {
  Future<ApiCallResponse> call({
    int? idEmpresa,
    String? inicio = '',
    String? fim = '',
  }) {
    final body = '''
{
  "id_empresa": ${idEmpresa},
  "inicio": "${inicio}",
  "fim": "${fim}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'relatorio',
      apiUrl: '${EmpresaGroup.baseUrl}/pagamento/relatorio/',
      callType: ApiCallType.POST,
      headers: {
        ...EmpresaGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Empresa Group Code

/// Start CONTATOSEMERG Group Code

class ContatosemergGroup {
  static String baseUrl = 'https://xare-axod-hky2.b2.xano.io/api:MLkFdmWD';
  static Map<String, String> headers = {};
  static CriaContatoEmergCall criaContatoEmergCall = CriaContatoEmergCall();
}

class CriaContatoEmergCall {
  Future<ApiCallResponse> call({
    String? nome = '',
    String? grauparentesco = '',
    String? telefone = '',
    int? userid,
  }) {
    final body = '''
{
  "contact": 0,
  "nome": "${nome}",
  "grauparentesco": "${grauparentesco}",
  "telefone": "${telefone}",
  "user_id_id": ${userid}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'criaContatoEmerg',
      apiUrl: '${ContatosemergGroup.baseUrl}/contatos_emerg',
      callType: ApiCallType.POST,
      headers: {
        ...ContatosemergGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End CONTATOSEMERG Group Code

/// Start Support Group Code

class SupportGroup {
  static String baseUrl = 'https://xare-axod-hky2.b2.xano.io/api:MLkFdmWD';
  static Map<String, String> headers = {};
  static PostTicketCall postTicketCall = PostTicketCall();
  static GetAllTicketsCall getAllTicketsCall = GetAllTicketsCall();
  static GetAllTicketsColabCall getAllTicketsColabCall =
      GetAllTicketsColabCall();
  static EditTicketCall editTicketCall = EditTicketCall();
}

class PostTicketCall {
  Future<ApiCallResponse> call({
    String? subject = '',
    String? category = '',
    String? description = '',
    String? email = '',
    String? nomeColab = '',
    int? userId = 0,
    String? status = 'Pendente',
  }) {
    final body = '''
{
  "userid": ${userId},
  "collaborator": "${nomeColab}",
  "subject": "${subject}",
  "description": "${description}",
  "category": "${category}",
  "email": "${email}",
  "status": "${status}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'PostTicket',
      apiUrl: '${SupportGroup.baseUrl}/support',
      callType: ApiCallType.POST,
      headers: {
        ...SupportGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetAllTicketsCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'GetAllTickets',
      apiUrl: '${SupportGroup.baseUrl}/support',
      callType: ApiCallType.GET,
      headers: {
        ...SupportGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetAllTicketsColabCall {
  Future<ApiCallResponse> call({
    int? id,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetAllTicketsColab',
      apiUrl: '${SupportGroup.baseUrl}/support/colab/${id}',
      callType: ApiCallType.GET,
      headers: {
        ...SupportGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EditTicketCall {
  Future<ApiCallResponse> call({
    int? id,
    int? createdAt,
    int? userid,
    String? collaborator = '',
    String? subject = '',
    String? description = '',
    String? category = '',
    String? email = '',
    String? status = '',
    String? response = '',
    int? finishedAt,
  }) {
    final body = '''
{
  "created_at": ${createdAt},
  "userid": ${userid},
  "collaborator": "${collaborator}",
  "subject": "${subject}",
  "description": "${description}",
  "category": "${category}",
  "email": "${email}",
  "status": "${status}",
  "response": "${response}",
  "finished_at": ${finishedAt}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Edit Ticket',
      apiUrl: '${SupportGroup.baseUrl}/support/${id}',
      callType: ApiCallType.POST,
      headers: {
        ...SupportGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Support Group Code

/// Start UserPhoto Group Code

class UserPhotoGroup {
  static String baseUrl = 'https://xare-axod-hky2.b2.xano.io/api:MLkFdmWD';
  static Map<String, String> headers = {};
  static GetPhotoColabCall getPhotoColabCall = GetPhotoColabCall();
  static EditPhotoColabCall editPhotoColabCall = EditPhotoColabCall();
  static AddPhotoColabCall addPhotoColabCall = AddPhotoColabCall();
}

class GetPhotoColabCall {
  Future<ApiCallResponse> call({
    int? colabId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getPhotoColab',
      apiUrl: '${UserPhotoGroup.baseUrl}/foto_colab/${colabId}',
      callType: ApiCallType.GET,
      headers: {
        ...UserPhotoGroup.headers,
      },
      params: {
        'colab_id': colabId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EditPhotoColabCall {
  Future<ApiCallResponse> call({
    int? colabId,
    FFUploadedFile? foto,
    bool? permissao,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'editPhotoColab',
      apiUrl: '${UserPhotoGroup.baseUrl}/foto_colab/${colabId}',
      callType: ApiCallType.POST,
      headers: {
        ...UserPhotoGroup.headers,
      },
      params: {
        'colab_id': colabId,
        'foto': foto,
        'permissao': permissao,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddPhotoColabCall {
  Future<ApiCallResponse> call({
    int? colabId,
    FFUploadedFile? foto,
    bool? permissao,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'addPhotoColab',
      apiUrl: '${UserPhotoGroup.baseUrl}/foto_colab',
      callType: ApiCallType.POST,
      headers: {
        ...UserPhotoGroup.headers,
      },
      params: {
        'colab_id': colabId,
        'foto': foto,
        'permissao': permissao,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End UserPhoto Group Code

/// Start PJ Group Code

class PjGroup {
  static String baseUrl = 'https://xare-axod-hky2.b2.xano.io/api:itPnww4x';
  static Map<String, String> headers = {};
  static GetAllPJsCall getAllPJsCall = GetAllPJsCall();
  static GetPJByIDCall getPJByIDCall = GetPJByIDCall();
  static InserirPJCall inserirPJCall = InserirPJCall();
  static EditPJCall editPJCall = EditPJCall();
  static LoginPJCall loginPJCall = LoginPJCall();
  static ShowMePJCall showMePJCall = ShowMePJCall();
  static ChangePasswordCall changePasswordCall = ChangePasswordCall();
  static ResponderSolicitacaoCall responderSolicitacaoCall =
      ResponderSolicitacaoCall();
}

class GetAllPJsCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Get All PJs',
      apiUrl: '${PjGroup.baseUrl}/user_id',
      callType: ApiCallType.GET,
      headers: {
        ...PjGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetPJByIDCall {
  Future<ApiCallResponse> call({
    int? id,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get PJ by ID',
      apiUrl: '${PjGroup.baseUrl}/user_id/${id}',
      callType: ApiCallType.GET,
      headers: {
        ...PjGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class InserirPJCall {
  Future<ApiCallResponse> call({
    String? nome = '',
    String? cnpj = '',
    String? cpf = '',
    String? nomeFantasia = '',
    String? razaoSocial = '',
    String? regimeTributario = '',
    int? banco,
    String? agencia = '',
    String? contacorrente = '',
    String? emailcorporativo = '',
    String? cargo = '',
    String? linkedin = '',
    String? gestor = '',
    String? telefone = '',
    String? statuscadastro = 'Pendente',
  }) {
    final body = '''
{
  "nome": "${nome}",
  "cnpj": "${cnpj}",
  "cpf": "${cpf}",
  "nomefantasia": "${nomeFantasia}",
  "razaosocial": "${razaoSocial}",
  "regimetributario": "${regimeTributario}",
  "banco": ${banco},
  "agencia": "${agencia}",
  "contacorrente": "${contacorrente}",
  "emailcorporativo": "${emailcorporativo}",
  "cargo": "${cargo}",
  "linkedin": "${linkedin}",
  "nomegestor": "${gestor}",
  "telefone": "${telefone}",
  "statuscadastro": "${statuscadastro}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'InserirPJ',
      apiUrl: '${PjGroup.baseUrl}/user_id',
      callType: ApiCallType.POST,
      headers: {
        ...PjGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EditPJCall {
  Future<ApiCallResponse> call({
    String? nome = '',
    String? cnpj = '',
    String? cpf = '',
    String? nomeFantasia = '',
    String? razaoSocial = '',
    String? regimeTributario = '',
    int? banco,
    String? agencia = '',
    String? contacorrente = '',
    String? emailcorporativo = '',
    String? cargo = '',
    String? linkedin = '',
    String? gestor = '',
    String? telefone = '',
    String? statusCadastro = 'Concluído',
    int? id,
    String? token = '',
    String? password2 = '',
  }) {
    final body = '''
{
  "nome": "${nome}",
  "cnpj": "${cnpj}",
  "cpf": "${cpf}",
  "nomefantasia": "${nomeFantasia}",
  "razaosocial": "${razaoSocial}",
  "regimetributario": "${regimeTributario}",
  "banco": ${banco},
  "agencia": "${agencia}",
  "contacorrente": "${contacorrente}",
  "email": "${emailcorporativo}",
  "cargo": "${cargo}",
  "linkedin": "${linkedin}",
  "nomegestor": "${gestor}",
  "telefone": "${telefone}",
  "status_cadastro": "${statusCadastro}",
  "password2": "${password2}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'EditPJ',
      apiUrl: '${PjGroup.baseUrl}/user_id/${id}',
      callType: ApiCallType.POST,
      headers: {
        ...PjGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class LoginPJCall {
  Future<ApiCallResponse> call({
    String? cpf = '',
    String? senha = '',
  }) {
    final body = '''
{
  "cpf": "${cpf}",
  "password": "${senha}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'loginPJ',
      apiUrl: '${PjGroup.baseUrl}/user_id/auth/login',
      callType: ApiCallType.POST,
      headers: {
        ...PjGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ShowMePJCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'showMePJ',
      apiUrl: '${PjGroup.baseUrl}/user_id/auth/me',
      callType: ApiCallType.GET,
      headers: {
        ...PjGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ChangePasswordCall {
  Future<ApiCallResponse> call({
    String? password = '',
    String? token = '',
    int? id,
  }) {
    final body = '''
{
  "password": "${password}",
  "id": ${id}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'changePassword',
      apiUrl: '${PjGroup.baseUrl}/user_id/auth/updatepassword',
      callType: ApiCallType.POST,
      headers: {
        ...PjGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ResponderSolicitacaoCall {
  Future<ApiCallResponse> call({
    int? idPrestador,
    int? idEmpresa,
    bool? response,
  }) {
    final body = '''
{
  "id_prestador": ${idPrestador},
  "id_empresa": ${idEmpresa},
  "response": ${response}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'responderSolicitacao',
      apiUrl: '${PjGroup.baseUrl}/user_id/responderSolicitacao/',
      callType: ApiCallType.POST,
      headers: {
        ...PjGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End PJ Group Code

/// Start Prestador Group Code

class PrestadorGroup {
  static String baseUrl = 'https://xare-axod-hky2.b2.xano.io/api:itPnww4x';
  static Map<String, String> headers = {};
  static AddInteressadoBeneficioCall addInteressadoBeneficioCall =
      AddInteressadoBeneficioCall();
  static AddPrestadorCall addPrestadorCall = AddPrestadorCall();
  static EditPrestadorCall editPrestadorCall = EditPrestadorCall();
  static ListarBeneficiosCall listarBeneficiosCall = ListarBeneficiosCall();
  static GetApontamentosCall getApontamentosCall = GetApontamentosCall();
  static GetApontamentosPrestadorCall getApontamentosPrestadorCall =
      GetApontamentosPrestadorCall();
  static PostApontamentosCall postApontamentosCall = PostApontamentosCall();
  static GetNotaFiscalPrestadorCall getNotaFiscalPrestadorCall =
      GetNotaFiscalPrestadorCall();
  static AddNotaFiscalCall addNotaFiscalCall = AddNotaFiscalCall();
  static GetAlocacoesPrestadorCall getAlocacoesPrestadorCall =
      GetAlocacoesPrestadorCall();
  static GetPagamentosPrestadorCall getPagamentosPrestadorCall =
      GetPagamentosPrestadorCall();
  static PrestadorExisteCall prestadorExisteCall = PrestadorExisteCall();
}

class AddInteressadoBeneficioCall {
  Future<ApiCallResponse> call({
    int? idBeneficio,
    int? idPrestador,
  }) {
    final body = '''
{
  "id_beneficio": ${idBeneficio},
  "id_prestador": ${idPrestador}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addInteressadoBeneficio',
      apiUrl: '${PrestadorGroup.baseUrl}/InserirInteressadoAtBeneficio',
      callType: ApiCallType.POST,
      headers: {
        ...PrestadorGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddPrestadorCall {
  Future<ApiCallResponse> call({
    String? nome = '',
    String? cnpj = '',
    String? cpf = '',
    String? nomefantasia = '',
    String? razaosocial = '',
    String? regimetributario = '',
    int? banco,
    String? agencia = '',
    String? contacorrente = '',
    String? email = '',
    String? cargo = '',
    String? linkedin = '',
    String? nomegestor = '',
    String? telefone = '',
    String? statuscadastro = '',
    String? password = '',
  }) {
    final body = '''
{
  "nome": "${nome}",
  "cnpj": "${cnpj}",
  "cpf": "${cpf}",
  "nomefantasia": "${nomefantasia}",
  "razaosocial": "${razaosocial}",
  "regimetributario": "${regimetributario}",
  "banco": ${banco},
  "agencia": "${agencia}",
  "contacorrente": "${contacorrente}",
  "email": "${email}",
  "cargo": "${cargo}",
  "linkedin": "${linkedin}",
  "nomegestor": "${nomegestor}",
  "telefone":"${telefone}" ,
  "status_cadastro": "${statuscadastro}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addPrestador',
      apiUrl: '${PrestadorGroup.baseUrl}/user_id/auth/signup',
      callType: ApiCallType.POST,
      headers: {
        ...PrestadorGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EditPrestadorCall {
  Future<ApiCallResponse> call({
    String? nome = '',
    String? cnpj = '',
    String? nomefantasia = '',
    String? razaosocial = '',
    String? regimetributario = '',
    int? banco,
    String? agencia = '',
    String? contacorrente = '',
    String? email = '',
    String? linkedin = '',
    String? nomegestor = '',
    String? telefone = '',
    int? id,
    String? cpf = '',
    String? cargo = '',
    String? token = '',
  }) {
    final body = '''
{
  "nome": "${nome}",
  "cnpj": "${cnpj}",
  "cpf": "${cpf}",
  "nomefantasia": "${nomefantasia}",
  "razaosocial": "${razaosocial}",
  "regimetributario": "${regimetributario}",
  "banco": ${banco},
  "agencia":"${agencia}",
  "contacorrente": "${contacorrente}",
  "email": "${email}",
  "cargo": "${cargo}",
  "linkedin": "${linkedin}",
  "nomegestor": "${nomegestor}",
  "telefone": "${telefone}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'editPrestador',
      apiUrl: '${PrestadorGroup.baseUrl}/user_id/${id}',
      callType: ApiCallType.POST,
      headers: {
        ...PrestadorGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ListarBeneficiosCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'ListarBeneficios',
      apiUrl: '${PrestadorGroup.baseUrl}/beneficio',
      callType: ApiCallType.GET,
      headers: {
        ...PrestadorGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetApontamentosCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'GetApontamentos',
      apiUrl: '${PrestadorGroup.baseUrl}/apontamentos',
      callType: ApiCallType.GET,
      headers: {
        ...PrestadorGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetApontamentosPrestadorCall {
  Future<ApiCallResponse> call({
    int? idPrestador,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetApontamentosPrestador',
      apiUrl: '${PrestadorGroup.baseUrl}/apontamentos/prestador/${idPrestador}',
      callType: ApiCallType.GET,
      headers: {
        ...PrestadorGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PostApontamentosCall {
  Future<ApiCallResponse> call({
    int? userId,
    int? projetoId,
    int? empresaId,
    double? totalHoras,
    bool? hasCommentary,
    String? mes = '',
    String? ano = '',
    double? valorHora,
    String? modalidade = '',
    String? comentario = '',
    String? status = '',
    String? regimeTributario = '',
  }) {
    final body = '''
{
  "user_id_id": ${userId},
  "projeto_id": ${projetoId},
  "id_empresa": ${empresaId},
  "totalhours": ${totalHoras},
  "status": "${status}",
  "hasCommentary": ${hasCommentary},
  "mesReferencia": "${mes}",
  "anoReferencia": "${ano}",
  "valorHora": ${valorHora},
  "modalidade":"${modalidade}",
  "regime_tributario": "${regimeTributario}",
  "commentary": "${comentario}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'postApontamentos',
      apiUrl: '${PrestadorGroup.baseUrl}/apontamentos',
      callType: ApiCallType.POST,
      headers: {
        ...PrestadorGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetNotaFiscalPrestadorCall {
  Future<ApiCallResponse> call({
    int? id,
    int? situacao,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getNotaFiscalPrestador',
      apiUrl: '${PrestadorGroup.baseUrl}/nota_fiscal/prestador/',
      callType: ApiCallType.GET,
      headers: {
        ...PrestadorGroup.headers,
      },
      params: {
        'id': id,
        'situacao': situacao,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddNotaFiscalCall {
  Future<ApiCallResponse> call({
    int? idNf,
    FFUploadedFile? pdf,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'addNotaFiscal',
      apiUrl: '${PrestadorGroup.baseUrl}/nota_fiscal/prestador/upload',
      callType: ApiCallType.POST,
      headers: {
        ...PrestadorGroup.headers,
      },
      params: {
        'id_nf': idNf,
        'pdf': pdf,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetAlocacoesPrestadorCall {
  Future<ApiCallResponse> call({
    int? idPrestador,
    int? idEmpresa,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getAlocacoesPrestador',
      apiUrl: '${PrestadorGroup.baseUrl}/alocacoes/prestador/empresa/',
      callType: ApiCallType.GET,
      headers: {
        ...PrestadorGroup.headers,
      },
      params: {
        'id_prestador': idPrestador,
        'id_empresa': idEmpresa,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetPagamentosPrestadorCall {
  Future<ApiCallResponse> call({
    int? id,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getPagamentosPrestador',
      apiUrl: '${PrestadorGroup.baseUrl}/pagamento/prestador/',
      callType: ApiCallType.GET,
      headers: {
        ...PrestadorGroup.headers,
      },
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PrestadorExisteCall {
  Future<ApiCallResponse> call({
    String? cpf = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'prestadorExiste',
      apiUrl: '${PrestadorGroup.baseUrl}/user_id/prestador-existe/',
      callType: ApiCallType.GET,
      headers: {
        ...PrestadorGroup.headers,
      },
      params: {
        'cpf': cpf,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Prestador Group Code

/// Start MagicLinks Group Code

class MagicLinksGroup {
  static String baseUrl = 'https://xare-axod-hky2.b2.xano.io/api:itPnww4x';
  static Map<String, String> headers = {};
  static SendEmailPJCall sendEmailPJCall = SendEmailPJCall();
  static SendEmailEmpresaCall sendEmailEmpresaCall = SendEmailEmpresaCall();
  static MagicLoginPJCall magicLoginPJCall = MagicLoginPJCall();
  static SendInviteCall sendInviteCall = SendInviteCall();
  static MagicLoginEmpresaCall magicLoginEmpresaCall = MagicLoginEmpresaCall();
  static MagicLoginInviteCall magicLoginInviteCall = MagicLoginInviteCall();
}

class SendEmailPJCall {
  Future<ApiCallResponse> call({
    String? email = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'sendEmailPJ',
      apiUrl: '${MagicLinksGroup.baseUrl}/auth/magic-link?email=${email}',
      callType: ApiCallType.GET,
      headers: {
        ...MagicLinksGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class SendEmailEmpresaCall {
  Future<ApiCallResponse> call({
    String? cnpj = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'sendEmailEmpresa',
      apiUrl: '${MagicLinksGroup.baseUrl}/auth/magic-link-empresa?cnpj=${cnpj}',
      callType: ApiCallType.GET,
      headers: {
        ...MagicLinksGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class MagicLoginPJCall {
  Future<ApiCallResponse> call({
    String? magicToken = '',
  }) {
    final body = '''
{
  "magic_token": "${magicToken}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'magicLoginPJ',
      apiUrl: '${MagicLinksGroup.baseUrl}/auth/magic-login',
      callType: ApiCallType.POST,
      headers: {
        ...MagicLinksGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class SendInviteCall {
  Future<ApiCallResponse> call({
    String? cpf = '',
    String? nome = '',
    String? email = '',
    int? empresaId,
  }) {
    final body = '''
{
  "cpf": "${cpf}",
  "email": "${email}",
  "nome": "${nome}",
  "empresa_id": ${empresaId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sendInvite',
      apiUrl: '${MagicLinksGroup.baseUrl}/auth/invite',
      callType: ApiCallType.POST,
      headers: {
        ...MagicLinksGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class MagicLoginEmpresaCall {
  Future<ApiCallResponse> call({
    String? magicToken = '',
  }) {
    final body = '''
{
  "magic_token": "${magicToken}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'magicLoginEmpresa',
      apiUrl: '${MagicLinksGroup.baseUrl}/auth/magic-login-empresa',
      callType: ApiCallType.POST,
      headers: {
        ...MagicLinksGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class MagicLoginInviteCall {
  Future<ApiCallResponse> call({
    String? magicToken = '',
  }) {
    final body = '''
{
  "magic_token": "${magicToken}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'magicLoginInvite',
      apiUrl: '${MagicLinksGroup.baseUrl}/auth/magic-login-invite',
      callType: ApiCallType.POST,
      headers: {
        ...MagicLinksGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End MagicLinks Group Code

/// Start Beneficios Group Code

class BeneficiosGroup {
  static String baseUrl = 'https://xare-axod-hky2.b2.xano.io/api:itPnww4x';
  static Map<String, String> headers = {};
  static GetBeneficiosCall getBeneficiosCall = GetBeneficiosCall();
  static GetBeneficioByIDCall getBeneficioByIDCall = GetBeneficioByIDCall();
  static AddBeneficioCall addBeneficioCall = AddBeneficioCall();
  static EditBeneCall editBeneCall = EditBeneCall();
  static AddBeneficioFAQCall addBeneficioFAQCall = AddBeneficioFAQCall();
  static AddComercialCall addComercialCall = AddComercialCall();
  static DeleteFAQCall deleteFAQCall = DeleteFAQCall();
  static AddBeneficioIMGCall addBeneficioIMGCall = AddBeneficioIMGCall();
  static GetBeneficiosPrestadorCall getBeneficiosPrestadorCall =
      GetBeneficiosPrestadorCall();
  static GetBeneficiosPrestadorInteressesCall
      getBeneficiosPrestadorInteressesCall =
      GetBeneficiosPrestadorInteressesCall();
  static RemoverFavoritoCall removerFavoritoCall = RemoverFavoritoCall();
  static FavoritarCall favoritarCall = FavoritarCall();
  static GetComerciaisBeneficioCall getComerciaisBeneficioCall =
      GetComerciaisBeneficioCall();
  static GetBeneficioPrestadorByIdCall getBeneficioPrestadorByIdCall =
      GetBeneficioPrestadorByIdCall();
}

class GetBeneficiosCall {
  Future<ApiCallResponse> call({
    int? categoria = 0,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getBeneficios',
      apiUrl: '${BeneficiosGroup.baseUrl}/beneficio',
      callType: ApiCallType.GET,
      headers: {
        ...BeneficiosGroup.headers,
      },
      params: {
        'categoria': categoria,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetBeneficioByIDCall {
  Future<ApiCallResponse> call({
    int? beneficioId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getBeneficioByID',
      apiUrl: '${BeneficiosGroup.baseUrl}/beneficio/${beneficioId}',
      callType: ApiCallType.GET,
      headers: {
        ...BeneficiosGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddBeneficioCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? category = '',
    String? description = '',
    bool? isActive,
    int? idEmpresa,
  }) {
    final body = '''
{
  "name": "${name}",
  "category": "${category}",
  "description": "${description}",
  "is_active": ${isActive},
  "empresa_id": ${idEmpresa}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addBeneficio',
      apiUrl: '${BeneficiosGroup.baseUrl}/beneficio',
      callType: ApiCallType.POST,
      headers: {
        ...BeneficiosGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EditBeneCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? category = '',
    String? description = '',
    bool? isActive,
    int? id,
  }) {
    final body = '''
{
  "name": "${name}",
  "category": "${category}",
  "description": "${description}",
  "is_active": ${isActive}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'editBene',
      apiUrl: '${BeneficiosGroup.baseUrl}/beneficio/${id}',
      callType: ApiCallType.POST,
      headers: {
        ...BeneficiosGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddBeneficioFAQCall {
  Future<ApiCallResponse> call({
    int? idBeneficio,
    String? question = '',
    String? answer = '',
  }) {
    final body = '''
{
  "question": "${question}",
  "answer": "${answer}",
  "beneficio_id": ${idBeneficio}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addBeneficioFAQ',
      apiUrl: '${BeneficiosGroup.baseUrl}/faq',
      callType: ApiCallType.POST,
      headers: {
        ...BeneficiosGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddComercialCall {
  Future<ApiCallResponse> call({
    int? idBeneficio,
    String? nome = '',
    String? email = '',
    String? contato = '',
    String? empresa = '',
  }) {
    final body = '''
{
  "name": "${nome}",
  "email": "${email}",
  "contato": "${contato}",
  "beneficio_id": ${idBeneficio},
  "empresa": "${empresa}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addComercial',
      apiUrl: '${BeneficiosGroup.baseUrl}/comercial',
      callType: ApiCallType.POST,
      headers: {
        ...BeneficiosGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DeleteFAQCall {
  Future<ApiCallResponse> call({
    int? id,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteFAQ',
      apiUrl: '${BeneficiosGroup.baseUrl}/faq/${id}',
      callType: ApiCallType.DELETE,
      headers: {
        ...BeneficiosGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddBeneficioIMGCall {
  Future<ApiCallResponse> call({
    int? idBeneficio,
    FFUploadedFile? icon,
    FFUploadedFile? product,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'addBeneficioIMG',
      apiUrl: '${BeneficiosGroup.baseUrl}/beneficio/inserirImagens/',
      callType: ApiCallType.POST,
      headers: {
        ...BeneficiosGroup.headers,
      },
      params: {
        'id_beneficio': idBeneficio,
        'icon': icon,
        'product': product,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetBeneficiosPrestadorCall {
  Future<ApiCallResponse> call({
    dynamic? empresaJson,
    int? id,
  }) {
    final empresa = _serializeJson(empresaJson);
    final body = '''
{
  "empresas": ${empresa},
  "user_id": ${id}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getBeneficiosPrestador',
      apiUrl: '${BeneficiosGroup.baseUrl}/beneficio/beneficios-prestador/',
      callType: ApiCallType.POST,
      headers: {
        ...BeneficiosGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetBeneficiosPrestadorInteressesCall {
  Future<ApiCallResponse> call({
    dynamic? empresaJson,
    int? id,
  }) {
    final empresa = _serializeJson(empresaJson);
    final body = '''
{
  "empresas": ${empresa},
  "user_id": ${id}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getBeneficiosPrestadorInteresses',
      apiUrl:
          '${BeneficiosGroup.baseUrl}/beneficio/beneficios-prestador-interesses/',
      callType: ApiCallType.POST,
      headers: {
        ...BeneficiosGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RemoverFavoritoCall {
  Future<ApiCallResponse> call({
    int? id,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'removerFavorito',
      apiUrl: '${BeneficiosGroup.baseUrl}/interesse/${id}',
      callType: ApiCallType.DELETE,
      headers: {
        ...BeneficiosGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class FavoritarCall {
  Future<ApiCallResponse> call({
    int? idBeneficio,
    int? idPj,
    int? idComercial,
  }) {
    final body = '''
{
  "beneficio_id": ${idBeneficio},
  "user_id_id": ${idPj},
  "comercial_id": ${idComercial}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'favoritar',
      apiUrl: '${BeneficiosGroup.baseUrl}/interesse',
      callType: ApiCallType.POST,
      headers: {
        ...BeneficiosGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetComerciaisBeneficioCall {
  Future<ApiCallResponse> call({
    int? idBeneficio,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getComerciaisBeneficio',
      apiUrl: '${BeneficiosGroup.baseUrl}/comercial/beneficio/${idBeneficio}',
      callType: ApiCallType.GET,
      headers: {
        ...BeneficiosGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetBeneficioPrestadorByIdCall {
  Future<ApiCallResponse> call({
    int? idBeneficio,
    int? idPrestador = 0,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getBeneficioPrestadorById',
      apiUrl:
          '${BeneficiosGroup.baseUrl}/beneficio/prestador/${idBeneficio}/${idPrestador}',
      callType: ApiCallType.GET,
      headers: {
        ...BeneficiosGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Beneficios Group Code

/// Start Book Group Code

class BookGroup {
  static String baseUrl = 'https://xare-axod-hky2.b2.xano.io/api:zC3u3G31';
  static Map<String, String> headers = {};
  static SetupCall setupCall = SetupCall();
  static CriarCall criarCall = CriarCall();
  static GetSalariosGestorCall getSalariosGestorCall = GetSalariosGestorCall();
  static GetAusenciaGestorCall getAusenciaGestorCall = GetAusenciaGestorCall();
  static GetAcompanhamentosGestorCall getAcompanhamentosGestorCall =
      GetAcompanhamentosGestorCall();
  static GetAcompanhamentoByBookIDCall getAcompanhamentoByBookIDCall =
      GetAcompanhamentoByBookIDCall();
  static GetSalariosByBookIDCall getSalariosByBookIDCall =
      GetSalariosByBookIDCall();
  static GetAusenciasByBookIDCall getAusenciasByBookIDCall =
      GetAusenciasByBookIDCall();
  static GetAusenciasByColabCall getAusenciasByColabCall =
      GetAusenciasByColabCall();
  static GetAcompanhamentosByColabCall getAcompanhamentosByColabCall =
      GetAcompanhamentosByColabCall();
  static GetSalariosByColabCall getSalariosByColabCall =
      GetSalariosByColabCall();
  static AddBookAcompanhamentoCall addBookAcompanhamentoCall =
      AddBookAcompanhamentoCall();
  static AddFeriasCall addFeriasCall = AddFeriasCall();
  static AddAusenciaCall addAusenciaCall = AddAusenciaCall();
  static AddSalarioCall addSalarioCall = AddSalarioCall();
}

class SetupCall {
  Future<ApiCallResponse> call({
    int? idGestor,
    dynamic? hierarquiaJson,
  }) {
    final hierarquia = _serializeJson(hierarquiaJson);
    final body = '''
{
  "id_gestor": ${idGestor},
  "hierarquia": ${hierarquia}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Setup',
      apiUrl: '${BookGroup.baseUrl}/book/setup/',
      callType: ApiCallType.POST,
      headers: {
        ...BookGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CriarCall {
  Future<ApiCallResponse> call({
    int? idGestor,
    dynamic? colabsJson,
  }) {
    final colabs = _serializeJson(colabsJson);
    final body = '''
{
  "id_gestor": ${idGestor},
  "colabs": ${colabs}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Criar',
      apiUrl: '${BookGroup.baseUrl}/book/criar/',
      callType: ApiCallType.POST,
      headers: {
        ...BookGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetSalariosGestorCall {
  Future<ApiCallResponse> call({
    int? idGestor,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetSalariosGestor',
      apiUrl: '${BookGroup.baseUrl}/book_salario/gestor/${idGestor}',
      callType: ApiCallType.GET,
      headers: {
        ...BookGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetAusenciaGestorCall {
  Future<ApiCallResponse> call({
    int? idGestor,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetAusenciaGestor',
      apiUrl: '${BookGroup.baseUrl}/book_ausencia/gestor/${idGestor}',
      callType: ApiCallType.GET,
      headers: {
        ...BookGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetAcompanhamentosGestorCall {
  Future<ApiCallResponse> call({
    int? idGestor,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetAcompanhamentosGestor',
      apiUrl: '${BookGroup.baseUrl}/book_acompanhamento/gestor/${idGestor}',
      callType: ApiCallType.GET,
      headers: {
        ...BookGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetAcompanhamentoByBookIDCall {
  Future<ApiCallResponse> call({
    int? bookId = 1,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetAcompanhamentoByBookID',
      apiUrl: '${BookGroup.baseUrl}/book_acompanhamento/book/${bookId}',
      callType: ApiCallType.GET,
      headers: {
        ...BookGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetSalariosByBookIDCall {
  Future<ApiCallResponse> call({
    int? bookId = 1,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetSalariosByBookID',
      apiUrl: '${BookGroup.baseUrl}/book_salario/book/${bookId}',
      callType: ApiCallType.GET,
      headers: {
        ...BookGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetAusenciasByBookIDCall {
  Future<ApiCallResponse> call({
    int? bookId = 1,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetAusenciasByBookID',
      apiUrl: '${BookGroup.baseUrl}/book_ausencia/book/${bookId}',
      callType: ApiCallType.GET,
      headers: {
        ...BookGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetAusenciasByColabCall {
  Future<ApiCallResponse> call({
    int? colabId = 1,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetAusenciasByColab',
      apiUrl: '${BookGroup.baseUrl}/book_ausencia/colab/${colabId}',
      callType: ApiCallType.GET,
      headers: {
        ...BookGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetAcompanhamentosByColabCall {
  Future<ApiCallResponse> call({
    int? colabId = 1,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetAcompanhamentosByColab',
      apiUrl: '${BookGroup.baseUrl}/book_acompanhamento/colab/${colabId}',
      callType: ApiCallType.GET,
      headers: {
        ...BookGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetSalariosByColabCall {
  Future<ApiCallResponse> call({
    int? colabId = 1,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetSalariosByColab',
      apiUrl: '${BookGroup.baseUrl}/book_salario/colab/${colabId}',
      callType: ApiCallType.GET,
      headers: {
        ...BookGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddBookAcompanhamentoCall {
  Future<ApiCallResponse> call({
    String? movimentacao = '',
    String? forca = '',
    String? melhoria = '',
    String? obsGerais = '',
    String? nmGestor = '',
    int? bookId,
  }) {
    final body = '''
{
  "movimentacao": "${movimentacao}",
  "forca": "${forca}",
  "melhoria": "${melhoria}",
  "obs_gerais": "${obsGerais}",
  "nm_gestor": "${nmGestor}",
  "book_id": "${bookId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AddBookAcompanhamento',
      apiUrl: '${BookGroup.baseUrl}/book_acompanhamento',
      callType: ApiCallType.POST,
      headers: {
        ...BookGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddFeriasCall {
  Future<ApiCallResponse> call({
    int? bookId,
    String? tipo = '',
    int? dataInicio,
    int? dataFim,
    dynamic? periodoJson,
  }) {
    final periodo = _serializeJson(periodoJson);
    final body = '''
{
  "book_id": ${bookId},
  "tipo_ausencia": "${tipo}",
  "data_inicio": ${dataInicio},
  "data_fim": ${dataFim},
  "periodo": ${periodo}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AddFerias',
      apiUrl: '${BookGroup.baseUrl}/book_ausencia',
      callType: ApiCallType.POST,
      headers: {
        ...BookGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddAusenciaCall {
  Future<ApiCallResponse> call({
    int? bookId,
    String? tipo = '',
    int? dataInicio,
    int? dataFim,
  }) {
    final body = '''
{
  "book_id": ${bookId},
  "tipo_ausencia": "${tipo}",
  "data_inicio": ${dataInicio},
  "data_fim": ${dataFim}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AddAusencia',
      apiUrl: '${BookGroup.baseUrl}/book_ausencia',
      callType: ApiCallType.POST,
      headers: {
        ...BookGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddSalarioCall {
  Future<ApiCallResponse> call({
    int? bookId,
    String? movimentadoEm = '',
    int? valorTotal,
    int? valorHora,
    int? beneficios,
    String? motivo = '',
    String? tipo = '',
    String? cargo = '',
  }) {
    final body = '''
{
  "book_id": ${bookId},
  "movimentado_em": "${movimentadoEm}",
  "valor_total": ${valorTotal},
  "valor_hora": ${valorHora},
  "beneficios": ${beneficios},
  "motivo": "${motivo}",
  "tipo": "${tipo}",
  "cargo": "${cargo}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AddSalario',
      apiUrl: '${BookGroup.baseUrl}/book_salario',
      callType: ApiCallType.POST,
      headers: {
        ...BookGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Book Group Code

/// Start csv Group Code

class CsvGroup {
  static String baseUrl = 'https://xare-axod-hky2.b2.xano.io/api:itPnww4x/csv/';
  static Map<String, String> headers = {};
  static ExportarTemplateOneCall exportarTemplateOneCall =
      ExportarTemplateOneCall();
  static ExportarTemplateTwoCall exportarTemplateTwoCall =
      ExportarTemplateTwoCall();
  static ExportarTemplateThreeCall exportarTemplateThreeCall =
      ExportarTemplateThreeCall();
  static ImportarCall importarCall = ImportarCall();
}

class ExportarTemplateOneCall {
  Future<ApiCallResponse> call({
    int? idEmpresa,
    String? token = '',
    int? identificadorAcesso = 0,
  }) {
    final body = '''
{
  "empresa_id": ${idEmpresa},
  "token": "${token}",
  "identificador": ${identificadorAcesso}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'exportarTemplateOne',
      apiUrl: '${CsvGroup.baseUrl}exportar/apontamentos-t1/',
      callType: ApiCallType.POST,
      headers: {
        ...CsvGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ExportarTemplateTwoCall {
  Future<ApiCallResponse> call({
    int? idEmpresa,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'exportarTemplateTwo',
      apiUrl: '${CsvGroup.baseUrl}exportar/apontamentos-t2/${idEmpresa}',
      callType: ApiCallType.GET,
      headers: {
        ...CsvGroup.headers,
        'Content-Disposition': 'attachment;filename=apontamentos.csv',
        'Content-Type': 'text/csv',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ExportarTemplateThreeCall {
  Future<ApiCallResponse> call({
    int? idEmpresa,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'exportarTemplateThree',
      apiUrl: '${CsvGroup.baseUrl}exportar/apontamentos-t3/${idEmpresa}',
      callType: ApiCallType.GET,
      headers: {
        ...CsvGroup.headers,
        'Content-Disposition': 'attachment;filename=apontamentos.csv',
        'Content-Type': 'text/csv',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ImportarCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? csv,
    int? idEmpresa,
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'importar',
      apiUrl: '${CsvGroup.baseUrl}importar/apontamentos/',
      callType: ApiCallType.POST,
      headers: {
        ...CsvGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'csv': csv,
        'id_empresa': idEmpresa,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End csv Group Code

/// Start myCV Group Code

class MyCVGroup {
  static String baseUrl = 'https://xare-axod-hky2.b2.xano.io/api:MLkFdmWD';
  static Map<String, String> headers = {};
  static GeraLinkCall geraLinkCall = GeraLinkCall();
  static EditCVCall editCVCall = EditCVCall();
  static GetByLinkCall getByLinkCall = GetByLinkCall();
  static DeleteLinkCall deleteLinkCall = DeleteLinkCall();
}

class GeraLinkCall {
  Future<ApiCallResponse> call({
    dynamic? experienciasJson,
    String? nomelink = '',
    dynamic? certificacoesJson,
    dynamic? formacaoJson,
    dynamic? hardskillsJson,
    dynamic? softskillsJson,
    dynamic? idiomasJson,
    dynamic? metodologiasJson,
  }) {
    final experiencias = _serializeJson(experienciasJson);
    final certificacoes = _serializeJson(certificacoesJson);
    final formacao = _serializeJson(formacaoJson);
    final hardskills = _serializeJson(hardskillsJson);
    final softskills = _serializeJson(softskillsJson);
    final idiomas = _serializeJson(idiomasJson);
    final metodologias = _serializeJson(metodologiasJson);
    final body = '''
{
  "experiencias": ${experiencias},
  "nomelink": "${nomelink}",
  "ativo": "1",
  "certificacoes": ${certificacoes},
  "formacao": ${formacao},
  "hardskills": ${hardskills},
  "softskills": ${softskills},
  "idiomas": ${idiomas},
  "metodologias": ${metodologias}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'geraLink',
      apiUrl: '${MyCVGroup.baseUrl}/mycv',
      callType: ApiCallType.POST,
      headers: {
        ...MyCVGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EditCVCall {
  Future<ApiCallResponse> call({
    String? nomelink = '',
    dynamic? experienciasJson,
    bool? ativo,
    dynamic? certificacoesJson,
    dynamic? formacaoJson,
    dynamic? hardskillsJson,
    dynamic? softskillsJson,
    dynamic? idiomasJson,
    dynamic? metodologiasJson,
  }) {
    final experiencias = _serializeJson(experienciasJson);
    final certificacoes = _serializeJson(certificacoesJson);
    final formacao = _serializeJson(formacaoJson);
    final hardskills = _serializeJson(hardskillsJson);
    final softskills = _serializeJson(softskillsJson);
    final idiomas = _serializeJson(idiomasJson);
    final metodologias = _serializeJson(metodologiasJson);
    final body = '''
{
  "nome_link": "${nomelink}",
  "experiencias": ${experiencias},
  "ativo": ${ativo},
  "certificacoes": ${certificacoes},
  "formacao": ${formacao},
  "hard_skills": ${hardskills},
  "soft_skills": ${softskills},
  "idiomas": ${idiomas},
  "metodologias": ${metodologias}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'editCV',
      apiUrl: '${MyCVGroup.baseUrl}/mycv/edit/',
      callType: ApiCallType.POST,
      headers: {
        ...MyCVGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetByLinkCall {
  Future<ApiCallResponse> call({
    String? nomelink = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getByLink',
      apiUrl: '${MyCVGroup.baseUrl}/mycv/nome-link/${nomelink}',
      callType: ApiCallType.GET,
      headers: {
        ...MyCVGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DeleteLinkCall {
  Future<ApiCallResponse> call({
    String? nomelink = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteLink',
      apiUrl: '${MyCVGroup.baseUrl}/mycv/${nomelink}',
      callType: ApiCallType.DELETE,
      headers: {
        ...MyCVGroup.headers,
      },
      params: {
        'nomelink': nomelink,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End myCV Group Code

/// Start OKR Group Code

class OkrGroup {
  static String baseUrl = 'https://xare-axod-hky2.b2.xano.io/api:vqNe_lyO/';
  static Map<String, String> headers = {};
  static GetAllObjetivosAreaCall getAllObjetivosAreaCall =
      GetAllObjetivosAreaCall();
  static GetAllokrCall getAllokrCall = GetAllokrCall();
  static GetResultadosCall getResultadosCall = GetResultadosCall();
  static AddObjetivoPrincipalCall addObjetivoPrincipalCall =
      AddObjetivoPrincipalCall();
  static AddObjetivodaAreaCall addObjetivodaAreaCall = AddObjetivodaAreaCall();
  static PausarOKRCall pausarOKRCall = PausarOKRCall();
  static DespausarOKRCall despausarOKRCall = DespausarOKRCall();
  static PausarObjetivoAreaCall pausarObjetivoAreaCall =
      PausarObjetivoAreaCall();
  static DespausarObjetivoAreaCall despausarObjetivoAreaCall =
      DespausarObjetivoAreaCall();
  static PausarResultadoCall pausarResultadoCall = PausarResultadoCall();
  static DespausarResultadoCall despausarResultadoCall =
      DespausarResultadoCall();
  static PausarIniciativaCall pausarIniciativaCall = PausarIniciativaCall();
  static DespausarIniciativaCall despausarIniciativaCall =
      DespausarIniciativaCall();
  static AddResultadoChaveCall addResultadoChaveCall = AddResultadoChaveCall();
  static AddIniciativaCall addIniciativaCall = AddIniciativaCall();
  static EditarOKRCall editarOKRCall = EditarOKRCall();
  static EditarObjetivoAreaCall editarObjetivoAreaCall =
      EditarObjetivoAreaCall();
  static EditarResultadoChaveCall editarResultadoChaveCall =
      EditarResultadoChaveCall();
  static EditarIniciativaCall editarIniciativaCall = EditarIniciativaCall();
  static DeleteIniciativaCall deleteIniciativaCall = DeleteIniciativaCall();
  static DeleteResultadoChaveCall deleteResultadoChaveCall =
      DeleteResultadoChaveCall();
  static DeleteObjetivoAreaCall deleteObjetivoAreaCall =
      DeleteObjetivoAreaCall();
  static DeleteObjetivoPrincipalCall deleteObjetivoPrincipalCall =
      DeleteObjetivoPrincipalCall();
}

class GetAllObjetivosAreaCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getAllObjetivosArea',
      apiUrl: '${OkrGroup.baseUrl}objetivo_area',
      callType: ApiCallType.GET,
      headers: {
        ...OkrGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetAllokrCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getAllokr',
      apiUrl: '${OkrGroup.baseUrl}okr',
      callType: ApiCallType.GET,
      headers: {
        ...OkrGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetResultadosCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getResultados',
      apiUrl: '${OkrGroup.baseUrl}resultado_chave',
      callType: ApiCallType.GET,
      headers: {
        ...OkrGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddObjetivoPrincipalCall {
  Future<ApiCallResponse> call({
    String? dataLimite = '',
    String? objetivo = '',
    int? colabId,
    String? area = '',
  }) {
    final body = '''
{
  "data_limite": "${dataLimite}",
  "objetivo": "${objetivo}",
  "colab_id": ${colabId},
  "area": "${area}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addObjetivoPrincipal',
      apiUrl: '${OkrGroup.baseUrl}okr',
      callType: ApiCallType.POST,
      headers: {
        ...OkrGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddObjetivodaAreaCall {
  Future<ApiCallResponse> call({
    String? dataLimite = '',
    String? titulo = '',
    int? okrId,
    String? area = '',
    int? colabId,
  }) {
    final body = '''
{
  "data_limite": "${dataLimite}",
  "titulo": "${titulo}",
  "okr_id": ${okrId},
  "area": "${area}",
  "colab_id":${colabId} 
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addObjetivodaArea',
      apiUrl: '${OkrGroup.baseUrl}objetivo_area',
      callType: ApiCallType.POST,
      headers: {
        ...OkrGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PausarOKRCall {
  Future<ApiCallResponse> call({
    int? id,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'pausarOKR',
      apiUrl: '${OkrGroup.baseUrl}okr/pausar/${id}',
      callType: ApiCallType.GET,
      headers: {
        ...OkrGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DespausarOKRCall {
  Future<ApiCallResponse> call({
    int? id,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'despausarOKR',
      apiUrl: '${OkrGroup.baseUrl}okr/despausar/${id}',
      callType: ApiCallType.GET,
      headers: {
        ...OkrGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PausarObjetivoAreaCall {
  Future<ApiCallResponse> call({
    int? id,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'pausarObjetivoArea',
      apiUrl: '${OkrGroup.baseUrl}objetivo_area/pausar/${id}',
      callType: ApiCallType.GET,
      headers: {
        ...OkrGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DespausarObjetivoAreaCall {
  Future<ApiCallResponse> call({
    int? id,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'despausarObjetivoArea',
      apiUrl: '${OkrGroup.baseUrl}objetivo_area/despausar/${id}',
      callType: ApiCallType.GET,
      headers: {
        ...OkrGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PausarResultadoCall {
  Future<ApiCallResponse> call({
    int? id,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'pausarResultado',
      apiUrl: '${OkrGroup.baseUrl}resultado_chave/pausar/${id}',
      callType: ApiCallType.GET,
      headers: {
        ...OkrGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DespausarResultadoCall {
  Future<ApiCallResponse> call({
    int? id,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'despausarResultado',
      apiUrl: '${OkrGroup.baseUrl}resultado_chave/despausar/${id}',
      callType: ApiCallType.GET,
      headers: {
        ...OkrGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PausarIniciativaCall {
  Future<ApiCallResponse> call({
    int? id,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'pausarIniciativa',
      apiUrl: '${OkrGroup.baseUrl}iniciativa/pausar/${id}',
      callType: ApiCallType.GET,
      headers: {
        ...OkrGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DespausarIniciativaCall {
  Future<ApiCallResponse> call({
    int? id,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'despausarIniciativa',
      apiUrl: '${OkrGroup.baseUrl}iniciativa/despausar/${id}',
      callType: ApiCallType.GET,
      headers: {
        ...OkrGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddResultadoChaveCall {
  Future<ApiCallResponse> call({
    String? dataLimite = '',
    String? titulo = '',
    int? objetivoareaId,
    int? colabId,
    bool? pausado,
  }) {
    final body = '''
{
  "data_limite": "${dataLimite}",
  "titulo": "${titulo}",
  "objetivo_area_id": ${objetivoareaId},
  "colab_id": ${colabId},
  "pausado": ${pausado}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addResultadoChave',
      apiUrl: '${OkrGroup.baseUrl}resultado_chave',
      callType: ApiCallType.POST,
      headers: {
        ...OkrGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddIniciativaCall {
  Future<ApiCallResponse> call({
    String? dataLimite = '',
    String? status = '',
    int? colabId,
    String? titulo = '',
    int? resultadochaveId,
    bool? pausado,
    String? nomeColab = '',
  }) {
    final body = '''
{
  "data_limite": "${dataLimite}",
  "status": "${status}",
  "colab_id": ${colabId},
  "titulo": "${titulo}",
  "resultado_chave_id": ${resultadochaveId},
  "pausado": ${pausado},
  "nome_colab": "${nomeColab}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addIniciativa',
      apiUrl: '${OkrGroup.baseUrl}iniciativa',
      callType: ApiCallType.POST,
      headers: {
        ...OkrGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EditarOKRCall {
  Future<ApiCallResponse> call({
    String? dataLimite = '',
    int? id,
  }) {
    final body = '''
{
  "data_limite": "${dataLimite}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'editarOKR',
      apiUrl: '${OkrGroup.baseUrl}okr/${id}',
      callType: ApiCallType.POST,
      headers: {
        ...OkrGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EditarObjetivoAreaCall {
  Future<ApiCallResponse> call({
    String? dataLimite = '',
    int? id,
  }) {
    final body = '''
{
  "data_limite": "${dataLimite}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'editarObjetivoArea',
      apiUrl: '${OkrGroup.baseUrl}objetivo_area/${id}',
      callType: ApiCallType.POST,
      headers: {
        ...OkrGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EditarResultadoChaveCall {
  Future<ApiCallResponse> call({
    String? dataLimite = '',
    int? id,
  }) {
    final body = '''
{
  "data-limite": "${dataLimite}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'editarResultadoChave',
      apiUrl: '${OkrGroup.baseUrl}resultado_chave/${id}',
      callType: ApiCallType.POST,
      headers: {
        ...OkrGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EditarIniciativaCall {
  Future<ApiCallResponse> call({
    String? dataLimite = '',
    int? id,
    int? colabId,
    String? titulo = '',
    String? nomeColab = '',
    String? status = '',
  }) {
    final body = '''
{
  "data-limite": "${dataLimite}",
  "colabId": ${colabId},
  "titulo": "${titulo}",
  "nome-colab": "${nomeColab}",
  "status": "${status}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'editarIniciativa',
      apiUrl: '${OkrGroup.baseUrl}iniciativa/${id}',
      callType: ApiCallType.POST,
      headers: {
        ...OkrGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DeleteIniciativaCall {
  Future<ApiCallResponse> call({
    int? iniciativaId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteIniciativa',
      apiUrl: '${OkrGroup.baseUrl}iniciativa/${iniciativaId}',
      callType: ApiCallType.DELETE,
      headers: {
        ...OkrGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DeleteResultadoChaveCall {
  Future<ApiCallResponse> call({
    int? resultadoChaveId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteResultadoChave',
      apiUrl: '${OkrGroup.baseUrl}resultado_chave/${resultadoChaveId}',
      callType: ApiCallType.DELETE,
      headers: {
        ...OkrGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DeleteObjetivoAreaCall {
  Future<ApiCallResponse> call({
    int? objetivoAreaId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteObjetivoArea',
      apiUrl: '${OkrGroup.baseUrl}objetivo_area/${objetivoAreaId}',
      callType: ApiCallType.DELETE,
      headers: {
        ...OkrGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DeleteObjetivoPrincipalCall {
  Future<ApiCallResponse> call({
    int? okrId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteObjetivoPrincipal',
      apiUrl: '${OkrGroup.baseUrl}okr/${okrId}',
      callType: ApiCallType.DELETE,
      headers: {
        ...OkrGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End OKR Group Code

/// Start Leads Group Code

class LeadsGroup {
  static String baseUrl = 'https://xare-axod-hky2.b2.xano.io/api:MLkFdmWD';
  static Map<String, String> headers = {};
  static ListarLeadsCall listarLeadsCall = ListarLeadsCall();
  static CriarLeadsCall criarLeadsCall = CriarLeadsCall();
  static EditarLeadsCall editarLeadsCall = EditarLeadsCall();
  static GetLeadCall getLeadCall = GetLeadCall();
}

class ListarLeadsCall {
  Future<ApiCallResponse> call({
    int? colabId = 0,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'ListarLeads',
      apiUrl: '${LeadsGroup.baseUrl}/leads',
      callType: ApiCallType.GET,
      headers: {
        ...LeadsGroup.headers,
      },
      params: {
        'colab-id': colabId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CriarLeadsCall {
  Future<ApiCallResponse> call({
    String? nomeCliente = '',
    String? gestorCliente = '',
    String? areaGestor = '',
    String? cargoGestor = '',
    String? emailCliente = '',
    String? telCliente = '',
    String? responsavelLead = '',
    String? assunto = '',
    String? detalhes = '',
    String? dataReuniao = '',
    String? horaIni = '',
    String? horaFim = '',
    String? tipoReuniao = '',
    String? enderecoCliente = '',
    int? userid,
  }) {
    final body = '''
{
  "nomeCliente": "${nomeCliente}",
  "gestorCliente": "${gestorCliente}",
  "areaGestor": "${areaGestor}",
  "cargoGestor": "${cargoGestor}",
  "emailCliente": "${emailCliente}",
  "telCliente": "${telCliente}",
  "responsavelLead": "${responsavelLead}",
  "assunto": "${assunto}",
  "detalhes": "${detalhes}",
  "dataReuniao": "${dataReuniao}",
  "horaIni": "${horaIni}",
  "horaFim": "${horaFim}",
  "tipoReuniao": "${tipoReuniao}",
  "enderecoCliente": "${enderecoCliente}",
  "userid": ${userid}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CriarLeads',
      apiUrl: '${LeadsGroup.baseUrl}/leads',
      callType: ApiCallType.POST,
      headers: {
        ...LeadsGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EditarLeadsCall {
  Future<ApiCallResponse> call({
    int? leadsId,
    String? nomeCliente = '',
    String? areaGestor = '',
    String? cargoGestor = '',
    String? emailCliente = '',
    String? telCliente = '',
    String? responsavelLead = '',
    String? assunto = '',
    String? detalhes = '',
    String? dataReuniao = '',
    String? horaIni = '',
    String? horaFim = '',
    String? tipoReuniao = '',
    String? enderecoCliente = '',
    int? userid,
    String? gestorCliente = '',
  }) {
    final body = '''
{
  "leads_id": ${leadsId},
  "nomeCliente": "${nomeCliente}",
  "gestorCliente": "${gestorCliente}",
  "areaGestor": "${areaGestor}",
  "cargoGestor": "${cargoGestor}",
  "emailCliente": "${emailCliente}",
  "telCliente": "${telCliente}",
  "responsavelLead": "${responsavelLead}",
  "assunto": "${assunto}",
  "detalhes": "${detalhes}",
  "dataReuniao": "${dataReuniao}",
  "horaIni": "${horaIni}",
  "horaFim": "${horaFim}",
  "tipoReuniao": "${tipoReuniao}",
  "enderecoCliente": "${enderecoCliente}",
  "userid": ${userid}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'EditarLeads',
      apiUrl: '${LeadsGroup.baseUrl}/leads/${leadsId}',
      callType: ApiCallType.POST,
      headers: {
        ...LeadsGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetLeadCall {
  Future<ApiCallResponse> call({
    int? leadsId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetLead',
      apiUrl: '${LeadsGroup.baseUrl}/leads/${leadsId}',
      callType: ApiCallType.GET,
      headers: {
        ...LeadsGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Leads Group Code

class CriaAnexoCall {
  static Future<ApiCallResponse> call({
    String? nome = '',
    String? telefone = '',
    String? datanascimento = '',
    String? anexo = '',
  }) {
    final body = '''
{
  "nome": "${nome}",
  "telefone": "${telefone}",
  "datanascimento": "${datanascimento}",
  "anexo": "${anexo}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'criaAnexo',
      apiUrl: 'https://xare-axod-hky2.b2.xano.io/api:MLkFdmWD/cliente',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CriaPDItesteCall {
  static Future<ApiCallResponse> call({
    String? manager = '',
    String? goal1 = '',
    String? goal2 = '',
    String? goal3 = '',
    String? deadline1 = '',
    String? deadline2 = '',
    String? deadline3 = '',
    String? careerAnchor = '',
    String? mentorFacilitator = '',
    String? profileMbti = '',
    String? collaborator = '',
    int? collaboratorId,
    String? peoplepartner = '',
    int? step = 1,
    int? managerId,
  }) {
    final body = '''
{
  "manager": "${manager}",
  "goal1": "${goal1}",
  "goal2": "${goal2}",
  "goal3": "${goal3}",
  "deadline1": "${deadline1}",
  "deadline2": "${deadline2}",
  "deadline3": "${deadline3}",
  "peoplepartner": "${peoplepartner}",
  "profile_mbti": "${profileMbti}",
  "career_anchor": "${careerAnchor}",
  "mentor_facilitator": "${mentorFacilitator}",
  "collaborator": "${collaborator}",
  "collaborator_id": ${collaboratorId},
  "step": ${step},
  "manager_id": ${managerId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'criaPDIteste',
      apiUrl: 'https://xare-axod-hky2.b2.xano.io/api:MLkFdmWD/pdi-teste',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetAccessTokenoldCall {
  static Future<ApiCallResponse> call({
    String? accesscode = '',
  }) {
    final body = '''
{
  "AccessCode": "${accesscode}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetAccessTokenold',
      apiUrl:
          'https://spw.app.foursys.com/backoffice-rf-hom/api/Usuario/GetAccessToken',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetAccessTokenNewCall {
  static Future<ApiCallResponse> call({
    String? accesscode = '',
  }) {
    final body = '''
{
  "accessCode": "${accesscode}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetAccessTokenNew',
      apiUrl:
          'https://os2h-alp-no0195.server01.foursys.local/Usuario.API/api/Usuario/GetAccessToken',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class BuscaDadosColabCall {
  static Future<ApiCallResponse> call({
    String? cpf = '',
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'BuscaDadosColab',
      apiUrl:
          'https://spw.app.foursys.com/backoffice-rf-hom/api/Colaborador/BuscarDadosColaborador',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'cpf': cpf,
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ObterCVCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'obterCV',
      apiUrl: 'https://xare-axod-hky2.b2.xano.io/api:MLkFdmWD/cv',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
