// Automatic FlutterFlow imports
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../flutter_flow/lat_lng.dart';
import '../../flutter_flow/place.dart';
import '../../flutter_flow/custom_functions.dart';

dynamic newCustomAction2(
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
  int? pessoarefugiada,
  String? residentes,
  String? familiariares,
  int? pcd,
  String? gruporisco,
  String? saude,
  String? source,
) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  // create array list json object
  return jsonDecode(
      '{"candidate_id":$candidateid,"first_name":"$firstname","dataNascimento":"$datanascimento","cand_rg":"$rg","cand_estCivil":"$estcivil","phone_home":"$phonehome","phone_cell":"$phonecell","address":"$endereco","address_number":"$num","address_complement":"$complemento","district":"$bairro","city":"$cidade","state":"$uf","zip":"$cep","key_skills":[],"methodologies":[],"email1":"$email1","email2":"$email2","emailFoursys":"$email4sys","desired_pay": 0,"current_pay": 0,"cand_Lkdin":"$linkedin","cand_skype":"$skype","instagram":"$instagram","facebook":"$facebook","twitter":"$twitter","disponibilidade": "disponibilidade","zona":"$zona","cand_modalidade":"$modalidade","cand_eng_level":"$nivelingles","cand_esp_level":"$nivelespanhol","cand_other_level":"$outralingua","indicacao_4makers": "","cand_filhos":$filhos,"school_level":"$graduacao","genre":"$genero","sexual_orientation":"$orientacaosexual","ethnicity":"$etnia","refugee_person":$pessoarefugiada,"cand_residentes":"$residentes","cand_familiares":"$familiariares","pcd":$pcd,"cand_gruporisco":"$gruporisco","cand_saude":"$saude","candidate_emergency_contact": [],"source": "$source","file": "null"}');

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
