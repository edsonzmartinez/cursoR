###################################################################
# Análise Estatística em Estudos em Saúde Utilizando o Programa R # 
###################################################################
# Introdução                                                      #
# Edson Zangiacomi Martinez                                       #
###################################################################

# Introdução

# A função contributors() exibe os nomes das principais pessoas que contribuíram para o desenvolvimento do programa R.
contributors()

# A função citation() exibe uma sugestão de como  citar o programa R em publicações técnicas e acadêmicas.
citation()

# RShowDoc("COPYING") exibe a licença pública do programa R.
RShowDoc("COPYING")

# A função history() exibe uma lista das funções executadas pelo usuário.
history()

# Além das funções existentes no R, você pode criar suas próprias funções, como veremos posteriormente. 
# As funções que já existem no R são chamadas de "built-in functions" (ou "funções embutidas"). 
# A função builtins() exibe uma lista das funções "built-in" do R.
builtins()

# sessionInfo() exibe informações sobre o programa R e o sistema operacional.
sessionInfo()

# O símbolo "#" serve para inserir comentários quando você escreve linhas de programação

##################
# Tipos de dados #
##################

# Escalares
x <- 34
y = 7
9 -> z
X <- 45
h <- pi
z <- 8+4
a <- b <- c <- 8

# Vetores
# Os vetores podem ser numéricos, caracteres ou lógicos (tipo "verdadeiro" ou "falso").

# numéricos
x1 <- c(6,3,6,0,7,3)
x2 <- 1:20
x3 <- 20:1
x4 <- c(x2,x4)

# caracteres
y1 <- c("norte", "sul","leste","oeste")
y2 <- month.abb
y3 <- month.name

# lógicos
z <- c(TRUE,TRUE,FALSE)


# is.vector(x) retorna TRUE se x é um vetor e FALSE caso contrário
is.vector(x1)

# Matrizes
M1 <- matrix(c(1, 1, 1, 2), nrow = 2)

# ncol indica quantas colunas terá a matriz
M2 <- matrix(c(1, 3, 2, 4), ncol = 2)

# perceba que a matriz é "preenchida" sequencialmente pelas colunas
# byrow é usado para preencher a matriz pelas linhas
M3 <- matrix(c(1, 3, 2, 4), ncol = 2, byrow=T)

M <- matrix(c(1, 3, 2, 4), ncol = 2, byrow=T, dimnames=list(c("L1","L2"),c("C1","C2")))

dim(M)           # retorna a dimensão da matriz M (linhas e colunas)
M[1,1]           # retorna o elemento da linha 1 e coluna 1 da matriz M
M[1,]            # retorna a linha 1 da matriz M
M[,1]            # retorna a coluna 1 da matriz M
nrow(M)          # retorna o número de linhas da matriz M
ncol(M)          # retorna o número de colunas da matriz M
t(M)             # retorna a transposta da matriz M
solve(M)         # retorna a inversa da matriz M
det(M)           # retorna o determinante da matriz M
diag(M)          # retorna os elementos da diagonal da matriz M
eigen(M)         # retorna os autovalores e autovetores da matriz M
is.matrix(M)     # retorna TRUE se M é uma matriz e FALSE caso contrário

# Fatores
# Fatores representam variáveis categóricas.

x <- c(7,5,2,8,5,7,1,7)

# as funções factor(x) ou as.factor(x) convertem x em fatores.
factor(x)
as.factor(x)

# is.factor() retorna TRUE se x é um fator e FALSE caso contrário
is.factor(x)

# a função levels() retorna os níveis de um fator
xf <- factor(x)
levels(xf)
 
# Arrays
# Generalizam o conceito de matrizes, permitindo um número maior de dimensões

a <- array(1:24,  dim=c(3,4,2))

# Data frame
# Um data frame é um “banco de dados”: é uma tabela composta por um ou vários vetores e/ou fatores do mesmo tamanho.

nome <- c("Alexander","André","Breno","Carla")
nota <- c(8.6,9.4,6.2,7.5)
resultado <- c(TRUE,TRUE,TRUE,FALSE)
meusdados <- data.frame(nome,nota,resultado)
names(meusdados) <- c("nome","nota","resultado")

##################################################
# Valores faltantes (missings)                   #
##################################################

# Os valores faltantes são indicados por NA (not available)

y <- c(4,9,5,NA,3)
is.na(y)            # indica quais elementos em y são faltantes
!is.na(y)           # indica quais elementos em y não são faltantes
anyNA(y)            # retorna TRUE se há algum valor faltante em y
y[is.na(y)] <- 99   # substitui todos os valores faltantes em y por 99

# Removendo valores faltantes de um vetor

y <- c(4,9,5,NA,3)
y <- y[!is.na(y)]

# Removendo valores faltantes de um data frame

x1 <- c(3,7,4,NA,9,2,6)
x2 <- c(NA,3,5,6,9,8,NA)
x3 <- c(9,7,2,5,8,3,4)
dat <- data.frame(x1,x2,x3)
is.na(dat)
complete.cases(dat)

newdat <- na.omit(dat)
newdat

##################################################
# Listagem e remoção de objetos                  #
##################################################

ls()                # lista os objetos ativos
remove() ou rm()    # remove objetos
rm(list=ls())       # remove todos os objetos ativos
ls.str()            # detalhes dos objetos ativos
exists()            # verifica a existência de um objeto na seção atual

a <- c(56,78,98)
exists("a") 

##################################################
# Notação científica                             #
##################################################

# Útil quando se deseja expressar números muito grandes ou muito pequenos. Por exemplo,

2e3      # denota 2 x 103 = 2000
1.85e8   # denota 1,85 x 108 = 185000000
2e15     # denota 2 x 1015 = 2000000000000000
2e-10    # denota 2 x 10-10 = 0,0000000002

##################################################
# Operadores                                     #
##################################################

# Aritméticos

################################ 
#  +   Adição                  #
#  -   Subtração               #
#  *   Multiplicação           #
#  /   Divisão                 #
#  ^   Potência                #
#  **  Potência                #
#  %%  "Resto" da divisão      #
#  %/% Divisão inteira         #
################################ 

# Comparações

################################ 
#  <    Menor que              # 
#  >    Maior que              # 
#  <=   Menor ou igual         # 
#  >=   Maior ou igual         # 
#  ==   Igual                  # 
#  !=   Diferente              # 
################################ 

# Lógicos

################################ 
#  !=    NOT                   #
#  x&y   AND                   #
#  x&&y  AND                   #
#  x|y   OR                    #
#  x||y  OR                    #
################################ 

# Funções Matemáticas Comuns

########################################### 
#  abs()         # Valor absoluto         #
#  choose()      # Combinação             #
#  exp()         # Exponencial            #
#  factorial()   # Fatorial               #
#  lfactorial()  # Log fatorial           #
#  log()         # Logaritmo              #
#  log2()        # Logaritmo de base 2    #
#  log10()       # Logaritmo de base 10   #
#  sqrt()        # Raiz quadrada          #
#  pi            # 3,14159265             #
#  Inf           # Infinito               #
########################################### 

# Infinito:

1/0

a<-8
b<-0
is.infinite(a/b)

# "Not a number" (NaN):

0/0

is.nan(Inf/Inf)

##################################################
# Funções trigonométricas                        #
##################################################

##########################################################################################
# cos()   sin()   tan()     #  Cosseno, seno e tangente de um ângulo em radianos         #
# acos()  asin()  atan()    #  Arco-cosseno, arco-seno e arco-tangente de um ângulo      #
# cosh()  sinh()  tanh()    #  Cosseno, seno e tangente hiperbólicos de um ângulo        #
# acosh() asinh() atanh()   #  Arco-cosseno, arco-seno e arco-tangente hiperbólicos      #
# cospi() sinpi() tanpi()   #  Cosseno, seno e tangente de um ângulo multiplicado por pi #
##########################################################################################

# Exemplo

cos(30)

# ATENÇÃO: O R opera com ângulos em radianos, e não em graus!
# Conversão:
# 1 grau = pi/180 radianos
# 1 radiano = 180/pi graus

# Por exemplo, o cosseno de um ângulo de 60 graus é dado por:

cos(60*pi/180)

# ou  

cospi(60/180)

#############################
# Funções de arredondamento #
#############################

# Funções ceiling() e floor()

ceiling(x)    # Retorna o menor número inteiro maior que x

floor(x)      # Retorna o maior número inteiro menor que x

# Exemplos

ceiling(6.9)
# [1] 7

ceiling(6.2)
# [1] 7

floor(6.9)
# [1] 6

floor(6.2)
# [1] 6

# Função round()

round(x,digits=k)    # Se k é maior ou igual a zero, arredonda o valor x a para um valor com k casas decimais

# Exemplos

round(5.6892,digits=3)
# [1] 5.689

round(5.6892,3)
# [1] 5.689

round(5.6898,3)
# [1] 5.69

# notar que round(x,digits=0) retorna o número inteiro mais próximo a x

round(5.6898,0)
# [1] 6
 
round(5.2898,0)
# [1] 5

# notar que, se k não é declarado em round(x,digits=k), é retornado o número inteiro mais próximo a x,
# como se k fosse igual a zero

round(5.6898)
# [1] 6

round(5.2898)
# [1] 5

# round(x,digits=-1) retorna o número inteiro mais próximo a x, cujo último algarismo é zero

round(528.98,-1)
# [1] 530 

round(522.98,-1)
# [1] 520

# round(x,digits=-2) retorna o número inteiro mais próximo a x, cujos dois últimos algarismos são zeros

round(528.98,-2)
# [1] 500

round(588.98,-2)
# [1] 600

# Função trunc()

trunc(x)     # Arredonda para o valor inteiro mais próximo a x, mas em direção a zero

# Exemplos

trunc(528.98)
# [1] 528
 
trunc(528.18)
# [1] 528 

trunc(-528.18)
# [1] -528

trunc(-528.98)
# [1] -528

round(-528.98)
# [1] -529
