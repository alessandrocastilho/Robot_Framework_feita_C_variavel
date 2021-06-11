*** Settings ***
Resource        ../Resource/resource.robot
Resource        ../Resource/page/Home.robot



*** Test Cases  ***
Cenario 1: Abrir pagina home
        Dado que abro o navegador
        Quando acessar o site
        Então o site sera exibido
