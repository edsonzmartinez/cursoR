# Criando funções no R

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
