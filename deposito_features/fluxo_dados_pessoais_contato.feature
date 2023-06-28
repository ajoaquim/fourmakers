Feature: Dados Pessoais Contato
  Cadastro de Dados de Contato
  
  Scenario: Contato Salvar Dados Sem Contato de Emergência Cadastrado
	  Given Dado que eu tenha me autenticado com sucesso no sistema
	  When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"
		And Clico no menu "Minha Conta, Contato"		
		And Em Contatos de Emergencia localizo "Voce Não tem Contatos de Emergencia Cadastrado"
		And Clico em Salvar Dados
		Then Devo receber mensagem "Voce não possui contatos de emergencia cadastrados..."
		And Clico em OK para retornar a Tela Minha Conta
	
	Scenario: Contato Cadastrar Contato de Emergência
	  Given Dado que eu tenha me autenticado com sucesso no sistema
	  When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"
		And Clico no menu "Minha Conta, Contato"		
		And Em "Contatos de Emergencia" clico em "Inserir Contato"
		And Na tela "Contato de emergencia"
		And Digito valores validos do contado e pressiono "Salvar"
		Then Recebo Contato cadastrado com sucesso e com OK fecho a tela 
	
	Scenario: Contato Editar Contato de Emergência
	  Given Dado que eu tenha me autenticado com sucesso no sistema
	  When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"
		And Clico no menu "Minha Conta, Contato"		
		And Em "Contatos de Emergencia" clico em "Editar"
		And Edito Com valores validos do contato e pressiono Salvar 
		Then Recebo Contato editado com sucesso e com OK fecho a tela 
	
	Scenario: Contato Excluir Contato de Emergência
	  Given Dado que eu tenha me autenticado com sucesso no sistema
	  When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"
		And Clico no menu "Minha Conta, Contato"		
		And Em "Contatos de Emergencia" clico em "Deletar"
		And Em "Excluir Contato de Emergencia" confirmo com "Excluir"
		Then Recebo Contato Excluido com sucesso e com OK fecho a tela 
			
	Scenario: Contato Salvar Dados Sem Contato de Emergência Cadastrado
	  Given Dado que eu tenha me autenticado com sucesso no sistema
	  When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"
		And Clico no menu "Minha Conta, Contato"		
		And Em Contatos de Emergencia localizo "Voce Não tem Contatos de Emergencia Cadastrado"
		And Clico em Salvar Dados
		Then Devo receber mensagem "Voce não possui contatos de emergencia cadastrados..." e fechar e retornar
		
	Scenario: Contato Salvar Sem Campo Obrigatório Preenchido
	  Given Dado que eu tenha me autenticado com sucesso no sistema
	  When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"
		And Clico em "Minha Conta Contato" 
		And Limpo Conteudo de "Celular" e clico em "Salvar Dados"
		Then Devo receber alerta "Campos Obrigatórios! Por favor, preenchha todos os campos obrigatórios"
		And fecho a tela para retornar para a tela "Minha Conta, Contato"
		
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
		
		
		
