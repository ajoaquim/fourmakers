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
//import 'dart:html' as html;
import "package:universal_html/html.dart" as html;
import 'package:dio/dio.dart';

dynamic downloadRelatorioCSV(dynamic pagamentos, String token) {
  downloadFile(pagamentos, token);
}

void downloadFile(dynamic pagamentos, String token) async {
  Dio dio = Dio();

  try {
    Options options = Options(
      responseType: ResponseType.bytes,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    // Configurar os parâmetros do corpo
    Map<String, dynamic> data = {
      'pagamentos': pagamentos,
    };

    // Fazer a solicitação POST para a API
    Response response = await dio.post(
      'https://xare-axod-hky2.b2.xano.io/api:itPnww4x/pagamento/exportar/relatorio/',
      data: data,
      options: options,
    );

    // Obter os dados do arquivo
    List<int> fileData = response.data;

    // Obter o diretório de downloads
    String downloadsPath = html.window.navigator.userAgent.contains('Chrome')
        ? html.window.navigator.vendor.contains('Google')
            ? 'downloads'
            : 'Downloads'
        : 'downloads';

    // Salvar o arquivo no diretório de downloads
    String savePath = '$downloadsPath/relatorio.csv';
    String base64Data = base64.encode(fileData);
    html.AnchorElement anchorElement = html.AnchorElement(
        href:
            'data:application/octet-stream;charset=utf-16le;base64,$base64Data')
      ..setAttribute('download', savePath)
      ..click();

    print('O arquivo foi salvo em: $savePath');
  } catch (error) {
    print('Ocorreu um erro ao baixar o arquivo: $error');
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
