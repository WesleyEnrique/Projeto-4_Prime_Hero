*** Settings ***
Test Setup       Abrir o navegador    
Test Teardown    Fechar o navegador
Library          SeleniumLibrary    
Library          DebugLibrary
Library          FakerLibrary
Library    Screenshot
Resource        ../../src/auto/keywords/keywords.robot
Resource        ../../src/config/hooks.robot
Resource        ../../src/page/home.robot


*** Test Cases ***    
Caso de teste: Adicionar cliente
  Acessar a página home do site 
  Clicar em "Sign in"
  Informar um e-mail válido 
  Clicar em "Create an account"
  Preencher os dados obrigatórios 
  submeter cadastro 
  Conferir se o cadastro foi feito com sucesso 

