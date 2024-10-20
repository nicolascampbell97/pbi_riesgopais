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

### Con SQL 

