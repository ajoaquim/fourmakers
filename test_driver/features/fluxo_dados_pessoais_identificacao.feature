Feature: Dados Pessoais Identificacao
  Cadastro de Dados de Identificacao
  
  Scenario: Identificacao Editar Foto
	  Given Dado que eu tenha me autenticado com sucesso no sistema
	  When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"
		And Clico em "Minha Conta Dados Pessoais" 
		And Clico em "Dados Pessoais Editar Foto" e Fechar
		Then Devo retornar para a tela "Minha Conta"
		
	Scenario: Identificacao Salvar Sem Campo Obrigatório Preenchido
	  Given Dado que eu tenha me autenticado com sucesso no sistema
	  When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"
		And Clico em "Minha Conta Dados Pessoais" 
		And Limpo Conteudo de "RG" e tento "Salvar Dados"
		Then Devo receber alerta "Campos Obrigatórios! Por favor, preenchha todos os campos obrigatórios"
		And fecho a tela para Devo retornar para a tela "Minha Conta"
		
	Scenario: Identificacao Validar Nome e CPF Já Preenchidos
		Given Dado que eu tenha me autenticado com sucesso no sistema
		When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"
		And Clico em "Minha Conta Dados Pessoais"
		Then Campos "Nome completo" e "CPF" estão preenchidos e bloqueados contra edição
		
	Scenario: Identificacao Preencher Registro Completo
		Given Dado que eu tenha me autenticado com sucesso no sistema
		When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"
		And Clico em "Minha Conta Dados Pessoais"
		And Digito Valores Validos para Data Nascimento, RG, Estado Civil, Escolaridade, Etnia, Genero, Orientacao Sexual, Pessoa Refugiada
		And Clico em Salvar Dados
		Then Recebo confirmacao de registro salvo com sucesso
		
		
		
