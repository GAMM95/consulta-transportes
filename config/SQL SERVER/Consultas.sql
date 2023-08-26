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
SELECT * FROM PAPELETA 
WHERE PAP_fechapago IS NULL;


-- =================================================================
-- 1.- CONSULTA DE MOSTRAR DATOS DE LA ULTIMA TARJETA DE CIRCULACION
-- =================================================================
SELECT ASO_razonsocial, ASO_ruc, 
TAR_codigo, TAR_serie, TAR_fechaemision,TAR_fechavencimiento,
RES_numero,
UNI_aniofabrica,UNI_motor, UNI_numerounidad, MOD_descripcion, MAR_descripcion
 ,EST_descripcion
FROM TARJETA_CIRCULACION  TJ
INNER JOIN UNIDAD U ON U.UNI_codigo=TJ.UNI_codigo
INNER JOIN ASOCIACION A ON A.ASO_codigo=U.ASO_codigo
LEFT JOIN RESOLUCION R ON R.ASO_codigo =A.ASO_codigo
INNER JOIN MODELO M ON M.MOD_codigo = U.MOD_codigo
INNER JOIN MARCA MA ON MA.MAR_codigo=M.MAR_codigo
 JOIN ESTADO E ON E.EST_codigo=TJ.TAR_estado
WHERE UNI_placa = '8234-2T'
ORDER BY TAR_fechaemision DESC;
go

-- =================================================================
-- 2.- CONSULTA PARA MOSTRAR PAPELETAS NO PAGADAS
-- =================================================================
SELECT CONCAT(PER_nombre,' ', PER_apellidos ) AS Conductor, PAP_fechaemision,PAP_monto 
FROM PAPELETA P
INNER JOIN UNIDAD U ON U.UNI_codigo=P.UNI_codigo
INNER JOIN PERSONA PER ON PER.PER_codigo=U.PRO_codigo
WHERE PAP_estado IN(24) AND UNI_placa IN('8596-1T')
GO

-- =================================================================
-- CONSULTA PARA MOSTRAR DATOS DE LOS PARADEROS
-- =================================================================
SELECT DISTINCT CONCAT(PER_apellidos,', ',PER_nombre) AS Conductor, ASO_razonsocial, ASO_direccion, ASO_colores 
FROM UNIDAD U
LEFT JOIN ASOCIACION A ON U.UNI_codigo=A.ASO_codigo
INNER JOIN PERSONA P ON P.PER_codigo=U.PRO_codigo
WHERE UNI_placa IN ('6195-2T')
GO
