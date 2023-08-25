*** Settings ***
Documentation    Exercicios lista

*** Variables ***
@{LISTA}    refri    suco    agua

*** Test Cases ***

Imprimindo os itens da Lista
    Imprimir todos os itens

*** Keywords ***
Imprimir todos os itens 
    Log    Eu bebo ${LISTA[0]}, joao bebe ${LISTA[1]}, e voce bebe ${LISTA[2]}