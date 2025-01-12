*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}    https://amazon.com.br/
${MENU_ELETRONICOS}    //a[@data-csa-c-content-id='nav_cs_electronics']
${H2_ELETRONICOS}    //h2[.='Eletrônicos e Tecnologia']
${INPUT_PESQUISA}    twotabsearchtextbox
${BTN_PESQUISA}    nav-search-submit-button

*** Keywords ***
Abrir o navegador
    Open Browser    browser=googlechrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Sleep    25s
    Wait Until Element Is Visible    xpath=${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element    xpath=${MENU_ELETRONICOS}

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains    text=${FRASE}
    Wait Until Element Is Visible    xpath=${H2_ELETRONICOS}

Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    xpath=//img[@alt='${NOME_CATEGORIA}']

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    id=${INPUT_PESQUISA}    text=${PRODUTO}

Clicar no botão de pesquisa
    Click Element    id=${BTN_PESQUISA}

Verificar o resultado da pesquisa se está, listando o produto ${PRODUTO}
        Wait Until Element Is Visible    xpath=(//span[contains(text(),'${PRODUTO}')])[1]
        Scroll Element Into View    xpath=(//span[contains(text(),'${PRODUTO}')])[1]