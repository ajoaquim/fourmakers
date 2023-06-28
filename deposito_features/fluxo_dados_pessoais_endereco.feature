Feature: Dados Pessoais Endereco
  Cadastro de Dados de Endereco
  
  Scenario: Endereco Salvar Sem Campo Obrigatório Preenchido
	  Given Dado que eu tenha me autenticado com sucesso no sistema
	  When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"
		And Clico em "Minha Conta Endereco" 
		And Limpo Conteudo de "Endereço" e clico em "Salvar Dados"
		Then Devo receber alerta "Campos Obrigatórios! Por favor, preenchha todos os campos obrigatórios"
		And fecho a tela para retornar para a tela "Minha Conta, Endereco"
		
	Scenario: Contato Preencher Registro Completo
		Given Dado que eu tenha me autenticado com sucesso no sistema
		When Clico no menu "Dados Pessoais" sigo para tela "Minha Conta"
		And Clico em "Minha Conta Contato"
		And Digito Valores Validos para Cep, Endereço, Numero, Complemento, Bairro, Cidade, UF, Comquem Mora
		And Clico em Salvar Dados
		Then Recebo confirmacao de registro salvo com sucesso
	
		
		
		
