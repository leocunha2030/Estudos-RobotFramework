*** Test Cases ***
Teste FOR usando variaveis
    Cria dicionario de traduções

*** Keywords ***

Cria dicionario de traduções
    FOR    ${index}    ${english}    ${finnish}    ${portuguese}    IN
    ...    1            cat           kissa        gato
    ...    2            dog           koira        cachorro
    ...    3            horse         hevonnen     cavalo
        ${message}=    Catenate    SEPARATOR=\n
        ...            Animal ${index}:
        ...            Em inglês: ${english}
        ...            Em finlândes: ${finnish}
        ...            Em português: ${portuguese}
        Log    ${message}
    END