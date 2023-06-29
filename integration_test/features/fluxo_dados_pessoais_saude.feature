@tag
Feature: 	Validando Dados Pessoais Saude

	@debug
	Scenario: Atualizar Dados Pessoais Saude
		Given Eu Acesso Pagina 'Dashboard'
		When Eu Pressiono Menu 'Dados Pessoais'
		And Eu Pressiono Menu 'Dados Pessoais Saude'
		And Eu Digito Lista Verificacao 'Selecione caso tenha alguma deficiência: = Nenhuma'
		And Eu Digito Lista Verificacao 'Pertence a grupo de risco para Covid19? = Não'
		And Eu Digito Texto 'Possui alguma condição de saúde relevante? = Não'
		And Eu Pressiono Botao 'Salvar dados'
		Then Eu Espero Como Resultado Alerta 'Dados salvos com sucesso!'
		And Eu Pressiono Alerta OK Para Fechar Alerta

