@tag
Feature: Validando Logout

	@debug
	Scenario: Saindo da Aplicacao
		Given Eu Acesso 'Login Fourmakers'
		When Eu Pressiono 'Entrar Com A Conta Da Microsoft'
		And Eu Pressiono 'Logout'
		Then Eu Espero Resultado 'url=https://login.microsoftonline.com/common/oauth2/logout'

