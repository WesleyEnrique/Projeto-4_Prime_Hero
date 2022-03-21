*** Settings ***
Test Setup        Abrir o navegador
Test Teardown     fechar o navegador
Library           SeleniumLibrary
Resource          TesteWeb1.robot
Library           FakerLibrary
Library           DebugLibrary
Library           XML

*** Variables ***
${BROWSER}    chrome
${URL}        http://automationpractice.com

*** Test Cases ***
Caso de teste 1: Conferir intens listados no site 
    Passar o mouse por cima da categoria "Womem" 
    Clicar na sub-categoria "Summer Dresses"
    Conferir os produtos da sub-categoria "Summer Dresses" foram mostrados 

*** Keywords ***
Abrir o navegador 
    Open Browser  browser=${BROWSER}
    Acessar a página home do site Automation Practice

Fechar o navegador 
    Close Browser

Acessar a página home do site Automation Practice
    Go To    ${URL}
    Title Should Be    My Store
Passar o mouse por cima da categoria "Womem" 
    Mouse Over    class=sf-with-ul
    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/header/div[3]/div/div/div[6]/ul/li[1]/ul
Clicar na sub-categoria "Summer Dresses"
   
    Click Element    xpath=/html/body/div/div[1]/header/div[3]/div/div/div[6]/ul/li[1]/ul/li[2]/ul/li[3]/a

Conferir os produtos da sub-categoria "Summer Dresses" foram mostrados 
    Wait Until Element Is Visible    xpath=//*[@class='replace-2x img-responsive']
    Page should contain image        xpath=/html/body/div/div[2]/div/div[3]/div[2]/ul/li[1]/div/div[1]/div/a[1]/img
    ...                              xpath=/html/body/div/div[2]/div/div[3]/div[2]/ul/li[2]/div/div[1]/div/a[1]/img
    ...                              xpath=/html/body/div/div[2]/div/div[3]/div[2]/ul/li[3]/div/div[1]/div/a[1]/img
    