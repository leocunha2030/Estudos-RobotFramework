*** Settings ***
Library     SeleniumLibrary 
Resource    amazon_resources.robot
*** Keywords ***  
# GHERKIN BDD STEPS
# Reaproveitar Keywords é um boa prática e poupa esforços
Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br 
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z." 

Quando acessar o menu "Eletrônicos"
        Click Element    locator=${MENU_ELETRONICOS}


E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa

Então o título da página deve ficar "${TITULO}"
    Verificar se o título da página fica "${TITULO}"

E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa, listando o produto "Console Xbox Series S" 

