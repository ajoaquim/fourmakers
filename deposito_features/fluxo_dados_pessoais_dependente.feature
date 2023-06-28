Feature: Dados Pessoais Dependente
  Cadastro de Dados de Dependente
 
 	Scenario: Dependente Salvar Sem Campo Obrigatório Preenchido
	  Given Dado que eu tenha me autenticado com sucesso no sistema
	  When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"
		And Clico em "Minha Conta Dependentes" 
		And Em Dependente Clico em Inserir Dependente
		And Deixo em branco  Conteudo de "Nome Completo, Data de Nascimento"  clico em "Salvar"
		Then Devo receber a legenda "Campo Obrigatório" abaixo de "Nome Completo, Data de Nascimento"  e retorno a tela anterior		
	
	Scenario: Dependente Preencher Registro Completo
		Given Dado que eu tenha me autenticado com sucesso no sistema
		When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"
		And Clico em "Minha Conta Dependentes"
		And Em Dependente Clico em Inserir Dependente
		And Digito Valores Validos para Nome Completo, CPF, RG, Data Nascimento, Tipo de Dependente, Requer Ajuda
		And Clico em Salvar
		Then Recebo confirmacao de registro salvo com sucesso, OK fecho a tela
		
 	Scenario: Dependente Editar 
	  Given Dado que eu tenha me autenticado com sucesso no sistema
	  When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"
		And Clico no menu "Minha Conta, Dependente"		
		And Em "Dependentes" clico em "Editar"
		And Edito Com valores validos do dependente e pressiono Salvar 
		Then Recebo dependente editado com sucesso e com OK fecho a tela 
	
	Scenario: Dependente Excluir
	  Given Dado que eu tenha me autenticado com sucesso no sistema
	  When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"
		And Clico no menu "Minha Conta, Dependente"		
		And Em "Dependentes" clico em "Deletar"
		And Em "Excluir Dependente" confirmo com "Excluir"
		Then Recebo Dependente Excluido com sucesso e com OK fecho a tela 
			
	
		
	
		
	Scenario: Contato Validar Email Profissional Já Preenchidos
		Given Dado que eu tenha me autenticado com sucesso no sistema
		When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"
		And Clico em "Minha Conta Dados Contato"
		Then Campos "Email Profissional" estão preenchidos e bloqueados contra edição
		
	Scenario: Contato Preencher Registro Completo
		Given Dado que eu tenha me autenticado com sucesso no sistema
		When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"
		And Clico em "Minha Conta Contato"
		And Digito Valores Validos para E-mail alternativo, Celular, Contatos de Emergência
		And Clico em Salvar Dados
		Then Recebo confirmacao de registro salvo com sucesso
		
		
		
