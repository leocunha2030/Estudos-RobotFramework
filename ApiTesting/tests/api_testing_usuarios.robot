*** Settings ***
Resource    ../resources/api_testing_usuarios.resource

*** Variables ***


*** Test Cases ***
Cenário 01: Cadastrar um novo usuário com sucesso na ServeRest
    Criar um usuário novo
    # Cadastrar um usuário criado na ServeRest
    # Conferir se o usuário foi cadastrado com sucesso
    