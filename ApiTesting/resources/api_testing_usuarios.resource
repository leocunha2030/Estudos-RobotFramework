*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections

*** Keywords ***
Criar Sessão na ServeRest
    ${Header}    Create Dictionary    Accept=application/json   Content-Type=application/json
    Create Session    alias=ServeRest    url=https://serverest.dev    headers=${Header}


Criar um usuário novo
    ${PALAVRA_ALEATORIA}    Generate Random String  length=4  chars=[LETTERS]
    ${PALAVRA_ALEATORIA}    Convert To Lower Case    ${PALAVRA_ALEATORIA}
    Set Test Variable    ${EMAIL_TESTE}    ${PALAVRA_ALEATORIA}@email.com
    Log    Minha palavra aleatoria ${PALAVRA_ALEATORIA}@email.com

Cadastrar um usuário criado na ServeRest
    ${body}    Create Dictionary    
    ...    nome=Fulano da Silva
    ...    email=${EMAIL_TESTE}
    ...    password=12345  
    ...    administrador=true
    Log    ${body}
    Criar Sessão na ServeRest
    ${resposta}    POST On Session    
    ...    alias=ServeRest
    ...    url=/usuarios
    ...    json=${body}
    
    Log    ${resposta.json()}
    Set Test Variable    ${RESPOSTA}    ${resposta.json()}

Conferir se o usuário foi cadastrado com sucesso
    Log    ${RESPOSTA}
    Dictionary Should Contain Item    ${RESPOSTA}    message  Cadastro realizado com sucesso
    Dictionary Should Contain Key    ${RESPOSTA}     _id

    
