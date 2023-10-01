/*
Empresa        :  Municipalidad Distrital de La Esperanza
Software       :  Sistema de Consultas de Transportes
DBMS           :  SQL Server
Base de Datos  :  TRANSPORTES
Script         :  Consultas
*/

-- =============================================
-- Consultas para el panel INICIO
-- =============================================

/* Cantidad total de unidades*/
SELECT count(*) FROM UNIDAD;


/* Cantidad total de asociacione */
SELECT count(*) FROM ASOCIACION;

/* Cantidad de papeletas no pagadas */
SELECT count(*) FROM PAPELETA 
WHERE PAP_fechapago IS NULL;


-- =================================================================
-- 1.- CONSULTA DE MOSTRAR DATOS DE LA ULTIMA TARJETA DE CIRCULACION
-- =================================================================
SELECT ASO_razonsocial AS asociacion, ASO_ruc AS ruc, 
TAR_serie AS serie, 
FORMAT(TAR_fechaemision, 'dd/MM/yyyy') AS fechaEmisionFormateada,FORMAT(TAR_fechavencimiento, 'dd/MM/yyyy') AS fechaVencimientoFormateada, RES_numero AS numero, UNI_aniofabrica AS anioFabricacion, UNI_motor AS motor, MOD_descripcion AS modelo, MAR_descripcion AS marca,EST_descripcion AS estado
FROM TARJETA_CIRCULACION  TJ
INNER JOIN UNIDAD U ON U.UNI_codigo=TJ.UNI_codigo
INNER JOIN ASOCIACION A ON A.ASO_codigo=U.ASO_codigo
LEFT JOIN RESOLUCION R ON R.ASO_codigo =A.ASO_codigo
INNER JOIN MODELO M ON M.MOD_codigo = U.MOD_codigo
INNER JOIN MARCA MA ON MA.MAR_codigo=M.MAR_codigo
JOIN ESTADO E ON E.EST_codigo=TJ.TAR_estado
WHERE UNI_placa IN ('8596-1T')
ORDER BY TAR_fechaemision DESC
GO

-- =================================================================
-- 2.- CONSULTA PARA MOSTRAR PAPELETAS NO PAGADAS
-- =================================================================
SELECT CONCAT(PER_nombre, ' ', PER_apellidos) AS Propietario, CONCAT(FORMAT(PAP_fechaemision, 'dd/MM/yyyy'),' ',PAP_hora) AS fechaEmisionFormateada, 
UNI_tarjetapropiedad,I.INF_descripcion AS infraccion,
PAP_monto AS monto, EST_descripcion AS estado       
FROM PAPELETA P
INNER JOIN UNIDAD U ON U.UNI_codigo = P.UNI_codigo
INNER JOIN PERSONA PER ON PER.PER_codigo = U.PRO_codigo
INNER JOIN INFRACCION I ON I.INF_codigo = P.INF_codigo
INNER JOIN ESTADO E ON E.EST_codigo = P.PAP_estado
WHERE UNI_placa IN ('8596-1T')
ORDER BY PAP_fechaemision
GO

-- =================================================================
-- CONSULTA PARA MOSTRAR DATOS DE LOS PARADEROS
-- =================================================================
SELECT DISTINCT CONCAT(PER_apellidos,', ',PER_nombre) AS conductor, ASO_razonsocial as asociacion, rp.PAR_descripcion as direccion, rp.PAR_referencia as referencia
FROM UNIDAD U
left JOIN ASOCIACION A ON U.UNI_codigo=A.ASO_codigo
INNER JOIN PERSONA P ON P.PER_codigo=U.PRO_codigo
INNER JOIN RESOLUCION R ON r.ASO_codigo = a.ASO_codigo
INNER JOIN RESOLUCION_PARADERO rp on rp.RES_codigo = r.RES_codigo
WHERE UNI_placa IN ('NG-42925')
GO