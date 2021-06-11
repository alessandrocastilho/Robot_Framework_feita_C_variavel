*** Settings ***
Resource        ../resource.robot
Library  SeleniumLibrary


*** Variables ***

${Home_Url}             http://automationpractice.com/index.php
${Home_Validar_Url}     My Store
${Titulo}               //*[@id="center_column"]/h1/span[1]
${Titulo_Postagem}      "T-SHIRT"
${Tit_Mensagem_Erro}    //*[@id="center_column"]/p
${Mensagem_Erro}        No results were found for your search "pneu"

*** Keywords ***
#cenario 1 - inincio.robot
Dado que abro o navegador
  Abrir navegador 

Quando acessar o site
  Go To       ${Home_Url}
  
Então o site sera exibido
  Title Should Be        ${Home_Validar_Url}

#cenario 1 - consultar.robot
Dado que eu esteja na pagina home 
  Dado que abro o navegador
  Quando acessar o site
  Então o site sera exibido

Quando pesquiso por "${produto}" 
  set Selenium Implicit Wait   5
  Click Element    //*[@ID="search_query_top"]
  Input Text       //*[@ID="search_query_top"]      ${produto}
  Click Button     //*[@id="searchbox"]/button

Entao verifico se retornou o produto t-shirt
  Wait Until Element Is Visible   ${Titulo}
  Element Text Should Be          ${Titulo}  ${Titulo_Postagem}

#cenario 2 - consultar.robot
Entao verifico que não deve encontrar o produto
  Wait Until Element Is Visible   ${Tit_Mensagem_Erro}
  Element Text Should Be          ${Tit_Mensagem_Erro}   ${Mensagem_Erro}