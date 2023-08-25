*** Settings ***
Documentation     Essa suíte testa o site da Amazon.com.br
Resource          amazon_resources_gherkin.robot
Test Setup        Abrir o navegador
Test Teardown     Fechar o navegador



*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]    Esse teste verifica o menu eletronicos do site da amazon.com.br
    ...                e verfica a categoria Computadores e Informática
    [Tags]             menus  categorias
    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Eletrônicos"
    Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    E a categoria "Computadores e Informática" deve ser exibida na página

Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]    Esse teste verifica a busca de um produto
    [Tags]             busca_produtos  lista_busca
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    E um produto da linha "Xbox Series S" deve ser mostrado na página

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    E um produto da linha "Xbox Series S" deve ser mostrado na página
    Entao Adicionar o produto "Console Xbox Series S" no carrinho
    E Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

Caso de Teste 04 - Excluir Produto no Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    E um produto da linha "Xbox Series S" deve ser mostrado na página
    Entao Adicionar o produto "Console Xbox Series S" no carrinho
    E Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    E Entao entrar na pagina "Carrinho de compras"
    E Entao excluir o produto "Console Xbox Series S"
    E Entao verificar se o produto "Console Xbox Series S" foi excluido