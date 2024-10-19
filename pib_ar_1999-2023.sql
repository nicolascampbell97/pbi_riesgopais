#Selecciono las columnas con el nombre de los países y los años de 1999 a 2023 . Luego filtro el registro de Argentina#

SELECT country_name, "1999", "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023"  
FROM PBIusdpreciosconstantesHoja1
WHERE country_name = 'Argentina'