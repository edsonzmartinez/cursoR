#######################################
# Gráficos de dispersão usado o       #
# pacote ggplot e a função geom_hex   #
#######################################

# install.packages("viridis")
library(ggplot2)
library(viridis)

# Sobre o pacote viridis, ver:
# https://cran.r-project.org/web/packages/viridis/vignettes/intro-to-viridis.html

x <- rnorm(10000,40,2)
d <- rnorm(10000,0,1)
y <- x+d

# Gráfico tradicional
plot(x,y,bty="l",pch=16,col="blue",las=1)

data <- data.frame(x,y)

# Exemplo 1
ggplot(data, aes(x = x, y = y)) +  geom_hex()

# Exemplo 2
# Necessário o pacote viridis
ggplot(data, mapping = aes(x = x, y = y)) +
  scale_color_viridis() + geom_hex() + theme_bw()

# Exemplo 3
ggplot(data, mapping = aes(x = x, y = y)) +
  scale_color_viridis() + geom_hex(color="white") + theme_bw()

# Exemplo 4
ggplot(data, mapping = aes(x = x, y = y)) +
  scale_color_viridis() + geom_hex(bins=60) + theme_bw()

# Exemplo 5
ggplot(data, aes(x = x, y = y)) +
  geom_hex(color = 1, fill = 4, alpha = 0.4) 

# Exemplo 6
ggplot(data, aes(x = x, y = y)) +
  geom_hex() +
  guides(fill = guide_colourbar(barwidth = 0.7,
                                barheight = 15))

# Exemplo 7
# Modificando o título da legenda
ggplot(data, aes(x = x, y = y)) +
  geom_hex() +
  guides(fill = guide_colourbar(barwidth = 0.7,
                                barheight = 15)) +
  guides(fill = guide_colourbar(title = "Frequências"))




