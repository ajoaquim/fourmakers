@tag
Feature: 	Validando Dados Pessoais Contato
  			Cadastro de Dados de Contato

	Scenario: Contato Inserir Contato de Emergência
		Given Eu Acesso Pagina 'Dashboard'
		When Eu Pressiono Menu 'Dados Pessoais'
		And Eu Pressiono Menu 'Contato'
		And Eu Pressiono Botao 'Inserir contato'
		And Eu Aguardo Pop-Up 'Adicionar contato de emergência'
		And Eu Digito Texto 'Nome do contato = Nome Conteudo'
		And Eu Digito Lista Verificacao 'Grau de parentesco = Filho(a)'
		And Eu Digito Texto 'Telefone de contato = (22)2222-2222'
		And Eu Pressiono Botao 'Salvar'
		Then Eu Espero Como Resultado Alerta 'Contato cadastrado com sucesso.'
		And Eu Pressiono Alerta OK Para Fechar Alerta

	Scenario: Contato Atualizar Dados de Contato
		Given Eu Acesso Pagina 'Dashboard'
		When Eu Pressiono Menu 'Dados Pessoais'
		And Eu Pressiono Menu 'Contato'
		And Eu Digito Texto 'Email alternativo = Email alternativo Conteudo'
		And Eu Digito Texto 'Celular = (22)2222-2222'
		And Eu Pressiono Botao 'Salvar dados'
		Then Eu Espero Como Resultado Alerta 'Dados salvos com sucesso!'
		And Eu Pressiono Alerta OK Para Fechar Alerta
		

		
		
