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

dynamic jsonHardSkills(
  int? id,
  int? nivelId,
  String? cpf,
) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  // create a object json from entries and serialize
  final data = jsonEncode(<String, dynamic>{
    'id': id,
    'nivelId': nivelId,
    'cpf': cpf,
  });
  return data;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
