*** Settings ***
Resource    ../resources/api_testing_usuarios.resource

*** Variables ***


*** Test Cases ***
Cenário 01: Cadastrar um novo usuário com sucesso na ServeRest
    Criar um usuário novo
    Cadastrar um usuário criado na ServeRest    ${EMAIL_TESTE}  status_code_desejado=201
    Conferir se o usuário foi cadastrado com sucesso
    
Cenário 02: Cadastrar usuário já existente
    Criar um usuário novo
    Cadastrar um usuário criado na ServeRest    ${EMAIL_TESTE}  status_code_desejado=201
    Vou repetir o cadastro do usuário
    Verificar se a API não permitiu o cadastro repetido