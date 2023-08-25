*** Settings ***
Library     SeleniumLibrary 
Resource    amazon_resources.robot

*** Variables ***
${CONSOLE_XBOX_SERIES_S}    //img[contains(@alt,'Console Xbox Series S')]
${ADD_TO_CART}              //input[contains(@name,'submit.add-to-cart')]
${ADICIONADO_COM_SUCESSO}   //span[contains(.,'Adicionado ao carrinho')]
${CLICK_PAGINA_CARRINHO}    //span[contains(.,'Carrinho')]
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

Entao Adicionar o produto "Console Xbox Series S" no carrinho
    Click Element    locator=${CONSOLE_XBOX_SERIES_S}
    Wait Until Element Is Visible    locator=${ADD_TO_CART}
    Click Element    locator=${ADD_TO_CART}

E Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Wait Until Element Is Visible    locator=${ADICIONADO_COM_SUCESSO}

E Entao entrar na pagina "Carrinho de compras"
    Click Element    locator=${CLICK_PAGINA_CARRINHO}
    

E Entao excluir o produto "Console Xbox Series S"
    Wait Until Element Is Visible    locator=//span[@class='a-truncate-cut'][contains(.,'Console Xbox Series S')]
    Click Element    locator=//input[@aria-label='Excluir Console Xbox Series S']

E Entao verificar se o produto "Console Xbox Series S" foi excluido
    Wait Until Element Contains    locator=//div[@data-asin='B08JN2VMGX']    text=Console Xbox Series S foi removido de Carrinho de compras.