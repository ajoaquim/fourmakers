@tag
Feature: 	Validando Dados Pessoais Dependente
	Cadastro de Dados de Contato

	Scenario: Contato Inserir Dependente
		Given Eu Acesso 'Dashboard'
		When Eu Pressiono 'Dados Pessoais'
		And Eu Pressiono 'Dependente'
		And Eu Pressiono 'Inserir dependente'
		And Eu Aguardo 'Adicionar dependente'
		And Eu Digito 'Nome completo = Danilo Joaquim'
		And Eu Digito 'CPF = 11111111-11'
		And Eu Digito 'Data nascimento = 11/07/1986'
		And Eu Digito 'RG = 15116261-X'
		And Eu Escolho 'Tipo de dependente = FILHO(A)'
		And Eu Digito 'Requer ajuda? Qual? = Não'
		And Eu Pressiono 'Salvar'
		Then Eu Espero Resultado 'Dependente criado com sucesso!'
		And Eu Fecho Alerta 'OK'
