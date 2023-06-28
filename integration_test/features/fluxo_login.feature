@tag
Feature: validando fluxo login

	@debug
 	Scenario: login valido para foursys microsoft
		Given Eu Acesso A Pagina De Login Fourmakers
		When Eu Pressiono Entrar Com A Conta Da Microsoft
		Then Eu Espero Como Resultado Ver Meu Dashboard

 	Scenario: login invalido para foursys microsoft
		Given Eu Acesso A Pagina De Login Fourmakers
		When Eu Pressiono Entrar Com A Conta Da Microsoft
		Then Eu Espero Como Resultado Ver "does not exist in tenant 'Foursys Projetos"
		

	

	