*** Settings ***
Documentation    Essa suite testa o site da amazon.com.br
Resource         ./resource/amazon_resources.robot
Test Setup       abrir o navegador
#Test Teardown    fechar o navegador

*** Test Cases ***
Caso de teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]    Esse teste verifica se é possível acessar o menu eletrônicos no site amazon.com.br
    ...                e verfica se ao acessar o menu, aparece a categoria Computadores e Informática.
    ...                author: gabriellimma data: 22/05/22.
    [Tags]             menus    categorias
    acessar a home page do site amazon
    deixa o navegador em tela inteira
    entrar no menu "Eletrônicos"
    verificar se aparece a frase "Eletrônicos e Tecnologia"
    verificar se o titulo da pagina é Eletrônicos e Tecnologia | Amazon.com.br
    verificar se aparece a categoria "Computadores e Informática"

Caso de teste 02 - Pesquisa de produto
    [Documentation]    Esse teste verifica a pesquisa de um produto através do campo de pesquisa verifica
    ...                verifica também se ao pesquisar, uma lista contendo pelo menos um dos produtos
    ...                pesquisado aparece.
    [Tags]             busca_produtos    pesquisa
    acessar a home page do site amazon
    verificar se o titulo da pagina é Amazon.com.br | Tudo pra você, de A a Z.
    digitar no campo de pesquisa Play Sation 5
    # clicar no botao de pesquisa
    # verificar o resultado da pesquisa se esta o produto pesquisado
