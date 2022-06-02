*** Settings ***
Documentation    Suite de testes em gherkin do site da amazon
Resource         ../resource/amazon_resources.robot
Test Setup       abrir o navegador
Test Teardown    fechar o navegador

*** Test Cases ***
Caso de teste 1 - Verificar o acesso ao menu eletrônicos
    [Documentation]    Esse teste verifica se é possível acessar o menu eletrônicos no site amazon.com.br
    ...                e verfica se ao acessar o menu, aparece a categoria Computadores e Informática.
    [Tags]             menus categorias
    Dado que estou na homepage do site amazon.com.br
    Quando acesso o menu "eletrônicos"
    Entao o titulo da pagina deve ser "Eletrônicos e Tecnologia | Amazon.com.br"
    E a categoria "Computadores e Informática" deve ser exibida na página

Caso de teste 2 - Verificar a pesquisa de um produto
    [Documentation]    Esse teste verifica a pesquisa de um produto através do campo de pesquisa verifica
    ...                verifica também se ao pesquisar, uma lista contendo pelo menos um dos produtos
    ...                pesquisado aparece.
    [Tags]             busca
    Dado que estou na homepage do site amazon.com.br
    Quando pesquisar pelo produto "Play Station 5"
    Então o título da página deve ser "Amazon.com.br : Play Station 5"
    E um produto da linha "playstation 5" deve ser exibido na página

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Dado que estou na homepage do site amazon.com.br
    E adiciono o produto "Console PlayStation 5" no carrinho
    Então verifico se o produto "Console PlayStation 5" foi adicionado com sucesso
 
Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Dado que estou na homepage do site amazon.com.br
    E adiciono o produto "Console PlayStation 5" no carrinho
    Quando remover o produto "Console PlayStation 5" do carrinho
    Entao o carrinho deve ficar vazio