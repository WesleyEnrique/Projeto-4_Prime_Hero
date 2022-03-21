*** Settings ***
Resource    package.robot
*** Keywords ***

 Abrir o navegador
    Open Browser        browser=${BROWSER}
    Maximize Browser Window 
Fechar o navegador
    Close Browser