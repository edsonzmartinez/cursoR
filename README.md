# cursoR

![](https://img.shields.io/github/languages/code-size/edsonzmartinez/cursoR)

## Descrição do Projeto
<p align="left">Repositório de bancos de dados e códigos para a disciplina "Introdução ao R para Pesquisa em Saúde"</p>

<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/r/r-original.svg" width="40" height="40"/>

## Bancos de dados

**Arquivo Dados02.csv**

```
urlfile="https://raw.githubusercontent.com/edsonzmartinez/cursoR/main/Dados02.csv"

w <- read.csv(urlfile,head=TRUE,sep=";",dec=",")
```

**Dados dos jogadores da África do Sul:**

```
urlfile="https://raw.githubusercontent.com/edsonzmartinez/cursoR/main/Dados_jogadores.csv"

jog <- read.csv(urlfile,head=TRUE,sep=";",dec=",")
```

**Dados climáticos de Ribeirão Preto**

Descrição dos dados: https://github.com/edsonzmartinez/cursoR/blob/main/dadosclimaticosRP

**Dados dos caranguejos**

```
urlfile="https://raw.githubusercontent.com/edsonzmartinez/cursoR/main/crabs.txt"

w <- read.table(urlfile,head=TRUE,sep=",",dec=".")
```

Se usar estes dados, deve ser citada a fonte:

Wolfram Research, "Sample Data: Crab Measures" from the Wolfram Data Repository (2016)   https://doi.org/10.24097/wolfram.70344.data 

Campbell, N. A. and Mahon, R. J. Five morphological measurements of two varieties of both sexes of crab species Leptograpsus variegatus from Fremantle, W. Australia. Australian Journal of Zoology, vol. 22, 1974.

https://duch.mimuw.edu.pl/~pokar/StatystykaII/DANE/CampbellMahon.pdf

**Dados dos músicos:**

```
urlfile="https://raw.githubusercontent.com/edsonzmartinez/cursoR/main/Musicos.csv"

w <- read.csv2(urlfile)

# Codificação de caracteres Windows-1252
w <- read.csv2(urlfile, fileEncoding = "Windows-1252")

# Dados duplicados:
duplicated(w)
duplicates <- w[duplicated(w), ]
wnew <- w[!duplicated(w),]
```
