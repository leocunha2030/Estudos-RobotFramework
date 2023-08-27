*** Settings ***
Documentation    exercicios de keywords 
Library    FakerLibrary

*** Keywords ***
Chama Email
    ${PESSOA}    FakerLibrary.Name
    ${EMAIL}    FakerLibrary.Email
    Log        O email é: ${EMAIL}
    Log        O nome é: ${PESSOA}

*** Test Cases ***
Deve chamar Email  
    Chama Email