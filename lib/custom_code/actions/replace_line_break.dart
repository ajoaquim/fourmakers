// Automatic FlutterFlow imports
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math' as math;

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!

String? replaceLineBreak(String? text) {
  if (text == null) return null;
  return text.replaceAll(RegExp(r'\n'), '\\n');
}
