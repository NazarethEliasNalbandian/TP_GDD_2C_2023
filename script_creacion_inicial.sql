USE GD2C2023
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'SQLSQUAD')
BEGIN 
	EXEC ('CREATE SCHEMA SQLSQUAD')
END
GO

-------------------------------------
--------------- TABLES --------------
-------------------------------------

/* 
 * TABLE: agente 
 */

CREATE TABLE SQLSQUAD.agente(
    AGENTE_CODIGO             numeric(18, 0)    IDENTITY(1,1),
    AGENTE_FECHA_NAC          datetime          NULL,
    AGENTE_MAIL               nvarchar(100)     NULL,
    AGENTE_TELEFONO           numeric(18, 0)    NULL,
    AGENTE_FECHA_REGISTRO     datetime          NULL,
    AGENTE_DNI                numeric(18, 0)    NULL,
    AGENTE_APELLIDO           nvarchar(100)     NULL,
    AGENTE_NOMBRE             nvarchar(100)     NULL,
    AGENTE_SUCURSAL_CODIGO    numeric(18, 0)    NOT NULL,
    CONSTRAINT PK11 PRIMARY KEY NONCLUSTERED (AGENTE_CODIGO)
)
go

IF OBJECT_ID('agente') IS NOT NULL
    PRINT '<<< CREATED TABLE agente >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE agente >>>'
go

/* 
 * TABLE: alquiler 
 */

CREATE TABLE SQLSQUAD.alquiler(
    ALQUILER_CODIGO             numeric(18, 0)    IDENTITY(1,1),
    ALQUILER_GASTOS_AVERIGUA    numeric(18, 2)    NULL,
    ALQUILER_COMISION           numeric(18, 2)    NULL,
    ALQUILER_DEPOSITO           numeric(18, 2)    NULL,
    ALQUILER_DETALLE            numeric(18, 0)    NULL,
    ALQUILER_CANT_PERIODOS      numeric(18, 0)    NULL,
    ALQUILER_FECHA_FIN          datetime          NULL,
    ALQUILER_FECHA_INICIO       datetime          NOT NULL,
    ALQUILER_ANUNCIO_CODIGO     numeric(19, 0)    NOT NULL,
    ALQUILER_ESTADO_ALQUILER    numeric(18, 0)    NOT NULL,
    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (ALQUILER_CODIGO)
)
go



IF OBJECT_ID('alquiler') IS NOT NULL
    PRINT '<<< CREATED TABLE alquiler >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE alquiler >>>'
go

/* 
 * TABLE: anuncio 
 */

CREATE TABLE SQLSQUAD.anuncio(
    ANUNCIO_CODIGO                numeric(19, 0)    IDENTITY(1,1),
    ANUNCIO_COSTO_ANUNCIO         numeric(18, 2)    NULL,
    ANUNCIO_FECHA_FINALIZACION    datetime          NULL,
    ANUNCIO_PRECIO_PUBLICADO      numeric(18, 2)    NULL,
    ANUNCIO_FECHA_PUBLICACION     datetime          NULL,
    ANUNCIO_AGENTE_CODIGO         numeric(18, 0)    NOT NULL,
    ANUNCIO_INMUEBLE_CODIGO       numeric(18, 0)    NOT NULL,
    ANUNCIO_TIPO_OPERACION_ID     numeric(18, 0)    NOT NULL,
    ANUNCIO_MONEDA_ID             numeric(18, 0)    NOT NULL,
    ANUNCIO_ESTADO_ANUNCIO_ID     numeric(18, 0)    NOT NULL,
    ANUNCIO_TIPO_PERIODO_ID       numeric(18, 0)    NOT NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (ANUNCIO_CODIGO)
)
go



IF OBJECT_ID('anuncio') IS NOT NULL
    PRINT '<<< CREATED TABLE anuncio >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE anuncio >>>'
go

/* 
 * TABLE: barrio 
 */

CREATE TABLE SQLSQUAD.barrio(
    BARRIO_ID              numeric(18, 0)    IDENTITY(1,1),
    BARRIO_LOCALIDAD_ID    numeric(18, 0)    NOT NULL,
    BARRIO_NOMBRE          nvarchar(100)     NULL,
    CONSTRAINT PK17 PRIMARY KEY NONCLUSTERED (BARRIO_ID)
)
go



IF OBJECT_ID('barrio') IS NOT NULL
    PRINT '<<< CREATED TABLE barrio >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE barrio >>>'
go

/* 
 * TABLE: cant_ambientes 
 */

CREATE TABLE SQLSQUAD.cant_ambientes(
    CANT_AMBIENTES_ID        numeric(18, 0)    IDENTITY(1,1),
    CANT_AMBIENTES_NOMBRE    nvarchar(100)     NULL,
    CONSTRAINT PK19 PRIMARY KEY NONCLUSTERED (CANT_AMBIENTES_ID)
)
go



IF OBJECT_ID('cant_ambientes') IS NOT NULL
    PRINT '<<< CREATED TABLE cant_ambientes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cant_ambientes >>>'
go

/* 
 * TABLE: caracteristica 
 */

CREATE TABLE SQLSQUAD.caracteristica(
    CARACTERISTICA_ID        numeric(18, 0)    IDENTITY(1,1),
    CARACTERISTICA_NOMBRE    nvarchar(100)     NULL,
    CONSTRAINT PK23 PRIMARY KEY NONCLUSTERED (CARACTERISTICA_ID)
)
go



IF OBJECT_ID('caracteristica') IS NOT NULL
    PRINT '<<< CREATED TABLE caracteristica >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE caracteristica >>>'
go

/* 
 * TABLE: caracteristica_inmueble 
 */

CREATE TABLE SQLSQUAD.caracteristica_inmueble(
    CARACTERISTICA_INMUEBLE_CARACTERISTICA_ID    numeric(18, 0)    NOT NULL,
    CARACTERISTICA_INMUEBLE_INMUEBLE_CODIGO      numeric(18, 0)    NOT NULL,
    CONSTRAINT PK24 PRIMARY KEY NONCLUSTERED (CARACTERISTICA_INMUEBLE_CARACTERISTICA_ID, CARACTERISTICA_INMUEBLE_INMUEBLE_CODIGO)
)
go



IF OBJECT_ID('caracteristica_inmueble') IS NOT NULL
    PRINT '<<< CREATED TABLE caracteristica_inmueble >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE caracteristica_inmueble >>>'
go

/* 
 * TABLE: comprador 
 */

CREATE TABLE SQLSQUAD.comprador(
    COMPRADOR_CODIGO            numeric(18, 0)    IDENTITY(1,1),
    COMPRADOR_FECHA_NAC         datetime          NULL,
    COMPRADOR_MAIL              nvarchar(100)     NULL,
    COMPRADOR_TELEFONO          numeric(18, 0)    NULL,
    COMPRADOR_FECHA_REGISTRO    datetime          NULL,
    COMPRADOR_DNI               numeric(18, 0)    NULL,
    COMPRADOR_APELLIDO          nvarchar(100)     NULL,
    COMPRADOR_NOMBRE            nvarchar(100)     NULL,
    CONSTRAINT PK10 PRIMARY KEY NONCLUSTERED (COMPRADOR_CODIGO)
)
go



IF OBJECT_ID('comprador') IS NOT NULL
    PRINT '<<< CREATED TABLE comprador >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE comprador >>>'
go

/* 
 * TABLE: detalle_alquiler 
 */

CREATE TABLE SQLSQUAD.detalle_alquiler(
    DETALLE_CODIGO                 numeric(18, 0)    IDENTITY(1,1),
    DETALLE_ALQ_PRECIO             numeric(18, 2)    NULL,
    DETALLE_ALQ_NRO_PERIODO_INI    numeric(18, 0)    NULL,
    DETALLE_ALQ_NRO_PERIODO_FIN    numeric(18, 0)    NULL,
    DETALLE_ALQUILER_CODIGO        numeric(18, 0)    NOT NULL,
    CONSTRAINT PK5 PRIMARY KEY NONCLUSTERED (DETALLE_CODIGO)
)
go



IF OBJECT_ID('detalle_alquiler') IS NOT NULL
    PRINT '<<< CREATED TABLE detalle_alquiler >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE detalle_alquiler >>>'
go

/* 
 * TABLE: direccion 
 */

CREATE TABLE SQLSQUAD.direccion(
    DIRECCION_ID                   numeric(18, 0)    IDENTITY(1,1),
    DIRECCION_PISO_DEPARTAMENTO    numeric(18, 0)    NULL,
    DIRECCION_NUMERO_CALLE         numeric(18, 0)    NOT NULL,
    DIRECCION_CALLE                nvarchar(100)     NOT NULL,
    DIRECCION_BARRIO_ID            numeric(18, 0)    NULL,
    CONSTRAINT PK25 PRIMARY KEY NONCLUSTERED (DIRECCION_ID)
)
go



IF OBJECT_ID('direccion') IS NOT NULL
    PRINT '<<< CREATED TABLE direccion >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE direccion >>>'
go

/* 
 * TABLE: disposicion 
 */

CREATE TABLE SQLSQUAD.disposicion(
    DISPOSICION_ID        numeric(18, 0)    IDENTITY(1,1),
    DISPOSICION_NOMBRE    nvarchar(100)     NULL,
    CONSTRAINT PK20 PRIMARY KEY NONCLUSTERED (DISPOSICION_ID)
)
go



IF OBJECT_ID('disposicion') IS NOT NULL
    PRINT '<<< CREATED TABLE disposicion >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE disposicion >>>'
go

/* 
 * TABLE: estado_alquiler 
 */

CREATE TABLE SQLSQUAD.estado_alquiler(
    ESTADO_ALQUILER_ID        numeric(18, 0)    IDENTITY(1,1),
    ESTADO_ALQUILER_NOMBRE    nvarchar(100)     NOT NULL,
    CONSTRAINT PK29 PRIMARY KEY NONCLUSTERED (ESTADO_ALQUILER_ID)
)
go



IF OBJECT_ID('estado_alquiler') IS NOT NULL
    PRINT '<<< CREATED TABLE estado_alquiler >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE estado_alquiler >>>'
go

/* 
 * TABLE: estado_anuncio 
 */

CREATE TABLE SQLSQUAD.estado_anuncio(
    ESTADO_ANUNCIO_ID        numeric(18, 0)    IDENTITY(1,1),
    ESTADO_ANUNCIO_NOMBRE    nvarchar(100)     NULL,
    CONSTRAINT PK28 PRIMARY KEY NONCLUSTERED (ESTADO_ANUNCIO_ID)
)
go



IF OBJECT_ID('estado_anuncio') IS NOT NULL
    PRINT '<<< CREATED TABLE estado_anuncio >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE estado_anuncio >>>'
go

/* 
 * TABLE: estado_inmueble 
 */

CREATE TABLE SQLSQUAD.estado_inmueble(
    ESTADO_INMUEBLE_ID        numeric(18, 0)    IDENTITY(1,1),
    ESTADO_INMUEBLE_NOMBRE    nvarchar(100)     NOT NULL,
    CONSTRAINT PK22 PRIMARY KEY NONCLUSTERED (ESTADO_INMUEBLE_ID)
)
go



IF OBJECT_ID('estado_inmueble') IS NOT NULL
    PRINT '<<< CREATED TABLE estado_inmueble >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE estado_inmueble >>>'
go

/* 
 * TABLE: inmueble 
 */

CREATE TABLE SQLSQUAD.inmueble(
    INMUEBLE_CODIGO                numeric(18, 0)    NOT NULL,
    INMUEBLE_NOMBRE                nvarchar(100)     NULL,
    INMUEBLE_EXPESAS               numeric(18, 2)    NULL,
    INMUEBLE_ANTIGUEDAD            numeric(18, 0)    NULL,
    INMUEBLE_SUPERFICIETOTAL       numeric(18, 2)    NULL,
    INMUEBLE_DESCRIPCION           nvarchar(100)     NULL,
    INMUEBLE_TIPO_INMUEBLE_ID      numeric(18, 0)    NOT NULL,
    INMUEBLE_DISPOSICION_ID        numeric(18, 0)    NOT NULL,
    INMUEBLE_ORIENTACION_ID        numeric(18, 0)    NOT NULL,
    INMUEBLE_ESTADO_INMUEBLE_ID    numeric(18, 0)    NOT NULL,
    INMUEBLE_CANT_AMBIENTES_ID     numeric(18, 0)    NOT NULL,
    INMUEBLE_DIRECCION_ID          numeric(18, 0)    NOT NULL,
    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (INMUEBLE_CODIGO)
)
go



IF OBJECT_ID('inmueble') IS NOT NULL
    PRINT '<<< CREATED TABLE inmueble >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE inmueble >>>'
go

/* 
 * TABLE: inmueble_propietario 
 */

CREATE TABLE SQLSQUAD.inmueble_propietario(
    INMUEBLE_PROPIETARIO_PROPIETARIO_CODIGO    numeric(18, 0)    NOT NULL,
    INMUEBLE_PROPIETARIO_INMUEBLE_CODIGO       numeric(18, 0)    NOT NULL,
    CONSTRAINT PK31 PRIMARY KEY NONCLUSTERED (INMUEBLE_PROPIETARIO_PROPIETARIO_CODIGO, INMUEBLE_PROPIETARIO_INMUEBLE_CODIGO)
)
go



IF OBJECT_ID('inmueble_propietario') IS NOT NULL
    PRINT '<<< CREATED TABLE inmueble_propietario >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE inmueble_propietario >>>'
go

/* 
 * TABLE: inquilino 
 */

CREATE TABLE SQLSQUAD.inquilino(
    INQUILINO_CODIGO            numeric(18, 0)    IDENTITY(1,1),
    INQUILINO_FECHA_NAC         datetime          NULL,
    INQUILINO_FECHA_REGISTRO    datetime          NULL,
    INQUILINO_MAIL              nvarchar(100)     NULL,
    INQUILINO_TELEFONO          numeric(18, 0)    NULL,
    INQUILINO_APELLIDO          nvarchar(100)     NULL,
    INQUILINO_NOMBRE            nvarchar(100)     NULL,
    INQUILINO_DNI               numeric(18, 0)    NULL,
    CONSTRAINT PK6 PRIMARY KEY NONCLUSTERED (INQUILINO_CODIGO)
)
go



IF OBJECT_ID('inquilino') IS NOT NULL
    PRINT '<<< CREATED TABLE inquilino >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE inquilino >>>'
go

/* 
 * TABLE: inquilino_alquiler 
 */

CREATE TABLE SQLSQUAD.inquilino_alquiler(
    INQUILINO_ALQUILER_ALQUILER_CODIGO     numeric(18, 0)    NOT NULL,
    INQUILINO_ALQUILER_INQUILINO_CODIGO    numeric(18, 0)    NOT NULL,
    CONSTRAINT PK32 PRIMARY KEY NONCLUSTERED (INQUILINO_ALQUILER_ALQUILER_CODIGO, INQUILINO_ALQUILER_INQUILINO_CODIGO)
)
go



IF OBJECT_ID('inquilino_alquiler') IS NOT NULL
    PRINT '<<< CREATED TABLE inquilino_alquiler >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE inquilino_alquiler >>>'
go

/* 
 * TABLE: localidad 
 */

CREATE TABLE SQLSQUAD.localidad(
    LOCALIDAD_ID              numeric(18, 0)    IDENTITY(1,1),
    LOCALIDAD_PROVINCIA_ID    numeric(18, 0)    NOT NULL,
    LOCALIDAD_NOMBRE          nvarchar(100)     NOT NULL,
    CONSTRAINT PK16 PRIMARY KEY NONCLUSTERED (LOCALIDAD_ID)
)
go



IF OBJECT_ID('localidad') IS NOT NULL
    PRINT '<<< CREATED TABLE localidad >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE localidad >>>'
go

/* 
 * TABLE: medio_pago 
 */

CREATE TABLE SQLSQUAD.medio_pago(
    MEDIO_PAGO_ID        numeric(18, 0)    IDENTITY(1,1),
    MEDIO_PAGO_NOMBRE    nvarchar(100)     NOT NULL,
    CONSTRAINT PK30 PRIMARY KEY NONCLUSTERED (MEDIO_PAGO_ID)
)
go



IF OBJECT_ID('medio_pago') IS NOT NULL
    PRINT '<<< CREATED TABLE medio_pago >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE medio_pago >>>'
go

/* 
 * TABLE: moneda 
 */

CREATE TABLE SQLSQUAD.moneda(
    MONEDA_ID        numeric(18, 0)    IDENTITY(1,1),
    MONEDA_NOMBRE    nvarchar(100)     NOT NULL,
    CONSTRAINT PK26 PRIMARY KEY NONCLUSTERED (MONEDA_ID)
)
go



IF OBJECT_ID('moneda') IS NOT NULL
    PRINT '<<< CREATED TABLE moneda >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE moneda >>>'
go

/* 
 * TABLE: orientacion 
 */

CREATE TABLE SQLSQUAD.orientacion(
    ORIENTACION_ID        numeric(18, 0)    IDENTITY(1,1),
    ORIENTACION_NOMBRE    nvarchar(100)     NULL,
    CONSTRAINT PK21 PRIMARY KEY NONCLUSTERED (ORIENTACION_ID)
)
go



IF OBJECT_ID('orientacion') IS NOT NULL
    PRINT '<<< CREATED TABLE orientacion >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE orientacion >>>'
go

/* 
 * TABLE: pago_alquiler 
 */

CREATE TABLE SQLSQUAD.pago_alquiler(
    PAGO_ALQUILER_CODIGO               numeric(18, 0)    IDENTITY(1,1),
    PAGO_ALQUILER_FECHA_VENCIMIENTO    datetime          NULL,
    PAGO_ALQUILER_IMPORTE              numeric(18, 2)    NULL,
    PAGO_ALQUILER_FEC_FIN              datetime          NULL,
    PAGO_ALQUILER_FEC_INI              datetime          NULL,
    PAGO_ALQUILER_DESC                 nvarchar(100)     NULL,
    PAGO_ALQUILER_NRO_PERIODO          numeric(18, 0)    NULL,
    PAGO_ALQUILER_FECHA                datetime          NULL,
    PAGO_ALQUILER_ALQUILER_CODIGO      numeric(18, 0)    NOT NULL,
    PAGO_ALQUILER_MEDIO_PAGO_ID        numeric(18, 0)    NOT NULL,
    CONSTRAINT PK7 PRIMARY KEY NONCLUSTERED (PAGO_ALQUILER_CODIGO)
)
go



IF OBJECT_ID('pago_alquiler') IS NOT NULL
    PRINT '<<< CREATED TABLE pago_alquiler >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE pago_alquiler >>>'
go

/* 
 * TABLE: pago_venta 
 */

CREATE TABLE SQLSQUAD.pago_venta(
    PAGO_VENTA_CODIGO           numeric(18, 0)    IDENTITY(1,1),
    PAGO_VENTA_COTIZACION       numeric(18, 2)    NULL,
    PAGO_VENTA_IMPORTE          numeric(18, 2)    NULL,
    PAGO_VENTA_VENTA_CODIGO     numeric(18, 0)    NOT NULL,
    PAGO_VENTA_MONEDA_ID        numeric(18, 0)    NOT NULL,
    PAGO_VENTA_MEDIO_PAGO_ID    numeric(18, 0)    NOT NULL,
    CONSTRAINT PK8 PRIMARY KEY NONCLUSTERED (PAGO_VENTA_CODIGO)
)
go



IF OBJECT_ID('pago_venta') IS NOT NULL
    PRINT '<<< CREATED TABLE pago_venta >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE pago_venta >>>'
go

/* 
 * TABLE: propietario 
 */

CREATE TABLE SQLSQUAD.propietario(
    PROPIETARIO_CODIGO            numeric(18, 0)    IDENTITY(1,1),
    PROPIETARIO_FECHA_NAC         datetime          NULL,
    PROPIETARIO_MAIL              nvarchar(255)     NULL,
    PROPIETARIO_TELEFONO          numeric(18, 0)    NULL,
    PROPIETARIO_FECHA_REGISTRO    datetime          NULL,
    PROPIETARIO_DNI               numeric(18, 0)    NULL,
    PROPIETARIO_APELLIDO          nvarchar(100)     NULL,
    PROPIETARIO_NOMBRE            nvarchar(100)     NULL,
    CONSTRAINT PK13 PRIMARY KEY NONCLUSTERED (PROPIETARIO_CODIGO)
)
go



IF OBJECT_ID('propietario') IS NOT NULL
    PRINT '<<< CREATED TABLE propietario >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE propietario >>>'
go

/* 
 * TABLE: provincia 
 */

CREATE TABLE SQLSQUAD.provincia(
    PROVINCIA_ID        numeric(18, 0)    IDENTITY(1,1),
    PROVINCIA_NOMBRE    nvarchar(100)     NULL,
    CONSTRAINT PK18 PRIMARY KEY NONCLUSTERED (PROVINCIA_ID)
)
go



IF OBJECT_ID('provincia') IS NOT NULL
    PRINT '<<< CREATED TABLE provincia >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE provincia >>>'
go

/* 
 * TABLE: sucursal 
 */

CREATE TABLE SQLSQUAD.sucursal(
    SUCURSAL_CODIGO          numeric(18, 0)    NOT NULL,
    SUCURSAL_TELEFONO        nvarchar(100)     NULL,
    SUCURSAL_NOMBRE          nvarchar(100)     NULL,
    SUCURSAL_DIRECCION_ID    numeric(18, 0)    NOT NULL,
    CONSTRAINT PK12 PRIMARY KEY NONCLUSTERED (SUCURSAL_CODIGO)
)
go



IF OBJECT_ID('sucursal') IS NOT NULL
    PRINT '<<< CREATED TABLE sucursal >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE sucursal >>>'
go

/* 
 * TABLE: tipo_inmueble 
 */

CREATE TABLE SQLSQUAD.tipo_inmueble(
    TIPO_INMUEBLE_ID        numeric(18, 0)    IDENTITY(1,1),
    TIPO_INMUEBLE_NOMBRE    nvarchar(100)     NOT NULL,
    CONSTRAINT PK15 PRIMARY KEY NONCLUSTERED (TIPO_INMUEBLE_ID)
)
go



IF OBJECT_ID('tipo_inmueble') IS NOT NULL
    PRINT '<<< CREATED TABLE tipo_inmueble >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE tipo_inmueble >>>'
go

/* 
 * TABLE: tipo_operacion 
 */

CREATE TABLE SQLSQUAD.tipo_operacion(
    TIPO_OPERACION_ID        numeric(18, 0)    IDENTITY(1,1),
    TIPO_OPERACION_NOMBRE    nvarchar(100)     NOT NULL,
    CONSTRAINT PK14 PRIMARY KEY NONCLUSTERED (TIPO_OPERACION_ID)
)
go



IF OBJECT_ID('tipo_operacion') IS NOT NULL
    PRINT '<<< CREATED TABLE tipo_operacion >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE tipo_operacion >>>'
go

/* 
 * TABLE: tipo_periodo 
 */

CREATE TABLE SQLSQUAD.tipo_periodo(
    TIPO_PERIODO_ID        numeric(18, 0)    IDENTITY(1,1),
    TIPO_PERIODO_NOMBRE    nvarchar(100)     NOT NULL,
    CONSTRAINT PK15_1 PRIMARY KEY NONCLUSTERED (TIPO_PERIODO_ID)
)
go



IF OBJECT_ID('tipo_periodo') IS NOT NULL
    PRINT '<<< CREATED TABLE tipo_periodo >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE tipo_periodo >>>'
go

/* 
 * TABLE: venta 
 */

CREATE TABLE SQLSQUAD.venta(
    VENTA_CODIGO              numeric(18, 0)    IDENTITY(1,1),
    VENTA_COMISION            numeric(18, 2)    NULL,
    VENTA_PRECIO_VENTA        numeric(18, 2)    NULL,
    VENTA_FECHA               datetime          NULL,
    VENTA_ANUNCIO_CODIGO      numeric(19, 0)    NOT NULL,
    VENTA_COMPRADOR_CODIGO    numeric(18, 0)    NOT NULL,
    VENTA_MONEDA_ID           numeric(18, 0)    NOT NULL,
    CONSTRAINT PK9 PRIMARY KEY NONCLUSTERED (VENTA_CODIGO)
)
go



IF OBJECT_ID('venta') IS NOT NULL
    PRINT '<<< CREATED TABLE venta >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE venta >>>'
go

/* 
 * TABLE: agente 
 */

ALTER TABLE SQLSQUAD.agente ADD CONSTRAINT Refsucursal9 
    FOREIGN KEY (AGENTE_SUCURSAL_CODIGO)
    REFERENCES SQLSQUAD.sucursal(SUCURSAL_CODIGO)
go


/* 
 * TABLE: alquiler 
 */

ALTER TABLE SQLSQUAD.alquiler ADD CONSTRAINT Refestado_alquiler36 
    FOREIGN KEY (ALQUILER_ESTADO_ALQUILER)
    REFERENCES SQLSQUAD.estado_alquiler(ESTADO_ALQUILER_ID)
go

ALTER TABLE SQLSQUAD.alquiler ADD CONSTRAINT Refanuncio13 
    FOREIGN KEY (ALQUILER_ANUNCIO_CODIGO)
    REFERENCES SQLSQUAD.anuncio(ANUNCIO_CODIGO)
go


/* 
 * TABLE: anuncio 
 */

ALTER TABLE SQLSQUAD.anuncio ADD CONSTRAINT Reftipo_periodo49 
    FOREIGN KEY (ANUNCIO_TIPO_PERIODO_ID)
    REFERENCES SQLSQUAD.tipo_periodo(TIPO_PERIODO_ID)
go

ALTER TABLE SQLSQUAD.anuncio ADD CONSTRAINT Refagente7 
    FOREIGN KEY (ANUNCIO_AGENTE_CODIGO)
    REFERENCES SQLSQUAD.agente(AGENTE_CODIGO)
go

ALTER TABLE SQLSQUAD.anuncio ADD CONSTRAINT Refinmueble12 
    FOREIGN KEY (ANUNCIO_INMUEBLE_CODIGO)
    REFERENCES SQLSQUAD.inmueble(INMUEBLE_CODIGO)
go

ALTER TABLE SQLSQUAD.anuncio ADD CONSTRAINT Reftipo_operacion17 
    FOREIGN KEY (ANUNCIO_TIPO_OPERACION_ID)
    REFERENCES SQLSQUAD.tipo_operacion(TIPO_OPERACION_ID)
go

ALTER TABLE SQLSQUAD.anuncio ADD CONSTRAINT Refmoneda33 
    FOREIGN KEY (ANUNCIO_MONEDA_ID)
    REFERENCES SQLSQUAD.moneda(MONEDA_ID)
go

ALTER TABLE SQLSQUAD.anuncio ADD CONSTRAINT Refestado_anuncio35 
    FOREIGN KEY (ANUNCIO_ESTADO_ANUNCIO_ID)
    REFERENCES SQLSQUAD.estado_anuncio(ESTADO_ANUNCIO_ID)
go


/* 
 * TABLE: barrio 
 */

ALTER TABLE SQLSQUAD.barrio ADD CONSTRAINT Reflocalidad30 
    FOREIGN KEY (BARRIO_LOCALIDAD_ID)
    REFERENCES SQLSQUAD.localidad(LOCALIDAD_ID)
go


/* 
 * TABLE: caracteristica_inmueble 
 */

ALTER TABLE SQLSQUAD.caracteristica_inmueble ADD CONSTRAINT Refcaracteristica27 
    FOREIGN KEY (CARACTERISTICA_INMUEBLE_CARACTERISTICA_ID)
    REFERENCES SQLSQUAD.caracteristica(CARACTERISTICA_ID)
go

ALTER TABLE SQLSQUAD.caracteristica_inmueble ADD CONSTRAINT Refinmueble28 
    FOREIGN KEY (CARACTERISTICA_INMUEBLE_INMUEBLE_CODIGO)
    REFERENCES SQLSQUAD.inmueble(INMUEBLE_CODIGO)
go


/* 
 * TABLE: detalle_alquiler 
 */

ALTER TABLE SQLSQUAD.detalle_alquiler ADD CONSTRAINT Refalquiler2 
    FOREIGN KEY (DETALLE_ALQUILER_CODIGO)
    REFERENCES SQLSQUAD.alquiler(ALQUILER_CODIGO)
go


/* 
 * TABLE: direccion 
 */

ALTER TABLE SQLSQUAD.direccion ADD CONSTRAINT Refbarrio31 
    FOREIGN KEY (DIRECCION_BARRIO_ID)
    REFERENCES SQLSQUAD.barrio(BARRIO_ID)
go


/* 
 * TABLE: inmueble 
 */

ALTER TABLE SQLSQUAD.inmueble ADD CONSTRAINT Reftipo_inmueble18 
    FOREIGN KEY (INMUEBLE_TIPO_INMUEBLE_ID)
    REFERENCES SQLSQUAD.tipo_inmueble(TIPO_INMUEBLE_ID)
go

ALTER TABLE SQLSQUAD.inmueble ADD CONSTRAINT Refcant_ambientes22 
    FOREIGN KEY (INMUEBLE_CANT_AMBIENTES_ID)
    REFERENCES SQLSQUAD.cant_ambientes(CANT_AMBIENTES_ID)
go

ALTER TABLE SQLSQUAD.inmueble ADD CONSTRAINT Refdisposicion23 
    FOREIGN KEY (INMUEBLE_DISPOSICION_ID)
    REFERENCES SQLSQUAD.disposicion(DISPOSICION_ID)
go

ALTER TABLE SQLSQUAD.inmueble ADD CONSTRAINT Reforientacion24 
    FOREIGN KEY (INMUEBLE_ORIENTACION_ID)
    REFERENCES SQLSQUAD.orientacion(ORIENTACION_ID)
go

ALTER TABLE SQLSQUAD.inmueble ADD CONSTRAINT Refestado_inmueble25 
    FOREIGN KEY (INMUEBLE_ESTADO_INMUEBLE_ID)
    REFERENCES SQLSQUAD.estado_inmueble(ESTADO_INMUEBLE_ID)
go

ALTER TABLE SQLSQUAD.inmueble ADD CONSTRAINT Refdireccion32 
    FOREIGN KEY (INMUEBLE_DIRECCION_ID)
    REFERENCES SQLSQUAD.direccion(DIRECCION_ID)
go


/* 
 * TABLE: inmueble_propietario 
 */

ALTER TABLE SQLSQUAD.inmueble_propietario ADD CONSTRAINT Refpropietario44 
    FOREIGN KEY (INMUEBLE_PROPIETARIO_PROPIETARIO_CODIGO)
    REFERENCES SQLSQUAD.propietario(PROPIETARIO_CODIGO)
go

ALTER TABLE SQLSQUAD.inmueble_propietario ADD CONSTRAINT Refinmueble45 
    FOREIGN KEY (INMUEBLE_PROPIETARIO_INMUEBLE_CODIGO)
    REFERENCES SQLSQUAD.inmueble(INMUEBLE_CODIGO)
go


/* 
 * TABLE: inquilino_alquiler 
 */

ALTER TABLE SQLSQUAD.inquilino_alquiler ADD CONSTRAINT Refinquilino46 
    FOREIGN KEY (INQUILINO_ALQUILER_INQUILINO_CODIGO)
    REFERENCES SQLSQUAD.inquilino(INQUILINO_CODIGO)
go

ALTER TABLE SQLSQUAD.inquilino_alquiler ADD CONSTRAINT Refalquiler47 
    FOREIGN KEY (INQUILINO_ALQUILER_ALQUILER_CODIGO)
    REFERENCES SQLSQUAD.alquiler(ALQUILER_CODIGO)
go


/* 
 * TABLE: localidad 
 */

ALTER TABLE SQLSQUAD.localidad ADD CONSTRAINT Refprovincia29 
    FOREIGN KEY (LOCALIDAD_PROVINCIA_ID)
    REFERENCES SQLSQUAD.provincia(PROVINCIA_ID)
go


/* 
 * TABLE: pago_alquiler 
 */

ALTER TABLE SQLSQUAD.pago_alquiler ADD CONSTRAINT Refmedio_pago37 
    FOREIGN KEY (PAGO_ALQUILER_MEDIO_PAGO_ID)
    REFERENCES SQLSQUAD.medio_pago(MEDIO_PAGO_ID)
go

ALTER TABLE SQLSQUAD.pago_alquiler ADD CONSTRAINT Refalquiler14 
    FOREIGN KEY (PAGO_ALQUILER_ALQUILER_CODIGO)
    REFERENCES SQLSQUAD.alquiler(ALQUILER_CODIGO)
go


/* 
 * TABLE: pago_venta 
 */

ALTER TABLE SQLSQUAD.pago_venta ADD CONSTRAINT Refmoneda38 
    FOREIGN KEY (PAGO_VENTA_MONEDA_ID)
    REFERENCES SQLSQUAD.moneda(MONEDA_ID)
go

ALTER TABLE SQLSQUAD.pago_venta ADD CONSTRAINT Refmedio_pago40 
    FOREIGN KEY (PAGO_VENTA_MEDIO_PAGO_ID)
    REFERENCES SQLSQUAD.medio_pago(MEDIO_PAGO_ID)
go

ALTER TABLE SQLSQUAD.pago_venta ADD CONSTRAINT Refventa16 
    FOREIGN KEY (PAGO_VENTA_VENTA_CODIGO)
    REFERENCES SQLSQUAD.venta(VENTA_CODIGO)
go


/* 
 * TABLE: sucursal 
 */

ALTER TABLE SQLSQUAD.sucursal ADD CONSTRAINT Refdireccion42 
    FOREIGN KEY (SUCURSAL_DIRECCION_ID)
    REFERENCES SQLSQUAD.direccion(DIRECCION_ID)
go


/* 
 * TABLE: venta 
 */

ALTER TABLE SQLSQUAD.venta ADD CONSTRAINT Refmoneda39 
    FOREIGN KEY (VENTA_MONEDA_ID)
    REFERENCES SQLSQUAD.moneda(MONEDA_ID)
go

ALTER TABLE SQLSQUAD.venta ADD CONSTRAINT Refanuncio3 
    FOREIGN KEY (VENTA_ANUNCIO_CODIGO)
    REFERENCES SQLSQUAD.anuncio(ANUNCIO_CODIGO)
go

ALTER TABLE SQLSQUAD.venta ADD CONSTRAINT Refcomprador5 
    FOREIGN KEY (VENTA_COMPRADOR_CODIGO)
    REFERENCES SQLSQUAD.comprador(COMPRADOR_CODIGO)
go

--------------------------------------
------------ FUNCTIONS ---------------
--------------------------------------

-- FUNCIÓN QUE RECIBE UNA DIRECCIÓN Y DEVUELVE EL NOMBRE DE LA CALLE
GO
CREATE FUNCTION SQLSQUAD.NombreCalle (@direccion nvarchar(100))
RETURNS nvarchar(100)
AS
BEGIN
    RETURN (SELECT CASE WHEN CHARINDEX(' ', REVERSE(@direccion)) > 0 THEN LEFT(@direccion, LEN(@direccion) - CHARINDEX(' ', REVERSE(@direccion)))
						ELSE @direccion
						END)
END

-- FUNCIÓN QUE RECIBE UNA DIRECCIÓN Y DEVUELVE EL NÚMERO DE CALLE
GO
CREATE FUNCTION SQLSQUAD.NumeroCalle (@direccion nvarchar(100))
RETURNS numeric(18,0)
AS
BEGIN
    DECLARE @posicionEspacio int;
    SET @posicionEspacio = CHARINDEX(' ', REVERSE(@direccion))

    RETURN RIGHT(@direccion, @posicionEspacio - 1)
END

-- FUNCIÓN QUE RECIBE UNA CALLE Y SU NÚMERO Y DEVUELVE LA DIRECCIÓN
GO
CREATE FUNCTION SQLSQUAD.DireccionCompleta (@nombreCalle nvarchar(100), @numeroCalle numeric(18,0))
RETURNS nvarchar(100)
AS
BEGIN
    RETURN @nombreCalle + ' ' + CAST(@numeroCalle AS nvarchar(100))
END

--------------------------------------
------------ PROCEDURES --------------
--------------------------------------

GO
CREATE PROCEDURE SQLSQUAD.MigrarDatosPropietario
AS
BEGIN
    INSERT INTO SQLSQUAD.Propietario (PROPIETARIO_FECHA_NAC, PROPIETARIO_MAIL, PROPIETARIO_TELEFONO, PROPIETARIO_FECHA_REGISTRO, PROPIETARIO_DNI, PROPIETARIO_APELLIDO, PROPIETARIO_NOMBRE)
    SELECT DISTINCT
        PROPIETARIO_FECHA_NAC,
        PROPIETARIO_MAIL,
        PROPIETARIO_TELEFONO,
        PROPIETARIO_FECHA_REGISTRO,
        PROPIETARIO_DNI,
        PROPIETARIO_APELLIDO,
        PROPIETARIO_NOMBRE
    FROM
        gd_esquema.Maestra
    WHERE
        PROPIETARIO_DNI IS NOT NULL
END
GO

CREATE PROCEDURE SQLSQUAD.MigrarDatosComprador
AS
BEGIN
    INSERT INTO SQLSQUAD.Comprador (COMPRADOR_FECHA_NAC, COMPRADOR_MAIL, COMPRADOR_TELEFONO, COMPRADOR_FECHA_REGISTRO, COMPRADOR_DNI, COMPRADOR_APELLIDO, COMPRADOR_NOMBRE)
    SELECT DISTINCT
        COMPRADOR_FECHA_NAC,
        COMPRADOR_MAIL,
        COMPRADOR_TELEFONO,
        COMPRADOR_FECHA_REGISTRO,
        COMPRADOR_DNI,
        COMPRADOR_APELLIDO,
        COMPRADOR_NOMBRE
    FROM
        gd_esquema.Maestra
    WHERE
        COMPRADOR_DNI IS NOT NULL
END
GO

CREATE PROCEDURE SQLSQUAD.MigrarDatosInquilino
AS
BEGIN
    INSERT INTO SQLSQUAD.Inquilino (INQUILINO_FECHA_NAC, INQUILINO_MAIL, INQUILINO_TELEFONO, INQUILINO_FECHA_REGISTRO, INQUILINO_DNI, INQUILINO_APELLIDO, INQUILINO_NOMBRE)
    SELECT DISTINCT
        INQUILINO_FECHA_NAC,
        INQUILINO_MAIL,
        INQUILINO_TELEFONO,
        INQUILINO_FECHA_REGISTRO,
        INQUILINO_DNI,
        INQUILINO_APELLIDO,
        INQUILINO_NOMBRE
    FROM
        gd_esquema.Maestra
	WHERE INQUILINO_DNI IS NOT NULL
END
GO

CREATE PROCEDURE SQLSQUAD.MigrarDatosEstadoAnuncio
AS
BEGIN
    INSERT INTO SQLSQUAD.estado_anuncio (ESTADO_ANUNCIO_NOMBRE)
    SELECT DISTINCT
        ANUNCIO_ESTADO
    FROM
        gd_esquema.Maestra
	WHERE ANUNCIO_ESTADO IS NOT NULL
END
GO

CREATE PROCEDURE SQLSQUAD.MigrarDatosCantAmbientes
AS
BEGIN
    INSERT INTO SQLSQUAD.cant_ambientes (CANT_AMBIENTES_NOMBRE)
    SELECT DISTINCT
        INMUEBLE_CANT_AMBIENTES
    FROM
        gd_esquema.Maestra
	WHERE INMUEBLE_CANT_AMBIENTES IS NOT NULL
END
GO

CREATE PROCEDURE SQLSQUAD.MigrarDatosDisposicion
AS
BEGIN
    INSERT INTO SQLSQUAD.disposicion (DISPOSICION_NOMBRE)
    SELECT DISTINCT
        INMUEBLE_DISPOSICION
    FROM
        gd_esquema.Maestra
	WHERE INMUEBLE_DISPOSICION IS NOT NULL
END
GO

CREATE PROCEDURE SQLSQUAD.MigrarDatosTipoInmueble
AS
BEGIN
    INSERT INTO SQLSQUAD.tipo_inmueble (TIPO_INMUEBLE_NOMBRE)
    SELECT DISTINCT
        INMUEBLE_TIPO_INMUEBLE
    FROM
        gd_esquema.Maestra
	WHERE INMUEBLE_TIPO_INMUEBLE IS NOT NULL
END
GO


CREATE PROCEDURE SQLSQUAD.MigrarDatosOrientacion
AS
BEGIN
    INSERT INTO SQLSQUAD.orientacion (ORIENTACION_NOMBRE)
    SELECT DISTINCT
        INMUEBLE_ORIENTACION
    FROM
        gd_esquema.Maestra
	WHERE INMUEBLE_ORIENTACION IS NOT NULL
END
GO

GO
CREATE PROCEDURE SQLSQUAD.MigrarDatosEstadoInmueble
AS
BEGIN
    INSERT INTO SQLSQUAD.estado_inmueble (ESTADO_INMUEBLE_NOMBRE)
    SELECT DISTINCT
        INMUEBLE_ESTADO
    FROM
        gd_esquema.Maestra
	WHERE INMUEBLE_ESTADO IS NOT NULL
END
GO

CREATE PROCEDURE SQLSQUAD.MigrarDatosTipoPeriodo
AS
BEGIN
    INSERT INTO SQLSQUAD.tipo_periodo(TIPO_PERIODO_NOMBRE)
    SELECT DISTINCT
        ANUNCIO_TIPO_PERIODO
    FROM
        gd_esquema.Maestra
	WHERE ANUNCIO_TIPO_PERIODO IS NOT NULL
END
GO

CREATE PROCEDURE SQLSQUAD.MigrarDatosTipoOperacion
AS
BEGIN
    INSERT INTO SQLSQUAD.tipo_operacion(TIPO_OPERACION_NOMBRE)
    SELECT DISTINCT
        ANUNCIO_TIPO_OPERACION
    FROM
        gd_esquema.Maestra
	WHERE ANUNCIO_TIPO_OPERACION IS NOT NULL
END
GO

CREATE PROCEDURE SQLSQUAD.MigrarDatosMoneda
AS
BEGIN
    INSERT INTO SQLSQUAD.moneda(MONEDA_NOMBRE)
    SELECT DISTINCT
        ANUNCIO_MONEDA
    FROM
        gd_esquema.Maestra
	WHERE ANUNCIO_MONEDA IS NOT NULL
	UNION
	SELECT PAGO_VENTA_MONEDA FROM gd_esquema.Maestra
	WHERE PAGO_VENTA_MONEDA IS NOT NULL
END
GO

CREATE PROCEDURE SQLSQUAD.MigrarDatosProvincia
AS
BEGIN
    INSERT INTO SQLsquad.provincia(PROVINCIA_NOMBRE)
    SELECT DISTINCT
        INMUEBLE_PROVINCIA
    FROM
        gd_esquema.Maestra
	WHERE INMUEBLE_PROVINCIA IS NOT NULL
	UNION
	SELECT SUCURSAL_PROVINCIA FROM gd_esquema.Maestra
END
GO

CREATE PROCEDURE SQLSQUAD.MigrarDatosLocalidad
AS
BEGIN
    INSERT INTO SQLSQUAD.localidad(LOCALIDAD_NOMBRE, LOCALIDAD_PROVINCIA_ID)
    SELECT DISTINCT
        INMUEBLE_LOCALIDAD, P.PROVINCIA_ID
    FROM gd_esquema.Maestra
	JOIN SQLSQUAD.provincia P ON P.PROVINCIA_NOMBRE = INMUEBLE_PROVINCIA
	WHERE INMUEBLE_LOCALIDAD IS NOT NULL
	UNION
	SELECT SUCURSAL_LOCALIDAD, P.PROVINCIA_ID FROM gd_esquema.Maestra
	JOIN SQLSQUAD.provincia P ON P.PROVINCIA_NOMBRE = SUCURSAL_PROVINCIA
	WHERE SUCURSAL_LOCALIDAD IS NOT NULL
END

GO

CREATE PROCEDURE SQLSQUAD.MigrarDatosBarrio
AS
BEGIN
    INSERT INTO SQLSQUAD.barrio(BARRIO_NOMBRE, BARRIO_LOCALIDAD_ID)
    SELECT DISTINCT
        INMUEBLE_BARRIO, LOCALIDAD_ID
    FROM gd_esquema.Maestra
	JOIN SQLSQUAD.localidad ON LOCALIDAD_ID = (SELECT LOCALIDAD_ID FROM SQLSQUAD.localidad
												WHERE LOCALIDAD_NOMBRE = INMUEBLE_LOCALIDAD AND INMUEBLE_PROVINCIA = (SELECT PROVINCIA_NOMBRE FROM SQLSQUAD.provincia
																														WHERE LOCALIDAD_PROVINCIA_ID = PROVINCIA_ID))
	WHERE INMUEBLE_LOCALIDAD IS NOT NULL
END
GO

CREATE PROCEDURE SQLSQUAD.MigrarDatosDireccion
AS
BEGIN
    INSERT INTO SQLSQUAD.direccion(DIRECCION_CALLE, DIRECCION_NUMERO_CALLE, DIRECCION_BARRIO_ID)
    SELECT DISTINCT
        SQLSQUAD.NombreCalle(INMUEBLE_DIRECCION) AS [Nombre de Calle], SQLSQUAD.NumeroCalle(INMUEBLE_DIRECCION) [Numero de calle], BARRIO_ID
    FROM gd_esquema.Maestra
	JOIN SQLSQUAD.barrio ON BARRIO_ID = (SELECT BARRIO_ID FROM SQLSQUAD.barrio
											WHERE BARRIO_NOMBRE = INMUEBLE_BARRIO AND INMUEBLE_LOCALIDAD = (SELECT LOCALIDAD_NOMBRE FROM SQLSQUAD.localidad
																												WHERE BARRIO_LOCALIDAD_ID = LOCALIDAD_ID AND INMUEBLE_PROVINCIA = (SELECT PROVINCIA_NOMBRE FROM SQLSQUAD.provincia
																																															WHERE LOCALIDAD_PROVINCIA_ID = PROVINCIA_ID)))
	WHERE INMUEBLE_BARRIO IS NOT NULL
	UNION
	SELECT DISTINCT SQLSQUAD.NombreCalle(SUCURSAL_DIRECCION), SQLSQUAD.NumeroCalle(SUCURSAL_DIRECCION), NULL FROM gd_esquema.Maestra
END
GO

CREATE PROCEDURE SQLSQUAD.MigrarDatosSucursal
AS
BEGIN
    INSERT INTO SQLSQUAD.sucursal(SUCURSAL_CODIGO, SUCURSAL_NOMBRE, SUCURSAL_TELEFONO, SUCURSAL_DIRECCION_ID)
    SELECT DISTINCT
		SUCURSAL_CODIGO,
		SUCURSAL_NOMBRE,
		SUCURSAL_TELEFONO,
		DIRECCION_ID
    FROM gd_esquema.Maestra
	JOIN SQLSQUAD.direccion ON DIRECCION_ID = (SELECT DIRECCION_ID FROM SQLSQUAD.direccion
												 WHERE SQLSQUAD.DireccionCompleta(DIRECCION_CALLE, DIRECCION_NUMERO_CALLE) = SUCURSAL_DIRECCION)
END
GO

CREATE PROCEDURE SQLSQUAD.MigrarDatosMedioPago
AS
BEGIN
    INSERT INTO SQLSQUAD.medio_pago(MEDIO_PAGO_NOMBRE)
    SELECT DISTINCT
        PAGO_ALQUILER_MEDIO_PAGO
    FROM gd_esquema.Maestra
	WHERE PAGO_ALQUILER_MEDIO_PAGO IS NOT NULL
	UNION
	SELECT PAGO_VENTA_MEDIO_PAGO FROM gd_esquema.Maestra
		WHERE PAGO_VENTA_MEDIO_PAGO IS NOT NULL
END
GO

CREATE PROCEDURE SQLSQUAD.MigrarDatosAgente
AS
BEGIN
	INSERT INTO SQLSQUAD.agente(AGENTE_DNI, AGENTE_NOMBRE, AGENTE_APELLIDO, AGENTE_FECHA_REGISTRO, AGENTE_TELEFONO, AGENTE_MAIL, AGENTE_FECHA_NAC, AGENTE_SUCURSAL_CODIGO)
    SELECT DISTINCT
		AGENTE_DNI, AGENTE_NOMBRE, AGENTE_APELLIDO

		O, AGENTE_FECHA_REGISTRO, AGENTE_TELEFONO, AGENTE_MAIL,AGENTE_FECHA_NAC, S.SUCURSAL_CODIGO
    FROM gd_esquema.Maestra G
	JOIN SQLSQUAD.sucursal S ON G.SUCURSAL_CODIGO = S.SUCURSAL_CODIGO
END

--caracteristica

CREATE PROCEDURE SQLSQUAD.MigrarDatosCaracteristica
AS
BEGIN
    INSERT INTO SQLSQUAD.caracteristica(CARACTERISTICA_NOMBRE)
	VALUES ('WIFI'), ('CABLE'), ('CALEFACCION'), ('GAS')
END
GO

--------------------------------------
---------- DATA MIGRATION ------------
--------------------------------------

GO
BEGIN TRANSACTION
	-- DATOS PROPIETARIO
	EXEC SQLSQUAD.MigrarDatosPropietario

	EXEC SQLSQUAD.MigrarDatosInquilino
	EXEC SQLSQUAD.MigrarDatosComprador

	-- DATOS INMUEBLE
	EXEC SQLSQUAD.MigrarDatosCantAmbientes
	EXEC SQLSQUAD.MigrarDatosDisposicion
	EXEC SQLSQUAD.MigrarDatosEstadoInmueble
	EXEC SQLSQUAD.MigrarDatosTipoInmueble
	EXEC SQLSQUAD.MigrarDatosOrientacion
	EXEC SQLSQUAD.MigrarDatosCaracteristica

	-- DATOS ANUNCIO
	EXEC SQLSQUAD.MigrarDatosEstadoAnuncio
	EXEC SQLSQUAD.MigrarDatosTipoPeriodo
	EXEC SQLSQUAD.MigrarDatosTipoOperacion

	-- DATOS MONEDA
	EXEC SQLSQUAD.MigrarDatosMoneda

	-- DATOS MEDIO PAGO
	EXEC SQLSQUAD.MigrarDatosMedioPago

	-- DATOS UBICACION
	EXEC SQLSQUAD.MigrarDatosProvincia
	EXEC SQLSQUAD.MigrarDatosLocalidad
	EXEC SQLSQUAD.MigrarDatosBarrio
	EXEC SQLSQUAD.MigrarDatosDireccion
	EXEC SQLSQUAD.MigrarDatosSucursal

	-- DATOS AGENTE
	EXEC SQLSQUAD.MigrarDatosAgente

	-- DATOS INMUEBLE
	EXEC SQLSQUAD.MigrarDatosInmueble

COMMIT TRANSACTION