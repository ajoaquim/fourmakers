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
    testFeature7();
  }

  void testFeature0() {
    runFeature(
      name: 'Validando Dados Pessoais Endereco:',
      tags: <String>['@tag'],
      run: () {
        runScenario(
          name: 'Atualizar Dados Pessoais Endereco Completa',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_endereco.feature',
          tags: <String>['@tag', '@debug'],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'Given Eu Acesso Pagina \'Dashboard\'',
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
                name: 'When Eu Pressiono Menu \'Dados Pessoais\'',
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
                name: 'And Eu Pressiono Menu \'Dados Pessoais Endereco\'',
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
                name: 'And Eu Digito Texto \'CEP = 01218-011\'',
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
                name: 'And Eu Digito Texto \'Endereço = Al Eduardo Prado 793\'',
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
                name: 'And Eu Digito Texto \'Complemento = Apto 32\'',
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
                name: 'And Eu Digito Texto \'Bairro = Campos Eliseos\'',
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
                name: 'And Eu Digito Texto \'Cidade = São Paulo\'',
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
                name: 'And Eu Digito Texto \'UF = SP\'',
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
                name: 'And Eu Digito Texto \'Com quem mora? = Conjuge\'',
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
                name: 'And Eu Pressiono Botao \'Salvar dados\'',
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
                    'Then Eu Espero Como Resultado Alerta \'Dados salvos com sucesso!\'',
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
                name: 'And Eu Pressiono Alerta OK Para Fechar Alerta',
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
                'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_endereco.feature',
            description: null,
            tags: <String>['@tag'],
          ),
        );

        runScenario(
          name: 'Atualizar Dados Pessoais Identificacao Completa Incompleta',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_endereco.feature',
          tags: <String>['@tag'],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'Given Eu Acesso Pagina \'Dashboard\'',
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
                name: 'When Eu Pressiono Menu \'Dados Pessoais\'',
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
                name: 'And Eu Pressiono Menu \'Dados Pessoais Endereço\'',
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
                name: 'And Eu Digito Texto \'Número = brancos\'',
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
                name: 'And Eu Pressiono Botao \'Salvar dados\'',
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
                    'Then Eu Espero Como Resultado Alerta \'Campos obrigatorios\'',
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
                name: 'And Eu Pressiono Alerta Fechar Para Fechar Alerta',
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
                'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_endereco.feature',
            description: null,
            tags: <String>['@tag'],
          ),
        );
      },
    );
  }

  void testFeature1() {
    runFeature(
      name: 'validando fluxo login:',
      tags: <String>['@tag'],
      run: () {
        runScenario(
          name: 'login valido para foursys microsoft',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\fluxo_login.feature',
          tags: <String>['@tag', '@debug'],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'Given Eu Acesso A Pagina De Login Fourmakers',
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
                name: 'When Eu Pressiono Entrar Com A Conta Da Microsoft',
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
                name: 'Then Eu Espero Como Resultado Ver Meu Dashboard',
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
                'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\fluxo_login.feature',
            description: null,
            tags: <String>['@tag'],
          ),
        );

        runScenario(
          name: 'login invalido para foursys microsoft',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\fluxo_login.feature',
          tags: <String>['@tag'],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'Given Eu Acesso A Pagina De Login Fourmakers',
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
                name: 'When Eu Pressiono Entrar Com A Conta Da Microsoft',
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
                    'Then Eu Espero Como Resultado Ver "does not exist in tenant \'Foursys Projetos"',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
          onAfter: () async => onAfterRunFeature(
            name: 'validando fluxo login',
            path:
                'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\fluxo_login.feature',
            description: null,
            tags: <String>['@tag'],
          ),
        );
      },
    );
  }

  void testFeature2() {
    runFeature(
      name: 'Validando Dados Pessoais Contato:',
      tags: <String>['@tag'],
      run: () {
        runScenario(
          name: 'Contato Inserir Contato de Emergência',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_contato.feature',
          tags: <String>['@tag'],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'Given Eu Acesso Pagina \'Dashboard\'',
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
                name: 'When Eu Pressiono Menu \'Dados Pessoais\'',
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
                name: 'And Eu Pressiono Menu \'Contato\'',
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
                name: 'And Eu Pressiono Botao \'Inserir contato\'',
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
                    'And Eu Aguardo Pop-Up \'Adicionar contato de emergência\'',
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
                name: 'And Eu Digito Texto \'Nome do contato = Nome Conteudo\'',
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
                    'And Eu Digito Lista Verificacao \'Grau de parentesco = Filho(a)\'',
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
                    'And Eu Digito Texto \'Telefone de contato = (22)2222-2222\'',
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
                name: 'And Eu Pressiono Botao \'Salvar\'',
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
                    'Then Eu Espero Como Resultado Alerta \'Contato cadastrado com sucesso.\'',
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
                name: 'And Eu Pressiono Alerta OK Para Fechar Alerta',
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
                'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_contato.feature',
            description: """Cadastro de Dados de Contato""",
            tags: <String>['@tag'],
          ),
        );

        runScenario(
          name: 'Contato Atualizar Dados de Contato',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_contato.feature',
          tags: <String>['@tag'],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'Given Eu Acesso Pagina \'Dashboard\'',
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
                name: 'When Eu Pressiono Menu \'Dados Pessoais\'',
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
                name: 'And Eu Pressiono Menu \'Contato\'',
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
                    'And Eu Digito Texto \'Email alternativo = Email alternativo Conteudo\'',
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
                name: 'And Eu Digito Texto \'Celular = (22)2222-2222\'',
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
                name: 'And Eu Pressiono Botao \'Salvar dados\'',
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
                    'Then Eu Espero Como Resultado Alerta \'Dados salvos com sucesso!\'',
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
                name: 'And Eu Pressiono Alerta OK Para Fechar Alerta',
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
                'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_contato.feature',
            description: """Cadastro de Dados de Contato""",
            tags: <String>['@tag'],
          ),
        );
      },
    );
  }

  void testFeature3() {
    runFeature(
      name: 'Calculator:',
      tags: <String>['@tag'],
      run: () {
        runScenario(
          name: '3 + 38 = 41',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\calculator.feature',
          tags: <String>['@tag', '@debug'],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'Given I open calculator',
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
                name: 'And calculator is empty',
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
                name: 'When I press number 3',
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
                name: 'And I press operation \'+\'',
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
                name: 'And I press number 3',
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
                name: 'And I press number 8',
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
                name: 'And I press operation \'=\'',
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
                name: 'Then I expect result \'41\'',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
          onBefore: () async => onBeforeRunFeature(
            name: 'Calculator',
            path:
                'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\calculator.feature',
            description: null,
            tags: <String>['@tag'],
          ),
          onAfter: () async => onAfterRunFeature(
            name: 'Calculator',
            path:
                'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\calculator.feature',
            description: null,
            tags: <String>['@tag'],
          ),
        );
      },
    );
  }

  void testFeature4() {
    runFeature(
      name: 'Validando Logout:',
      tags: <String>['@tag'],
      run: () {
        runScenario(
          name: 'Saindo da Aplicacao',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\fluxo_logout.feature',
          tags: <String>['@tag', '@debug'],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'Given Eu Acesso A Pagina De Login Fourmakers',
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
                name: 'When Eu Pressiono Entrar Com A Conta Da Microsoft',
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
                name: 'And Eu Pressiono Logout',
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
                    'Then Eu Espero url=https://login.microsoftonline.com/common/oauth2/logout',
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
                'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\fluxo_logout.feature',
            description: null,
            tags: <String>['@tag'],
          ),
          onAfter: () async => onAfterRunFeature(
            name: 'Validando Logout',
            path:
                'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\fluxo_logout.feature',
            description: null,
            tags: <String>['@tag'],
          ),
        );
      },
    );
  }

  void testFeature5() {
    runFeature(
      name: 'Validando Dados Pessoais Identificação:',
      tags: <String>['@tag'],
      run: () {
        runScenario(
          name: 'Atualizar Dados Pessoais Identificacao Completa',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_identificacao.feature',
          tags: <String>['@tag', '@debug'],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'Given Eu Acesso Pagina \'Dashboard\'',
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
                name: 'When Eu Pressiono Menu \'Dados Pessoais\'',
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
                name: 'And Eu Pressiono Menu \'Dados Pessoais Identificacao\'',
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
                name: 'And Eu Digito Texto \'Data nascimento = 20/10/1961\'',
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
                name: 'And Eu Digito Texto \'RG = 15116261X\'',
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
                    'And Eu Digito Lista Verificacao \'Estado civil = Solteiro (a)\'',
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
                    'And Eu Digito Lista Verificacao \'Escolaridade = Ensino Supeior Completo\'',
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
                name: 'And Eu Digito Lista Verificacao \'Etnia = Preta\'',
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
                name: 'And Eu Digito Lista Verificacao \'Genero = Cisgênero\'',
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
                    'And Eu Digito Lista Verificacao \'Orientacao sexual = Heterossexual\'',
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
                    'And Eu Digito Lista Verificacao \'Pessoa refugiada? = Não\'',
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
                name: 'And Eu Pressiono Botao \'Salvar dados\'',
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
                    'Then Eu Espero Como Resultado Alerta \'Dados salvos com sucesso!\'',
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
                name: 'And Eu Pressiono Alerta OK Para Fechar Alerta',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
          onBefore: () async => onBeforeRunFeature(
            name: 'Validando Dados Pessoais Identificação',
            path:
                'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_identificacao.feature',
            description: null,
            tags: <String>['@tag'],
          ),
        );

        runScenario(
          name: 'Atualizar Dados Pessoais Identificacao Completa Incompleta',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_identificacao.feature',
          tags: <String>['@tag'],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'Given Eu Acesso Pagina \'Dashboard\'',
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
                name: 'When Eu Pressiono Menu \'Dados Pessoais\'',
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
                name: 'And Eu Pressiono Menu \'Dados Pessoais Identificacao\'',
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
                name: 'And Eu Digito Texto \'RG = brancos\'',
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
                name: 'And Eu Pressiono Botao \'Salvar dados\'',
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
                    'Then Eu Espero Como Resultado Alerta \'Campos obrigatorios\'',
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
                name: 'And Eu Pressiono Alerta Fechar Para Fechar Alerta',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
          onAfter: () async => onAfterRunFeature(
            name: 'Validando Dados Pessoais Identificação',
            path:
                'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_identificacao.feature',
            description: null,
            tags: <String>['@tag'],
          ),
        );
      },
    );
  }

  void testFeature6() {
    runFeature(
      name: 'Validando Dados Pessoais Saude:',
      tags: <String>['@tag'],
      run: () {
        runScenario(
          name: 'Atualizar Dados Pessoais Saude',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_saude.feature',
          tags: <String>['@tag', '@debug'],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'Given Eu Acesso Pagina \'Dashboard\'',
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
                name: 'When Eu Pressiono Menu \'Dados Pessoais\'',
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
                name: 'And Eu Pressiono Menu \'Dados Pessoais Saude\'',
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
                    'And Eu Digito Lista Verificacao \'Selecione caso tenha alguma deficiência: = Nenhuma\'',
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
                    'And Eu Digito Lista Verificacao \'Pertence a grupo de risco para Covid19? = Não\'',
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
                    'And Eu Digito Texto \'Possui alguma condição de saúde relevante? = Não\'',
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
                name: 'And Eu Pressiono Botao \'Salvar dados\'',
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
                    'Then Eu Espero Como Resultado Alerta \'Dados salvos com sucesso!\'',
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
                name: 'And Eu Pressiono Alerta OK Para Fechar Alerta',
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
                'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_saude.feature',
            description: null,
            tags: <String>['@tag'],
          ),
          onAfter: () async => onAfterRunFeature(
            name: 'Validando Dados Pessoais Saude',
            path:
                'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_saude.feature',
            description: null,
            tags: <String>['@tag'],
          ),
        );
      },
    );
  }

  void testFeature7() {
    runFeature(
      name: 'Validando Dados Pessoais Contato:',
      tags: <String>['@tag'],
      run: () {
        runScenario(
          name: 'Contato Atualizar Dependente',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_dependente.feature',
          tags: <String>['@tag', '@debug'],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'Given Eu Acesso Pagina \'Dashboard\'',
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
                name: 'When Eu Pressiono Menu \'Dados Pessoais\'',
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
                name: 'And Eu Pressiono Menu \'Dependente\'',
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
                name: 'And Eu Pressiono Botao \'Inserir dependente\'',
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
                name: 'And Eu Aguardo Pop-Up \'Adicionar dependente\'',
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
                name: 'And Eu Digito Texto \'Nome completo = Danilo Joaquim\'',
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
                name: 'And Eu Digito Texto \'CPF = 11111111-11\'',
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
                name: 'And Eu Digito Texto \'Data nascimento = 11/07/1986\'',
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
                name: 'And Eu Digito Texto \'RG = 15116261-X\'',
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
                    'And Eu Digito Lista Verificacao \'Tipo de dependente = FILHO(A)\'',
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
                name: 'And Eu Digito Texto \'Requer ajuda? Qual? = Não\'',
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
                name: 'And Eu Pressiono Botao \'Salvar\'',
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
                    'Then Eu Espero Como Resultado Alerta \'Dependente criado com sucesso!\'',
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
                name: 'And Eu Pressiono Alerta OK Para Fechar Alerta',
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
                'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_dependente.feature',
            description: """Cadastro de Dados de Contato""",
            tags: <String>['@tag'],
          ),
          onAfter: () async => onAfterRunFeature(
            name: 'Validando Dados Pessoais Contato',
            path:
                'C:\\Users\\ajoaquim\\workspace-flutter\\_fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_dependente.feature',
            description: """Cadastro de Dados de Contato""",
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
