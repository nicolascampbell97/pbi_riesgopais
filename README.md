# ¿Existe una relación lineal entre el Riesgo País y el PBI?
#### El 21 de Septiembre de 2024, el Presidente de la Nación, Javier Milei, posteo en la red social "X", dos modelos de regresión lineal. Uno entre el Riesgo País (EMBI) y el PBI en dólares, y otro entre el Riesgo País el Estimador Mensual de Actividad Económica.  
![Twit Milei](https://github.com/user-attachments/assets/3f630c2a-319f-4b1c-954d-eeaea80a335c)
![Milei relación EMBI vs PIB usd](https://github.com/user-attachments/assets/99ef124d-0bed-4a96-8d75-8ea7890d0640)
![Milei relación EMBI vs EMAE](https://github.com/user-attachments/assets/3cd6682e-838f-4e34-9c6f-4ba3ab92e2cf)

#### En pocas palabras, lo que estos modelos buscaban explicar es que existe una relación inversa entre el nivel Riesgo País y el PBI, es decir, a mayor nivel de Riesgo Pais, menor sería el nivel del PBI, y viceversa. Lo que buscó sostener el Presidente es que, al tener superavit fiscal y generar la mejores expectativas de pago de deuda en el mercado, reduciendo el Riesgo País, el PBI iba a aumentar. 
#### Sin embargo, estos modelos no cuentan con testeos estadísiticos que permitan saber que tan explicativos son.

## ¿Que voy a hacer en este trabajo?
#### El objetivo de este trabajo es realizar, por un lado, un test F, para saber si el modelo es estadísticamente significativo, observando el P-value, y, por otro lado, calcular el Coeficiente de Determinación (R2) para saber en cuánto el Riesgo País explica al PBI.

### Pasos:
##### 1. Obtener los datasets con la información del PBI en dólares a precios constantes de cada año y los puntos de Riesgo País de cada trimestre de los años 1999 a 2023.
##### 2. Limpiar y transformar dichos datasets para obtener un solo dataset con la información del PBI en dólares y el Riesgo País, utilizando Excel y SQL.
##### 3. Con R studio, voy a graficar regresión lineal, realizar un test F y calcular el R2 para saber que tan explicativo es este modelo.

## 1. Limpieza y transformación del dataset PBI en u$d a precios constantes.
#### -Descargo el dataset de PIB (u$s a precios constantes de 2015) del Banco Mundial en formato csv., que se encuentra en: https://datos.bancomundial.org/indicator/NY.GDP.MKTP.KD?locations=AR .
#### Se nos presenta la siguiente planilla:
![PBI_BancoMundial](https://github.com/user-attachments/assets/2c6f4d98-f805-44b0-ac1a-0f89d722f9f9)

#### -Abro el archivo en Excel o Google Sheets y elimino las primeras 5 filas superiores dejando las fila 6 como cabecera de la tabla.
#### -Para que Google Sheets me lea el formato csv. y  me reeamplace las comas por columnas, hago lo siguiente: Pestaña "Datos" -> "Dividir texto en columnas". 
#### -Lo convierto a tabla: Pestaña "Formato" -> "Convertir a tabla".
#### -Guardo el archivo como "PBI usd precios constantes.csv", que es el que se encuentra en el repositorio.

#### Con SQL voy a seleccionar los campos con los años 1999 a 2023 y el campo con los nombres de los paises ("country_name"). Con la clausula WHERE voy a seleccionar el registro de Argentina del campo "country_name"
```sql

SELECT country_name, "1999", "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023"  
FROM PBIusdpreciosconstantes
WHERE country_name = 'Argentina'

```
#### Exporto el resultado como "pib_ar_1999-2023.csv"

#### Para finalizar la transformación de este dataset voy a pivotearlo para que los años me queden como registros.
##### -Abro "pib_ar_1999-2023.csv" en Google Sheets, abro otra hoja y uso la función TRANSPONER para poner a los años como registro de un solo campo llamado "año". 
```
=TRANSPONER('pib_ar_1999-2023.csv'!B1:Z2)
```
##### Al observar los registros  de PBI me encontré con que muchos de ellos estaban escritos de manera diferente entre sí. Algunos tenían decimales, algunos se separaban por una coma (,) o por un punto (.). Lo que hice fue darle un mismo formato a todos los registros y determinar el formato de la columna "pbi_usd" como numérico.
##### Para que no queden números tan grandes, lo que hice fue crear otra columna llamada "pbi_en_mm", que contenga el resultado del número de la celda de la izquierda dividido por 1.000.000

#### El resultado final es una tabla de 3 columnas: con los años, otra con el pbi argentino de esos años y una tercera con el pbi divido por 1.000.000, como se puede observar en el documento "pivot_pib_ar_1999-2023.csv" que se encuentra en el repositorio.

## 2. Limpieza y transformación del dataset de Riesgo País (EMBI).
##### -Descargo el dataset de cotizaciones históricas de Riesgo País de Argentina desde esta página: https://www.rava.com/perfil/riesgo%20pais .
##### -En SQL voy a seleccionar las columnas "cierre" (que contiene los puntos de cierre de Riesgo País de todas las fechas) y "fecha".
##### -Posteriormente, para obtener los puntos de Riesgo País de cierre de cada fin de trimestre de los años 1999 a 2023, voy a filtrar las últimas fechas de cada trimestre usando la claúsula WHERE. Tendría que quedar una consulta con 100 registros (4 fechas de cierre por año). 
#### El código a ejecutar sería el siguiente:
```sql
SELECT cierre, fecha from RIESGOPAISCotizacioneshistoricas
WHERE fecha = '1999-03-31' or fecha = '1999-06-30' or fecha = '1999-09-30' or fecha = '1999-12-31' OR
fecha = '2000-03-31' or fecha = '2000-06-30' or fecha = '2000-09-29' or fecha = '2000-12-29' OR fecha = '2001-03-30' or fecha = '2001-06-29' or fecha = '2001-09-28' or fecha = '2001-12-31' OR
fecha = '2002-03-29' or fecha = '2002-06-28' or fecha = '2002-09-30' or fecha = '2002-12-31' OR fecha = '2003-03-31' or fecha = '2003-06-30' or fecha = '2003-09-30' or fecha = '2003-12-31' OR
fecha = '2004-03-31' or fecha = '2004-06-30' or fecha = '2004-09-30' or fecha = '2004-12-31' OR fecha = '2005-03-31' or fecha = '2005-06-30' or fecha = '2005-09-30' or fecha = '2005-12-31' OR
fecha = '2006-03-31' or fecha = '2006-06-30' or fecha = '2006-09-29' or fecha = '2006-12-29' OR fecha = '2007-03-30' or fecha = '2007-06-29' or fecha = '2007-09-28' or fecha = '2007-12-31' OR
fecha = '2008-03-31' or fecha = '2008-06-30' or fecha = '2008-09-30' or fecha = '2008-12-31' OR fecha = '2009-03-31' or fecha = '2009-06-30' or fecha = '2009-09-30' or fecha = '2009-12-31' OR
fecha = '2010-03-31' or fecha = '2010-06-30' or fecha = '2010-09-30' or fecha = '2010-12-31' OR fecha = '2011-03-31' or fecha = '2011-06-30' or fecha = '2011-09-30' or fecha = '2011-12-30' OR
fecha = '2012-03-30' or fecha = '2012-06-29' or fecha = '2012-09-28' or fecha = '2012-12-31' OR fecha = '2013-03-27' or fecha = '2013-06-28' or fecha = '2013-09-30' or fecha = '2013-12-31' OR
fecha = '2014-03-31' or fecha = '2014-06-30' or fecha = '2014-09-30' or fecha = '2014-12-31' OR fecha = '2015-03-31' or fecha = '2015-06-30' or fecha = '2015-09-30' or fecha = '2015-12-31' OR
fecha = '2016-03-31' or fecha = '2016-06-30' or fecha = '2016-09-30' or fecha = '2016-12-30' OR fecha = '2017-03-31' or fecha = '2017-06-30' or fecha = '2017-09-29' or fecha = '2017-12-29' OR
fecha = '2018-03-29' or fecha = '2018-06-29' or fecha = '2018-09-28' or fecha = '2018-12-31' OR fecha = '2019-03-31' or fecha = '2019-06-30' or fecha = '2019-09-30' or fecha = '2019-12-31' OR
fecha = '2020-03-31' or fecha = '2020-06-30' or fecha = '2020-09-30' or fecha = '2020-12-31' OR fecha = '2021-03-31' or fecha = '2021-06-30' or fecha = '2021-09-30' or fecha = '2021-12-31' OR
fecha = '2022-03-31' or fecha = '2022-06-30' or fecha = '2022-09-29' or fecha = '2022-12-31' OR fecha = '2023-03-31' or fecha = '2023-06-30' or fecha = '2023-09-30' or fecha = '2023-12-31'
```

##### -Exporto la consulta en formato csv. y lo guardo como "EMBI_arg.csv", que está en el repositorio. 
##### -En Google Sheets le doy formato a ambas de las columnas: A la columna fecha de doy formato fecha y a la columna cierre le doy formato numérico.
##### -Para unir esta tabla con la de PBI, voy a crear una Foreign Key (o clave foránea) con el año de cada fecha de la columna "fecha", utilizando la función "AÑO". Ejemplo:
```
=AÑO(B2)
```
##### -El archivo final lo guardo como "EMBI_arg2.csv". 

## 3. Fusión entre ambas tablas: 
#### El último paso de transformación de datos para este proyecto, va a ser la de unir ambos datasets para hacer uno solo con laque voy a graficar la regresión lineal y hacer los tests. 
##### -En SQL voy a unir ambas tablas por la columna "año" de cada una, usando INNER JOIN. Con SELECT, le pido que me muestre las columnas "año", "pbi_en_mm", "cierre" y "fecha"
```sql
SELECT rp.año, pbi_en__mm, cierre, fecha FROM pivot_pib_ar_19992023 pib
inner join EMBI_arg2 rp
on pib.año = rp.año
```
#### El resultado final lo exporto como “pib_riesgopais.csv”. 

## 4. Gráfico de Modelo de Regresión Lineal, Test F y Coeficiente de Determinación R2 en R. 
#### Con R studio voy a realizar, primero, el gráfico de regresión lineal entre las variables "cierre" (Riesgo País) y "pbi_en_mm" usando el paquete 'ggplot' de 'tidyverse'.

```r
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
```
##### -Abro el dataset "pib_riesgopais.csv" con read_csv.
##### -Con ggplot hago la regresión con
##### -En la línea 'scale_y_continuous' indico los limites numéricos del eje 'Y' y, en la parte 'labels = function...', le pido que me muestre los números del PBI como número entero, ya que me los indicaba en notación científica. 
##### -En la línea 'theme' defino el tipo y el tamaño de letra. 
##### -En la línea 'labs' escribo los títulos del gráfico, de los ejes y la fuente.

![regresion_EMBIPIB](https://github.com/user-attachments/assets/8ff10528-e913-4086-9e59-e5e623ef8178)

### Ahora calculo el R2 y realizo el test F para calcular el P-value y saber que tan bueno es este modelo de regresión lineal. 
```r
modelo_pib_rp <- lm(pbi_en__mm ~ cierre, data = pib_riesgopais)

summary(modelo_pib_rp)
```
![P-value y R2](https://github.com/user-attachments/assets/a84dba67-67e0-4616-81e9-f9d019d14c14)

#### LA fórmula de la regresión es: PBI = 558578,76 - 28,23*RiesgoPais
#### Esto quiere decir que cuando el riesgo país aumenta en una unidad, el PBI cae u$d28,23 millones.

## 5. Conclusiones
#### Nuestro modelo de regresión lineal entre el Riesgo País y el PBI argentino es estadísticamente significativo ya que el P-value es 0.000, lo que es aceptable para un nivel de confianza del 95%.
#### Sin embargo, el R2 obtenido es 0.3054, esto quiere decir que el Riesgo País explica la variabilidad del PBI argentino sólo en un 30,54%, lo cual debilita el nivel explicativo de este modelo. 
#### Lo recomendable sería sumar otras variables que puedan explicar mejor la variabilidad del PBI.
