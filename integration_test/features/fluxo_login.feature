@tag
Feature: validando fluxo login

	@debug
 	Scenario: login valido para foursys microsoft
		Given Eu Acesso 'Login Fourmakers'
		When Eu Pressiono 'Entrar Com A Conta Da Microsoft'
		Then Eu Espero Resultado 'Dashboard'


		

	

	