*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary
Library                  Screenshot
Resource                
Resource
*** Keywords ***


Acessar a página home do site 
    Go To               ${URL}
    Wait Until Element Is Visible       xpath=//*[@id="block_top_menu"]/ul
    Title Should Be                     My Store
Clicar em "Sign in"
    Click Element   class=login
Informar um e-mail válido 
    ${EMAIL}                  FakerLibrary.email 
    Input Text    name=email_create    ${EMAIL}
Clicar em "Create an account"
    Click Button    xpath=/html/body/div/div[2]/div/div[3]/div/div/div[1]/form/div/div[3]/button
    Take Screenshot
    Wait Until Element Is Visible    id=id_gender1
Preencher os dados obrigatórios
    
    Click Element   id=id_gender1
    Input Text      name=customer_firstname     ${FIRST_NAME}
    Input Text      name=customer_lastname      ${LAST_NAME}
    Input Password  name=passwd                 ${PASSWORD}
    Input Text      name=firstname              ${_FIRST_NAME}
    Input Text      name=lastname               ${_LAST_NAME}
    Input Text      name=address1               ${ADDRESS}
    Input Text      name=city                   ${CITY}
    Select From List By Index    name=id_state     1 
    Input Text      name=postcode               ${POSTAL_CODE}
    Input Text      name=phone_mobile           ${MOBILE_PHONE}
    Input Text      name=alias                  ${OTHER_ADRDRESS}
submeter cadastro 
    Click Button    name=submitAccount

Conferir se o cadastro foi feito com sucesso 
    Page Should Contain    ${MSG}