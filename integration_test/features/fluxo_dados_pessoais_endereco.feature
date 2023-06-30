@tag
Feature: 	Validando Dados Pessoais Endereco

	@debug
	Scenario: Atualizar Dados Pessoais Endereco Completo
		Given Eu Acesso 'Dashboard'
		When Eu Pressiono 'Dados Pessoais'
		And Eu Pressiono 'Dados Pessoais Endereco'
		And Eu Digito 'CEP = 01218-011'
		And Eu Digito 'Endereço = Al Eduardo Prado 793'
		And Eu Digito 'Complemento = Apto 32'
		And Eu Digito 'Bairro = Campos Eliseos'
		And Eu Digito 'Cidade = São Paulo'
		And Eu Digito 'UF = SP'
		And Eu Digito 'Com quem mora? = Conjuge'
		And Eu Pressiono 'Salvar dados'
		Then Eu Espero 'Dados salvos com sucesso!'
		And Eu Fecho Alerta 'OK'

	Scenario: Atualizar Dados Pessoais Identificacao Incompleta
		Given Eu Acesso 'Dashboard'
		When Eu Pressiono 'Dados Pessoais'
		And Eu Pressiono 'Dados Pessoais Endereço'
		And Eu Digito 'Número = brancos'
		And Eu Pressiono 'Salvar dados'
		Then Eu Espero Resultado 'Campos obrigatorios'
		And Eu Fecho Alerta 'Fechar'

		
