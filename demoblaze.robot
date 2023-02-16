*** Settings ***
Documentation    Robot Framework Sem Complicação
Library          SeleniumLibrary    timeout=500

*** Variables ***
${url}          https://www.demoblaze.com
${navegador}    chrome

*** Keywords ***
Adicionar itens no carrinho de compras
    Open Browser                     ${url}    ${navegador}
    Maximize Browser Window    
    Click Link                       Laptops
    Wait Until Element Is Visible    link=MacBook Pro
    Click Link                       MacBook Pro
    Wait Until Element Is Visible    xpath=//div[2]//a
    Click Element                    xpath=//div[2]//a
    Alert Should Be Present

Finalizar compras 
    Click Link                       Cart
    Click Button                     css=.btn-success
    Wait Until Element Is Visible    id=year
    Input Text                       id=name       Rafael da Silva
    Input Text                       id=country    Brasil
    Input Text                       css=#city     Mogi das Cruzes
    Input Text                       id=card       987654321
    Input Text                       id=month      07
    Input Text                       id=year       2029
    Click Button                     xpath=//button[text()='Purchase']
    Element Text Should Be           css=.sweet-alert >h2    Thank you for your purchase!
    Click Button                     css=.confirm
   


*** Test Cases ***
RafaTest
    Adicionar itens no carrinho de compras
    Finalizar compras
