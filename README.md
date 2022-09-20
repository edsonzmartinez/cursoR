# cursoR
## Descrição do Projeto
<p align="left">Repositório de bancos de dados e códigos para a disciplina "Análise Estatística em Estudos em Saúde Utilizando o Programa R"</p>

## Bancos de dados

* Arquivo Dados02.csv

urlfile="https://raw.githubusercontent.com/edsonzmartinez/cursoR/main/Dados02.csv"

w <- read.csv(urlfile,head=TRUE,sep=";",dec=",")

* Dados dos jogadores da África do Sul:

urlfile="https://raw.githubusercontent.com/edsonzmartinez/cursoR/main/Dados_jogadores.csv"

jog <- read.csv(urlfile,head=TRUE,sep=";",dec=",")

* Dados climáticos de Ribeirão Preto

urlfile="https://raw.githubusercontent.com/edsonzmartinez/cursoR/main/dadosclimaticosRP.csv"
clima <- read.csv(urlfile,head=TRUE,sep=";",dec=",")

Fonte: Centro Integrado de Informações Agrometeorológicas

ano: ano (de 1991 a 2021)

mes: meses

tempmaxabs: temperatura máxima absoluta (oC)

tempminabs: temperatura mínima absoluta (oC)

tempmaxmensal: temperatura máxima mensal (oC)

tempminmensal: temperatura mínima mensal (oC)

tempmedia: temperatura média

ETP: evapotranspiração potencial (mm)

precipitacao: precipitação (mm)

DCCH: dias com chuva

