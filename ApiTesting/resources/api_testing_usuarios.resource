*** Settings ***
Library    RequestsLibrary
Library    String

*** Keywords ***
Criar um usuário novo
    ${PALAVRA_ALEATORIA}    Generate Random String  length=4  chars=[LETTERS]
    ${PALAVRA_ALEATORIA}    Convert To Lower Case    ${PALAVRA_ALEATORIA}
    Set Test Variable    ${EMAIL_TESTE}    ${PALAVRA_ALEATORIA}@email.com
    Log    Minha palavra aleatoria ${PALAVRA_ALEATORIA}@email.com
    