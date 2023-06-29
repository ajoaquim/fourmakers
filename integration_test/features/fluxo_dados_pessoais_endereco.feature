@tag
Feature: 	Validando Dados Pessoais Endereco

	@debug
	Scenario: Atualizar Dados Pessoais Endereco Completa
		Given Eu Acesso Pagina 'Dashboard'
		When Eu Pressiono Menu 'Dados Pessoais'
		And Eu Pressiono Menu 'Dados Pessoais Endereco'
		And Eu Digito Texto 'CEP = 01218-011'
		And Eu Digito Texto 'Endereço = Al Eduardo Prado 793'
		And Eu Digito Texto 'Complemento = Apto 32'
		And Eu Digito Texto 'Bairro = Campos Eliseos'
		And Eu Digito Texto 'Cidade = São Paulo'
		And Eu Digito Texto 'UF = SP'
		And Eu Digito Texto 'Com quem mora? = Conjuge'
		And Eu Pressiono Botao 'Salvar dados'
		Then Eu Espero Como Resultado Alerta 'Dados salvos com sucesso!'
		And Eu Pressiono Alerta OK Para Fechar Alerta

	Scenario: Atualizar Dados Pessoais Identificacao Completa Incompleta
		Given Eu Acesso Pagina 'Dashboard'
		When Eu Pressiono Menu 'Dados Pessoais'
		And Eu Pressiono Menu 'Dados Pessoais Endereço'
		And Eu Digito Texto 'Número = brancos'
		And Eu Pressiono Botao 'Salvar dados'
		Then Eu Espero Como Resultado Alerta 'Campos obrigatorios'
		And Eu Pressiono Alerta Fechar Para Fechar Alerta

		
