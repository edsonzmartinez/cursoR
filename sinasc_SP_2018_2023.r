
library(sf)
library(RColorBrewer)

urlfile="https://raw.githubusercontent.com/edsonzmartinez/cursoR/main/sinasc_SP_2018_2023.csv"

w <- read.csv2(urlfile)

# Cod_Municipio: Código e nome do município
# RRAS: Redes Regionais de Atenção à Saúde (RRAS)
# Ano2018: Nascimentos por residência da mãe, no ano de 2018
# Ano2023: Nascimentos por residência da mãe, no ano de 2023

w$cod6 <- substr(w$Cod_Municipio,1,6)

shp <- st_read("/vsizip//vsicurl/https://raw.githubusercontent.com/edsonzmartinez/spatial/main/SP_Municipios_2022.zip")

shp$CD_MUN6 <- substr(shp$CD_MUN,1,6)

n <- dim(shp)[1]

for (k in 1:n) {
 ind <- (w$cod6 == shp$CD_MUN6[k])
  if (sum(ind == 1)) {
   shp$RRAS[k]<- w$RRAS[ind] }}

my_palette <- colorRampPalette(base_palette)(19)

RRAS_c <- unique(shp$RRAS)

shp$cor <- c()
for (k in 1:n) {
 shp$cor[k] <- my_palette[which(RRAS_c == shp$RRAS[k])] }
 
plot(shp$geometry, col=shp$cor)


