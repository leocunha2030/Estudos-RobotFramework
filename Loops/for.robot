*** Test Cases ***
Teste do novo formato do formato
    Novo formato

*** Keywords ***

Novo formato
    FOR    ${animal}    IN    gato    ganso    cachorro
        Log    O animal é: ${animal}
        
    END