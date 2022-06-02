*** Settings ***
Documentation    Essa suite testa o site da amazon.com.br
Resource         ../resource/amazon_resources.robot
Test Setup       abrir o navegador
Test Teardown    fechar o navegador

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
    verificar se o titulo da pagina é "Eletrônicos e Tecnologia | Amazon.com.br"
    verificar se aparece a categoria "Computadores e Informática"

Caso de teste 02 - Pesquisa de produto
    [Documentation]    Esse teste verifica a pesquisa de um produto através do campo de pesquisa verifica
    ...                verifica também se ao pesquisar, uma lista contendo pelo menos um dos produtos
    ...                pesquisado aparece.
    [Tags]             busca_produtos    pesquisa
    acessar a home page do site amazon
    deixa o navegador em tela inteira
    verificar se o titulo da pagina é "Amazon.com.br | Tudo pra você, de A a Z."
    digitar no campo de pesquisa "Play Station 5"
    clicar no botao "pesquisa"
    verificar se o resultado da pesquisa esta listando o produto "playstation 5"

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    acessar a home page do site amazon
    deixa o navegador em tela inteira
    digitar no campo de pesquisa "Console PlayStation 5"
    clicar no botao "pesquisa"
    verificar se o resultado da pesquisa esta listando o produto "Console PlayStation 5"
    adicionar o produto "Console PlayStation 5" ao carrinho
    verificar se o produto "Console PlayStation 5" foi adicionado ao carrinho

Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    acessar a home page do site amazon
    deixa o navegador em tela inteira
    digitar no campo de pesquisa "Console PlayStation 5"
    clicar no botao "pesquisa"
    verificar se o resultado da pesquisa esta listando o produto "Console PlayStation 5"
    adicionar o produto "Console PlayStation 5" ao carrinho
    verificar se o produto "Console PlayStation 5" foi adicionado ao carrinho
    acessar o menu carrinho
    remover o produto "Console PlayStation 5" do carrinho
    verificar se o carrinho de compras esta vazio