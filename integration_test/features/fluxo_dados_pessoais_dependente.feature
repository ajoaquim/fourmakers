@tag
Feature: 	Validando Dados Pessoais Contato
	Cadastro de Dados de Contato
	@debug
	Scenario: Contato Atualizar Dependente
		Given Eu Acesso Pagina 'Dashboard'
		When Eu Pressiono Menu 'Dados Pessoais'
		And Eu Pressiono Menu 'Dependente'
		And Eu Pressiono Botao 'Inserir dependente'
		And Eu Aguardo Pop-Up 'Adicionar dependente'
		And Eu Digito Texto 'Nome completo = Danilo Joaquim'
		And Eu Digito Texto 'CPF = 11111111-11'
		And Eu Digito Texto 'Data nascimento = 11/07/1986'
		And Eu Digito Texto 'RG = 15116261-X'
		And Eu Digito Lista Verificacao 'Tipo de dependente = FILHO(A)'
		And Eu Digito Texto 'Requer ajuda? Qual? = Não'
		And Eu Pressiono Botao 'Salvar'
		Then Eu Espero Como Resultado Alerta 'Dependente criado com sucesso!'
		And Eu Pressiono Alerta OK Para Fechar Alerta
