##fusiono la tablas de pbi argentino con el de riesgo pais, uniendolos con la columna "año" de ambas tablas##
#la tabla con la que voy a graficar va a ser una que contenga las columnas año, pbi, puntos de riesgo pais y fecha#

SELECT rp.año, pbi_en__mm, cierre, fecha FROM pivot_pib_ar_19992023 pib
inner join EMBI_arg2 rp
on pib.año = rp.año