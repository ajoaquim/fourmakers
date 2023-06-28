import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

bool filterSearch(
  String filterFor,
  String filterIn,
) {
  return filterIn.toLowerCase().contains(filterFor.toLowerCase());
}

List<dynamic> filterComerciais(
  List<dynamic> jsonList,
  String query,
) {
  List<dynamic> filteredList = jsonList.where((item) {
    return item['name'].toLowerCase().contains(query.toLowerCase()) ||
        item['email'].toLowerCase().contains(query.toLowerCase()) ||
        item['contato'].toLowerCase().contains(query.toLowerCase());
  }).toList();
  return filteredList;
}

int? getIdOkr(
  dynamic json,
  String? objetivo,
) {
  // read json and filter by nomefantasia
  final List<dynamic> data = [];
  for (int i = 0; i < json.length; i++) {
    if (json[i]['objetivo'] == objetivo) {
      data.add(json[i]);
    }
  }

  // return id of first item in filtered list
  return data[0]['id'];
}

String? urlBase64(
  String? url,
  String? token,
) {
  if (token == null) {
    return url;
  } else {
    String encodedToken = base64Encode(utf8.encode(token));

    return url?.replaceFirst('\$1', Uri.encodeComponent(encodedToken));
  }
}

dynamic sendDataCv(dynamic inputList) {
  return jsonDecode(jsonEncode(inputList));
}

dynamic sendStringPeriodoAusencias(List<dynamic> inputList) {
  List<Map<String, dynamic>> formattedList = [];

  for (dynamic item in inputList) {
    if (item is Map<String, dynamic>) {
      Map<String, dynamic> formattedItem = {
        'data_inicio': item['data_inicio'],
        'data_fim': item['data_fim']
      };
      formattedList.add(formattedItem);
    }
  }

  return jsonDecode(jsonEncode(formattedList));
}

List<dynamic> filterAprovarHorasItems(
  List<dynamic> jsonList,
  String query,
) {
  List<dynamic> filteredList = jsonList.where((item) {
    return item['mesReferencia'].toLowerCase().contains(query.toLowerCase()) ||
        item['modalidade'].toLowerCase().contains(query.toLowerCase()) ||
        item['projeto'][0]['name']
            .toLowerCase()
            .contains(query.toLowerCase()) ||
        item['empresa']['nomefantasia']
            .toLowerCase()
            .contains(query.toLowerCase()) ||
        item['user_id'][0]['nome'].toLowerCase().contains(query.toLowerCase());
  }).toList();
  return filteredList;
}

List<dynamic> filterPagamentos(
  List<dynamic> jsonList,
  String query,
) {
  List<dynamic> filteredList = jsonList.where((item) {
    return item['situacao'].toLowerCase().contains(query.toLowerCase()) ||
        item['nota_fiscal']['mesReferencia']
            .toLowerCase()
            .contains(query.toLowerCase()) ||
        item['nota_fiscal']['anoReferencia']
            .toLowerCase()
            .contains(query.toLowerCase()) ||
        item['user_id'][0]['nome']
            .toLowerCase()
            .contains(query.toLowerCase()) ||
        item['user_id'][0]['cpf'].toLowerCase().contains(query.toLowerCase());
  }).toList();
  return filteredList;
}

bool filterByStatus(
  String filterFor,
  String filterIn,
) {
  return filterIn.contains(filterFor);
}

String addDateMaskAAAAMMDD(String dateResult) {
  if (dateResult == null) {
    return "";
  }
  // Add your function code here!
  var day = dateResult.substring(8, 10);
  var month = dateResult.substring(5, 7);
  var year = dateResult.substring(0, 4);
  var dateFormat = '$year-$month-$day';
  return dateFormat;
}

List<dynamic> filterBeneficios(
  List<dynamic> jsonList,
  String query,
) {
  List<dynamic> filteredList = jsonList.where((item) {
    return item['name'].toLowerCase().contains(query.toLowerCase()) ||
        item['description'].toLowerCase().contains(query.toLowerCase()) ||
        item['category'].toLowerCase().contains(query.toLowerCase());
  }).toList();
  return filteredList;
}

String addDateMaskReverse(String dateResult) {
  if (dateResult == null) {
    return "";
  }
  // Add your function code here!
  var year = dateResult.substring(dateResult.length - 4);
  var month = dateResult.substring(3, 5);
  var day = dateResult.substring(0, 2);

  //var dateFormat = '$day/$month/$year';
  var dateFormat = '$year-$month-$day' + 'T19:00:00.539637+00:00';
  return dateFormat;
}

String? addPhoneMaskReverse(String? phoneResult) {
  if (phoneResult != null && phoneResult.length > 10) {
    var ddd = phoneResult.substring(0, 2);
    var phoneFormat =
        '($ddd)${phoneResult.substring(2, 7)}-${phoneResult.substring(7, 11)}';
    return phoneFormat;
  } else {
    String result = " ";
    return result;
  }
}

String addDateMaskReverseXANO(String dateResult) {
  if (dateResult == null) {
    return "";
  }
  // Add your function code here!
  var year = dateResult.substring(dateResult.length - 4);
  var month = dateResult.substring(3, 5);
  var day = dateResult.substring(0, 2);

  //var dateFormat = '$day/$month/$year';
  var dateFormat = '$year-$month-$day';
  return dateFormat;
}

dynamic contadorObjetivosArea(dynamic okrs) {
  dynamic filteredOKR = okrs;

  if (filteredOKR != null) {
    int resultadosChaveCount = filteredOKR['resultados-chave'].length;

    int iniciativasCount = filteredOKR['resultados-chave'].fold(
        0, (count, objetivoArea) => count + objetivoArea['iniciativas'].length);

    dynamic result = {
      'resultados_chave': resultadosChaveCount,
      'iniciativas': iniciativasCount,
    };

    return result;
  }
}

int contadorResultadosChave(dynamic okrs) {
  dynamic filteredOKR = okrs;

  int inici = filteredOKR['iniciativas'].length;

  return inici;
}

int countOfRecords(List<String> listagempdi) {
  // count items api call
  return listagempdi.toList(growable: false).length;
}

List<dynamic> filterBy(
  dynamic json,
  String? status,
) {
  // read json and filter by status
  return json.where((dynamic j) => j['status'] == status).toList();
}

String addZipCodeMaskReverse(String zipCodeResult) {
  // Add your function code here!
  var zipCodeFormat =
      '${zipCodeResult.substring(0, 5)}${zipCodeResult.substring(6, 9)}';
  return zipCodeFormat;
}

int? countRecords(List<String> lista) {
  // count number of records from a list and return the value
  int count = 0;
  for (String row in lista) {
    count++;
  }
  return count;
}

bool checkHasCommentaryAprovarNotaItem(
  int id,
  List<dynamic> list,
  bool verify,
) {
  for (dynamic item in list) {
    if (item['id'] == id && item['commentary'].trim().isEmpty == verify) {
      return true;
    }
  }
  return false;
}

List<dynamic> filterSupport(
  List<dynamic> jsonList,
  String query,
) {
  List<dynamic> filteredList = jsonList.where((item) {
    return item['collaborator'].toLowerCase().contains(query.toLowerCase()) ||
        item['subject'].toLowerCase().contains(query.toLowerCase()) ||
        item['description'].toLowerCase().contains(query.toLowerCase()) ||
        item['category'].toLowerCase().contains(query.toLowerCase()) ||
        item['email'].toLowerCase().contains(query.toLowerCase());
  }).toList();
  return filteredList;
}

bool checkIdAprovarNotaItem(
  int id,
  String status,
  List<dynamic> list,
) {
  for (var item in list) {
    if (item is Map<String, dynamic> &&
        item.containsKey('id') &&
        item.containsKey('situacao') &&
        item['id'] == id &&
        item['situacao'] == status) {
      return true;
    }
  }
  return false;
}

List<dynamic> filterFelizometro(
  dynamic json,
  String? emotion,
) {
  // read json and filter by status
  return json.where((dynamic j) => j['emotion'] == emotion).toList();
}

dynamic newCustomFunction(
  String? name,
  int? quantity,
) {
  // create object json
  return <String, dynamic>{"name": name, "quantity": quantity};
}

dynamic criaJson(
  String? description,
  String? deadline,
  int? idpdi,
) {
  // create array list json object
  return '{"description":"$description", "deadline":"$deadline", "idpdi": $idpdi}';
}

List<String>? retornaStringConcatx(
  String? value1,
  String? value2,
) {
  // creat a object list of strings
  return [value1! ?? '', value2! ?? ''];
}

List<String>? mapJson(dynamic entrada) {
  var description = entrada['description'];
  var deadline = entrada['deadline'].toString();

  var dia = deadline.substring(6, 8);
  var mes = deadline.substring(4, 6);
  var ano = deadline.substring(0, 4);
  var dataFormat = '$dia/$mes/$ano';

  return [description, dataFormat];
}

dynamic editaEscolaridadeNew(
  String? instituicao,
  int? formacaoId,
  String? descricao,
  String? dataInicio,
  String? dataTermino,
  int? tipoDiplomaId,
  int? id,
) {
  // create array list json object
  return jsonDecode(
      '{"id":$id, "instituicao":"$instituicao","formacaoId":$formacaoId,"descricao":"$descricao","dataInicio":"$dataInicio","dataTermino":"$dataTermino","tipoDiplomaId":$tipoDiplomaId}');
}

String addDateMask(String? dateResult) {
  if (dateResult == null) {
    return "dd/mm/yyyy";
  }
  // Add your function code here!
  var day = dateResult.substring(8, 10);
  var month = dateResult.substring(5, 7);
  var year = dateResult.substring(0, 4);
  var dateFormat = '$day/$month/$year';
  return dateFormat;
}

dynamic createPeriodoItem(
  int inicio,
  int fim,
) {
  return {'data_inicio': inicio, 'data_fim': fim};
}

String addZipCodeMask(String zipCodeResult) {
  // Add your function code here!
  var zipCodeFormat =
      '${zipCodeResult.substring(0, 5)}-${zipCodeResult.substring(5, 8)}';
  return zipCodeFormat;
}

dynamic createAprovarNotaItem(
  int id,
  String situacao,
) {
  return {
    'id': id,
    'situacao': situacao,
    'commentary': "",
  };
}

dynamic criaBeneficio(
  String? name,
  String? category,
  String? description,
  bool? isActive,
  String? imgIcon,
  String? imgProduct,
  List<dynamic>? faq,
) {
  // create array list json object
  return jsonDecode(
      '{"name":"$name","category":"$category","description":"$description","is_active":$isActive,"img_icon":"$imgIcon","img_product":"$imgProduct", "faq": $faq}');
}

List<dynamic> createAprovarNotaItemByList(
  List<int> ids,
  String status,
  String comment,
  List<dynamic> inputList,
) {
  List<dynamic> outputList = [];
  for (int id in ids) {
    bool objectFound = false;
    for (dynamic object in inputList) {
      if (object is Map && object.containsKey('id') && object['id'] == id) {
        outputList.add({
          'id': object['id'],
          'situacao': status,
          'commentary': comment,
        });
        objectFound = true;
        break;
      }
    }
    if (!objectFound) {
      outputList.add({
        'id': id,
        'situacao': status,
        'commentary': comment,
      });
    }
  }
  for (dynamic object in inputList) {
    if (object is Map &&
        object.containsKey('id') &&
        !ids.contains(object['id'])) {
      outputList.add(object);
    }
  }
  return outputList;
}

List<dynamic> createAprovarHorasItemByList(
  List<int> ids,
  String status,
  String comment,
  List<dynamic> inputList,
) {
  bool hasc;

  if (comment.trim().isEmpty) {
    hasc = false;
  } else {
    hasc = true;
  }

  List<dynamic> outputList = [];
  for (int id in ids) {
    bool objectFound = false;
    for (dynamic object in inputList) {
      if (object is Map && object.containsKey('id') && object['id'] == id) {
        outputList.add({
          'id': object['id'],
          'status': status,
          'hasCommentary': hasc,
          'commentary': comment,
        });
        objectFound = true;
        break;
      }
    }
    if (!objectFound) {
      outputList.add({
        'id': id,
        'status': status,
        'hasCommentary': hasc,
        'commentary': comment,
      });
    }
  }
  for (dynamic object in inputList) {
    if (object is Map &&
        object.containsKey('id') &&
        !ids.contains(object['id'])) {
      outputList.add(object);
    }
  }
  return outputList;
}

String? addPhoneMask(String? phoneResult) {
  if (phoneResult != null && phoneResult.length > 10) {
    var ddd = phoneResult.substring(0, 2);
    var phoneFormat =
        '($ddd)${phoneResult.substring(2, 7)}-${phoneResult.substring(7, 11)}';
    return phoneFormat;
  } else {
    String result = " ";
    return result;
  }
}

String addCpfMask(String cpfResult) {
  var cpfFormat =
      '${cpfResult.substring(0, 3)}.${cpfResult.substring(3, 6)}.${cpfResult.substring(6, 9)}-${cpfResult.substring(9, 11)}';
  return cpfFormat;
}

dynamic convert(
  String? brand,
  String? model,
) {
  dynamic json = {};
  json['brand'] = brand as String;
  json['model'] = model;
  return json;
}

dynamic criaObjJson3(
  String? description,
  String? deadline,
  int? idpdi,
) {
  dynamic json = {};
  json['description'] = description;
  json['deadline'] = deadline;
  json['idpdi'] = idpdi;
  return json;

  // create array list json object
  //return '{"description":"$description", "deadline":"$deadline", "idpdi": $idpdi}';
}

List<dynamic>? filterbyDone(
  dynamic json,
  bool? done,
) {
  // read json and filter by status
  return json.where((dynamic j) => j['done'] == done).toList();
}

double? multiplicacao(
  double? value1,
  double? value2,
) {
  // multiply value 1 by value 2
  if ((value1 ?? 0) * (value2 ?? 0) < 0)
    throw new Exception("value1($value1) * value($value2) < 0");
  if (value1 == null) throw new Exception("value1 * value2 = null, value = 0");
  if (value2 == null) throw new Exception("value1 * value2 = null, value = 0");
  return value1 * value2;
}

double? calculaPercentilPlanoAcao(
  int? value1,
  int? value2,
) {
  // divide value 1 by value 2 and get the quotient and divide by 100
  if (value1 != null && value2 != null) {
    return (value1 / value2) / 100.0;
  } else {
    return null;
  }
}

List<dynamic> filterAprovarNotaItems(
  List<dynamic> jsonList,
  String query,
) {
  List<dynamic> filteredList = jsonList.where((item) {
    return item['mesReferencia'].toLowerCase().contains(query.toLowerCase()) ||
        item['anoReferencia'].toLowerCase().contains(query.toLowerCase()) ||
        item['user_id'][0]['nome'].toLowerCase().contains(query.toLowerCase());
  }).toList();
  return filteredList;
}

List<dynamic>? filterByOKR(
  dynamic json,
  String? objetivo,
) {
  // read json and filter by status
  return json.where((dynamic j) => j['objetivo'] == objetivo).toList();
}

String returnIdJson(
  dynamic entrada,
  String filter,
) {
  // if (entrada == null) {
  //   return 0;
  // }
  // var _id = entrada['id'];
  // if (_id is int && entrada['descricao'] == filter) {
  //   return 2;
  // }

  Map<String, dynamic> dados = json.decode(entrada);
  return dados.toString();
}

List<dynamic> filterJsonListByIDCopy(
  List<dynamic> jsonList,
  dynamic filterObj,
) {
  List<int> projectIds = List<int>.from(
      filterObj['_alocacoes_of_user_id'].map((a) => a['projeto_id'] as int));
  return jsonList.where((json) => projectIds.contains(json['id'])).toList();
}

int? newCustomFunction2(
  int? value1,
  int? value2,
) {
  // sum value1 and value2
  if (value1 == null || value2 == null) {
    return null;
  }
  return (value1 + value2);
}

List<dynamic> filterAlocados(
  List<dynamic> jsonList,
  String query,
) {
  List<dynamic> filteredList = jsonList.where((item) {
    return item['modality'].toLowerCase().contains(query.toLowerCase()) ||
        item['situacao'].toLowerCase().contains(query.toLowerCase()) ||
        item['_users_details'][0]['nome']
            .toLowerCase()
            .contains(query.toLowerCase()) ||
        item['_users_details'][0]['cpf']
            .toLowerCase()
            .contains(query.toLowerCase()) ||
        item['_users_details'][0]['cnpj']
            .toLowerCase()
            .contains(query.toLowerCase());
  }).toList();
  return filteredList;
}

List<dynamic> filterProjects(
  List<dynamic> jsonList,
  String query,
) {
  List<dynamic> filteredList = jsonList.where((item) {
    return item['name'].toLowerCase().contains(query.toLowerCase());
  }).toList();
  return filteredList;
}

dynamic functionPedro(
  String? cpf,
  int? nivelId,
  int? id,
) {
  // create array list json object
  return '{"id":$id, "nivelId":$nivelId, "cpf": "$cpf"}';
}

dynamic convertSingleString(List<String>? lista) {
  // convert list of string in single string separated per comma
  if (lista == null) {
    return '';
  } else {
    var newString = '';
    for (int i = 0; i < lista.length; i++) {
      if (i == lista.length - 1) {
        newString += lista[i].trim();
      } else {
        newString += lista[i].trim() + ',';
      }
    }
    return newString;
  }
}

List<dynamic>? filterByNome(
  dynamic json,
  String? nmProfissional,
) {
  // read json and filter by status
  return json
      .where((dynamic j) => j['nmProfissional'] == nmProfissional)
      .toList();
}

List<dynamic>? newCustomFunction3(
  dynamic json,
  String? nmProfissional,
) {
  // read json and filter by nmProfissional
  final List<dynamic> data = [];
  for (int i = 0; i < json.length; i++) {
    if (json[i]['nmProfissional'] == nmProfissional) {
      data.add(json[i]);
    }
  }
  print(data);
  return data;
}

List<dynamic> filterListByString(
  List<dynamic> jsonList,
  String searchStr,
) {
  List<dynamic> filteredList = jsonList.where((item) {
    bool hasString = false;
    if (item is Map<String, dynamic>) {
      item.forEach((key, value) {
        if (value != null &&
            value.toString().toLowerCase().contains(searchStr.toLowerCase())) {
          hasString = true;
        }
      });
    }
    return hasString;
  }).toList();

  return filteredList;
}

dynamic montaSrs(
  int? candidateid,
  String? firstname,
  String? datanascimento,
  String? rg,
  String? estcivil,
  String? phonehome,
  String? phonecell,
  String? endereco,
  String? num,
  String? complemento,
  String? bairro,
  String? cidade,
  String? uf,
  String? cep,
  String? email1,
  String? email2,
  String? email4sys,
  String? linkedin,
  String? skype,
  String? instagram,
  String? facebook,
  String? twitter,
  String? zona,
  String? modalidade,
  String? nivelingles,
  String? nivelespanhol,
  String? outralingua,
  int? filhos,
  String? graduacao,
  String? genero,
  String? orientacaosexual,
  String? etnia,
  bool? pessoarefugiada,
  String? residentes,
  String? familiariares,
  bool? pcd,
  String? gruporisco,
  String? saude,
  String? source,
) {
  // create array list json object
  return jsonDecode(
      '{"candidate_id":$candidateid,"first_name":"$firstname","dataNascimento":"$datanascimento","cand_rg":"$rg","cand_estCivil":"$estcivil","phone_home":"$phonehome","phone_cell":"$phonecell","address":"$endereco","address_number":"$num","address_complement":"$complemento","district":"$bairro","city":"$cidade","state":"$uf","zip":"$cep","key_skills": ["JAVA", "ORACLE"],"methodologies": ["Kanban", "Agile"],"email1":"$email1","email2":"$email2","emailFoursys":"$email4sys","desired_pay": null,"current_pay": null,"cand_Lkdin":"$linkedin","cand_skype":"$skype","instagram":"$instagram","facebook":"$facebook","twitter":"$twitter","disponibilidade": null,"zona":"$zona","cand_modalidade":"$modalidade","cand_eng_level":"$nivelingles","cand_esp_level":"$nivelespanhol","cand_other_level":"$outralingua","indicacao_4makers": null,"cand_filhos":"$filhos","school_level":"$graduacao","genre":"$genero","sexual_orientation":"$orientacaosexual","ethnicity":"$etnia","refugee_person":"$pessoarefugiada","cand_residentes":"$residentes","cand_familiares":"$familiariares","pcd":"$pcd","cand_gruporisco":"$gruporisco","cand_saude":"$saude","candidate_emergency_contact": [{"contact_order": 1,"name":"Geraldo da Rocha","degree_kinship":"Pai","phone":"11995623839"},{"contact_order": 2,"name":"Marcella Lapa","degree_kinship":"Cônjuge","phone":"15996056059"}],"source": "$source","file": null}');
}

double? divideBy100(int? valor) {
  // divide value by 100
  if (valor != null && valor != 0) {
    return valor / 100;
  }
  return null;
}

dynamic montaSalvarColab(
  String? cep,
  String? endereco,
  String? complemento,
  int? numero,
  String? bairro,
  String? cidade,
  String? estado,
  String? cpf,
  String? nomeCompleto,
  String? email,
  String? slackid,
  String? datanascimento,
  String? cargo,
  String? rg,
  String? matricula,
  String? dataAdmissao,
  String? unidade,
  int? idunidade,
  int? statusid,
  String? statusdesc,
  bool? flagcandidat,
  bool? flagativo,
  String? urlfoto,
  String? urlfotothumb,
  String? urlfotothumbmini,
  String? urlfotothumbverymini,
  bool? mesegue,
  bool? estouseguindo,
  bool? acessobackoffice,
  bool? acessobuscaavancada,
  String? contatoprincipal,
  int? idcargo,
) {
  // create array list json object
  return jsonDecode(
      '{"cpf": "$cpf","nomeCompleto": "$nomeCompleto","email": "$email", "contatoPrincipal": "$contatoprincipal","contatoOutros": null,"slack_id": "$slackid","dataNascimento": "$datanascimento","cargo":{"cargo": "$cargo", "id": $idcargo}, "diretoria": {"diretoria": "$unidade","id": $idunidade},"status": {"id": $statusid,"descricao": "$statusdesc","sucesso": true,"mensagem": null,"erros": null},"rg": "$rg","fcmToken": null,"matricula":"$matricula","dataAdmissao":"$dataAdmissao","endereco":{"cep":"$cep", "endereco":"$endereco", "complemento":"$complemento","numero": $numero, "bairro":"$bairro", "cidade":"$cidade", "estado":"$estado"},"flagCandidato": $flagcandidat,"flagAtivo": $flagativo,"candidato": null,"urlFoto": "$urlfoto","urlFotoThumb": "$urlfotothumb","urlFotoThumbMini": "$urlfotothumbmini","urlFotoThumbVeryMini": "$urlfotothumbverymini","meSegue": $mesegue,"estouSeguindo": $estouseguindo,"acessoBackoffice": $acessobackoffice,"acessoBuscaAvançada": $acessobuscaavancada}');
}

dynamic montaSalvarSrs(
  int? candidateid,
  String? firstname,
  String? datanascimento,
  String? rg,
  String? estcivil,
  String? phonehome,
  String? phonecell,
  String? endereco,
  String? num,
  String? complemento,
  String? bairro,
  String? cidade,
  String? uf,
  String? cep,
  String? email1,
  String? email2,
  String? email4sys,
  String? linkedin,
  String? skype,
  String? instagram,
  String? facebook,
  String? twitter,
  String? zona,
  String? modalidade,
  String? nivelingles,
  String? nivelespanhol,
  String? outralingua,
  int? filhos,
  String? graduacao,
  String? genero,
  String? orientacaosexual,
  String? etnia,
  bool? pessoarefugiada,
  String? residentes,
  String? familiariares,
  bool? pcd,
  String? gruporisco,
  String? saude,
  String? source,
) {
  // create array list json object
  return jsonDecode(
      '{"candidate_id":$candidateid,"first_name":"$firstname","dataNascimento":"$datanascimento","cand_rg":"$rg","cand_estCivil":"$estcivil","phone_home":"$phonehome","phone_cell":"$phonecell","address":"$endereco","address_number":"$num","address_complement":"$complemento","district":"$bairro","city":"$cidade","state":"$uf","zip":"$cep","key_skills": ["JAVA", "ORACLE"],"methodologies": ["Kanban", "Agile"],"email1":"$email1","email2":"$email2","emailFoursys":"$email4sys","desired_pay": null,"current_pay": null,"cand_Lkdin":"$linkedin","cand_skype":"$skype","instagram":"$instagram","facebook":"$facebook","twitter":"$twitter","disponibilidade": null,"zona":"$zona","cand_modalidade":"$modalidade","cand_eng_level":"$nivelingles","cand_esp_level":"$nivelespanhol","cand_other_level":"$outralingua","indicacao_4makers": null,"cand_filhos":"$filhos","school_level":"$graduacao","genre":"$genero","sexual_orientation":"$orientacaosexual","ethnicity":"$etnia","refugee_person":"$pessoarefugiada","cand_residentes":"$residentes","cand_familiares":"$familiariares","pcd":"$pcd","cand_gruporisco":"$gruporisco","cand_saude":"$saude","candidate_emergency_contact": [{"contact_order": 1,"name":"Geraldo da Rocha","degree_kinship":"Pai","phone":"11995623839"},{"contact_order": 2,"name":"Marcella Lapa","degree_kinship":"Cônjuge","phone":"15996056059"}],"source": "$source","file": null}');
}

dynamic criaEscolaridadeNew(
  String? instituicao,
  int? formacaoId,
  String? descricao,
  String? dataInicio,
  String? dataTermino,
  String? tipoDiplomaId,
) {
  // create array list json object
  return jsonDecode(
      '{"instituicao":"$instituicao","formacaoId":$formacaoId,"descricao":"$descricao","dataInicio":"$dataInicio","dataTermino":"$dataTermino","tipoDiplomaId":"$tipoDiplomaId"}');
}

int? returnNumeroContatos(dynamic contatoEmergJson) {
  if (contatoEmergJson.containsKey('contatos') &&
      contatoEmergJson['contatos'] is List) {
    return contatoEmergJson['contatos'].length;
  } else {
    return 0;
  }
}

int? returnNumeroContatosMaisUm(String contatoEmergJson) {
  final Map<String, dynamic> parsedJson = json.decode(contatoEmergJson);
  final List<dynamic> contacts = parsedJson['contatos'];
  return contacts.length + 1;
}

bool cpfExiste(
  String searchString,
  List<dynamic> jsonList,
  String name,
) {
  for (final jsonMap in jsonList) {
    if (jsonMap.containsKey(name) &&
        jsonMap[name].contains(searchString) &&
        jsonMap[name] is! bool &&
        jsonMap[name] is! int &&
        jsonMap[name] is! double) {
      return true;
    }
  }
  return false;
}

int returnLength(String texto) {
  return texto.length;
}

int? getIdProjetobyName(
  dynamic json,
  String? nomeProjeto,
) {
  // read json and filter by nomefantasia
  final List<dynamic> data = [];
  for (int i = 0; i < json.length; i++) {
    if (json[i]['projeto'][0]['name'] == nomeProjeto) {
      data.add(json[i]);
    }
  }

  // return id of first item in filtered list
  return data[0]['projeto_id'];
}

List<dynamic> filterJsonListByID(
  List<dynamic> jsonList,
  dynamic filterObj,
) {
  List<int> projectIds = List<int>.from(
      filterObj['_alocacoes_of_user_id'].map((a) => a['projeto_id'] as int));
  return jsonList.where((json) => projectIds.contains(json['id'])).toList();
}

String? getDoubleReverse(double doubleValue) {
  if (doubleValue == null || doubleValue == 0 || doubleValue.isNaN) {
    return '0';
  } else {
    String stringValue = (doubleValue * 100).toStringAsFixed(2);
    String formattedValue = stringValue.replaceAll('.', ',');
    return formattedValue;
  }
}

int returnNumberOfAlocateds(List<dynamic> jsonList) {
  int count = 0;
  for (dynamic jsonItem in jsonList) {
    if (jsonItem['_alocacoes_of_user_id'] != null &&
        jsonItem['_alocacoes_of_user_id'].length > 0) {
      count++;
    }
  }
  return count;
}

int? getIdEmpresabyNameCopy(
  dynamic json,
  String? nomefantasia,
) {
  // read json and filter by nomefantasia
  final List<dynamic> data = [];
  for (int i = 0; i < json.length; i++) {
    if (json[i]['empresa']['nomefantasia'] == nomefantasia) {
      data.add(json[i]);
    }
  }

  // return id of first item in filtered list
  return data[0]['empresa_id'];
}

int returnNumeroPendentes(List<dynamic> jsonList) {
  int count = 0;
  for (dynamic jsonItem in jsonList) {
    if (jsonItem['statuscadastro'] == 'Pendente') {
      count++;
    }
  }
  return count;
}

List<dynamic> insertCommentaryAtAprovarNotaItem(
  List<dynamic> objects,
  int id,
  String commentary,
) {
  for (var i = 0; i < objects.length; i++) {
    if (objects[i]['id'] == id) {
      objects[i]['commentary'] = commentary;
      break;
    }
  }
  return objects;
}

dynamic getProjetoByID(
  dynamic json,
  int? projeto,
) {
  // read json and filter by nomefantasia
  final List<dynamic> data = [];
  for (int i = 0; i < json.length; i++) {
    if (json[i]['projeto_id'] == projeto) {
      data.add(json[i]);
    }
  }

  // return id of first item in filtered list, if it exists
  if (data.isNotEmpty) {
    return data;
  } else {
    return null;
  }
}

List<dynamic> filterPrestadores(
  List<dynamic> jsonList,
  String query,
) {
  List<dynamic> filteredList = jsonList.where((item) {
    return item['nome'].toLowerCase().contains(query.toLowerCase()) ||
        item['cpf'].toLowerCase().contains(query.toLowerCase());
  }).toList();
  return filteredList;
}

String formatTimestamp(int timestamp) {
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  var day = date.day.toString().padLeft(2, '0');
  var month = date.month.toString().padLeft(2, '0');
  var year = date.year.toString();
  var formatedDate = '$day/$month/$year';
  return formatedDate;
}

int getCurrentTimestamp() {
  DateTime now = DateTime.now();
  DateTime today = DateTime(now.year, now.month, now.day);
  return today.millisecondsSinceEpoch;
}

int returnNumeroPendentes2(List<dynamic> jsonList) {
  int count = 0;
  for (dynamic jsonItem in jsonList) {
    if (jsonItem['status'] == 'Pendente') {
      count++;
    }
  }
  return count;
}

List<dynamic> filterTicketsByStatus(
  List<dynamic> jsonList,
  String status,
) {
  List<dynamic> filteredList =
      jsonList.where((json) => json['status'] == status).toList();
  filteredList.sort((a, b) => a["created_at"].compareTo(b["created_at"]));
  return filteredList;
}

int? getIdEmpresabyName(
  dynamic json,
  String? nomefantasia,
) {
  // read json and filter by nomefantasia
  final List<dynamic> data = [];
  for (int i = 0; i < json.length; i++) {
    if (json[i]['empresa']['nomefantasia'] == nomefantasia) {
      data.add(json[i]);
    }
  }

  // return id of first item in filtered list
  return data[0]['empresa_id'];
}

String? timestampToDate(String? timestamp) {
  //  timestamp to date format aaaa-mm-dd
  var now = new DateTime.now();
  var formatter = new DateFormat('yyyy-MM-dd');
  String formatted = formatter.format(now);
  return formatted;
}

int countAlocadosPerProject(
  List<dynamic> alocados,
  int id,
) {
  return alocados.where((alocado) => alocado['projeto_id'] == id).length;
}

List<dynamic> returnHardSkillsWithCertificates(List<dynamic> inputList) {
  List<dynamic> outputList = [];

  for (var element in inputList) {
    if (element is Map &&
        element.containsKey("certificados") &&
        element["certificados"].isNotEmpty) {
      outputList.add(element);
    }
  }

  return outputList;
}

String? getEscolaridadeName(
  dynamic json1,
  dynamic json2,
) {
  List<dynamic> compareJson(
      Map<String, dynamic> json1, Map<String, dynamic> json2) {
    List<dynamic> commonItems = [];
    json1.forEach((key, value) {
      if (json2.containsKey(key) && json2[key] == value) {
        commonItems.add({key: value});
      }
    });
    return commonItems;
  }
}

List<dynamic> getEscolaridadeNameID(
  List<dynamic> jsonList,
  dynamic filterObj,
) {
  List<int> projectIds = List<int>.from(
      filterObj['_alocacoes_of_user_id'].map((a) => a['projeto_id'] as int));
  return jsonList.where((json) => projectIds.contains(json['id'])).toList();
}

dynamic returnCompetenciaById(
  List<dynamic> competencias,
  int id,
) {
  for (var i = 0; i < competencias.length; i++) {
    if (competencias[i]['id'] == id) {
      return competencias[i];
    }
  }
  return null;
}

dynamic createAprovarHorasItem(
  int id,
  String status,
) {
  return {
    'id': id,
    'status': status,
    'hasCommentary': false,
    'commentary': "",
  };
}

dynamic sendStringProcessarHoras(List<dynamic> inputList) {
  List<Map<String, dynamic>> formattedList = [];

  for (dynamic item in inputList) {
    if (item is Map<String, dynamic>) {
      Map<String, dynamic> formattedItem = {
        'id': item['id'],
        'status': item['status'],
        'hasCommentary': item['hasCommentary'],
        'commentary': item['commentary']
      };
      formattedList.add(formattedItem);
    }
  }

  return jsonDecode(jsonEncode(formattedList));
}

List<dynamic> removeAprovarHorasItem(
  List<dynamic> list,
  int id,
) {
  return list
      .where((item) => item is Map<String, dynamic> && item['id'] != id)
      .toList();
}

List<dynamic> insertCommentaryAtAprovarHorasItem(
  List<dynamic> objects,
  int id,
  String commentary,
) {
  for (var i = 0; i < objects.length; i++) {
    if (objects[i]['id'] == id) {
      if (commentary.trim().isEmpty) {
        objects[i]['hasCommentary'] = false;
      } else {
        objects[i]['hasCommentary'] = true;
      }
      objects[i]['commentary'] = commentary;
      break;
    }
  }
  return objects;
}

bool checkIdAprovarHorasItem(
  int id,
  String status,
  List<dynamic> list,
) {
  for (var item in list) {
    if (item is Map<String, dynamic> &&
        item.containsKey('id') &&
        item.containsKey('status') &&
        item['id'] == id &&
        item['status'] == status) {
      return true;
    }
  }
  return false;
}

bool checkHasCommentaryAprovarHorasItem(
  int id,
  List<dynamic> list,
  bool verify,
) {
  for (dynamic item in list) {
    if (item['id'] == id && item['hasCommentary'] == verify) {
      return true;
    }
  }
  return false;
}

String getComentarioAprovarHorasItem(
  List<dynamic> inputList,
  int id,
) {
  for (dynamic item in inputList) {
    if (item is Map<String, dynamic> &&
        item['id'] == id &&
        item.containsKey('commentary')) {
      return item['commentary'];
    }
  }
  return '';
}

int countInt(List<int> inputList) {
  return inputList.length;
}

dynamic sendStringProcessarNotas(List<dynamic> inputList) {
  List<Map<String, dynamic>> formattedList = [];

  for (dynamic item in inputList) {
    if (item is Map<String, dynamic>) {
      Map<String, dynamic> formattedItem = {
        'id': item['id'],
        'situacao': item['situacao'],
        'commentary': item['commentary']
      };
      formattedList.add(formattedItem);
    }
  }

  return jsonDecode(jsonEncode(formattedList));
}

double? valorHora(String? valorString) {
  if (valorString == null) {
    return null;
  }

  final numericRegex = RegExp(r'[\d.,]+');
  final matches = numericRegex.allMatches(valorString);
  final extracted = matches.map((match) => match.group(0)).join();

  if (extracted.isEmpty) {
    return null;
  }

  final numeric = double.tryParse(extracted.replaceAll(',', '.'));

  return numeric;
}

List<int> getObjectsIds(List<dynamic> objects) {
  List<int> ids = [];
  for (dynamic object in objects) {
    if (object is Map && object.containsKey('id')) {
      ids.add(object['id']);
    }
  }
  return ids;
}

int? dateToTimestamp(String? date) {
  //  timestamp to date format aaaa-mm-dd
  if (date == null) {
    return null;
  }

  final dateParts = date.split('/');
  final day = int.parse(dateParts[0]);
  final month = int.parse(dateParts[1]);
  final year = int.parse(dateParts[2]);
  final dateTime = DateTime(year, month, day);
  return dateTime.millisecondsSinceEpoch;
}

String? timestampToDateUser(String? timestamp) {
  //  timestamp to date format aaaa-mm-dd
  var now = new DateTime.now();
  var formatter = new DateFormat('dd/MM/yyyy');
  String formatted = formatter.format(now);
  return formatted;
}

int? stringLength(String? textoCampo) {
  // get string length
  if (textoCampo == null) {
    return null;
  }
  return textoCampo.length;
}

String unixTimeStampToDateString(int? timestamp) {
  if (timestamp == null) {
    return " ";
  }

  var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  var formattedDate =
      "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year.toString().padLeft(4, '0')}";
  return formattedDate;
}

String doubleToReais(double? value) {
  final currencyFormat = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
    decimalDigits: 2,
  );
  return currencyFormat.format(value);
}

String? encodeToken(String? token) {
  String? encodedString = token != null ? Uri.encodeComponent(token) : null;
  return encodedString;
}

String? urlPhoto(
  String? url,
  String? token,
) {
  if (token == null) {
    return url;
  } else {
    String encodedToken = base64Encode(utf8.encode(token));

    return url?.replaceFirst('\$1', Uri.encodeComponent(encodedToken));
  }
}

double? getDouble(String? stringValue) {
  if (stringValue == null) {
    return null;
  } else {
    String percent = stringValue.replaceAll(',', '.').replaceAll('%', '');
    double returnValue = double.parse(percent) / 100;

    return returnValue;
  }
}

dynamic getJsonItem(
  List<dynamic>? jsonList,
  String? searchName,
) {
  if (jsonList == null || searchName == null) {
    return null;
  }

  for (var json in jsonList) {
    List<dynamic> projetoList = json['projeto'];
    for (var projeto in projetoList) {
      if (projeto['name'] == searchName) {
        return json;
      }
    }
  }

  return null; // No object with matching "name" field was found
}

String? getCurrentDate() {
  DateTime now = DateTime.now();
  DateTime today = DateTime(now.year, now.month, now.day);

// Add your function code here!
  var day = today.toString().substring(8, 10);
  var month = today.toString().substring(5, 7);
  var year = today.toString().substring(0, 4);

  var dateFormat = '$year-$month-$day';

  return dateFormat;
  // return today.toString();
}

String returnCSVDownloadURL(
  int idempresa,
  String token,
  String numero,
) {
  String baseUrl =
      'https://xare-axod-hky2.b2.xano.io/api:itPnww4x/csv/exportar/apontamentos-t$numero';
  String empresaId = idempresa.toString();
  String token1 = token.substring(0, 199);
  String token2 = token.substring(199);
  String url = '$baseUrl/$empresaId/$token1/$token2';
  return url;
}

String? maskMoney(double? valor) {
  // create a mask for money
  if (valor == null) {
    return null;
  }
  final oCcy = new NumberFormat("###,###.00", "en_US");
  return oCcy.format(valor);
}

double returnValorTaxaRelatorio(
  double taxa,
  double total,
) {
  double taxa2 = taxa / 100;
  return total * taxa2;
}

double returnTaxaRelatorio(
  double valorTaxa,
  double valorTotal,
) {
  double taxa = valorTaxa / valorTotal;
  return taxa * 100;
}

double returnValorTotalTaxaRelatorio(
  double valorTaxa,
  double valorTotal,
) {
  return valorTaxa + valorTotal;
}

int? convertStringToNumber(String? valor) {
  // convert string to number
  if (valor == null) {
    return null;
  }
  return int.tryParse(valor);
}

String doubleToPorcentagem(double number) {
  int percentage = (number * 100).toInt();
  return '$percentage%';
}

dynamic contadorOKR(dynamic okrs) {
  dynamic filteredOKR = okrs;

  if (filteredOKR != null) {
    int objetivosAreaCount = filteredOKR['objetivos-area'].length;
    int resultadosChaveCount = filteredOKR['objetivos-area'].fold(
        0,
        (count, objetivoArea) =>
            count + objetivoArea['resultados-chave'].length);
    int iniciativasCount = filteredOKR['objetivos-area'].fold(
        0,
        (count, objetivoArea) =>
            count +
            objetivoArea['resultados-chave'].fold(
                0,
                (count, resultadoChave) =>
                    count + resultadoChave['iniciativas'].length));

    dynamic result = {
      'objetivos_area': objetivosAreaCount,
      'resultados_chave': resultadosChaveCount,
      'iniciativas': iniciativasCount,
    };

    return result;
  }
}

bool isDateInYear(
  String date,
  String year,
) {
  if (year == "Todos") {
    return true;
  }

  DateTime parsedDate = DateTime.parse(date);
  int parsedYear = int.parse(year);

  return parsedDate.year == parsedYear;
}

bool isNull(String? widget) {
  if (widget == null || widget == "Todos") {
    return true;
  }

  return false;
}

bool isDateInQuarter(
  String date,
  String quarter,
  String year,
) {
  if (year == "Todos" || year == null) {
    return true;
  }

  DateTime parsedDate = DateTime.parse(date);
  int parsedYear = int.parse(year);

  int quarterStartMonth;
  int quarterEndMonth;

  switch (quarter) {
    case "Q1":
      quarterStartMonth = 1;
      quarterEndMonth = 3;
      break;
    case "Q2":
      quarterStartMonth = 4;
      quarterEndMonth = 6;
      break;
    case "Q3":
      quarterStartMonth = 7;
      quarterEndMonth = 9;
      break;
    case "Q4":
      quarterStartMonth = 10;
      quarterEndMonth = 12;
      break;
    default:
      throw ArgumentError("Invalid quarter: $quarter");
  }

  return parsedDate.year == parsedYear &&
      parsedDate.month >= quarterStartMonth &&
      parsedDate.month <= quarterEndMonth;
}

dynamic listToDecodedJSONx(List<dynamic> inputList) {
  Map<String, dynamic> jsonMap = {};

  // Generate JSON keys as indices and values from the input list
  for (int i = 0; i < inputList.length; i++) {
    jsonMap[i.toString()] = inputList[i];
  }

  // Encode the JSON map to a stringx
  String jsonString = jsonEncode(jsonMap);

  // Decode the JSON string back to a dynamic object
  dynamic jsonObject = jsonDecode(jsonString);

  return jsonObject;
}

String? convertBase64(String? token) {
  // encode string to base64
  if (token == null) return null;
  final bytes = utf8.encode(token);
  final base64Str = base64.encode(bytes);
  return base64Str;
}

String? findAndReplaceString(
  String? find,
  String? replace,
  String? content,
) {
  // find and replace string
  if (find == null || replace == null || content == null) {
    return null;
  }
  return content.replaceAll(find, replace);
}

String moneyInput(double? valor) {
  if (valor == null) {
    return '0,00';
  }

  NumberFormat formato = NumberFormat('#,##0.00', 'pt_BR');
  return formato.format(valor);
}

double moneyStringToDouble(String? valorString) {
  if (valorString == null) {
    return 0;
  }

  String valorSemPonto =
      valorString.replaceAll('.', ''); // Remove o ponto separador de milhar
  String valorComPonto = valorSemPonto.replaceAll(
      ',', '.'); // Substitui a vírgula decimal por ponto
  double valor = double.parse(valorComPonto);

  return valor;
}
