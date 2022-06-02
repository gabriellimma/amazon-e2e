*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}                       http://amazon.com.br
${SEARCHBOX_ID}              id:twotabsearchtextbox
${MENU_ELETRONICOS}          //a[@data-csa-c-content-id='nav_cs_electronics']
${HEADER_ELETRONICOS}        xpath://h1[contains(.,'Eletrônicos e Tecnologia')]
${BROWSER}                   chrome
${BTN_PESQUISA}              id:nav-search-submit-button
${SEARCH_RESULT}             xpath://span[@class='a-size-medium s-light-weight-text'][contains(.,'Exibindo resultados para')]
${ADICIONADO_AO_CARRINHO}    xpath://span[@class='a-size-medium-plus a-color-base sw-atc-text a-text-bold'][contains(.,'Adicionado ao carrinho')]
${CONFIGURACAO_TEXT}         xpath://span[@class='a-size-base'][contains(.,'Console PlayStation 5')]

*** Keywords ***
abrir o navegador
    Open Browser    browser=${BROWSER}    executable_path=/Users/gabriellima/Documents/chromedriver

fechar o navegador
    Close Browser

acessar a home page do site amazon
    Go To    url=${URL}

deixa o navegador em tela inteira
    Maximize Browser Window

entrar no menu "Eletrônicos"
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}
    Click Element                    locator=${MENU_ELETRONICOS}

verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains         ${FRASE}
    Element Should Be Visible        ${HEADER_ELETRONICOS}

verificar se o titulo da pagina é "${TituloDaPagina}"
    Title Should Be    ${TituloDaPagina}

verificar se aparece a categoria "${CATEGORIA}"
    Element Should Be Visible    //a[@aria-label='${CATEGORIA}']

digitar no campo de pesquisa "${PRODUTO}"
    Input Text    locator=${SEARCHBOX_ID}   text=${PRODUTO}

clicar no botao pesquisa
    Wait Until Element Is Visible    locator=${BTN_PESQUISA}


clicar no botao "pesquisa"
    Click Button                     locator=${BTN_PESQUISA}

verificar se o resultado da pesquisa esta listando o produto "${PRODUTO_PESQUISADO}"
    Wait Until Element Is Visible    locator=xpath://span[@class='a-color-state a-text-bold'][contains(.,'"${PRODUTO_PESQUISADO}"')]

adicionar o produto "${PRODUTO}" ao carrinho
    Click Element                    locator=xpath://img[@alt='${PRODUTO}']
    Wait Until Element Is Visible    locator=xpath://input[contains(@name,'submit.add-to-cart')]
    Click Element                    locator=xpath://input[contains(@name,'submit.add-to-cart')]

acessar o menu carrinho
    Wait Until Element Is Visible    locator=id:nav-cart
    Click Element    locator=id:nav-cart
remover o produto "${PRODUTO}" do carrinho
    Wait Until Element Is Visible    locator=xpath://input[contains(@aria-label,'Excluir ${PRODUTO}')]
    Click Element                    locator=xpath://input[contains(@aria-label,'Excluir ${PRODUTO}')]

verificar se o carrinho de compras esta vazio
    Wait Until Element Is Visible    locator=xpath://h1[contains(.,'Seu carrinho de compras da Amazon está vazio.')]
    Element Text Should Be           locator=xpath://h1[contains(.,'Seu carrinho de compras da Amazon está vazio.')]   expected=Seu carrinho de compras da Amazon está vazio.

verificar se o produto "${PRODUTO}" foi adicionado ao carrinho
    Wait Until Element Is Visible    locator=${ADICIONADO_AO_CARRINHO}
    Element Text Should Be           locator=${ADICIONADO_AO_CARRINHO}    expected=Adicionado ao carrinho

Dado que estou na homepage do site amazon.com.br
    acessar a home page do site amazon
    deixa o navegador em tela inteira

Quando acesso o menu "eletrônicos"
    entrar no menu "Eletrônicos"

Entao o titulo da pagina deve ser "${TituloDaPagina}"
    verificar se o titulo da pagina é "${TituloDaPagina}"
    Title Should Be    ${TituloDaPagina}
E a categoria "${CATEGORIA}" deve ser exibida na página
    verificar se aparece a categoria "${CATEGORIA}"

Quando pesquisar pelo produto "${PRODUTO}"
    digitar no campo de pesquisa "${PRODUTO}"
    clicar no botao "pesquisa"

Então o título da página deve ser "${TituloDaPagina}"
    verificar se o titulo da pagina é "${TituloDaPagina}"
E um produto da linha "${PRODUTO_PESQUISADO}" deve ser exibido na página
    verificar se o resultado da pesquisa esta listando o produto "${PRODUTO_PESQUISADO}"

E adiciono o produto "${PRODUTO}" no carrinho
    adicionar o produto "${PRODUTO}" ao carrinho

Então verifico se o produto "${PRODUTO}" foi adicionado com sucesso
    verificar se o produto "${PRODUTO}" foi adicionado ao carrinho

    