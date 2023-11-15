 ########################################
 #
 # Machine learning
 #
 # Unsupervised learning
 #
 # Hierarchical algorithms and K-means
 #
 # Edson Zangiacomi Martinez (2023)
 # 
 ######################################3
 
 # Clear existing data and graphics
 rm(list=ls())
 graphics.off()
 # Read data
 urlfile <- "https://raw.githubusercontent.com/edsonzmartinez/basesdedados/main/IDH_UF_Brasil.csv"
 dados <- read.csv2(urlfile)
 head(dados)
 # function stand
 stand <- function(x) return((x-mean(x))/sd(x))
 # Standardizing data
 dados$E2021s <- stand(dados$E2021)
 dados$R2021s <- stand(dados$R2021)
 dados$L2021s <- stand(dados$L2021)
 # Select variables of interest
 dadosIDH <- subset(dados,select=c(E2021s,R2021s,L2021s))
 head(dadosIDH)
 # Euclidian distances
 distancia <- dist(dadosIDH,method="euclidean")
 # Dendogram
 fit <- hclust(distancia,method="ward.D")
 plot(fit,labels=dados$UF,ylab="Distância",main="",xlab="",sub="")
 rect.hclust(fit, k = 3, border = 2:6)
 # Figure Euclidian distances
  plot(dados$E2021s,dados$R2021s,pch=19,bty="l",xlab="IDH Educação",ylab="IDH Renda")
  lines(c(dados$E2021s[1],dados$E2021s[20]),c(dados$R2021s[1],dados$R2021s[20]),lty="dashed",col="magenta")
  lines(c(dados$E2021s[1],dados$E2021s[20]),c(dados$R2021s[1],dados$R2021s[1]),col="magenta")
  lines(c(dados$E2021s[20],dados$E2021s[20]),c(dados$R2021s[1],dados$R2021s[20]),col="magenta")
  points(dados$E2021s[1],dados$R2021s[1],col="red",pch=19)
  points(dados$E2021s[20],dados$R2021s[20],col="red",pch=19)
  text(dados$E2021s[1],dados$R2021s[1],dados$UF[1],pos=3)
  text(dados$E2021s[20],dados$R2021s[20],dados$UF[20],pos=3)
 ###
 plot(dadosIDH$E2021s,dadosIDH$R2021s,col="white",bty="l",las=1,xlab="IDH Educação",ylab="IDH Renda")
 text(dadosIDH$E2021s,dadosIDH$R2021s,col="black",dados$UF,font=2)
 ####
 ####
 # K-MEANS 
 #
 # Select variables of interest
 dadosIDH <- subset(dados,select=c(E2021s,R2021s,L2021s))
 set.seed(222)
 km1 <- kmeans(dadosIDH,centers=4,nstart=3,iter.max=100)
 km1
 print(paste("Soma total de quadrados dentro dos clusters",round(km1$tot.withinss,2)))
 # Plot 
 plot(dadosIDH$E2021s,dadosIDH$R2021s,col="white",bty="l",las=1,xlab="IDH Educação",ylab="IDH Renda")
 text(dadosIDH$E2021s,dadosIDH$R2021s,col=km1$cluster,dados$UF,font=2)
 points(km1$centers,pch=19)
 # Elobow plot
 k.max <- 15
 set.seed(222)
 wss <- sapply(1:k.max, function(k){kmeans(dadosIDH, k, nstart=50,iter.max = 100)$tot.withinss})
 wss
 plot(1:k.max, wss,
     type="b", pch = 19, frame = FALSE, 
     xlab="Number of clusters K",
     ylab="Total within-clusters sum of squares")

 

