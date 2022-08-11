###################################################################
# Análise Estatística em Estudos em Saúde Utilizando o Programa R # 
###################################################################
# Regressão linear simples                                        #
# Edson Zangiacomi Martinez                                       #
###################################################################

# Dados

age <- c(39L, 47L, 45L, 47L, 65L, 46L, 67L, 42L, 67L, 56L, 64L, 56L, 
59L, 34L, 42L, 48L, 45L, 17L, 20L, 19L, 36L, 50L, 39L, 21L, 44L, 
53L, 63L, 29L, 25L, 69L)

SBP <- c(144L, 220L, 138L, 145L, 162L, 142L, 170L, 124L, 158L, 154L, 
162L, 150L, 140L, 110L, 128L, 130L, 135L, 114L, 116L, 124L, 136L, 
142L, 120L, 120L, 160L, 158L, 144L, 130L, 125L, 175L)

# Gráfico de dispersão

plot(age,SBP,xlab="Idade (anos)", ylab="Pressão arterial sistólica (mmHg)",bty="l",pch=19)

# Supondo que o valor de SBP para o indivíduo 2 é um erro de digitação

age<-age[SBP<200]
SBP<-SBP[SBP<200]

plot(age,SBP,xlab="Idade (anos) ",ylab="Pressão arterial sistólica (mmHg)",bty="l",pch=19)

# a função lm() (linear model) ajusta um modelo de regressão linear

lm(SBP~age)

# a função summary() exibe mais detalhes sobre o ajuste do modelo

summary(lm(SBP~age))

# atribuindo ao objeto "modelo" os resultados do ajuste do modelo de regressão:

modelo <- lm(SBP~age)

summary(modelo)

# a função names() mostra o conteúdo do objeto "modelo"

names(modelo)

# por exemplo, se queremos os coeficientes do modelo

modelo$coefficients

​class(modelo)

# Intervalos de confiança 95% para os parâmetros:

confint(modelo)

 # Gráfico:

plot(age,SBP,xlab="Idade (anos) ",ylab="Pressão arterial sistólica (mmHg)",bty="l",pch=19)

# Inserindo a reta de regressão no gráfico:

abline(modelo)

# Valores preditos:

fitted(modelo)

SBP

# Gráfico de valores observados versus valores preditos:

plot(SBP,fitted(modelo),ylab="Valores ajustados pelo modelo",xlab="Valores observados",pch=19,bty="l", main="Valores observados x preditos")

​# Diagnósticos

par(mar = c(4, 4, 2, 2), mfrow = c(2, 2))

plot(modelo)

# Teste de normalidade dos resíduos:

shapiro.test(residuals(modelo))

# Tabela de análise de variância (ANOVA):

anova(modelo)

# Gerando uma banda de confiança para a reta de regressão:

pconf <- predict(modelo,interval="confidence")

pconf

datanew <- data.frame(cbind(age,pconf))
g <- datanew[with(datanew,order(age)),]
plot(age,SBP,xlab="Idade (anos)",ylab="Pressão arterial sistólica (mmHg)",bty="l",pch=19)
points(g$age,g$lwr,type="l",col="red")
points(g$age,g$upr,type="l",col="red")
abline(modelo,col="blue")

# Alternativa:

plot(age,SBP,xlab="Idade (anos)",ylab="Pressão arterial sistólica (mmHg)",bty="l",pch=NA)
polygon(c(g$age,rev(g$age)),c(g$lwr,rev(g$upr)),col="gray",border=NA)
points(age,SBP,pch=19)
abline(modelo,col="blue")

