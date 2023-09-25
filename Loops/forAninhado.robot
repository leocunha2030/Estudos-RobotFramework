*** Test Cases ***

Teste de FOR aninhado
    cria cadastro de produtos

*** Keywords ***

Cria cadastro de produtos
    FOR    ${produto}    IN    casaco    camisa    meia
        Imprime tamanho para o produto    ${produto}
    END    

Imprime tamanho para o produto
    [Arguments]    ${produto}
    FOR    ${tamanho}    IN    P    M    G
        Log    Produto: ${produto} - Tamanho: ${tamanho}
        
    END