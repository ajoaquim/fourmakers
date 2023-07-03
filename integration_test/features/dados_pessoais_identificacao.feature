@tag
Feature: 	Validando Dados Pessoais

	@debug
	Scenario: Atualizar Dados Pessoais
		Given Eu Acesso 'Dashboard'
		When Eu Pressiono 'Dados Pessoais'
		And Eu Pressiono 'Dados Pessoais Identificacao'
		And Eu Digito 'Data nascimento = 20/10/1961'
		And Eu Digito 'RG = 15116261X'
		And Eu Escolho 'Estado civil = Solteiro (a)'
		And Eu Escolho 'Escolaridade = Ensino Supeior Completo'
		And Eu Escolho 'Etnia = Preta'
		And Eu Escolho 'Genero = Cisgênero'
		And Eu Escolho 'Orientacao sexual = Heterossexual'
		And Eu Escolho 'Pessoa refugiada? = Não'
		And Eu Escolho 'Salvar dados'
		Then Eu Espero Resultado 'Dados salvos com sucesso!'
		And Eu Fecho Alerta 'OK'


		
