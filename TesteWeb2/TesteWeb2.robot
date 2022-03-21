*** Settings ***

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador
Library            SeleniumLibrary
Library            DebugLibrary

*** Variables ***
${BROWSER}    chrome
${URL}        http://automationpractice.com

*** Test Cases ***
Caso de teste 01: Pesquisar nome existente na loja 
    Acessar a página home do site Automation Practice
    Digitar o nome do produto "computador" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir mensagem No results were found for your search "computador"

*** Keywords ***
Abrir o navegador 
    open browser  browser=${BROWSER}

Fechar o navegador
    Close Browser

Acessar a página home do site Automation Practice
    Go To    ${URL}
    Title Should Be    My Store

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa 
    Input Text    name=search_query    ${PRODUTO}
    Capture Page Screenshot

Clicar no botão pesquisar
    Click Element    name=submit_search        

Conferir mensagem ${MSG_ERRO} 
    Element Text Should Be  class=alert.alert-warning  ${MSG_ERRO}
