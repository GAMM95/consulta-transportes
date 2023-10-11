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
SELECT count(*)
FROM UNIDAD;


/* Cantidad total de asociacione */
SELECT count(*)
FROM ASOCIACION;

/* Cantidad de papeletas no pagadas */
SELECT count(*)
FROM PAPELETA
WHERE PAP_fechapago IS NULL;


-- =================================================================
-- 1.- CONSULTA DE MOSTRAR DATOS DE LA ULTIMA TARJETA DE CIRCULACION
-- =================================================================
SELECT U.UNI_placa AS placa, TAR_serie AS numTarjeta,
    FORMAT(TAR_fechaemision, 'dd/MM/yyyy') AS fechaEmision, FORMAT(TAR_fechavencimiento, 'dd/MM/yyyy') AS fechaCaducidad, EST_descripcion AS estado, ASO_razonsocial AS asociacion,
    CONCAT(PER_apellidos,', ',PER_nombre) AS propietario
    FROM TARJETA_CIRCULACION  TJ
    INNER JOIN UNIDAD U ON U.UNI_codigo=TJ.UNI_codigo
    INNER JOIN PERSONA PER ON PER.PER_codigo = U.PRO_codigo
    INNER JOIN ASOCIACION A ON A.ASO_codigo=U.ASO_codigo
    LEFT JOIN RESOLUCION R ON R.ASO_codigo =A.ASO_codigo
    INNER JOIN MODELO M ON M.MOD_codigo = U.MOD_codigo
    INNER JOIN MARCA MA ON MA.MAR_codigo=M.MAR_codigo
    JOIN ESTADO E ON E.EST_codigo=TJ.TAR_estado
WHERE UNI_placa IN ('MD-24003')
ORDER BY TAR_fechaemision DESC
GO

-- PROCEDIMIENTO ALMACENADO DE LAS TARJETAS DE CIRCULACION
CREATE PROCEDURE DBO.SP_TarCir_mostrar(
    @UNI_placa VARCHAR(10)
)
AS
BEGIN
    SELECT CONCAT(PER_apellidos,', ',PER_nombre) AS propietario, ASO_razonsocial AS asociacion, ASO_ruc AS ruc, UNI_placa,
        TAR_serie AS serie,
        FORMAT(TAR_fechaemision, 'dd/MM/yyyy') AS fechaEmisionFormateada, FORMAT(TAR_fechavencimiento, 'dd/MM/yyyy') AS fechaVencimientoFormateada, RES_numero AS numero, UNI_aniofabrica AS anioFabricacion, UNI_motor AS motor, MOD_descripcion AS modelo, MAR_descripcion AS marca, EST_descripcion AS estado
    FROM TARJETA_CIRCULACION  TJ
        INNER JOIN UNIDAD U ON U.UNI_codigo=TJ.UNI_codigo
        INNER JOIN PERSONA PER ON PER.PER_codigo = U.PRO_codigo
        INNER JOIN ASOCIACION A ON A.ASO_codigo=U.ASO_codigo
        LEFT JOIN RESOLUCION R ON R.ASO_codigo =A.ASO_codigo
        INNER JOIN MODELO M ON M.MOD_codigo = U.MOD_codigo
        INNER JOIN MARCA MA ON MA.MAR_codigo=M.MAR_codigo
        JOIN ESTADO E ON E.EST_codigo=TJ.TAR_estado
    WHERE UNI_placa = @UNI_placa
    ORDER BY TAR_fechaemision DESC
END;
GO

-- =================================================================
-- 2.- CONSULTA PARA MOSTRAR PAPELETAS
-- =================================================================
SELECT CONCAT(PER_nombre, ', ', PER_apellidos) AS Propietario, CONCAT(FORMAT(PAP_fechaemision, 'dd/MM/yyyy'),' ',PAP_hora) AS fechaEmisionFormateada,
    UNI_tarjetapropiedad, I.INF_descripcion AS infraccion,
    PAP_monto AS monto, EST_descripcion AS estado   , UNI_placa
FROM PAPELETA P
    INNER JOIN UNIDAD U ON U.UNI_codigo = P.UNI_codigo
    INNER JOIN PERSONA PER ON PER.PER_codigo = U.PRO_codigo
    INNER JOIN INFRACCION I ON I.INF_codigo = P.INF_codigo
    INNER JOIN ESTADO E ON E.EST_codigo = P.PAP_estado
WHERE UNI_placa IN ('NC-68148') AND PAP_fechapago IS NULL
ORDER BY PAP_fechaemision
GO

-- PROCEDIMIENTO ALMACENADO PARA MOSTRAR PAPELETAS
CREATE PROCEDURE DBO.SP_Papeletas_mostrar(
    @UNI_placa VARCHAR(10)
)
AS
BEGIN
    SELECT CONCAT(PER_nombre, ', ', PER_apellidos) AS Propietario, CONCAT(FORMAT(PAP_fechaemision, 'dd/MM/yyyy'),' ',PAP_hora) AS fechaEmisionFormateada,
        UNI_tarjetapropiedad, I.INF_descripcion AS infraccion,
        PAP_monto AS monto, EST_descripcion AS estado   , UNI_placa
    FROM PAPELETA P
        INNER JOIN UNIDAD U ON U.UNI_codigo = P.UNI_codigo
        INNER JOIN PERSONA PER ON PER.PER_codigo = U.PRO_codigo
        INNER JOIN INFRACCION I ON I.INF_codigo = P.INF_codigo
        INNER JOIN ESTADO E ON E.EST_codigo = P.PAP_estado
    WHERE UNI_placa = @UNI_placa
    ORDER BY PAP_fechaemision
END;
GO

-- =================================================================
-- CONSULTA PARA MOSTRAR DATOS DE LOS PARADEROS
-- =================================================================
SELECT DISTINCT CONCAT(PER_apellidos,', ',PER_nombre) AS conductor, ASO_razonsocial as asociacion, rp.PAR_descripcion as direccion, UNI_placa, rp.PAR_referencia as referencia
FROM UNIDAD U
    left JOIN ASOCIACION A ON U.UNI_codigo=A.ASO_codigo
    INNER JOIN PERSONA P ON P.PER_codigo=U.PRO_codigo
    INNER JOIN RESOLUCION R ON r.ASO_codigo = a.ASO_codigo
    INNER JOIN RESOLUCION_PARADERO rp on rp.RES_codigo = r.RES_codigo
WHERE UNI_placa IN ('NC-68148')
GO

-- PROCEDIMIENTO ALMACENADO PARA MOSTRAR PARADEROS
CREATE PROCEDURE DBO.SP_Paraderos_mostrar(
    @UNI_placa VARCHAR(10)
)
AS
BEGIN
    SELECT DISTINCT (PER_apellidos + ', '+ PER_nombre) AS conductor, ASO_razonsocial as asociacion, rp.PAR_descripcion as direccion, UNI_placa, rp.PAR_referencia as referencia
    FROM UNIDAD U
        left JOIN ASOCIACION A ON U.UNI_codigo=A.ASO_codigo
        INNER JOIN PERSONA P ON P.PER_codigo=U.PRO_codigo
        INNER JOIN RESOLUCION R ON r.ASO_codigo = a.ASO_codigo
        INNER JOIN RESOLUCION_PARADERO rp on rp.RES_codigo = r.RES_codigo
    WHERE UNI_placa = @UNI_placa
END;
GO



-- =================================================================
-- PROCEDIMIENTO ALMACENADO PARA INICIAR SESION
-- =================================================================
CREATE PROCEDURE dbo.SP_Usuario_login
    @USU_usuario VARCHAR(15),
    @USU_password VARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT ua.USU_usuario, ua.USU_password, p.PER_nombre
    FROM USUARIO_APLICATIVO ua
        INNER JOIN PERSONA p ON p.PER_codigo = ua.PER_codigo
    WHERE ua.USU_usuario = @USU_usuario AND ua.USU_password = @USU_password;
END;
GO



----- OTRA FORMA DE PROCEDIMIENTO ALMACENADO

-- create procedure dbo.SP_Usuario_login
--     (
--     @USU_usuario VARCHAR (15),
--     @USU_password VARCHAR(10)
-- )
-- as
-- begin
--     SET NOCOUNT ON;
--     begin
--         declare @PER_nombre VARCHAR(50);

--         select @PER_nombre = p.PER_nombre
--         from USUARIO_APLICATIVO ua
--             inner join PERSONA p on p.PER_codigo = ua.PER_codigo
--         where USU_usuario = @USU_usuario and USU_password = @USU_password;

--         if (@PER_nombre is not null)
--         begin
--             -- Inicio de sesión exitoso, almacenar el nombre de la persona en la sesión
--             execute as login = @USU_usuario;
--             -- Para usar el nombre de usuario como contexto de sesión
--             set context_info @PER_nombre;
--             execute as login = null;
--         end

--         select @PER_nombre as PER_nombre;
--     -- Esto devuelve el nombre de la persona para verificar el inicio de sesión en tu código de aplicación
--     end
-- end;
-- go



SELECT *
FROM TARJETA_CIRCULACION