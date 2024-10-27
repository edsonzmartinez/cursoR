# Funções de arredondamento

## Separação de casas decimais

O R usa o ponto para indicar que o algarismo seguinte pertence aos decimais.

Se usamos

```
options(OutDec=",")
```

o R passa a usar a vírgula para separar os algarismos decimais:

```
x <- c(7.5,5.6,2.1,8.9,5.4,7.7,1.1,7.8)
x
```

[1] 7,5 5,6 2,1 8,9 5,4 7,7 1,1 7,8

```
options(OutDec=".")
x
```

[1] 7.5 5.6 2.1 8.9 5.4 7.7 1.1 7.8

## Funções de arredondamento

### Funções ceiling() e floor()

ceiling(x)    Retorna o menor número inteiro maior que x

floor(x)      Retorna o maior número inteiro menor que x

```
# Exemplos

​ceiling(6.9)
```

[1] 7

```
ceiling(6.2)
```

[1] 7

```
floor(6.9)
```

[1] 6

```
floor(6.2)
```

[1] 6
