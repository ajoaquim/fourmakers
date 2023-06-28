 Feature: Validando login
 
 	Scenario: Login com sucesso
		Given Dado que eu acesse a pagina de login do sistema
		When Quando eu clico em Entrar com a conta da Microsoft
		Then Entao devo ser autenticado com sucesso

 	Scenario: Login com usuario invalido
		Given Dado que eu acesse a tela de login do sistema
		When Quando eu clico em Entrar com a conta da Microsoft
		Then Entao usuario nao deve ser autenticado com sucesso
		
	Scenario: Login com usuario Sem Login Ativo Microsoft
		Given Dado que eu acesse a tela de login do sistema
		When Quando eu clico em Entrar com a conta da Microsoft
		Then Entao usuario nao deve ser autenticado com sucesso
	

	