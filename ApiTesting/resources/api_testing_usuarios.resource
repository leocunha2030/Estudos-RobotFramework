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
    [Arguments]    ${email}  ${status_code_desejado}
    ${body}    Create Dictionary    
    ...    nome=Fulano da Silva
    ...    email=${email}
    ...    password=12345  
    ...    administrador=true
    Log    ${body}
    Criar Sessão na ServeRest
    ${resposta}    POST On Session    
    ...    alias=ServeRest
    ...    url=/usuarios
    ...    json=${body}
    ...    expected_status=${status_code_desejado}
    
    Log    ${resposta.json()}
    Set Test Variable    ${RESPOSTA}    ${resposta.json()}

Conferir se o usuário foi cadastrado com sucesso
    Log    ${RESPOSTA}
    Dictionary Should Contain Item    ${RESPOSTA}    message  Cadastro realizado com sucesso
    Dictionary Should Contain Key    ${RESPOSTA}     _id

Vou repetir o cadastro do usuário
    Cadastrar um usuário criado na ServeRest  email=${EMAIL_TESTE}  status_code_desejado=400  

Verificar se a API não permitiu o cadastro repetido
    Dictionary Should Contain Item    ${RESPOSTA}    message    Este email já está sendo usado
