library(tidyverse)
library(dplyr)
library(readr)
library(ggplot2)

pib_riesgopais <- read_csv("pib_riesgopais.csv")
head(pib_riesgopais)                         

####Grafico la regresión lineal con ggplot####
plot_pib_riesgopais<-ggplot(pib_riesgopais,
                            aes(x=cierre, y=pbi_en__mm))+
  geom_point()+
  geom_smooth(method = "lm", colour = "red")+
  scale_y_continuous(limits = c(200000,700000),
                     labels = function(n){format(n, scientific = FALSE)})+
  theme (plot.title=element_text(family = "serif", face= "bold", size=25),
         axis.title.y = element_text(family = "serif", size=15),
         axis.title.x = element_text(family = "serif", size=15),
         legend.position = "none")+
  labs(x="Riesgo País",
       y= "PIB en millones de USD",
       title = "EMBI vs PIB USD a precios constantes de 2015 (1999-2023)",
       caption = "Fuente: Elaboación propia en base a datos del Banco Mundial y EMBI de JP Morgan")

plot(plot_pib_riesgopais)
#labels = function... lo hago para quitarle la notación científica a los numeros del Eje Y y que me muestre los numeros enteros#

####Testeamos el modelo de regresión lineal####
##Creo el objeto "modelo_pib_rp" y uso la función lm() para hacer la regresión con las variables##
#Hipotesis nula: El modelo no es válido, es decir, el riesgo pais no explica el pib
modelo_pib_rp <- lm(pbi_en__mm ~ cierre, data = pib_riesgopais)

summary(modelo_pib_rp)
#P-value = 1.504e-09 = 0,000. Es estadísticamente significativo, podemos rechazar H0.
#Coeficiente de determinación R2 = 0,3054. El PBI explica sólo en un 30,54% la variabilidad del Riesgo Pais

##Fórmula de la regresión
modelo_pib_rp$coefficients
# PIB = 558578,76 - 28,23*RiesgoPais . Cuando el riesgo país aumenta en una unidad, el PBI cae en u$d28,23 millones