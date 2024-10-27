# Criando funções no R

## Função ifelse()

``` 
# A sintaxe é ifelse(expressão,x,y)

# Exemplo 1
nota1 <- 9
nota2 <- 6
ifelse(nota1>nota2,"A nota 1 é maior","A nota 1 não é maior")
```

``` 
# Exemplo 2
a <- c(8,34,8,4,7,5,9,5,3,6,3,6)
b <- ifelse(a %% 2 == 0,"par","ímpar")
```

## Função if()

```
​nota1 <- 9
nota2 <- 6
if (nota1>nota2) {"A nota 1 é maior"} else
                 {"A nota 1 não é maior"}
```
## Função cat()

```
a <- c(8,34,8,4,7,5,9,5,3,6,3,6)
cat(a)
cat(a,"\n")
cat("Arroz","Feijão","\n")
cat("Arroz","Feijão","\n",sep="---")
```

## Criando funções

``` 
# Exemplo 1

IMC <- function(peso,estatura) {
 if (estatura<=0) { stop("Verifique a estatura") }
 IMC <- peso/(estatura*estatura)
 cat("O IMC é",IMC,"\n")
 if (IMC<18.5) { cat("Baixo Peso","\n") }         else
 if (IMC<24.9) { cat("Peso normal","\n") }        else
 if (IMC<29.9) { cat("Pré obesidade","\n") }      else
 if (IMC<34.9) { cat("Obesidade grau I","\n") }   else
 if (IMC<39.9) { cat("Obesidade grau II","\n") }  else
               { cat("Obesidade grau III","\n") }
}
```

```
# Lembrar que, no R, há sempre muitas formas de escrevermos uma
# função com o mesmo propósito:

IMC <- function(peso,estatura) {
if (estatura<=0) { stop("Verifique a estatura") }
IMC <- peso/(estatura*estatura)
cat("O IMC é",IMC,"\n")
a <- cut(IMC,breaks=c(1,18.5,25,30,35,40,80))
clas <- switch(as.character(a),"(1,18.5]"  = "Baixo Peso",
                               "(18.5,25]" = "Peso normal",
                               "(25,30]"   = "Pré obesidade",
                               "(30,35]"   = "Obesidade grau I",
                               "(35,40]"   = "Obesidade grau II",
                               "(40,80]"   = "Obesidade grau III")
cat(clas,"\n")
}
```

```
# Exemplo 2
# Usando a função stopifnot()

IMCcalc <- function(peso,estatura) {
 stopifnot(peso>10,peso<200,estatura>1)
 IMC <- peso/(estatura*estatura)     
 return(IMC)
}
```

```
a <- IMCcalc(90,1.89)
a
```

[1] 25.19526

```
IMCcalc(250,1.34)
```
​
Erro: peso < 200 is not TRUE

```
​# Exemplo 3

# Usando a função warning()

IMCcalc <- function(peso,estatura) {
if (estatura>3) warning("Confira se a estatura está expressa em centímetros")
IMC <- peso/(estatura*estatura)     
 return(IMC)
}
```

```
IMCcalc(80,134)
```

[1] 0.004455335

Warning message:

In IMCcalc(80, 134) : Confira se a estatura está expressa em centímetros

``` 
# Exemplo 4

# Usando a função readline()

IMCcalc <- function() {
   nome <- readline(prompt="Qual o seu nome? ") 
   peso <- readline(prompt=paste(nome,", qual o seu peso em quilogramas? "))
   estt <- readline(prompt=paste(nome,", qual a sua estatura em metros? "))
   imc  <- as.numeric(peso)/(as.numeric(estt)^2)
   cat("Olá,",nome,", seu IMC é",round(imc,2),"kg/m2\n")
}
```

```
# Exemplo 5

describe <- function(variab,grupo,data,ndec=2) {
 n.d   <- aggregate(variab~grupo,data=data,length)[,2]
 m.d   <- round(aggregate(variab~grupo,data=data,mean)[,2],ndec)
 sd.d  <- round(aggregate(variab~grupo,data=data,sd)[,2],ndec)
 q     <- aggregate(variab~grupo,data=data,quantile)
 lab.d <- q[,1]
 med.d <- q[,2][,4]
 q1.d  <- q[,2][,3]
 q3.d  <- q[,2][,5]
 des   <- data.frame(lab.d,n.d,m.d,sd.d,med.d,q1.d,q3.d)
 names(des) <- c("Grupo","n","Média","DP","Mediana","Q1","Q3")
 return(des) }
```
 
