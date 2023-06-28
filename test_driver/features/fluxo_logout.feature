Feature: Validando logout

Scenario: Logout
	Given Dado que eu tenha me autenticado com sucesso no sistema
	When Quando eu acessar a tela home do sistema e clicar no menu "Logout"
	Then Entao devo ser deslogado da Microsoft, e o sistema deve me apresentar mensagem "Você saiu da sua conta"
	And Posso fechar a tela apresentada