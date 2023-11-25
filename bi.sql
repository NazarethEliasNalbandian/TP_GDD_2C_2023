USE GD2C2023
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'SQLSQUAD')
BEGIN 
	EXEC ('CREATE SCHEMA SQLSQUAD')
END
GO
/* 
 * TABLE: Alquiler 
 */

CREATE TABLE SQLSQUAD.BI_Alquiler(
    ALQUILER_TIEMPO_ID            numeric(18, 0)    NOT NULL,
    ALQUILER_UBICACION_ID         numeric(18, 0)    NOT NULL,
    ALQUILER_RANGO_M2_ID          numeric(18, 0)    NOT NULL,
    ALQUILER_TIPO_INMUEBLE_ID     numeric(18, 0)    NOT NULL,
    ALQUILER_TIPO_OPERACION_ID    numeric(18, 0)    NOT NULL,
    ALQUILER_TIPO_MONEDA_ID       numeric(18, 0)    NOT NULL,
    ALQUILER_AMBIENTES_ID         numeric(18, 0)    NOT NULL,
    ALQUILER_RANGO_ETARIO_ID      numeric(18, 0)    NOT NULL,
    ALQUILER_SUCURSAL_CODIGO      numeric(18, 0)    NOT NULL,
    ALQUILER_PAGO_ID              numeric(18, 0)    NOT NULL,
    CONSTRAINT PK_ALQ PRIMARY KEY NONCLUSTERED (ALQUILER_TIEMPO_ID, ALQUILER_UBICACION_ID, ALQUILER_RANGO_M2_ID, ALQUILER_TIPO_INMUEBLE_ID, ALQUILER_TIPO_OPERACION_ID, ALQUILER_TIPO_MONEDA_ID, ALQUILER_AMBIENTES_ID, ALQUILER_RANGO_ETARIO_ID, ALQUILER_SUCURSAL_CODIGO, ALQUILER_PAGO_ID)
)
go



IF OBJECT_ID('SQLSQUAD.BI_Alquiler') IS NOT NULL
    PRINT '<<< CREATED TABLE SQLSQUAD.BI_Alquiler >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SQLSQUAD.BI_Alquiler >>>'
go

/* 
 * TABLE: Ambientes 
 */

CREATE TABLE SQLSQUAD.BI_Ambientes(
    AMBIENTES_ID        numeric(18, 0)    NOT NULL,
    AMBIENTES_NOMBRE    nvarchar(100)     NULL,
    CONSTRAINT PK_AMB PRIMARY KEY NONCLUSTERED (AMBIENTES_ID)
)
go



IF OBJECT_ID('SQLSQUAD.BI_Ambientes') IS NOT NULL
    PRINT '<<< CREATED TABLE SQLSQUAD.BI_Ambientes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SQLSQUAD.BI_Ambientes >>>'
go

/* 
 * TABLE: Anuncio 
 */

CREATE TABLE SQLSQUAD.BI_Anuncio(
    ANUNCIO_TIEMPO_ID            numeric(18, 0)    NOT NULL,
    ANUNCIO_AMBIENTES_ID         numeric(18, 0)    NOT NULL,
    ANUNCIO_UBICACION_ID         numeric(18, 0)    NOT NULL,
    ANUNCIO_TIPO_OPERACION_ID    numeric(18, 0)    NOT NULL,
    ANUNCIO_SUCURSAL_CODIGO      numeric(18, 0)    NOT NULL,
    ANUNCIO_TIPO_MONEDA_ID       numeric(18, 0)    NOT NULL,
    AANUNCIO_RANGO_M2_ID         numeric(18, 0)    NOT NULL,
    ANUNCIO_TIPO_INMUEBLE_ID     numeric(18, 0)    NOT NULL,
    ANUNCIO_RANGO_ETARIO_ID      numeric(18, 0)    NOT NULL,
    CONSTRAINT PK_ANU PRIMARY KEY NONCLUSTERED (ANUNCIO_TIEMPO_ID, ANUNCIO_AMBIENTES_ID, ANUNCIO_UBICACION_ID, ANUNCIO_TIPO_OPERACION_ID, ANUNCIO_SUCURSAL_CODIGO, ANUNCIO_TIPO_MONEDA_ID, AANUNCIO_RANGO_M2_ID, ANUNCIO_TIPO_INMUEBLE_ID, ANUNCIO_RANGO_ETARIO_ID)
)
go



IF OBJECT_ID('SQLSQUAD.BI_Anuncio') IS NOT NULL
    PRINT '<<< CREATED TABLE SQLSQUAD.BI_Anuncio >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SQLSQUAD.BI_Anuncio >>>'
go

/* 
 * TABLE: Pago 
 */

CREATE TABLE SQLSQUAD.BI_Pago(
    PAGO_ID                   numeric(18, 0)   IDENTITY(1,1),
    PAGO_FECHA_VENCIMIENTO    date              NULL,
    PAGO_FECHA                date              NULL,
    CONSTRAINT PK_PAGO PRIMARY KEY NONCLUSTERED (PAGO_ID)
)
go



IF OBJECT_ID('SQLSQUAD.BI_Pago') IS NOT NULL
    PRINT '<<< CREATED TABLE SQLSQUAD.BI_Pago >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SQLSQUAD.BI_Pago >>>'
go

/* 
 * TABLE: Rango_Etario 
 */

CREATE TABLE SQLSQUAD.BI_Rango_Etario(
    RANGO_ETARIO_ID    numeric(18, 0)    IDENTITY(1,1),
    MENOR_A_25         bit               NULL,
    MAYOR_A_55         bit               NULL,
    ENTRE_35_Y_50      bit               NULL,
    ENTRE_25_Y_35      bit               NULL,
    CONSTRAINT PK_ET PRIMARY KEY NONCLUSTERED (RANGO_ETARIO_ID)
)
go



IF OBJECT_ID('SQLSQUAD.BI_Rango_Etario') IS NOT NULL
    PRINT '<<< CREATED TABLE SQLSQUAD.BI_Rango_Etario >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SQLSQUAD.BI_Rango_Etario >>>'
go

/* 
 * TABLE: Rango_m2 
 */

CREATE TABLE SQLSQUAD.BI_Rango_m2(
    RANGO_M2_ID       numeric(18, 0)    IDENTITY(1,1),
    MAYOR_A_100       bit               NULL,
    ENTRE_75_Y_100    bit               NULL,
    ENTRE_55_75       bit               NOT NULL,
    ENTRE_35_Y_55     bit               NULL,
    MENOR_A_35        bit               NULL,
    CONSTRAINT PK_M2 PRIMARY KEY NONCLUSTERED (RANGO_M2_ID)
)
go



IF OBJECT_ID('SQLSQUAD.BI_Rango_m2') IS NOT NULL
    PRINT '<<< CREATED TABLE SQLSQUAD.BI_Rango_m2 >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SQLSQUAD.BI_Rango_m2 >>>'
go

/* 
 * TABLE: Sucursal 
 */

CREATE TABLE SQLSQUAD.BI_Sucursal(
    SUCURSAL_CODIGO       numeric(18, 0)    NOT NULL,
    SUCURSAL_NOMBRE       nvarchar(100)     NULL,
    SUCURSAL_DIRECCION    nvarchar(100)     NULL,
    SUCURSAL_TELEFONO     nvarchar(100)     NULL,
    CONSTRAINT PK_SUC PRIMARY KEY NONCLUSTERED (SUCURSAL_CODIGO)
)
go



IF OBJECT_ID('SQLSQUAD.BI_Sucursal') IS NOT NULL
    PRINT '<<< CREATED TABLE SQLSQUAD.BI_Sucursal >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SQLSQUAD.BI_Sucursal >>>'
go

/* 
 * TABLE: Tiempo 
 */

CREATE TABLE SQLSQUAD.BI_Tiempo(
    TIEMPO_ID              numeric(18, 0)    IDENTITY(1,1),
    TIEMPO_MES             int               NULL,
    TIEMPO_CUATRIMESTRE    int               NULL,
    TIEMPO_AÑO             int               NULL,
    TIEMPO_DIA             int               NULL,
    CONSTRAINT PK_TIE PRIMARY KEY NONCLUSTERED (TIEMPO_ID)
)
go



IF OBJECT_ID('SQLSQUAD.BI_Tiempo') IS NOT NULL
    PRINT '<<< CREATED TABLE SQLSQUAD.BI_Tiempo >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SQLSQUAD.BI_Tiempo >>>'
go

/* 
 * TABLE: Tipo_inmueble 
 */

CREATE TABLE SQLSQUAD.BI_Tipo_inmueble(
    TIPO_INMUEBLE_ID        numeric(18, 0)    NOT NULL,
    TIPO_INMUEBLE_NOMBRE    nvarchar(100)     NULL,
    CONSTRAINT PK_TIP_INM PRIMARY KEY NONCLUSTERED (TIPO_INMUEBLE_ID)
)
go



IF OBJECT_ID('SQLSQUAD.BI_Tipo_inmueble') IS NOT NULL
    PRINT '<<< CREATED TABLE SQLSQUAD.BI_Tipo_inmueble >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SQLSQUAD.BI_Tipo_inmueble >>>'
go

/* 
 * TABLE: Tipo_moneda 
 */

CREATE TABLE SQLSQUAD.BI_Tipo_moneda(
    TIPO_MONEDA_ID        numeric(18, 0)    NOT NULL,
    TIPO_MONEDA_NOMBRE    nvarchar(100)     NULL,
    CONSTRAINT PK_TIP_MON PRIMARY KEY NONCLUSTERED (TIPO_MONEDA_ID)
)
go



IF OBJECT_ID('SQLSQUAD.BI_Tipo_moneda') IS NOT NULL
    PRINT '<<< CREATED TABLE SQLSQUAD.BI_Tipo_moneda >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SQLSQUAD.BI_Tipo_moneda >>>'
go

/* 
 * TABLE: Tipo_operacion 
 */

CREATE TABLE SQLSQUAD.BI_Tipo_operacion(
    TIPO_OPERACION_ID        numeric(18, 0)    NOT NULL,
    TIPO_OPERACION_NOMBRE    nvarchar(100)     NULL,
    CONSTRAINT PK_TIP_OP PRIMARY KEY NONCLUSTERED (TIPO_OPERACION_ID)
)
go



IF OBJECT_ID('SQLSQUAD.BI_Tipo_operacion') IS NOT NULL
    PRINT '<<< CREATED TABLE SQLSQUAD.BI_Tipo_operacion >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SQLSQUAD.BI_Tipo_operacion >>>'
go

/* 
 * TABLE: Ubicacion 
 */

CREATE TABLE SQLSQUAD.BI_Ubicacion(
    UBICACION_ID            numeric(18, 0)    IDENTITY(1,1),
    UBICACION_BARRIO        nvarchar(100)     NULL,
    UBICACION_LOCALIDAD     nvarchar(100)     NULL,
    UBICACION_PROVINICIA    nvarchar(100)     NULL,
    CONSTRAINT PK_UBI PRIMARY KEY NONCLUSTERED (UBICACION_ID)
)
go



IF OBJECT_ID('SQLSQUAD.BI_Ubicacion') IS NOT NULL
    PRINT '<<< CREATED TABLE SQLSQUAD.BI_Ubicacion >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SQLSQUAD.BI_Ubicacion >>>'
go

/* 
 * TABLE: Venta_inmueble 
 */

CREATE TABLE SQLSQUAD.BI_Venta_inmueble(
    VENTA_TIEMPO_ID            numeric(18, 0)    NOT NULL,
    VENTA_RANGO_M2_ID          numeric(18, 0)    NOT NULL,
    VENTA_AMBIENTES_ID         numeric(18, 0)    NOT NULL,
    VENTA_TIPO_OPERACION_ID    numeric(18, 0)    NOT NULL,
    VENTA_TIPO_MONEDA_ID       numeric(18, 0)    NOT NULL,
    VENTA_TIPO_INMUEBLE_ID     numeric(18, 0)    NOT NULL,
    VENTA_UBICACION_ID         numeric(18, 0)    NOT NULL,
    VENTA_SUCURSAL_CODIGO      numeric(18, 0)    NOT NULL,
    CONSTRAINT PK_VEN_IN PRIMARY KEY NONCLUSTERED (VENTA_TIEMPO_ID, VENTA_RANGO_M2_ID, VENTA_AMBIENTES_ID, VENTA_TIPO_OPERACION_ID, VENTA_TIPO_MONEDA_ID, VENTA_TIPO_INMUEBLE_ID, VENTA_UBICACION_ID, VENTA_SUCURSAL_CODIGO)
)
go



IF OBJECT_ID('SQLSQUAD.BI_Venta_inmueble') IS NOT NULL
    PRINT '<<< CREATED TABLE SQLSQUAD.BI_Venta_inmueble >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SQLSQUAD.BI_Venta_inmueble >>>'
go

/* 
 * TABLE: Alquiler 
 */

ALTER TABLE SQLSQUAD.BI_Alquiler ADD CONSTRAINT RefTiempo10 
    FOREIGN KEY (ALQUILER_TIEMPO_ID)
    REFERENCES SQLSQUAD.BI_Tiempo(TIEMPO_ID)
go

ALTER TABLE SQLSQUAD.BI_Alquiler ADD CONSTRAINT RefUbicacion11 
    FOREIGN KEY (ALQUILER_UBICACION_ID)
    REFERENCES SQLSQUAD.BI_Ubicacion(UBICACION_ID)
go

ALTER TABLE SQLSQUAD.BI_Alquiler ADD CONSTRAINT RefRango_m212 
    FOREIGN KEY (ALQUILER_RANGO_M2_ID)
    REFERENCES SQLSQUAD.BI_Rango_m2(RANGO_M2_ID)
go

ALTER TABLE SQLSQUAD.BI_Alquiler ADD CONSTRAINT RefTipo_inmueble13 
    FOREIGN KEY (ALQUILER_TIPO_INMUEBLE_ID)
    REFERENCES SQLSQUAD.BI_Tipo_inmueble(TIPO_INMUEBLE_ID)
go

ALTER TABLE SQLSQUAD.BI_Alquiler ADD CONSTRAINT RefTipo_operacion14 
    FOREIGN KEY (ALQUILER_TIPO_OPERACION_ID)
    REFERENCES SQLSQUAD.BI_Tipo_operacion(TIPO_OPERACION_ID)
go

ALTER TABLE SQLSQUAD.BI_Alquiler ADD CONSTRAINT RefTipo_moneda15 
    FOREIGN KEY (ALQUILER_TIPO_MONEDA_ID)
    REFERENCES SQLSQUAD.BI_Tipo_moneda(TIPO_MONEDA_ID)
go

ALTER TABLE SQLSQUAD.BI_Alquiler ADD CONSTRAINT RefAmbientes16 
    FOREIGN KEY (ALQUILER_AMBIENTES_ID)
    REFERENCES SQLSQUAD.BI_Ambientes(AMBIENTES_ID)
go

ALTER TABLE SQLSQUAD.BI_Alquiler ADD CONSTRAINT RefRango_Etario17 
    FOREIGN KEY (ALQUILER_RANGO_ETARIO_ID)
    REFERENCES SQLSQUAD.BI_Rango_Etario(RANGO_ETARIO_ID)
go

ALTER TABLE SQLSQUAD.BI_Alquiler ADD CONSTRAINT RefSucursal18 
    FOREIGN KEY (ALQUILER_SUCURSAL_CODIGO)
    REFERENCES SQLSQUAD.BI_Sucursal(SUCURSAL_CODIGO)
go

ALTER TABLE SQLSQUAD.BI_Alquiler ADD CONSTRAINT RefPago28 
    FOREIGN KEY (ALQUILER_PAGO_ID)
    REFERENCES SQLSQUAD.BI_Pago(PAGO_ID)
go


/* 
 * TABLE: Anuncio 
 */

ALTER TABLE SQLSQUAD.BI_Anuncio ADD CONSTRAINT RefTiempo1 
    FOREIGN KEY (ANUNCIO_TIEMPO_ID)
    REFERENCES SQLSQUAD.BI_Tiempo(TIEMPO_ID)
go

ALTER TABLE SQLSQUAD.BI_Anuncio ADD CONSTRAINT RefAmbientes2 
    FOREIGN KEY (ANUNCIO_AMBIENTES_ID)
    REFERENCES SQLSQUAD.BI_Ambientes(AMBIENTES_ID)
go

ALTER TABLE SQLSQUAD.BI_Anuncio ADD CONSTRAINT RefUbicacion3 
    FOREIGN KEY (ANUNCIO_UBICACION_ID)
    REFERENCES SQLSQUAD.BI_Ubicacion(UBICACION_ID)
go

ALTER TABLE SQLSQUAD.BI_Anuncio ADD CONSTRAINT RefTipo_operacion4 
    FOREIGN KEY (ANUNCIO_TIPO_OPERACION_ID)
    REFERENCES SQLSQUAD.BI_Tipo_operacion(TIPO_OPERACION_ID)
go

ALTER TABLE SQLSQUAD.BI_Anuncio ADD CONSTRAINT RefSucursal5 
    FOREIGN KEY (ANUNCIO_SUCURSAL_CODIGO)
    REFERENCES SQLSQUAD.BI_Sucursal(SUCURSAL_CODIGO)
go

ALTER TABLE SQLSQUAD.BI_Anuncio ADD CONSTRAINT RefRango_Etario6 
    FOREIGN KEY (ANUNCIO_RANGO_ETARIO_ID)
    REFERENCES SQLSQUAD.BI_Rango_Etario(RANGO_ETARIO_ID)
go

ALTER TABLE SQLSQUAD.BI_Anuncio ADD CONSTRAINT RefTipo_moneda7 
    FOREIGN KEY (ANUNCIO_TIPO_MONEDA_ID)
    REFERENCES SQLSQUAD.BI_Tipo_moneda(TIPO_MONEDA_ID)
go

ALTER TABLE SQLSQUAD.BI_Anuncio ADD CONSTRAINT RefRango_m28 
    FOREIGN KEY (AANUNCIO_RANGO_M2_ID)
    REFERENCES SQLSQUAD.BI_Rango_m2(RANGO_M2_ID)
go

ALTER TABLE SQLSQUAD.BI_Anuncio ADD CONSTRAINT RefTipo_inmueble9 
    FOREIGN KEY (ANUNCIO_TIPO_INMUEBLE_ID)
    REFERENCES SQLSQUAD.BI_Tipo_inmueble(TIPO_INMUEBLE_ID)
go


/* 
 * TABLE: Venta_inmueble 
 */

ALTER TABLE SQLSQUAD.BI_Venta_inmueble ADD CONSTRAINT RefTiempo19 
    FOREIGN KEY (VENTA_TIEMPO_ID)
    REFERENCES SQLSQUAD.BI_Tiempo(TIEMPO_ID)
go

ALTER TABLE SQLSQUAD.BI_Venta_inmueble ADD CONSTRAINT RefRango_m220 
    FOREIGN KEY (VENTA_RANGO_M2_ID)
    REFERENCES SQLSQUAD.BI_Rango_m2(RANGO_M2_ID)
go

ALTER TABLE SQLSQUAD.BI_Venta_inmueble ADD CONSTRAINT RefAmbientes21 
    FOREIGN KEY (VENTA_AMBIENTES_ID)
    REFERENCES SQLSQUAD.BI_Ambientes(AMBIENTES_ID)
go

ALTER TABLE SQLSQUAD.BI_Venta_inmueble ADD CONSTRAINT RefTipo_operacion22 
    FOREIGN KEY (VENTA_TIPO_OPERACION_ID)
    REFERENCES SQLSQUAD.BI_Tipo_operacion(TIPO_OPERACION_ID)
go

ALTER TABLE SQLSQUAD.BI_Venta_inmueble ADD CONSTRAINT RefTipo_moneda23 
    FOREIGN KEY (VENTA_TIPO_MONEDA_ID)
    REFERENCES SQLSQUAD.BI_Tipo_moneda(TIPO_MONEDA_ID)
go

ALTER TABLE SQLSQUAD.BI_Venta_inmueble ADD CONSTRAINT RefTipo_inmueble25 
    FOREIGN KEY (VENTA_TIPO_INMUEBLE_ID)
    REFERENCES SQLSQUAD.BI_Tipo_inmueble(TIPO_INMUEBLE_ID)
go

ALTER TABLE SQLSQUAD.BI_Venta_inmueble ADD CONSTRAINT RefUbicacion26 
    FOREIGN KEY (VENTA_UBICACION_ID)
    REFERENCES SQLSQUAD.BI_Ubicacion(UBICACION_ID)
go

ALTER TABLE SQLSQUAD.BI_Venta_inmueble ADD CONSTRAINT RefSucursal27 
    FOREIGN KEY (VENTA_SUCURSAL_CODIGO)
    REFERENCES SQLSQUAD.BI_Sucursal(SUCURSAL_CODIGO)
go
-------------------------- FUNCIONES ----------------------------

CREATE FUNCTION SQLSQUAD.SignoMoneda(@moneda nvarchar(100))
RETURNS char(4)
AS
BEGIN
	 RETURN (SELECT CASE WHEN @moneda = 'Moneda Pesos' THEN '$'
						 WHEN @moneda = 'Moneda Dolares' THEN 'USD'
						 END)
END

GO
CREATE FUNCTION SQLSQUAD.noCumplioPago(@fecha_pago datetime, @fecha_vencimiento datetime)
RETURNS int
BEGIN
	 RETURN (SELECT CASE WHEN @fecha_vencimiento > @fecha_pago THEN 1
						 ELSE 0
						 END)
END

GO
CREATE FUNCTION SQLSQUAD.mayorA100(@superficie numeric(18,2))
RETURNS int
BEGIN
     IF @superficie > 100
		RETURN 1
	  
	 RETURN 0
END

GO
CREATE FUNCTION SQLSQUAD.entre75Y100(@superficie numeric(18,2))
RETURNS int
BEGIN
     IF @superficie >= 75 AND @superficie < 100
		RETURN 1
	  
	 RETURN 0
END

GO
CREATE FUNCTION SQLSQUAD.entre55Y75(@superficie numeric(18,2))
RETURNS int
BEGIN
     IF @superficie >= 55 AND @superficie < 75
		RETURN 1
	  
	 RETURN 0
END

GO
CREATE FUNCTION SQLSQUAD.entre35Y55(@superficie numeric(18,2))
RETURNS int
BEGIN
     IF @superficie >= 35 AND @superficie < 55
		RETURN 1
	  
	 RETURN 0
END
GO
CREATE FUNCTION SQLSQUAD.menorA35(@superficie numeric(18,2))
RETURNS int
BEGIN
     IF @superficie < 35
		RETURN 1
	  
	 RETURN 0
END
GO
-------------------------- PROCEDIMIENTOS ----------------------------


CREATE PROCEDURE MigrarDatosBI_Tipo_Operacion
AS
BEGIN
	INSERT INTO SQLSQUAD.BI_Tipo_Operacion(TIPO_OPERACION_ID, TIPO_OPERACION_NOMBRE)
    SELECT  TIP_OP.TIPO_OPERACION_ID, TIP_OP.TIPO_OPERACION_NOMBRE
    FROM SQLSQUAD.tipo_operacion TIP_OP
END

GO
CREATE PROCEDURE MigrarDatosBI_Rango_m2
AS
BEGIN
	 INSERT INTO SQLSQUAD.BI_Rango_m2(MAYOR_A_100, ENTRE_75_Y_100, ENTRE_55_75, ENTRE_35_Y_55, MENOR_A_35)
	 SELECT SQLSQUAD.mayorA100(INMUEBLE_SUPERFICIETOTAL), SQLSQUAD.entre75Y100(INMUEBLE_SUPERFICIETOTAL), SQLSQUAD.entre55Y75(INMUEBLE_SUPERFICIETOTAL), SQLSQUAD.entre35Y55(INMUEBLE_SUPERFICIETOTAL), SQLSQUAD.menorA35(INMUEBLE_SUPERFICIETOTAL) FROM SQLSQUAD.inmueble
END

GO
CREATE PROCEDURE MigrarDatosBI_Tipo_Moneda
AS
BEGIN
	INSERT INTO SQLSQUAD.BI_Tipo_Moneda(TIPO_MONEDA_ID, TIPO_MONEDA_NOMBRE)
    SELECT  TIP_MON.MONEDA_ID, TIP_MON.MONEDA_NOMBRE
    FROM SQLSQUAD.moneda TIP_MON
END

--1. Duración promedio (en días) que se encuentran publicados los anuncios
--según el tipo de operación (alquiler, venta, etc), barrio y ambientes para cada
--cuatrimestre de cada año. Se consideran todos los anuncios que se dieron de alta
--en ese cuatrimestre. La duración se calcula teniendo en cuenta la fecha de alta y
--la fecha de finalización.


CREATE VIEW SQLSQUAD.duracion_promedio
AS
SELECT DISTINCT TIEMPO_AÑO, TIEMPO_CUATRIMESTRE, TIPO_OPERACION_NOMBRE, UBICACION_BARRIO, AMBIENTES_NOMBRE, AVG(TIEMPO_DIA) FROM Anuncio
JOIN Tiempo ON TIEMPO_ID = ANUNCIO_TIEMPO_ID
JOIN Tipo_Operacion ON TIPO_OPERACION_ID = ANUNCIO_TIPO_OPERACION_ID
JOIN Ubicacion ON UBICACION_ID = ANUNCIO_UBICACION_ID
JOIN Ambientes ON AMBIENTES_ID = ANUNCIO_AMBIENTES_ID
GROUP BY TIEMPO_AÑO, TIEMPO_CUATRIMESTRE, TIPO_OPERACION_NOMBRE, UBICACION_BARRIO, AMBIENTES_NOMBRE

--2. Precio promedio de los anuncios de inmuebles según el tipo de operación
--(alquiler, venta, etc), tipo de inmueble y rango m2 para cada cuatrimestre/año.
--Se consideran todos los anuncios que se dieron de alta en ese cuatrimestre. El
--precio se debe expresar en el tipo de moneda que corresponda, identificando de
--cuál se trata.

CREATE VIEW SQLSQUAD.precio_promedio
AS
SELECT DISTINCT TIEMPO_AÑO, TIEMPO_CUATRIMESTRE, TIPO_OPERACION_NOMBRE, TIPO_INMUEBLE_NOMBRE, MAYOR_A_100, ENTRE_75_Y_100, ENTRE_55_75, ENTRE_35_Y_55, MENOR_A_35 , SQLSQUAD.SignoMoneda(TIPO_MONEDA_NOMBRE) + ' '+ AVG(ANUNCIO_COSTO_ANUNCIO), TIPO_MONEDA_NOMBRE FROM Anuncio
JOIN Tipo_Operacion ON TIPO_OPERACION_ID = ANUNCIO_TIPO_OPERACION_ID
JOIN Tipo_Inmueble ON TIPO_INMUEBLE_ID = ANUNCIO_TIPO_INMUEBLE_ID
JOIN Rango_m2 ON RANGO_M2_ID = ANUNCIO_RANGO_M2_ID
JOIN Tiempo ON TIEMPO_ID = ANUNCIO_TIEMPO_ID
JOIN Moneda ON TIPO_MONEDA_ID = ANUNCIO_TIPO_MONEDA_ID
GROUP BY TIEMPO_AÑO, TIEMPO_CUATRIMESTRE, TIPO_OPERACION_NOMBRE, TIPO_INMUEBLE_NOMBRE, MAYOR_A_100, ENTRE_75_Y_100, ENTRE_55_75, ENTRE_35_Y_55, MENOR_A_35


--3. Los 5 barrios más elegidos para alquilar en función del rango etario de los
--inquilinos para cada cuatrimestre/año. Se calcula en función de los alquileres
--dados de alta en dicho periodo.

CREATE VIEW SQLSQUAD.barrios_mas_elegidos
AS
SELECT TOP 5 DISTINCT TIEMPO_AÑO, TIEMPO_CUATRIMESTRE, UBICACION_BARRIO, MENOR_A_25, MAYOR_A_55, ENTRE_25_Y_35, ENTRE_35_Y_50 FROM Alquiler
JOIN Ubicacion ON UBICACION_ID = ALQUILER_UBICACION_ID
JOIN Tiempo ON TIEMPO_ID = ALQUILER_TIEMPO_ID
GROUP BY TIEMPO_AÑO, TIEMPO_CUATRIMESTRE, UBICACION_BARRIO, MENOR_A_25, MAYOR_A_55, ENTRE_25_Y_35, ENTRE_35_Y_50
ORDER BY COUNT(*) DESC

--4. Porcentaje de incumplimiento de pagos de alquileres en término por cada
--mes/año. Se calcula en función de las fechas de pago y fecha de vencimiento del
--mismo. El porcentaje es en función del total de pagos en dicho periodo.

CREATE VIEW SQLSQUAD.incumplimiento_pagos
AS
SELECT TIEMPO_AÑO, TIEMPO_MES, SUM(SQLSQUAD.noCumplioPago(PAGO_FECHA, PAGO_FECHA_VENCIMIENTO))/COUNT(*)*100 FROM Alquiler
JOIN Pago ON PAGO_ID = ALQUILER_PAGO_ID
JOIN Tiempo ON TIEMPO_ID = ALQUILER_TIEMPO_ID
GROUP BY TIEMPO_AÑO, TIEMPO_MES

--5. Porcentaje promedio de incremento del valor de los alquileres para los
--contratos en curso por mes/año. Se calcula tomando en cuenta el último pago
--con respecto al del mes en curso, únicamente de aquellos alquileres que hayan
--tenido aumento y están activos.

CREATE VIEW SQLSQUAD.incremento
AS
SELECT TIEMPO_AÑO, TIEMPO_MES, AVG(PAGO_IMPORTE*100/
								  (SELECT PAGO_IMPORTE FROM Pago
									JOIN Alquiler ON PAGO_ID = ALQUILER_PAGO_ID
									WHERE TIEMPO_MES = MONTH(GETDATE()) 
									AND TIEMPO_AÑO = YEAR(GETDATE()))) 
FROM Alquiler
JOIN Pago ON PAGO_ID = ALQUILER_PAGO_ID
JOIN Tiempo ON TIEMPO_ID = ALQUILER_TIEMPO_ID
JOIN Estado ON ESTADO_ID = ALQUILER_ESTADO_ID
WHERE PAGO_IMPORTE < (SELECT PAGO_IMPORTE FROM Pago
					  JOIN Alquiler ON PAGO_ID = ALQUILER_PAGO_ID
						WHERE TIEMPO_MES = MONTH(GETDATE()) AND TIEMPO_AÑO = YEAR(GETDATE()))
	  AND ESTADO_NOMBRE = 'Activo'
GROUP BY TIEMPO_AÑO, TIEMPO_MES

--6. Precio promedio de m2 de la venta de inmuebles según el tipo de inmueble y
--la localidad para cada cuatrimestre/año. Se calcula en función de las ventas
--concretadas.

--7. Valor promedio de la comisión según el tipo de operación (alquiler, venta, etc)
--y sucursal para cada cuatrimestre/año. Se calcula en función de los alquileres y
--ventas concretadas dentro del periodo.


--8. Porcentaje de operaciones concretadas (tanto de alquileres como ventas) por
--cada sucursal, según el rango etario de los empleados por año en función de la
--cantidad de anuncios publicados en ese mismo año.

--9. Monto total de cierre de contratos por tipo de operación (tanto de alquileres
--como ventas) por cada cuatrimestre y sucursal, diferenciando el tipo de moneda.
