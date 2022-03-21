*** Settings ***
Test Setup              Abrir o navegador
Test Teardown           Fechar o navegador
Library                 SeleniumLibrary

*** Variables ***
${BROWSER}          chrome
${URL}              http://automationpractice.com
${TITULO_PRODUTO}   xpath=/html/body/div/div[2]/div/div[3]/div[2]/ul/li/div/div[2]/h5/a

*** Test Cases ***
Caso de Teste 01: Pesquisar produto existente
    Acessar a página home do site Automation Practice
    Digitar o nome do produto "Blouse" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir se o produto "Blouse" foi listado no site

*** Keywords ***
### setup
Abrir o navegador
  Open Browser  ${URL}  ${BROWSER}

### teardown
Fechar o navegador
  Close Browser

Acessar a página home do site Automation Practice
  #Go To               ${URL}
  Title Should Be     My Store

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
  Wait Until Element Is Visible  id=search_query_top  10s
  Input Text    id=search_query_top    ${PRODUTO}

Clicar no botão pesquisar
  Click Element  name=submit_search

Conferir se o produto "${PRODUTO}" foi listado no site
    Element Text Should Be  ${TITULO_PRODUTO}  ${PRODUTO}