*** Test Cases ***

Teste mais opções IN RANGE
    tradicional
    apenas quantidade de laços informada (limite superior)
    aritmetico
    intervalos especificos

*** Keywords ***

tradicional
    [Documentation]    Percorre de 1 até 10
    FOR    ${INDEX}    IN RANGE    1    11    
        Log    ${INDEX}
        
    END
apenas quantidade de laços informada (limite superior)
    [Documentation]    Percorre de 0 até 9
    FOR    ${counter}    IN RANGE    0    9    
        Log    ${counter}
    END

aritmetico
    [Documentation]    Percorre de 0 até 5
    ${var}    Set Variable    ${5}
    FOR    ${counter}    IN RANGE    ${var}+1
        Log    ${counter}
        
    END
intervalos especificos
    [Documentation]    Percorre de 0 até 30, pulando de 5 em 5
    FOR    ${counter}    IN RANGE    0    31    5
        Log    ${counter}
        
    END