@tag
Feature: 	Validando Dados Pessoais Contato
  			Cadastro de Dados de Contato

	Scenario: Contato Inserir Contato de Emergência
		Given Eu Acesso 'Dashboard'
		When Eu Pressiono 'Dados Pessoais'
		And Eu Pressiono 'Contato'
		And Eu Pressiono 'Inserir contato'
		And Eu Aguardo 'Adicionar contato de emergência'
		And Eu Digito 'Nome do contato = Nome Conteudo'
		And Eu Escolho 'Grau de parentesco = Filho(a)'
		And Eu Digito 'Telefone de contato = (22)2222-2222'
		And Eu Pressiono 'Salvar'
		Then Eu Espero Resultado 'Contato cadastrado com sucesso.'
		And Eu Fecho Alerta 'OK'

	Scenario: Contato Atualizar Dados de Contato
		Given Eu Acesso 'Dashboard'
		When Eu Pressiono 'Dados Pessoais'
		And Eu Pressiono 'Contato'
		And Eu Digito 'Email alternativo = Email alternativo Conteudo'
		And Eu Digito 'Celular = (22)2222-2222'
		And Eu Pressiono 'Salvar dados'
		Then Eu Espero Resultado 'Dados salvos com sucesso!'
		And Eu Fecho Alerta 'OK'
		

		
		
