*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${browser}  chrome



*** Keywords ***
Abrir navegador
    Open browser   url:        ${browser}