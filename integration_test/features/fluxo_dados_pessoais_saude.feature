@tag
Feature: 	Validando Dados Pessoais Saude

	@debug
	Scenario: Atualizar Dados Pessoais Saude
		Given Eu Acesso 'Dashboard'
		When Eu Pressiono 'Dados Pessoais'
		And Eu Pressiono 'Dados Pessoais Saude'
		And Eu Escolho 'Selecione caso tenha alguma deficiência: = Nenhuma'
		And Eu Escolho 'Pertence a grupo de risco para Covid19? = Não'
		And Eu Digito 'Possui alguma condição de saúde relevante? = Não'
		And Eu Pressiono 'Salvar dados'
		Then Eu Espero Resultado 'Dados salvos com sucesso!'
		And Eu Fecho Alerta 'OK'

