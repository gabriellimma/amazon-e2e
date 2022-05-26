*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}                       http://amazon.com.br
${MENU_ELETRONICOS}          //a[@data-csa-c-content-id='nav_cs_electronics']''
${HEADER_ELETRONICOS}        xpath://h1[contains(.,'Eletrônicos e Tecnologia')]
${CATEGORIA_COMPUTADORES}    xpath://span[@dir='auto'][contains(.,'Computadores e Informática')]

*** Keywords ***
abrir o navegador
    Open Browser    browser=chrome    executable_path=/Users/gabriellima/Documents/chromedriver

fechar o navegador
    Close Browser

acessar a home page do site amazon
    Go To    url=${URL}

deixa o navegador em tela inteira
    Maximize Browser Window

entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}

verificar se aparece a frase "Eletrônicos e Tecnologia"
    Wait Until Page Contains         Eletrônicos e Tecnologia
    Element Should Be Visible        ${HEADER_ELETRONICOS}

verificar se o titulo da pagina é ${TituloDaPagina}
    Title Should Be    ${TituloDaPagina}

verificar se aparece a categoria "Computadores e Informática"
    Element Should Be Visible    ${CATEGORIA_COMPUTADORES}

digitar no campo de pesquisa ${PRODUTO} 
    Input Text    locator=id:twotabsearchtextbox    text=${PRODUTO}
