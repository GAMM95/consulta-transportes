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
SELECT ASO_razonsocial, ASO_ruc, 
TAR_codigo, TAR_serie, FORMAT(TAR_fechaemision, 'dd/MM/yyyy') AS FechaEmisionFormateada,FORMAT(TAR_fechavencimiento, 'dd/MM/yyyy') AS FechaVencimientoFormateada,
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
WHERE UNI_placa = 'M4-6753'
ORDER BY TAR_fechaemision DESC;
go


-- =================================================================
-- 2.- CONSULTA PARA MOSTRAR PAPELETAS NO PAGADAS
-- =================================================================
SELECT CONCAT(PER_nombre,' ', PER_apellidos ) AS Conductor,  FORMAT(PAP_fechaemision, 'dd/MM/yyyy HH:mm') AS FechaEmisionFormateada,PAP_monto 
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
WHERE UNI_placa IN ('M4-6753')
GO




-- CONSULTAS NUEVAS 
SELECT CONCAT(PER_nombre, ' ', PER_apellidos) AS Propietario, CONCAT(FORMAT(PAP_fechaemision, 'dd/MM/yyyy'),' ',PAP_hora) AS FechaEmisionFormateada, 
UNI_tarjetapropiedad,I.INF_descripcion,
PAP_monto, EST_descripcion
            
			FROM PAPELETA P
            INNER JOIN UNIDAD U ON U.UNI_codigo = P.UNI_codigo
            INNER JOIN PERSONA PER ON PER.PER_codigo = U.PRO_codigo
			INNER JOIN INFRACCION I ON I.INF_codigo = P.INF_codigo
			INNER JOIN ESTADO E ON E.EST_codigo = P.PAP_estado
            ORDER BY PAP_fechaemision






SELECT DISTINCT CONCAT(PER_apellidos,', ',PER_nombre) AS Conductor, ASO_razonsocial, rp.PAR_descripcion, rp.PAR_referencia
FROM UNIDAD U
left JOIN ASOCIACION A ON U.UNI_codigo=A.ASO_codigo
INNER JOIN PERSONA P ON P.PER_codigo=U.PRO_codigo
inner JOIN RESOLUCION R ON r.ASO_codigo = a.ASO_codigo
inner join RESOLUCION_PARADERO rp on rp.RES_codigo = r.RES_codigo
WHERE UNI_placa IN ('NG-42925')
GO

SELECT CONCAT(PER_nombre, ' ', PER_apellidos) AS Propietario, CONCAT(FORMAT(PAP_fechaemision, 'dd/MM/yyyy'),' ',PAP_hora) AS FechaEmisionFormateada, 
UNI_tarjetapropiedad,I.INF_descripcion,
PAP_monto, EST_descripcion
            
			FROM PAPELETA P
            INNER JOIN UNIDAD U ON U.UNI_codigo = P.UNI_codigo
            INNER JOIN PERSONA PER ON PER.PER_codigo = U.PRO_codigo
			INNER JOIN INFRACCION I ON I.INF_codigo = P.INF_codigo
			INNER JOIN ESTADO E ON E.EST_codigo = P.PAP_estado
            ORDER BY PAP_fechaemision



SELECT ASO_razonsocial, ASO_ruc, 
TAR_serie, FORMAT(TAR_fechaemision, 'dd/MM/yyyy') AS FechaEmisionFormateada,FORMAT(TAR_fechavencimiento, 'dd/MM/yyyy') AS FechaVencimientoFormateada,
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
WHERE UNI_placa = 'M4-6753'
ORDER BY TAR_fechaemision DESC;
go