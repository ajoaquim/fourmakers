@tag
Feature: 	Validando Dados Pessoais Identificação

	@debug
	Scenario: Atualizar Dados Pessoais Identificacao Completa
		Given Eu Acesso Pagina 'Dashboard'
		When Eu Pressiono Menu 'Dados Pessoais'
		And Eu Pressiono Menu 'Dados Pessoais Identificacao'
		And Eu Digito Texto 'Data nascimento = 20/10/1961'
		And Eu Digito Texto 'RG = 15116261X'
		And Eu Digito Lista Verificacao 'Estado civil = Solteiro (a)'
		And Eu Digito Lista Verificacao 'Escolaridade = Ensino Supeior Completo'
		And Eu Digito Lista Verificacao 'Etnia = Preta'
		And Eu Digito Lista Verificacao 'Genero = Cisgênero'
		And Eu Digito Lista Verificacao 'Orientacao sexual = Heterossexual'
		And Eu Digito Lista Verificacao 'Pessoa refugiada? = Não'
		And Eu Pressiono Botao 'Salvar dados'
		Then Eu Espero Como Resultado Alerta 'Dados salvos com sucesso!'
		And Eu Pressiono Alerta OK Para Fechar Alerta

	Scenario: Atualizar Dados Pessoais Identificacao Completa Incompleta
		Given Eu Acesso Pagina 'Dashboard'
		When Eu Pressiono Menu 'Dados Pessoais'
		And Eu Pressiono Menu 'Dados Pessoais Identificacao'
		And Eu Digito Texto 'RG = brancos'
		And Eu Pressiono Botao 'Salvar dados'
		Then Eu Espero Como Resultado Alerta 'Campos obrigatorios'
		And Eu Pressiono Alerta Fechar Para Fechar Alerta

		
