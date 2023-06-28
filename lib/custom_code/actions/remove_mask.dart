// Automatic FlutterFlow imports
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

List<String> removeMask(
  String dateResult,
  String cpfResult,
  String zipCodeResult,
  String phoneResult,
) {
//Date
  var day = dateResult.substring(0, 2);
  var month = dateResult.substring(3, 5);
  var year = dateResult.substring(6, 10);
  var dateFormat = '$year-$month-${day}T00:00:00';
  //CPF
  var cpfFormat = cpfResult.replaceAll('.', '').replaceAll('-', '');
  //CEP
  var zipCodeFormat = zipCodeResult.replaceAll('-', '');
  //Telefone
  var phoneFormat =
      phoneResult.replaceAll('(', '').replaceAll(')', '').replaceAll('-', '');
  return [dateFormat, cpfFormat, zipCodeFormat, phoneFormat];
}
