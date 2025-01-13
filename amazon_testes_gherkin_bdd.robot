*** Settings ***
Documentation    Essa suite testa o site da Amazon.com.br
Resource         amazon_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

#Suite Setup     Blablabla    //Executar ação antes de iniciar os casos da suíte
#Suite Teardown  Blablabla    //Executar ação depois de finalizar os casos da suíte


*** Test Cases ***

Caso de Teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]    Esse teste verifica o menu eletrônico do site da Amazon.com.br
    ...                e verifica a categoria Computadores e Informática
    [Tags]             menus    categorias
    Given que estou na home page da Amazon.com.br
    When acessar o menu "Eletrônicos"
    Then o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    And o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    And a categoria "Computadores e Informática" deve ser exibida na página



Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]    Esse teste verifica a busca de um produto
    [Tags]             busca_produtos    lista_busca
    Given que estou na home page da Amazon.com.br
    When pesquisar pelo produto "Xbox Series S"
    Then o título da página deve ficar "Amazon.com.br : Xbox Series S"
    And um produto da linha "Xbox Series S" deve ser mostrado na página