*** Settings ***
Resource    ../resources/api_testing_usuarios.resource

*** Variables ***


*** Test Cases ***
Cenário 01: Cadastrar um novo usuário com sucesso na ServeRest
    [Documentation]    Testa a funcionalidade de cadastro de usuário
    [Tags]             cadastra_user
    Criar um usuário novo
    Cadastrar um usuário criado na ServeRest    ${EMAIL_TESTE}  status_code_desejado=201
    Conferir se o usuário foi cadastrado com sucesso
    
Cenário 02: Cadastrar usuário já existente
    [Documentation]    Verifica se a Api não permite cadastrar usuários repetidos
    [Tags]             cadastra_user_repetido
    Criar um usuário novo
    Cadastrar um usuário criado na ServeRest    ${EMAIL_TESTE}  status_code_desejado=201
    Vou repetir o cadastro do usuário
    Verificar se a API não permitiu o cadastro repetido

Cenário 03: Consultar os dados de um novo usuário
    [Documentation]    Testa a funcionalidade de Consultar os dados de um usuário por ID
    [Tags]             GET_USER
    Criar um usuário novo
    Cadastrar um usuário criado na ServeRest    email=${EMAIL_TESTE}    status_code_desejado=201
    Consultar os dados do novo usuário
    Conferir os dados retornados

Cenário 04: Realiza Login
    [Documentation]    Testa se funcionalidade de Login está funcionando corretamente
    [Tags]    Login_sucesso
    Criar um usuário novo
    Cadastrar um usuário criado na ServeRest    email=${EMAIL_TESTE}    status_code_desejado=201
    Conferir se o usuário foi cadastrado com sucesso
    Realizar Login
    Verificar se o login foi realizado com sucesso