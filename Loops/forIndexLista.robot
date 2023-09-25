*** Test Cases ***

Teste FOR com numeração da lista 
    for com numeração

*** Keywords ***

for com numeração
    FOR    ${INDEX}    ${ITEM}    IN ENUMERATE    P    M    G    GG    XG    XXG
        Log    Item da lista: ${ITEM} - posição do item na lista: ${INDEX}
    END