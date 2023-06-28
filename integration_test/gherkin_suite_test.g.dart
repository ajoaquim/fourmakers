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
      name: 'Dados Pessoais Contato:',
      tags: <String>[],
      run: () {
        runScenario(
          name: 'Contato Salvar Dados Sem Contato de Emergência Cadastrado',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_contato.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name:
                    'Given Dado que eu tenha me autenticado com sucesso no sistema',
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
                    'When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"',
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
                name: 'And Clico no menu "Minha Conta, Contato"',
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
                    'And Em Contatos de Emergencia localizo "Voce Não tem Contatos de Emergencia Cadastrado"',
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
                name: 'And Clico em Salvar Dados',
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
                    'Then Devo receber mensagem "Voce não possui contatos de emergencia cadastrados..."',
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
                name: 'And Clico em OK para retornar a Tela Minha Conta',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
          onBefore: () async => onBeforeRunFeature(
            name: 'Dados Pessoais Contato',
            path:
                'C:\\Users\\ajoaquim\\workspace-flutter\\fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_contato.feature',
            description: """Cadastro de Dados de Contato""",
            tags: <String>[],
          ),
        );

        runScenario(
          name: 'Contato Cadastrar Contato de Emergência',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_contato.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name:
                    'Given Dado que eu tenha me autenticado com sucesso no sistema',
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
                    'When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"',
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
                name: 'And Clico no menu "Minha Conta, Contato"',
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
                    'And Em "Contatos de Emergencia" clico em "Inserir Contato"',
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
                name: 'And Na tela "Contato de emergencia"',
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
                    'And Digito valores validos do contado e pressiono "Salvar"',
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
                    'Then Recebo Contato cadastrado com sucesso e com OK fecho a tela',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
        );

        runScenario(
          name: 'Contato Editar Contato de Emergência',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_contato.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name:
                    'Given Dado que eu tenha me autenticado com sucesso no sistema',
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
                    'When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"',
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
                name: 'And Clico no menu "Minha Conta, Contato"',
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
                name: 'And Em "Contatos de Emergencia" clico em "Editar"',
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
                    'And Edito Com valores validos do contato e pressiono Salvar',
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
                    'Then Recebo Contato editado com sucesso e com OK fecho a tela',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
        );

        runScenario(
          name: 'Contato Excluir Contato de Emergência',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_contato.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name:
                    'Given Dado que eu tenha me autenticado com sucesso no sistema',
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
                    'When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"',
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
                name: 'And Clico no menu "Minha Conta, Contato"',
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
                name: 'And Em "Contatos de Emergencia" clico em "Deletar"',
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
                    'And Em "Excluir Contato de Emergencia" confirmo com "Excluir"',
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
                    'Then Recebo Contato Excluido com sucesso e com OK fecho a tela',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
        );

        runScenario(
          name: 'Contato Salvar Dados Sem Contato de Emergência Cadastrado',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_contato.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name:
                    'Given Dado que eu tenha me autenticado com sucesso no sistema',
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
                    'When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"',
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
                name: 'And Clico no menu "Minha Conta, Contato"',
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
                    'And Em Contatos de Emergencia localizo "Voce Não tem Contatos de Emergencia Cadastrado"',
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
                name: 'And Clico em Salvar Dados',
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
                    'Then Devo receber mensagem "Voce não possui contatos de emergencia cadastrados..." e fechar e retornar',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
        );

        runScenario(
          name: 'Contato Salvar Sem Campo Obrigatório Preenchido',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_contato.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name:
                    'Given Dado que eu tenha me autenticado com sucesso no sistema',
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
                    'When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"',
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
                name: 'And Clico em "Minha Conta Contato"',
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
                    'And Limpo Conteudo de "Celular" e clico em "Salvar Dados"',
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
                    'Then Devo receber alerta "Campos Obrigatórios! Por favor, preenchha todos os campos obrigatórios"',
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
                    'And fecho a tela para retornar para a tela "Minha Conta, Contato"',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
        );

        runScenario(
          name: 'Contato Validar Email Profissional Já Preenchidos',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_contato.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name:
                    'Given Dado que eu tenha me autenticado com sucesso no sistema',
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
                    'When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"',
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
                name: 'And Clico em "Minha Conta Dados Contato"',
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
                    'Then Campos "Email Profissional" estão preenchidos e bloqueados contra edição',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
        );

        runScenario(
          name: 'Contato Preencher Registro Completo',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_contato.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name:
                    'Given Dado que eu tenha me autenticado com sucesso no sistema',
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
                    'When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"',
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
                name: 'And Clico em "Minha Conta Contato"',
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
                    'And Digito Valores Validos para E-mail alternativo, Celular, Contatos de Emergência',
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
                name: 'And Clico em Salvar Dados',
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
                name: 'Then Recebo confirmacao de registro salvo com sucesso',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
          onAfter: () async => onAfterRunFeature(
            name: 'Dados Pessoais Contato',
            path:
                'C:\\Users\\ajoaquim\\workspace-flutter\\fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_contato.feature',
            description: """Cadastro de Dados de Contato""",
            tags: <String>[],
          ),
        );
      },
    );
  }

  void testFeature1() {
    runFeature(
      name: 'Validando logout:',
      tags: <String>[],
      run: () {
        runScenario(
          name: 'Logout',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\fourmakers\\.\\integration_test\\features\\fluxo_logout.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name:
                    'Given Dado que eu tenha me autenticado com sucesso no sistema',
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
                    'When Quando eu acessar a tela home do sistema e clicar no menu "Logout"',
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
                    'Then Entao devo ser deslogado da Microsoft, e o sistema deve me apresentar mensagem "Você saiu da sua conta"',
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
                name: 'And Posso fechar a tela apresentada',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
          onBefore: () async => onBeforeRunFeature(
            name: 'Validando logout',
            path:
                'C:\\Users\\ajoaquim\\workspace-flutter\\fourmakers\\.\\integration_test\\features\\fluxo_logout.feature',
            description: null,
            tags: <String>[],
          ),
          onAfter: () async => onAfterRunFeature(
            name: 'Validando logout',
            path:
                'C:\\Users\\ajoaquim\\workspace-flutter\\fourmakers\\.\\integration_test\\features\\fluxo_logout.feature',
            description: null,
            tags: <String>[],
          ),
        );
      },
    );
  }

  void testFeature2() {
    runFeature(
      name: 'Dados Pessoais Dependente:',
      tags: <String>[],
      run: () {
        runScenario(
          name: 'Dependente Salvar Sem Campo Obrigatório Preenchido',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_dependente.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name:
                    'Given Dado que eu tenha me autenticado com sucesso no sistema',
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
                    'When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"',
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
                name: 'And Clico em "Minha Conta Dependentes"',
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
                name: 'And Em Dependente Clico em Inserir Dependente',
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
                    'And Deixo em branco  Conteudo de "Nome Completo, Data de Nascimento"  clico em "Salvar"',
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
                    'Then Devo receber a legenda "Campo Obrigatório" abaixo de "Nome Completo, Data de Nascimento"  e retorno a tela anterior',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
          onBefore: () async => onBeforeRunFeature(
            name: 'Dados Pessoais Dependente',
            path:
                'C:\\Users\\ajoaquim\\workspace-flutter\\fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_dependente.feature',
            description: """Cadastro de Dados de Dependente""",
            tags: <String>[],
          ),
        );

        runScenario(
          name: 'Dependente Preencher Registro Completo',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_dependente.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name:
                    'Given Dado que eu tenha me autenticado com sucesso no sistema',
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
                    'When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"',
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
                name: 'And Clico em "Minha Conta Dependentes"',
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
                name: 'And Em Dependente Clico em Inserir Dependente',
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
                    'And Digito Valores Validos para Nome Completo, CPF, RG, Data Nascimento, Tipo de Dependente, Requer Ajuda',
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
                name: 'And Clico em Salvar',
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
                    'Then Recebo confirmacao de registro salvo com sucesso, OK fecho a tela',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
        );

        runScenario(
          name: 'Dependente Editar',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_dependente.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name:
                    'Given Dado que eu tenha me autenticado com sucesso no sistema',
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
                    'When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"',
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
                name: 'And Clico no menu "Minha Conta, Dependente"',
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
                name: 'And Em "Dependentes" clico em "Editar"',
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
                    'And Edito Com valores validos do dependente e pressiono Salvar',
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
                    'Then Recebo dependente editado com sucesso e com OK fecho a tela',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
        );

        runScenario(
          name: 'Dependente Excluir',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_dependente.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name:
                    'Given Dado que eu tenha me autenticado com sucesso no sistema',
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
                    'When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"',
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
                name: 'And Clico no menu "Minha Conta, Dependente"',
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
                name: 'And Em "Dependentes" clico em "Deletar"',
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
                name: 'And Em "Excluir Dependente" confirmo com "Excluir"',
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
                    'Then Recebo Dependente Excluido com sucesso e com OK fecho a tela',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
        );

        runScenario(
          name: 'Contato Validar Email Profissional Já Preenchidos',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_dependente.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name:
                    'Given Dado que eu tenha me autenticado com sucesso no sistema',
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
                    'When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"',
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
                name: 'And Clico em "Minha Conta Dados Contato"',
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
                    'Then Campos "Email Profissional" estão preenchidos e bloqueados contra edição',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
        );

        runScenario(
          name: 'Contato Preencher Registro Completo',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_dependente.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name:
                    'Given Dado que eu tenha me autenticado com sucesso no sistema',
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
                    'When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"',
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
                name: 'And Clico em "Minha Conta Contato"',
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
                    'And Digito Valores Validos para E-mail alternativo, Celular, Contatos de Emergência',
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
                name: 'And Clico em Salvar Dados',
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
                name: 'Then Recebo confirmacao de registro salvo com sucesso',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
          onAfter: () async => onAfterRunFeature(
            name: 'Dados Pessoais Dependente',
            path:
                'C:\\Users\\ajoaquim\\workspace-flutter\\fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_dependente.feature',
            description: """Cadastro de Dados de Dependente""",
            tags: <String>[],
          ),
        );
      },
    );
  }

  void testFeature3() {
    runFeature(
      name: 'Validando login:',
      tags: <String>[],
      run: () {
        runScenario(
          name: 'Login com sucesso',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\fourmakers\\.\\integration_test\\features\\fluxo_login.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'Given Dado que eu acesse a pagina de login do sistema',
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
                name: 'When Quando eu clico em Entrar com a conta da Microsoft',
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
                name: 'Then Entao devo ser autenticado com sucesso',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
          onBefore: () async => onBeforeRunFeature(
            name: 'Validando login',
            path:
                'C:\\Users\\ajoaquim\\workspace-flutter\\fourmakers\\.\\integration_test\\features\\fluxo_login.feature',
            description: null,
            tags: <String>[],
          ),
        );

        runScenario(
          name: 'Login com usuario invalido',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\fourmakers\\.\\integration_test\\features\\fluxo_login.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'Given Dado que eu acesse a tela de login do sistema',
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
                name: 'When Quando eu clico em Entrar com a conta da Microsoft',
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
                name: 'Then Entao usuario nao deve ser autenticado com sucesso',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
        );

        runScenario(
          name: 'Login com usuario Sem Login Ativo Microsoft',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\fourmakers\\.\\integration_test\\features\\fluxo_login.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'Given Dado que eu acesse a tela de login do sistema',
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
                name: 'When Quando eu clico em Entrar com a conta da Microsoft',
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
                name: 'Then Entao usuario nao deve ser autenticado com sucesso',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
          onAfter: () async => onAfterRunFeature(
            name: 'Validando login',
            path:
                'C:\\Users\\ajoaquim\\workspace-flutter\\fourmakers\\.\\integration_test\\features\\fluxo_login.feature',
            description: null,
            tags: <String>[],
          ),
        );
      },
    );
  }

  void testFeature4() {
    runFeature(
      name: 'Dados Pessoais Endereco:',
      tags: <String>[],
      run: () {
        runScenario(
          name: 'Endereco Salvar Sem Campo Obrigatório Preenchido',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_endereco.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name:
                    'Given Dado que eu tenha me autenticado com sucesso no sistema',
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
                    'When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"',
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
                name: 'And Clico em "Minha Conta Endereco"',
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
                    'And Limpo Conteudo de "Endereço" e clico em "Salvar Dados"',
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
                    'Then Devo receber alerta "Campos Obrigatórios! Por favor, preenchha todos os campos obrigatórios"',
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
                    'And fecho a tela para retornar para a tela "Minha Conta, Endereco"',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
          onBefore: () async => onBeforeRunFeature(
            name: 'Dados Pessoais Endereco',
            path:
                'C:\\Users\\ajoaquim\\workspace-flutter\\fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_endereco.feature',
            description: """Cadastro de Dados de Endereco""",
            tags: <String>[],
          ),
        );

        runScenario(
          name: 'Contato Preencher Registro Completo',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_endereco.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name:
                    'Given Dado que eu tenha me autenticado com sucesso no sistema',
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
                    'When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"',
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
                name: 'And Clico em "Minha Conta Contato"',
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
                    'And Digito Valores Validos para Cep, Endereço, Numero, Complemento, Bairro, Cidade, UF, Comquem Mora',
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
                name: 'And Clico em Salvar Dados',
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
                name: 'Then Recebo confirmacao de registro salvo com sucesso',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
          onAfter: () async => onAfterRunFeature(
            name: 'Dados Pessoais Endereco',
            path:
                'C:\\Users\\ajoaquim\\workspace-flutter\\fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_endereco.feature',
            description: """Cadastro de Dados de Endereco""",
            tags: <String>[],
          ),
        );
      },
    );
  }

  void testFeature5() {
    runFeature(
      name: 'Dados Pessoais Saude:',
      tags: <String>[],
      run: () {
        runScenario(
          name: 'Saude Salvar Sem Campo Obrigatório Preenchido',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_saude.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name:
                    'Given Dado que eu tenha me autenticado com sucesso no sistema',
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
                    'When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"',
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
                name: 'And Clico em "Minha Conta Saude"',
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
                    'And Limpo Conteudo de "Possui alguma condição de saúde relevante" e clico em "Salvar Dados"',
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
                    'Then Devo receber alerta "Campos Obrigatórios! Por favor, preenchha todos os campos obrigatórios"',
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
                    'And fecho a tela para retornar para a tela "Minha Conta, Endereco"',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
          onBefore: () async => onBeforeRunFeature(
            name: 'Dados Pessoais Saude',
            path:
                'C:\\Users\\ajoaquim\\workspace-flutter\\fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_saude.feature',
            description: """Cadastro de Dados de Saude""",
            tags: <String>[],
          ),
        );

        runScenario(
          name: 'Contato Preencher Registro Completo',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_saude.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name:
                    'Given Dado que eu tenha me autenticado com sucesso no sistema',
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
                    'When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"',
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
                name: 'And Clico em "Minha Conta Saude"',
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
                    'And Digito Valores Validos para Selecione caso tenha alguma deficiencia, Pertence Grupo de Risco para Covid-19, Possui alguma condicao de saude relevante',
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
                name: 'And Clico em Salvar Dados',
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
                name: 'Then Recebo confirmacao de registro salvo com sucesso',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
          onAfter: () async => onAfterRunFeature(
            name: 'Dados Pessoais Saude',
            path:
                'C:\\Users\\ajoaquim\\workspace-flutter\\fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_saude.feature',
            description: """Cadastro de Dados de Saude""",
            tags: <String>[],
          ),
        );
      },
    );
  }

  void testFeature6() {
    runFeature(
      name: 'Dados Pessoais Identificacao:',
      tags: <String>[],
      run: () {
        runScenario(
          name: 'Identificacao Editar Foto',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_identificacao.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name:
                    'Given Dado que eu tenha me autenticado com sucesso no sistema',
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
                    'When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"',
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
                name: 'And Clico em "Minha Conta Dados Pessoais"',
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
                name: 'And Clico em "Dados Pessoais Editar Foto" e Fechar',
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
                name: 'Then Devo retornar para a tela "Minha Conta"',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
          onBefore: () async => onBeforeRunFeature(
            name: 'Dados Pessoais Identificacao',
            path:
                'C:\\Users\\ajoaquim\\workspace-flutter\\fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_identificacao.feature',
            description: """Cadastro de Dados de Identificacao""",
            tags: <String>[],
          ),
        );

        runScenario(
          name: 'Identificacao Salvar Sem Campo Obrigatório Preenchido',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_identificacao.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name:
                    'Given Dado que eu tenha me autenticado com sucesso no sistema',
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
                    'When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"',
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
                name: 'And Clico em "Minha Conta Dados Pessoais"',
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
                name: 'And Limpo Conteudo de "RG" e tento "Salvar Dados"',
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
                    'Then Devo receber alerta "Campos Obrigatórios! Por favor, preenchha todos os campos obrigatórios"',
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
                    'And fecho a tela para Devo retornar para a tela "Minha Conta"',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
        );

        runScenario(
          name: 'Identificacao Validar Nome e CPF Já Preenchidos',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_identificacao.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name:
                    'Given Dado que eu tenha me autenticado com sucesso no sistema',
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
                    'When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"',
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
                name: 'And Clico em "Minha Conta Dados Pessoais"',
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
                    'Then Campos "Nome completo" e "CPF" estão preenchidos e bloqueados contra edição',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
        );

        runScenario(
          name: 'Identificacao Preencher Registro Completo',
          description: null,
          path:
              'C:\\Users\\ajoaquim\\workspace-flutter\\fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_identificacao.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name:
                    'Given Dado que eu tenha me autenticado com sucesso no sistema',
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
                    'When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"',
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
                name: 'And Clico em "Minha Conta Dados Pessoais"',
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
                    'And Digito Valores Validos para Data Nascimento, RG, Estado Civil, Escolaridade, Etnia, Genero, Orientacao Sexual, Pessoa Refugiada',
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
                name: 'And Clico em Salvar Dados',
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
                name: 'Then Recebo confirmacao de registro salvo com sucesso',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
          onAfter: () async => onAfterRunFeature(
            name: 'Dados Pessoais Identificacao',
            path:
                'C:\\Users\\ajoaquim\\workspace-flutter\\fourmakers\\.\\integration_test\\features\\fluxo_dados_pessoais_identificacao.feature',
            description: """Cadastro de Dados de Identificacao""",
            tags: <String>[],
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
