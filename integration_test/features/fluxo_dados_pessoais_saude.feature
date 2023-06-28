Feature: Dados Pessoais Saude
  Cadastro de Dados de Saude
  
  Scenario: Saude Salvar Sem Campo Obrigatório Preenchido
	  Given Dado que eu tenha me autenticado com sucesso no sistema
	  When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"
		And Clico em "Minha Conta Saude" 
		And Limpo Conteudo de "Possui alguma condição de saúde relevante" e clico em "Salvar Dados"
		Then Devo receber alerta "Campos Obrigatórios! Por favor, preenchha todos os campos obrigatórios"
		And fecho a tela para retornar para a tela "Minha Conta, Endereco"
		
	Scenario: Contato Preencher Registro Completo
		Given Dado que eu tenha me autenticado com sucesso no sistema
		When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"
		And Clico em "Minha Conta Saude"
		And Digito Valores Validos para Selecione caso tenha alguma deficiencia, Pertence Grupo de Risco para Covid-19, Possui alguma condicao de saude relevante
		And Clico em Salvar Dados
		Then Recebo confirmacao de registro salvo com sucesso
	
		
		
		
