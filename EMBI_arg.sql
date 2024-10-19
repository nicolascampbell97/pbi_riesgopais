#De las cotizaciones de Riesgo Pais de Argentina voy a seleccionar las columnas con el indice de cierre de las ultimas fechas de cada trimestre de los años 1999 a 2023#

SELECT cierre, fecha from RIESGOPAISCotizacioneshistoricas
WHERE fecha = '1999-03-31' or fecha = '1999-06-30' or fecha = '1999-09-30' or fecha = '1999-12-31' OR
fecha = '2000-03-31' or fecha = '2000-06-30' or fecha = '2000-09-29' or fecha = '2000-12-29' OR fecha = '2001-03-30' or fecha = '2001-06-29' or fecha = '2001-09-28' or fecha = '2001-12-31' OR
fecha = '2002-03-29' or fecha = '2002-06-28' or fecha = '2002-09-30' or fecha = '2002-12-31' OR fecha = '2003-03-31' or fecha = '2003-06-30' or fecha = '2003-09-30' or fecha = '2003-12-31' OR
fecha = '2004-03-31' or fecha = '2004-06-30' or fecha = '2004-09-30' or fecha = '2004-12-31' OR fecha = '2005-03-31' or fecha = '2005-06-30' or fecha = '2005-09-30' or fecha = '2005-12-31' OR
fecha = '2006-03-31' or fecha = '2006-06-30' or fecha = '2006-09-29' or fecha = '2006-12-29' OR fecha = '2007-03-30' or fecha = '2007-06-29' or fecha = '2007-09-28' or fecha = '2007-12-31' OR
fecha = '2008-03-31' or fecha = '2008-06-30' or fecha = '2008-09-30' or fecha = '2008-12-31' OR fecha = '2009-03-31' or fecha = '2009-06-30' or fecha = '2009-09-30' or fecha = '2009-12-31' OR
fecha = '2010-03-31' or fecha = '2010-06-30' or fecha = '2010-09-30' or fecha = '2010-12-31' OR fecha = '2011-03-31' or fecha = '2011-06-30' or fecha = '2011-09-30' or fecha = '2011-12-30' OR
fecha = '2012-03-30' or fecha = '2012-06-29' or fecha = '2012-09-28' or fecha = '2012-12-31' OR
fecha = '2013-03-27' or fecha = '2013-06-28' or fecha = '2013-09-30' or fecha = '2013-12-31' OR
fecha = '2014-03-31' or fecha = '2014-06-30' or fecha = '2014-09-30' or fecha = '2014-12-31' OR
fecha = '2015-03-31' or fecha = '2015-06-30' or fecha = '2015-09-30' or fecha = '2015-12-31' OR
fecha = '2016-03-31' or fecha = '2016-06-30' or fecha = '2016-09-30' or fecha = '2016-12-30' OR
fecha = '2017-03-31' or fecha = '2017-06-30' or fecha = '2017-09-29' or fecha = '2017-12-29' OR
fecha = '2018-03-29' or fecha = '2018-06-29' or fecha = '2018-09-28' or fecha = '2018-12-31' OR
fecha = '2019-03-31' or fecha = '2019-06-30' or fecha = '2019-09-30' or fecha = '2019-12-31' OR
fecha = '2020-03-31' or fecha = '2020-06-30' or fecha = '2020-09-30' or fecha = '2020-12-31' OR
fecha = '2021-03-31' or fecha = '2021-06-30' or fecha = '2021-09-30' or fecha = '2021-12-31' OR
fecha = '2022-03-31' or fecha = '2022-06-30' or fecha = '2022-09-29' or fecha = '2022-12-31' OR
fecha = '2023-03-31' or fecha = '2023-06-30' or fecha = '2023-09-30' or fecha = '2023-12-31'