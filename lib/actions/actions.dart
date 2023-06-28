import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

Future refreshOKR(BuildContext context) async {
  ApiCallResponse? apiResultri9;
  ApiCallResponse? apiResultbb7;
  ApiCallResponse? apiResulttby;

  apiResultri9 = await OkrGroup.getAllokrCall.call();
  if ((apiResultri9?.succeeded ?? true)) {
    FFAppState().update(() {
      FFAppState().okrOrganizacaoOKR =
          (apiResultri9?.jsonBody ?? '').toList().cast<dynamic>();
    });
  }
  apiResultbb7 = await OkrGroup.getAllObjetivosAreaCall.call();
  if ((apiResultbb7?.succeeded ?? true)) {
    FFAppState().update(() {
      FFAppState().okrOrganizacaoObjetivoArea =
          (apiResultbb7?.jsonBody ?? '').toList().cast<dynamic>();
      FFAppState().okrAreaObjetivoArea =
          (apiResultbb7?.jsonBody ?? '').toList().cast<dynamic>();
    });
  }
  apiResulttby = await OkrGroup.getResultadosCall.call();
  if ((apiResulttby?.succeeded ?? true)) {
    FFAppState().update(() {
      FFAppState().okrAreaResultadoChave =
          (apiResulttby?.jsonBody ?? '').toList().cast<dynamic>();
    });
  }
}
