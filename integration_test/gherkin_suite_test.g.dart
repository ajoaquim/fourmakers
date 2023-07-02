// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gherkin_suite_test.dart';

// **************************************************************************
// GherkinSuiteTestGenerator
// **************************************************************************

class _CustomGherkinIntegrationTestRunner extends GherkinIntegrationTestRunner {
  _CustomGherkinIntegrationTestRunner({
    required FlutterTestConfiguration configuration,
    required StartAppFn appMainFunction,
    required Timeout scenarioExecutionTimeout,
    AppLifecyclePumpHandlerFn? appLifecyclePumpHandler,
    LiveTestWidgetsFlutterBindingFramePolicy? framePolicy,
  }) : super(
          configuration: configuration,
          appMainFunction: appMainFunction,
          scenarioExecutionTimeout: scenarioExecutionTimeout,
          appLifecyclePumpHandler: appLifecyclePumpHandler,
          framePolicy: framePolicy,
        );

  @override
  void onRun() {
    testFeature0();
    testFeature1();
    testFeature2();
    testFeature3();
    testFeature4();
    testFeature5();
    testFeature6();
  }

  void testFeature0() {
    runFeature(
      name: 'Validando Dados Pessoais Saude:',
      tags: <String>['@tag'],
      run: () {
        runScenario(
          name: 'Atualizar Dados Pessoais Saude',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\dados_pessoais_saude.feature',
          tags: <String>['@tag', '@debug'],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'Given Eu Acesso \'Dashboard\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'When Eu Pressiono \'Dados Pessoais\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Pressiono \'Dados Pessoais Saude\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name:
                    'And Eu Escolho \'Selecione caso tenha alguma deficiência: = Nenhuma\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name:
                    'And Eu Escolho \'Pertence a grupo de risco para Covid19? = Não\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name:
                    'And Eu Digito \'Possui alguma condição de saúde relevante? = Não\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Pressiono \'Salvar dados\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'Then Eu Espero Resultado \'Dados salvos com sucesso!\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Fecho Alerta \'OK\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
          onBefore: () async => onBeforeRunFeature(
            name: 'Validando Dados Pessoais Saude',
            path:
                'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\dados_pessoais_saude.feature',
            description: null,
            tags: <String>['@tag'],
          ),
          onAfter: () async => onAfterRunFeature(
            name: 'Validando Dados Pessoais Saude',
            path:
                'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\dados_pessoais_saude.feature',
            description: null,
            tags: <String>['@tag'],
          ),
        );
      },
    );
  }

  void testFeature1() {
    runFeature(
      name: 'Validando Dados Pessoais Identificacao:',
      tags: <String>['@tag'],
      run: () {
        runScenario(
          name: 'Atualizar Dados Pessoais Identificacao Completa',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\dados_pessoais_identificacao.feature',
          tags: <String>['@tag', '@debug'],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'Given Eu Acesso \'Dashboard\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'When Eu Pressiono \'Dados Pessoais\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Pressiono \'Dados Pessoais Identificacao\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Digito \'Data nascimento = 20/10/1961\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Digito \'RG = 15116261X\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Escolho \'Estado civil = Solteiro (a)\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name:
                    'And Eu Escolho \'Escolaridade = Ensino Supeior Completo\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Escolho \'Etnia = Preta\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Escolho \'Genero = Cisgênero\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Escolho \'Orientacao sexual = Heterossexual\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Escolho \'Pessoa refugiada? = Não\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Escolho \'Salvar dados\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'Then Eu Escolho \'Dados salvos com sucesso!\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Fecho Alerta \'OK\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
          onBefore: () async => onBeforeRunFeature(
            name: 'Validando Dados Pessoais Identificacao',
            path:
                'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\dados_pessoais_identificacao.feature',
            description: null,
            tags: <String>['@tag'],
          ),
        );

        runScenario(
          name: 'Atualizar Dados Pessoais Identificacao Incompleta',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\dados_pessoais_identificacao.feature',
          tags: <String>['@tag'],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'Given Eu Acesso \'Dashboard\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'When Eu Pressiono \'Dados Pessoais\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Pressiono \'Dados Pessoais Identificacao\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Digito \'RG = brancos\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Pressiono \'Salvar dados\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'Then Eu Espero Resultado \'Campos obrigatorios\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Fecho Alerta \'Fechar\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
          onAfter: () async => onAfterRunFeature(
            name: 'Validando Dados Pessoais Identificacao',
            path:
                'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\dados_pessoais_identificacao.feature',
            description: null,
            tags: <String>['@tag'],
          ),
        );
      },
    );
  }

  void testFeature2() {
    runFeature(
      name: 'Validando Dados Pessoais Endereco:',
      tags: <String>['@tag'],
      run: () {
        runScenario(
          name: 'Atualizar Dados Pessoais Endereco Completo',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\dados_pessoais_endereco.feature',
          tags: <String>['@tag', '@debug'],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'Given Eu Acesso \'Dashboard\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'When Eu Pressiono \'Dados Pessoais\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Pressiono \'Dados Pessoais Endereco\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Digito \'CEP = 01218-011\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Digito \'Endereço = Al Eduardo Prado 793\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Digito \'Complemento = Apto 32\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Digito \'Bairro = Campos Eliseos\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Digito \'Cidade = São Paulo\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Digito \'UF = SP\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Digito \'Com quem mora? = Conjuge\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Pressiono \'Salvar dados\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'Then Eu Espero \'Dados salvos com sucesso!\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Fecho Alerta \'OK\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
          onBefore: () async => onBeforeRunFeature(
            name: 'Validando Dados Pessoais Endereco',
            path:
                'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\dados_pessoais_endereco.feature',
            description: null,
            tags: <String>['@tag'],
          ),
        );

        runScenario(
          name: 'Atualizar Dados Pessoais Identificacao Incompleta',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\dados_pessoais_endereco.feature',
          tags: <String>['@tag'],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'Given Eu Acesso \'Dashboard\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'When Eu Pressiono \'Dados Pessoais\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Pressiono \'Dados Pessoais Endereço\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Digito \'Número = brancos\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Pressiono \'Salvar dados\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'Then Eu Espero Resultado \'Campos obrigatorios\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Fecho Alerta \'Fechar\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
          onAfter: () async => onAfterRunFeature(
            name: 'Validando Dados Pessoais Endereco',
            path:
                'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\dados_pessoais_endereco.feature',
            description: null,
            tags: <String>['@tag'],
          ),
        );
      },
    );
  }

  void testFeature3() {
    runFeature(
      name: 'Validando Dados Pessoais Contato:',
      tags: <String>['@tag'],
      run: () {
        runScenario(
          name: 'Contato Inserir Contato de Emergência',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\dados_pessoais_contato.feature',
          tags: <String>['@tag'],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'Given Eu Acesso \'Dashboard\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'When Eu Pressiono \'Dados Pessoais\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Pressiono \'Contato\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Pressiono \'Inserir contato\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Aguardo \'Adicionar contato de emergência\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Digito \'Nome do contato = Nome Conteudo\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Escolho \'Grau de parentesco = Filho(a)\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Digito \'Telefone de contato = (22)2222-2222\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Pressiono \'Salvar\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name:
                    'Then Eu Espero Resultado \'Contato cadastrado com sucesso.\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Fecho Alerta \'OK\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
          onBefore: () async => onBeforeRunFeature(
            name: 'Validando Dados Pessoais Contato',
            path:
                'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\dados_pessoais_contato.feature',
            description: """Cadastro de Dados de Contato""",
            tags: <String>['@tag'],
          ),
        );

        runScenario(
          name: 'Contato Atualizar Dados de Contato',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\dados_pessoais_contato.feature',
          tags: <String>['@tag'],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'Given Eu Acesso \'Dashboard\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'When Eu Pressiono \'Dados Pessoais\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Pressiono \'Contato\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name:
                    'And Eu Digito \'Email alternativo = Email alternativo Conteudo\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Digito \'Celular = (22)2222-2222\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Pressiono \'Salvar dados\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'Then Eu Espero Resultado \'Dados salvos com sucesso!\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Fecho Alerta \'OK\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
          onAfter: () async => onAfterRunFeature(
            name: 'Validando Dados Pessoais Contato',
            path:
                'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\dados_pessoais_contato.feature',
            description: """Cadastro de Dados de Contato""",
            tags: <String>['@tag'],
          ),
        );
      },
    );
  }

  void testFeature4() {
    runFeature(
      name: 'Validando Dados Pessoais Dependente:',
      tags: <String>['@tag'],
      run: () {
        runScenario(
          name: 'Contato Inserir Dependente',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\dados_pessoais_dependente.feature',
          tags: <String>['@tag'],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'Given Eu Acesso \'Dashboard\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'When Eu Pressiono \'Dados Pessoais\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Pressiono \'Dependente\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Pressiono \'Inserir dependente\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Aguardo \'Adicionar dependente\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Digito \'Nome completo = Danilo Joaquim\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Digito \'CPF = 11111111-11\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Digito \'Data nascimento = 11/07/1986\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Digito \'RG = 15116261-X\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Escolho \'Tipo de dependente = FILHO(A)\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Digito \'Requer ajuda? Qual? = Não\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Pressiono \'Salvar\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name:
                    'Then Eu Espero Resultado \'Dependente criado com sucesso!\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Fecho Alerta \'OK\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
          onBefore: () async => onBeforeRunFeature(
            name: 'Validando Dados Pessoais Dependente',
            path:
                'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\dados_pessoais_dependente.feature',
            description: """Cadastro de Dados de Contato""",
            tags: <String>['@tag'],
          ),
          onAfter: () async => onAfterRunFeature(
            name: 'Validando Dados Pessoais Dependente',
            path:
                'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\dados_pessoais_dependente.feature',
            description: """Cadastro de Dados de Contato""",
            tags: <String>['@tag'],
          ),
        );
      },
    );
  }

  void testFeature5() {
    runFeature(
      name: 'validando fluxo login:',
      tags: <String>['@tag'],
      run: () {
        runScenario(
          name: 'login valido para foursys microsoft',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\login.feature',
          tags: <String>['@tag', '@debug'],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'Given Eu Acesso \'Login Fourmakers\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'When Eu Pressiono \'Entrar com a conta da Microsoft\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'Then Eu Espero Resultado \'Dashboard\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
          onBefore: () async => onBeforeRunFeature(
            name: 'validando fluxo login',
            path:
                'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\login.feature',
            description: null,
            tags: <String>['@tag'],
          ),
          onAfter: () async => onAfterRunFeature(
            name: 'validando fluxo login',
            path:
                'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\login.feature',
            description: null,
            tags: <String>['@tag'],
          ),
        );
      },
    );
  }

  void testFeature6() {
    runFeature(
      name: 'Validando Logout:',
      tags: <String>['@tag'],
      run: () {
        runScenario(
          name: 'Saindo da Aplicacao',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\logout.feature',
          tags: <String>['@tag', '@debug'],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'Given Eu Acesso \'Login Fourmakers\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'When Eu Pressiono \'Entrar Com A Conta Da Microsoft\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'And Eu Pressiono \'Logout\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name:
                    'Then Eu Espero Resultado \'url=https://login.microsoftonline.com/common/oauth2/logout\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
          onBefore: () async => onBeforeRunFeature(
            name: 'Validando Logout',
            path:
                'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\logout.feature',
            description: null,
            tags: <String>['@tag'],
          ),
          onAfter: () async => onAfterRunFeature(
            name: 'Validando Logout',
            path:
                'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\logout.feature',
            description: null,
            tags: <String>['@tag'],
          ),
        );
      },
    );
  }
}

void executeTestSuite({
  required FlutterTestConfiguration configuration,
  required StartAppFn appMainFunction,
  Timeout scenarioExecutionTimeout = const Timeout(const Duration(minutes: 10)),
  AppLifecyclePumpHandlerFn? appLifecyclePumpHandler,
  LiveTestWidgetsFlutterBindingFramePolicy? framePolicy,
}) {
  _CustomGherkinIntegrationTestRunner(
    configuration: configuration,
    appMainFunction: appMainFunction,
    appLifecyclePumpHandler: appLifecyclePumpHandler,
    scenarioExecutionTimeout: scenarioExecutionTimeout,
    framePolicy: framePolicy,
  ).run();
}
