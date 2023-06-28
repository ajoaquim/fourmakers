@tag
Feature: Validando Logout

	@debug
	Scenario: Saindo da Aplicacao
		Given Eu Acesso A Pagina De Login Fourmakers
		When Eu Pressiono Entrar Com A Conta Da Microsoft
		And Eu Pressiono Logout
		Then Eu Espero url=https://login.microsoftonline.com/common/oauth2/logout

