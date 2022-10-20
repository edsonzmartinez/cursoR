###################################################################
# Análise Estatística em Estudos em Saúde Utilizando o Programa R # 
###################################################################
# Introdução                                                      #
# Edson Zangiacomi Martinez                                       #
###################################################################

# Operações com caracteres

  casefold(x)            # converte para letras minúsculas
  casefold(x,upper=TRUE) # converte para letras maiúsculas
  substr(x,2,4)          # extrai do 2o ao 4o caractere de cada elemento de x
  paste(x,"ly",sep="")   # insere "ly" no final de cada elemento de x
  nchar(x)               # número de caracteres em cada elemento de x
  grep("a",x)            # quais elementos de x contém "a" ?
  grep("a|b",x)          # quais elementos de x contém "a" ou "b"?
  grepl("a",x)           # retorna TRUE para os elementos de x que contém "a"
  grepl("^a",x)          # retorna TRUE para os elementos de x que começam por "a"
  agrep("abc",x)         # quais elementos de x contém ocorrências semelhantes a "abc" ?
  agrepl("abc",x)        # retorna TRUE para os elementos de x que contém ocorrências semelhantes a "abc"
  strsplit(x,"a")        # particiona x quando ocorre a letra "a"
  startsWith(x,"a")      # retorna TRUE para os elementos de x que começam por "a"
  endsWith(x,"a")        # retorna TRUE para os elementos de x que terminam por "a"
  sub("a","b",x)         # nos elementos de x, substitui a primeira ocorrência de "a" por "b"
  gsub("a","b",x)        # nos elementos de x, substitui toda ocorrência de "a" por "b"

# Exemplos:

animais <- c("gato","pássaro","minhoca","avestruz","cisne","elefante")

casefold(animais,upper=TRUE)
# [1] "GATO"     "PÁSSARO"  "MINHOCA"  "AVESTRUZ" "CISNE"    "ELEFANTE"

substr(animais,2,4)
# [1] "ato" "áss" "inh" "ves" "isn" "lef"

paste(animais,"verde",sep=" ")
# [1] "gato verde"     "pássaro verde"  "minhoca verde"  "avestruz verde"
# [5] "cisne verde"    "elefante verde"   

nchar(animais)
# [1] 4 7 7 8 5 8

grep("ve",animais)   # o quarto elemento de animais contém a expressão "ve":
# [1] 4

grep("a",animais)    # apenas o quinto elemento de animais não contém "a":
# [1] 1 2 3 4 6

grepl("o",animais)   # retorna TRUE para os elementos de animais que contém "o":
# [1] TRUE  TRUE  TRUE FALSE FALSE FALSE

grepl("^m",animais)  # retorna TRUE se o elemento de animais começa com "m":
# [1] FALSE FALSE  TRUE FALSE FALSE FALSE

agrep("galo",animais)   # NOTA: ver distância Levenshtein
# [1] 1

agrepl("galo",animais)  
# [1] TRUE FALSE FALSE FALSE FALSE FALSE

strsplit("Axraposaxpulouxaxcercaxexfugiuxparaxaxfloresta","x")
# [[1]]
#  [1] "A"        "raposa"   "pulou"    "a"        "cerca"    "e"      
#  [7] "fugiu"    "para"     "a"        "floresta"

startsWith(animais, "p")  # retorna TRUE para os elementos de animais que começam com "p":
# [1] FALSE  TRUE FALSE FALSE FALSE FALSE

endsWith(animais, "o")
# [1]  TRUE  TRUE FALSE FALSE FALSE FALSE

endsWith(animais, "ro")
# [1] FALSE  TRUE FALSE FALSE FALSE FALSE

sub("o","K",animais)
# [1] "gatK"     "pássarK"  "minhKca"  "avestruz" "cisne"    "elefante"

sub("e","X",animais)
# [1] "gato"     "pássaro"  "minhoca"  "avXstruz" "cisnX"    "Xlefante"

gsub("e","X",animais)
# [1] "gato"     "pássaro"  "minhoca"  "avXstruz" "cisnX"    "XlXfantX"

# Função trimws()
#################

# A função trimws(x) remove os espaços em branco no início e no final de x

x <- "          Saúde Pública          "
trimws(x)
#  [1] "Saúde Pública"

# ws refere-se a "white space"

# O argumento "l" pode ser utilizado quando se deseja retirar os espaços em
# branco no início (left) de x, e "r" pode ser utilizado quando se deseja
# retirar os espaços em branco (right) no final de x

trimws(x,"l")
# [1] "Saúde Pública          "

trimws(x,"r")
# [1] "          Saúde Pública"
