USE [master]
GO
/****** Object:  Database [TRANSPORTE]    Script Date: 23/08/2023 17:59:10 ******/
CREATE DATABASE [TRANSPORTE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TRANSPORTE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TRANSPORTE.mdf' , SIZE = 21504KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TRANSPORTE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TRANSPORTE_1.ldf' , SIZE = 2614848KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TRANSPORTE] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TRANSPORTE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TRANSPORTE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TRANSPORTE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TRANSPORTE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TRANSPORTE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TRANSPORTE] SET ARITHABORT OFF 
GO
ALTER DATABASE [TRANSPORTE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TRANSPORTE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TRANSPORTE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TRANSPORTE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TRANSPORTE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TRANSPORTE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TRANSPORTE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TRANSPORTE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TRANSPORTE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TRANSPORTE] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TRANSPORTE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TRANSPORTE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TRANSPORTE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TRANSPORTE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TRANSPORTE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TRANSPORTE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TRANSPORTE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TRANSPORTE] SET RECOVERY FULL 
GO
ALTER DATABASE [TRANSPORTE] SET  MULTI_USER 
GO
ALTER DATABASE [TRANSPORTE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TRANSPORTE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TRANSPORTE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TRANSPORTE] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TRANSPORTE] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TRANSPORTE] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TRANSPORTE', N'ON'
GO
ALTER DATABASE [TRANSPORTE] SET QUERY_STORE = OFF
GO
USE [TRANSPORTE]
GO
/****** Object:  Table [dbo].[ASEGURADORA]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ASEGURADORA](
	[ASE_codigo] [int] IDENTITY(1,1) NOT NULL,
	[ASE_descripcion] [varchar](150) NULL,
	[ASE_RUC] [char](11) NULL,
	[ASE_estado] [int] NULL,
 CONSTRAINT [PK__ASEGURAD__DFF995C07F60ED59] PRIMARY KEY CLUSTERED 
(
	[ASE_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ASEGURADORA_VEHICULO]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ASEGURADORA_VEHICULO](
	[UNI_codigo] [int] NOT NULL,
	[ASE_codigo] [int] NOT NULL,
	[ASV_numerocertificado] [varchar](20) NULL,
	[ASV_fechaemision] [datetime] NULL,
	[ASV_fechavencimiento] [datetime] NULL,
	[ASV_estado] [int] NULL,
	[ASV_tiposeguro] [int] NULL,
 CONSTRAINT [PK__ASEGURAD__C1E9CBC103317E3D] PRIMARY KEY CLUSTERED 
(
	[UNI_codigo] ASC,
	[ASE_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ASOCIACION]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ASOCIACION](
	[ASO_codigo] [int] IDENTITY(1,1) NOT NULL,
	[ASO_ruc] [char](11) NOT NULL,
	[ASO_razonsocial] [varchar](150) NULL,
	[ASO_telefono] [varchar](10) NULL,
	[ASO_direccion] [varchar](200) NULL,
	[ASO_colores] [varchar](150) NULL,
	[ASO_fechafundacion] [datetime] NULL,
	[ASO_presidente] [int] NULL,
	[ASO_estado] [int] NULL,
	[ASO_observacion] [varchar](150) NULL,
 CONSTRAINT [PK__ASOCIACI__5567684F07020F21] PRIMARY KEY CLUSTERED 
(
	[ASO_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CARNET_CAPACITACION]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CARNET_CAPACITACION](
	[TCA_codigo] [int] IDENTITY(1,1) NOT NULL,
	[PER_codigo] [int] NULL,
	[TCA_serie] [int] NULL,
	[TCA_fecha_curso] [datetime] NULL,
	[TCA_fecha_venci] [datetime] NULL,
	[TCA_estado] [int] NULL,
	[TCA_estadosistema] [int] NULL,
 CONSTRAINT [XPKCARNET_CAPACITACION] PRIMARY KEY CLUSTERED 
(
	[TCA_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CREDENCIAL_CONDUCTOR]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CREDENCIAL_CONDUCTOR](
	[CCM_id] [int] IDENTITY(1,1) NOT NULL,
	[PER_id] [int] NOT NULL,
 CONSTRAINT [PK_CREDENCIAL_CONDUCTOR] PRIMARY KEY CLUSTERED 
(
	[CCM_id] ASC,
	[PER_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DATOS]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DATOS](
	[DAT_cod] [int] NOT NULL,
	[DAT_UIT] [int] NULL,
	[DAT_diasdescuento] [int] NULL,
	[DAT_descuento] [decimal](9, 2) NULL,
 CONSTRAINT [PK_DATOS] PRIMARY KEY CLUSTERED 
(
	[DAT_cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLE_CREDENCIAL_CONDUCTOR]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLE_CREDENCIAL_CONDUCTOR](
	[DCC_id] [int] IDENTITY(1,1) NOT NULL,
	[CCM_id] [int] NOT NULL,
	[DCC_asociacion] [int] NULL,
	[DCC_tipo_tramite] [int] NULL,
	[DCC_serie] [varchar](12) NOT NULL,
	[DCC_codigo_reg] [varchar](12) NOT NULL,
	[DCC_codigo_imp] [varchar](12) NOT NULL,
	[DCC_vigencia_ini] [datetime] NOT NULL,
	[DCC_vigencia_fin] [datetime] NOT NULL,
	[DCC_expediente] [varchar](20) NOT NULL,
	[DCC_estado_vigencia] [int] NOT NULL,
	[DCC_estado_sistema] [int] NOT NULL,
	[DCC_qr] [image] NULL,
 CONSTRAINT [PK_DETALLE_CREDENCIAL_CONDUCTOR] PRIMARY KEY CLUSTERED 
(
	[DCC_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ESTADO]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ESTADO](
	[EST_codigo] [int] NOT NULL,
	[EST_descripcion] [varchar](50) NULL,
	[EST_categoria] [int] NULL,
 CONSTRAINT [PK_ESTADO] PRIMARY KEY CLUSTERED 
(
	[EST_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HISTORIAL]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HISTORIAL](
	[HIS_codigo] [int] IDENTITY(1,1) NOT NULL,
	[USU_codigo] [int] NULL,
	[HIS_fecha] [datetime] NULL,
	[HIS_ocurrencia] [varchar](200) NULL,
	[HIS_tabla] [varchar](50) NULL,
	[HIS_idcampo] [int] NULL,
 CONSTRAINT [PK_HISTORIAL] PRIMARY KEY CLUSTERED 
(
	[HIS_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HISTORIAL_CONDUCTOR]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HISTORIAL_CONDUCTOR](
	[HIC_id] [int] IDENTITY(1,1) NOT NULL,
	[HIC_fecha_asignacion] [date] NULL,
	[HIC_fecha_baja] [date] NOT NULL,
	[UNI_codigo] [int] NULL,
	[ASO_codigo] [int] NULL,
	[CON_codigo] [int] NULL,
 CONSTRAINT [PK_HISTORIAL_CONDUCTOR] PRIMARY KEY CLUSTERED 
(
	[HIC_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[INFRACCION]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INFRACCION](
	[INF_codigo] [int] IDENTITY(1,1) NOT NULL,
	[INF_codigodesc] [varchar](5) NULL,
	[INF_descripcion] [varchar](250) NULL,
	[INF_penalidad] [int] NULL,
	[INF_grado] [int] NULL,
	[INF_observacion] [varchar](150) NULL,
	[INF_estado] [int] NULL,
	[INF_medidaprev] [varchar](150) NULL,
	[INF_resposolidaria] [int] NULL,
 CONSTRAINT [PK__INFRACCI__2FF94DD6164452B1] PRIMARY KEY CLUSTERED 
(
	[INF_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LICENCIA_CONDUCCION]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LICENCIA_CONDUCCION](
	[LIC_codigo] [int] IDENTITY(1,1) NOT NULL,
	[LIC_numero] [varchar](10) NOT NULL,
	[LIC_clase] [varchar](5) NULL,
	[LIC_categoria] [varchar](6) NULL,
	[LIC_fechaemision] [datetime] NULL,
	[LIC_fechavencimiento] [datetime] NULL,
	[CON_codigo] [int] NULL,
	[LIC_estado] [int] NULL,
	[LIC_LugarProcedencia] [varchar](200) NULL,
 CONSTRAINT [PK__LICENCIA__DA8C74F41A14E395] PRIMARY KEY CLUSTERED 
(
	[LIC_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MARCA]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MARCA](
	[MAR_codigo] [int] IDENTITY(1,1) NOT NULL,
	[MAR_descripcion] [varchar](20) NULL,
	[MAR_estado] [int] NULL,
 CONSTRAINT [PK__MARCA__129A1E421DE57479] PRIMARY KEY CLUSTERED 
(
	[MAR_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MODELO]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MODELO](
	[MOD_codigo] [int] IDENTITY(1,1) NOT NULL,
	[MOD_descripcion] [varchar](20) NULL,
	[MAR_codigo] [int] NULL,
	[MOD_estado] [int] NULL,
 CONSTRAINT [PK__MODELO__BFDDDBE021B6055D] PRIMARY KEY CLUSTERED 
(
	[MOD_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PAPELETA]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAPELETA](
	[PAP_codigo] [int] IDENTITY(1,1) NOT NULL,
	[PAP_serie] [char](6) NULL,
	[PAP_monto] [decimal](9, 2) NULL,
	[PAP_fechaemision] [datetime] NULL,
	[PAP_fechapago] [datetime] NULL,
	[PAP_hora] [char](12) NOT NULL,
	[PAP_observacion] [varchar](150) NULL,
	[PAP_lugar] [varchar](150) NULL,
	[PAP_inspector] [int] NULL,
	[UNI_codigo] [int] NULL,
	[ASO_codigo] [int] NULL,
	[INF_codigo] [int] NULL,
	[CON_codigo] [nchar](10) NULL,
	[PAP_estado] [int] NULL,
	[PAP_fecharegistro] [datetime] NULL,
	[PAP_dependencia] [int] NULL,
	[PAP_documento] [varchar](100) NULL,
	[PRO_codigo] [int] NULL,
	[PAP_tipo_persona] [varchar](20) NULL,
 CONSTRAINT [PK__PAPELETA__16A4B88725869641] PRIMARY KEY CLUSTERED 
(
	[PAP_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERSONA]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERSONA](
	[PER_codigo] [int] IDENTITY(1,1) NOT NULL,
	[PER_dni] [char](11) NOT NULL,
	[PER_nombre] [varchar](100) NULL,
	[PER_apellidos] [varchar](100) NULL,
	[PER_direccion] [varchar](200) NULL,
	[PER_telefono] [varchar](10) NULL,
	[PER_estado] [int] NULL,
	[PER_capacitacion] [int] NULL,
 CONSTRAINT [PK__PERSONA__4A05D3D62D27B809] PRIMARY KEY CLUSTERED 
(
	[PER_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RESOLUCION]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RESOLUCION](
	[RES_codigo] [int] IDENTITY(1,1) NOT NULL,
	[RES_numero] [varchar](20) NULL,
	[RES_fechaemision] [date] NULL,
	[RES_fechavencimiento] [date] NULL,
	[RES_observacion] [varchar](150) NULL,
	[TIR_codigo] [int] NULL,
	[ASO_codigo] [int] NULL,
	[RES_estado] [int] NULL,
 CONSTRAINT [PK_RESOLUCION] PRIMARY KEY CLUSTERED 
(
	[RES_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RESOLUCION_PARADERO]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RESOLUCION_PARADERO](
	[PAR_codigo] [int] IDENTITY(1,1) NOT NULL,
	[PAR_descripcion] [varchar](250) NULL,
	[PAR_referencia] [varchar](250) NULL,
	[PAR_reten] [varchar](250) NULL,
	[PAR_retenreferencia] [varchar](250) NULL,
	[RES_codigo] [int] NULL,
	[PAR_estado] [int] NULL,
 CONSTRAINT [PK_RESOLUCION_PARADERO_1] PRIMARY KEY CLUSTERED 
(
	[PAR_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SERIES_ANULADAS]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SERIES_ANULADAS](
	[SER_id] [int] IDENTITY(1,1) NOT NULL,
	[SER_numero] [varchar](12) NULL,
	[SER_fecha] [datetime] NULL,
	[SER_observacion] [varchar](200) NULL,
	[SER_usuario] [varchar](50) NULL,
 CONSTRAINT [PK_SERIES_ANULADAS] PRIMARY KEY CLUSTERED 
(
	[SER_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SOCIO_ASOCIACION]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SOCIO_ASOCIACION](
	[SOC_codigo] [int] IDENTITY(1,1) NOT NULL,
	[PER_codigo] [int] NULL,
	[ASO_codigo] [int] NULL,
	[SOC_estado] [int] NULL,
 CONSTRAINT [PK_SOCIO_ASOCIACION] PRIMARY KEY CLUSTERED 
(
	[SOC_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TARJETA_CIRCULACION]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TARJETA_CIRCULACION](
	[TAR_codigo] [int] IDENTITY(1,1) NOT NULL,
	[TAR_serie] [int] NULL,
	[TAR_fechaemision] [datetime] NULL,
	[UNI_codigo] [int] NULL,
	[TAR_fechavencimiento] [datetime] NULL,
	[TAR_fechaentrega] [datetime] NULL,
	[TAR_estado] [int] NULL,
	[TAR_estadosistema] [int] NULL,
 CONSTRAINT [PK__TARJETA___151FA3CA403A8C7D] PRIMARY KEY CLUSTERED 
(
	[TAR_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temporal]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temporal](
	[RES_codigo] [int] NOT NULL,
	[RES_numero] [varchar](20) NULL,
	[TIR_codigo] [int] NULL,
	[ASO_codigo] [int] NULL,
	[RES_fechaemision] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temporal2]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temporal2](
	[RES_codigo] [int] NOT NULL,
	[RES_numero] [varchar](20) NULL,
	[TIR_codigo] [int] NULL,
	[ASO_codigo] [int] NULL,
	[RES_fechaemision] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPO_RESOLUCION]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPO_RESOLUCION](
	[TIR_codigo] [int] NOT NULL,
	[TIR_descripcion] [varchar](100) NULL,
 CONSTRAINT [PK_TIPO_RESOLUCION] PRIMARY KEY CLUSTERED 
(
	[TIR_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UNIDAD]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UNIDAD](
	[UNI_codigo] [int] IDENTITY(1,1) NOT NULL,
	[UNI_placa] [varchar](11) NOT NULL,
	[UNI_seriechasis] [varchar](20) NULL,
	[UNI_motor] [varchar](20) NULL,
	[UNI_tarjetapropiedad] [varchar](20) NOT NULL,
	[UNI_aniofabrica] [int] NULL,
	[UNI_estado] [int] NULL,
	[MOD_codigo] [int] NULL,
	[ASO_codigo] [int] NULL,
	[UNI_numerounidad] [varchar](6) NULL,
	[CON_codigo] [int] NULL,
	[PRO_codigo] [int] NULL,
	[UNI_inspecciontec] [int] NULL,
 CONSTRAINT [PK__UNIDAD__DC16529D47DBAE45] PRIMARY KEY CLUSTERED 
(
	[UNI_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO](
	[USU_codigo] [int] IDENTITY(1,1) NOT NULL,
	[USU_usuario] [varchar](15) NULL,
	[USU_password] [varchar](10) NULL,
	[USU_estado] [int] NULL,
	[PER_codigo] [int] NULL,
	[USU_rol] [int] NULL,
 CONSTRAINT [PK__USUARIO__596FE3E54BAC3F29] PRIMARY KEY CLUSTERED 
(
	[USU_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO_APLICATIVO]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO_APLICATIVO](
	[USU_codigo] [int] IDENTITY(1,1) NOT NULL,
	[PER_codigo] [int] NULL,
	[USU_usuario] [varchar](15) NULL,
	[USU_password] [varchar](10) NULL,
	[USU_tipo] [varchar](50) NULL,
	[USU_estado] [int] NULL,
 CONSTRAINT [PK_USUARIO_APLICATIVO] PRIMARY KEY CLUSTERED 
(
	[USU_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DETALLE_CREDENCIAL_CONDUCTOR] ADD  CONSTRAINT [DF_DETALLE_CREDENCIAL_CONDUCTOR_CDC_serie]  DEFAULT ((0)) FOR [DCC_serie]
GO
ALTER TABLE [dbo].[DETALLE_CREDENCIAL_CONDUCTOR] ADD  CONSTRAINT [DF_DETALLE_CREDENCIAL_CONDUCTOR_CDC_codigo_reg]  DEFAULT ((0)) FOR [DCC_codigo_reg]
GO
ALTER TABLE [dbo].[DETALLE_CREDENCIAL_CONDUCTOR] ADD  CONSTRAINT [DF_DETALLE_CREDENCIAL_CONDUCTOR_CDC_codigo_imp]  DEFAULT ((0)) FOR [DCC_codigo_imp]
GO
ALTER TABLE [dbo].[ASEGURADORA_VEHICULO]  WITH CHECK ADD  CONSTRAINT [FK__ASEGURADO__ASE_c__4D94879B] FOREIGN KEY([ASE_codigo])
REFERENCES [dbo].[ASEGURADORA] ([ASE_codigo])
GO
ALTER TABLE [dbo].[ASEGURADORA_VEHICULO] CHECK CONSTRAINT [FK__ASEGURADO__ASE_c__4D94879B]
GO
ALTER TABLE [dbo].[ASEGURADORA_VEHICULO]  WITH CHECK ADD  CONSTRAINT [FK__ASEGURADO__UNI_c__4E88ABD4] FOREIGN KEY([UNI_codigo])
REFERENCES [dbo].[UNIDAD] ([UNI_codigo])
GO
ALTER TABLE [dbo].[ASEGURADORA_VEHICULO] CHECK CONSTRAINT [FK__ASEGURADO__UNI_c__4E88ABD4]
GO
ALTER TABLE [dbo].[LICENCIA_CONDUCCION]  WITH CHECK ADD  CONSTRAINT [FK_LICENCIA_CONDUCCION_PERSONA] FOREIGN KEY([CON_codigo])
REFERENCES [dbo].[PERSONA] ([PER_codigo])
GO
ALTER TABLE [dbo].[LICENCIA_CONDUCCION] CHECK CONSTRAINT [FK_LICENCIA_CONDUCCION_PERSONA]
GO
ALTER TABLE [dbo].[MODELO]  WITH CHECK ADD  CONSTRAINT [FK__MODELO__MAR_codi__5535A963] FOREIGN KEY([MAR_codigo])
REFERENCES [dbo].[MARCA] ([MAR_codigo])
GO
ALTER TABLE [dbo].[MODELO] CHECK CONSTRAINT [FK__MODELO__MAR_codi__5535A963]
GO
ALTER TABLE [dbo].[PAPELETA]  WITH CHECK ADD  CONSTRAINT [FK__PAPELETA__INF_co__5629CD9C] FOREIGN KEY([INF_codigo])
REFERENCES [dbo].[INFRACCION] ([INF_codigo])
GO
ALTER TABLE [dbo].[PAPELETA] CHECK CONSTRAINT [FK__PAPELETA__INF_co__5629CD9C]
GO
ALTER TABLE [dbo].[PAPELETA]  WITH CHECK ADD  CONSTRAINT [FK__PAPELETA__UNI_co__571DF1D5] FOREIGN KEY([UNI_codigo])
REFERENCES [dbo].[UNIDAD] ([UNI_codigo])
GO
ALTER TABLE [dbo].[PAPELETA] CHECK CONSTRAINT [FK__PAPELETA__UNI_co__571DF1D5]
GO
ALTER TABLE [dbo].[RESOLUCION]  WITH CHECK ADD  CONSTRAINT [FK_RESOLUCION_ASOCIACION] FOREIGN KEY([ASO_codigo])
REFERENCES [dbo].[ASOCIACION] ([ASO_codigo])
GO
ALTER TABLE [dbo].[RESOLUCION] CHECK CONSTRAINT [FK_RESOLUCION_ASOCIACION]
GO
ALTER TABLE [dbo].[RESOLUCION]  WITH CHECK ADD  CONSTRAINT [FK_RESOLUCION_TIPO_RESOLUCION] FOREIGN KEY([TIR_codigo])
REFERENCES [dbo].[TIPO_RESOLUCION] ([TIR_codigo])
GO
ALTER TABLE [dbo].[RESOLUCION] CHECK CONSTRAINT [FK_RESOLUCION_TIPO_RESOLUCION]
GO
ALTER TABLE [dbo].[RESOLUCION_PARADERO]  WITH CHECK ADD  CONSTRAINT [FK_RESOLUCION_PARADERO_RESOLUCION1] FOREIGN KEY([RES_codigo])
REFERENCES [dbo].[RESOLUCION] ([RES_codigo])
GO
ALTER TABLE [dbo].[RESOLUCION_PARADERO] CHECK CONSTRAINT [FK_RESOLUCION_PARADERO_RESOLUCION1]
GO
ALTER TABLE [dbo].[TARJETA_CIRCULACION]  WITH CHECK ADD  CONSTRAINT [FK_TARJETA_CIRCULACION_UNIDAD] FOREIGN KEY([UNI_codigo])
REFERENCES [dbo].[UNIDAD] ([UNI_codigo])
GO
ALTER TABLE [dbo].[TARJETA_CIRCULACION] CHECK CONSTRAINT [FK_TARJETA_CIRCULACION_UNIDAD]
GO
ALTER TABLE [dbo].[UNIDAD]  WITH CHECK ADD  CONSTRAINT [FK__UNIDAD__MOD_codi__5EBF139D] FOREIGN KEY([MOD_codigo])
REFERENCES [dbo].[MODELO] ([MOD_codigo])
GO
ALTER TABLE [dbo].[UNIDAD] CHECK CONSTRAINT [FK__UNIDAD__MOD_codi__5EBF139D]
GO
ALTER TABLE [dbo].[UNIDAD]  WITH CHECK ADD  CONSTRAINT [FK_UNIDAD_ASOCIACION] FOREIGN KEY([ASO_codigo])
REFERENCES [dbo].[ASOCIACION] ([ASO_codigo])
GO
ALTER TABLE [dbo].[UNIDAD] CHECK CONSTRAINT [FK_UNIDAD_ASOCIACION]
GO
ALTER TABLE [dbo].[UNIDAD]  WITH CHECK ADD  CONSTRAINT [FK_UNIDAD_PERSONA] FOREIGN KEY([PRO_codigo])
REFERENCES [dbo].[PERSONA] ([PER_codigo])
GO
ALTER TABLE [dbo].[UNIDAD] CHECK CONSTRAINT [FK_UNIDAD_PERSONA]
GO
ALTER TABLE [dbo].[USUARIO]  WITH CHECK ADD  CONSTRAINT [FK__USUARIO__PER_cod__619B8048] FOREIGN KEY([PER_codigo])
REFERENCES [dbo].[PERSONA] ([PER_codigo])
GO
ALTER TABLE [dbo].[USUARIO] CHECK CONSTRAINT [FK__USUARIO__PER_cod__619B8048]
GO
/****** Object:  StoredProcedure [dbo].[SP_Agregar_Socio]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[SP_Agregar_Socio]
@PER_codigo  int,
@ASO_codigo int,
@SOC_estado int

As

Insert into SOCIO_ASOCIACION (PER_codigo,ASO_codigo,SOC_estado)
values (@PER_codigo ,@ASO_codigo ,@SOC_estado )
GO
/****** Object:  StoredProcedure [dbo].[SP_AsegUni_Editar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[SP_AsegUni_Editar]

@UNI_codigo int,

@ASE_codigo int,
@ASV_numerocertificado varchar(20),
@ASV_fechaemision date,
@ASV_fechavencimiento date,
@ASV_estado int,
@ASV_tiposeguro int
AS
Update ASEGURADORA_VEHICULO SET ASE_codigo = @ASE_codigo , ASV_numerocertificado = @ASV_numerocertificado , ASV_fechaemision =@ASV_fechaemision,
ASV_fechavencimiento =@ASV_fechavencimiento , ASV_estado = @ASV_estado ,ASV_tiposeguro =@ASV_tiposeguro  where UNI_codigo =@UNI_codigo 
GO
/****** Object:  StoredProcedure [dbo].[SP_Aseguradora_Agregar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Aseguradora_Agregar]
@ASE_descripcion varchar (150),
@ASE_ruc char(11),
@ASE_estado int

AS

Insert into ASEGURADORA (ASE_descripcion ,ASE_RUC, ASE_estado )
values (@ASE_descripcion ,@ASE_ruc,@ASE_estado)
GO
/****** Object:  StoredProcedure [dbo].[SP_Aseguradora_Editar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[SP_Aseguradora_Editar]

@ASE_codigo int,
@ASE_descripcion varchar(150),
@ASE_RUC char(11)

as

Update ASEGURADORA set ASE_descripcion = @ASE_descripcion , ASE_RUC = @ASE_RUC 
where ASE_codigo = @ASE_codigo 
GO
/****** Object:  StoredProcedure [dbo].[SP_Aseguradora_Filtrar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Aseguradora_Filtrar]
@parametro varchar (50)

AS
Select ASE_codigo , ASE_RUC As RUC ,ASE_descripcion as RazonSocial from ASEGURADORA
where  (cast(ASE_RUC    as char(11)) + rtrim( ASE_descripcion )) like '%'+ @parametro+ '%' AND ASE_estado  <> 3 
GO
/****** Object:  StoredProcedure [dbo].[SP_AseguradoraUnidad_Agregar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PRocedure [dbo].[SP_AseguradoraUnidad_Agregar]
--ASEGURADORA_VEHICULO
@UNI_placa varchar(11),
@UNI_codigo int,
@ASE_codigo int,
@ASV_numerocertificado varchar(20),
@ASV_fechaemision date,
@ASV_fechavencimiento date,
@ASV_estado int,
@ASV_tiposeguro int


AS

SET @UNI_codigo =(Select MAX(UNI_codigo) from UNIDAD  where UNI_placa = @UNI_placa )
Insert into ASEGURADORA_VEHICULO (UNI_codigo,ASE_codigo,ASV_numerocertificado,ASV_fechaemision,ASV_fechavencimiento,ASV_estado,ASV_tiposeguro)
values ( @UNI_codigo,@ASE_codigo,@ASV_numerocertificado,@ASV_fechaemision,@ASV_fechavencimiento,@ASV_estado,@ASV_tiposeguro)
GO
/****** Object:  StoredProcedure [dbo].[SP_Asociacion_Editar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SP_Asociacion_Editar]
@ASO_codigo int,
@ASO_ruc  char(11),
@ASO_razonsocial varchar(150),
@ASO_telefono varchar(10),
@ASO_direccion varchar(200),
@ASO_colores varchar (150),
@ASO_fechafundacion date,
@ASO_presidente int,
@ASO_estado int,
@ASO_observacion varchar(150)

As

Update ASOCIACION 
SET ASO_ruc =@ASO_ruc , ASO_razonsocial = @ASO_razonsocial, ASO_telefono =@ASO_telefono ,ASO_direccion = @ASO_direccion ,ASO_colores =@ASO_colores ,
ASO_fechafundacion =@ASO_fechafundacion ,ASO_presidente =@ASO_presidente ,ASO_estado =@ASO_estado , ASO_observacion =@ASO_observacion
Where ASO_codigo = @ASO_codigo
GO
/****** Object:  StoredProcedure [dbo].[SP_Asociacion_Eliminar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SP_Asociacion_Eliminar]
@ASO_Codigo int
AS
Update ASOCIACION 
Set ASO_estado = 3
where ASO_codigo = @ASO_codigo 
GO
/****** Object:  StoredProcedure [dbo].[SP_Asociacion_Filtrar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Asociacion_Filtrar]

@parametro varchar(50)

As

Select  a.ASO_codigo ,a.ASO_ruc as Ruc , a.ASO_razonsocial as Razon_Social ,a.ASO_colores as Colores , a.ASO_direccion as Direccion  , a.ASO_telefono as Telefono, a.ASO_fechafundacion as FechaFundacion ,a.ASO_estado,e.EST_descripcion  ,a.ASO_observacion as Observacion ,a.ASO_presidente,p.PER_dni as DniPresidente ,(p.PER_nombre+' '+p.PER_apellidos)  as Presidente  ,p.PER_direccion as DireccionPRE, p.PER_telefono as TelefonoPRE
FROM ASOCIACION a INNER JOIN PERSONA p ON p.PER_codigo = a.ASO_presidente INNER JOIN ESTADO e ON e.EST_codigo =a.ASO_estado
where (cast(a.ASO_ruc   as char(11)) + rtrim( a.ASO_razonsocial)) like '%'+ @parametro+ '%' AND a.ASO_estado <> 3 
GO
/****** Object:  StoredProcedure [dbo].[SP_Asociacion_FiltrarAux]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Asociacion_FiltrarAux]
@parametro varchar(50)

As

Select ASO_codigo , ASO_ruc AS RUC , ASO_razonsocial  as ASOCIACION from ASOCIACION 
Where ASO_codigo  NOT IN ( Select a.ASO_codigo 
from ASOCIACION a  inner join RESOLUCION  r on r.ASO_codigo =a.ASO_codigo where r.RES_estado  = 4  AND a.ASO_estado <> 3 AND r.TIR_codigo = 1 Group by a.ASO_codigo)
AND (cast(ASO_ruc   as char(11)) + rtrim( ASO_razonsocial )) like '%'+@parametro + '%' AND ASO_estado  <> 3
GO
/****** Object:  StoredProcedure [dbo].[SP_Asociacion_FiltrarAux2]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[SP_Asociacion_FiltrarAux2]
@parametro varchar (50)

As

Select ASO_codigo , ASO_ruc as RUC, ASO_razonsocial  As ASOCIACION

from ASOCIACION

where (cast(ASO_ruc   as char(11)) + rtrim( ASO_razonsocial )) like '%'+@parametro + '%' AND ASO_estado  <> 3
GO
/****** Object:  StoredProcedure [dbo].[SP_Asociacion_Listar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Asociacion_Listar]
AS

SELECT ASO_codigo, ASO_razonsocial,ASO_estado
FROM   ASOCIACION
WHERE  ASO_estado <> 3 
GO
/****** Object:  StoredProcedure [dbo].[SP_Asociacion_Operaciones]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Asociacion_Operaciones]
@ASO_ruc  char(11),
@ASO_razonsocial varchar(150),
@ASO_telefono varchar(10),
@ASO_direccion varchar(200),
@ASO_colores varchar (150),
@ASO_fechafundacion date,
@ASO_presidente int,
@ASO_estado int,
@ASO_observacion varchar(150),
@Opcion int

AS

 --AGREGAR
If @Opcion = 1
Insert into ASOCIACION  (ASO_ruc , ASO_razonsocial , ASO_telefono , ASO_direccion , ASO_colores ,
                         ASO_fechafundacion ,ASO_presidente ,ASO_estado, ASO_observacion )
values (@ASO_ruc ,@ASO_razonsocial, @ASO_telefono ,@ASO_direccion ,@ASO_colores,
        @ASO_fechafundacion ,@ASO_presidente , @ASO_estado ,@ASO_observacion )
GO
/****** Object:  StoredProcedure [dbo].[SP_Buscar_ConductorUnidad]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_Buscar_ConductorUnidad]
@parametro varchar (100),
@opcion int,
@codigoasoc int

AS

If @opcion = 1
Select  u.UNI_numerounidad as NroUni,u.CON_codigo,per.PER_dni as DniConductor, (per.PER_apellidos  + ' ' + per.PER_nombre ) as NombreConductor ,per.PER_direccion as Direccion ,per.PER_telefono as Telefono ,lc.LIC_codigo,lc.LIC_numero as NumeroLicencia ,lc.LIC_fechaemision as FechaExpedicionLIC ,lc.LIC_fechavencimiento as  FechaRevalidacionLIC,lc.LIC_clase as Clase, lc.LIC_categoria as Categoria ,e.EST_descripcion as EstadoLicencia,per.PER_capacitacion , (case per.PER_capacitacion when '1' then 'SI' when '0' then 'No' END) as CapacitacionSegurVial,u.UNI_codigo ,u.UNI_placa as PlacaUnidad ,u.UNI_seriechasis as SerieChasis ,u.UNI_motor as NroMotor,mo.MAR_codigo, mar.MAR_descripcion as Marca,u.MOD_codigo,mo.MOD_descripcion as Modelo,u.ASO_codigo , aso.ASO_razonsocial as Asociacion , aso.ASO_ruc as Ruc , u.PRO_codigo ,(per2.PER_apellidos  + ' ' + per2.PER_nombre ) as NombrePropietario, per2.PER_dni as DniPropietario,lc.LIC_LugarProcedencia  as LICLugarProc
From UNIDAD u INNER JOIN PERSONA  per ON per.PER_codigo = u.CON_codigo INNER JOIN PERSONA per2 ON per2.PER_codigo = u.PRO_codigo LEFT JOIN LICENCIA_CONDUCCION lc ON u.CON_codigo = lc.CON_codigo LEFT JOIN ESTADO e ON e.EST_codigo = lc.LIC_estado INNER JOIN MODELO mo ON mo.MOD_codigo = u.MOD_codigo INNER JOIN MARCA mar ON mar.MAR_codigo = mo.MAR_codigo INNER JOIN ASOCIACION aso ON aso.ASO_codigo = u.ASO_codigo
where u.UNI_placa   like '%'+ @parametro+'%'  AND u.UNI_estado <> 3 AND  u.CON_codigo  <> 7 AND aso.ASO_codigo = @codigoasoc
Order By CONVERT(integer,u.UNI_numerounidad) asc
  
If @opcion = 2
Select  u.UNI_numerounidad as NroUni ,u.CON_codigo,per.PER_dni as DniConductor, (per.PER_apellidos  + ' ' + per.PER_nombre ) as NombreConductor ,per.PER_direccion as Direccion ,per.PER_telefono as Telefono ,lc.LIC_codigo,lc.LIC_numero as NumeroLicencia ,lc.LIC_fechaemision as FechaExpedicionLIC ,lc.LIC_fechavencimiento as  FechaRevalidacionLIC,lc.LIC_clase as Clase, lc.LIC_categoria as Categoria ,e.EST_descripcion as EstadoLicencia,per.PER_capacitacion , (case per.PER_capacitacion when '1' then 'SI' when '0' then 'No' END) as CapacitacionSegurVial,u.UNI_codigo ,u.UNI_placa as PlacaUnidad ,u.UNI_seriechasis as SerieChasis ,u.UNI_motor as NroMotor,mo.MAR_codigo, mar.MAR_descripcion as Marca,u.MOD_codigo,mo.MOD_descripcion as Modelo,u.ASO_codigo , aso.ASO_razonsocial as Asociacion , aso.ASO_ruc as Ruc , u.PRO_codigo ,(per2.PER_apellidos  + ' ' + per2.PER_nombre ) as NombrePropietario, per2.PER_dni as DniPropietario ,lc.LIC_LugarProcedencia  as LICLugarProc
From UNIDAD u INNER JOIN PERSONA  per ON per.PER_codigo = u.CON_codigo INNER JOIN PERSONA per2 ON per2.PER_codigo = u.PRO_codigo LEFT JOIN LICENCIA_CONDUCCION lc ON u.CON_codigo = lc.CON_codigo LEFT JOIN ESTADO e ON e.EST_codigo = lc.LIC_estado INNER JOIN MODELO mo ON mo.MOD_codigo = u.MOD_codigo INNER JOIN MARCA mar ON mar.MAR_codigo = mo.MAR_codigo INNER JOIN ASOCIACION aso ON aso.ASO_codigo = u.ASO_codigo
where (cast(per.PER_dni  as char(8)) + rtrim( per.PER_nombre  +  '  ' + per.PER_apellidos)) like '%'+ @parametro + '%' AND u.UNI_estado <> 3 AND  u.CON_codigo  <> 7 AND aso.ASO_codigo = @codigoasoc 
Order By CONVERT(integer,u.UNI_numerounidad) asc

If @opcion = 3
Select  u.UNI_numerounidad as NroUni ,u.CON_codigo,per.PER_dni as DniConductor, (per.PER_apellidos  + ' ' + per.PER_nombre ) as NombreConductor ,per.PER_direccion as Direccion ,per.PER_telefono as Telefono ,lc.LIC_codigo,lc.LIC_numero as NumeroLicencia ,lc.LIC_fechaemision as FechaExpedicionLIC ,lc.LIC_fechavencimiento as  FechaRevalidacionLIC,lc.LIC_clase as Clase, lc.LIC_categoria as Categoria ,e.EST_descripcion as EstadoLicencia,per.PER_capacitacion , (case per.PER_capacitacion when '1' then 'SI' when '0' then 'No' END) as CapacitacionSegurVial,u.UNI_codigo ,u.UNI_placa as PlacaUnidad ,u.UNI_seriechasis as SerieChasis ,u.UNI_motor as NroMotor,mo.MAR_codigo, mar.MAR_descripcion as Marca,u.MOD_codigo,mo.MOD_descripcion as Modelo,u.ASO_codigo , aso.ASO_razonsocial as Asociacion , aso.ASO_ruc as Ruc , u.PRO_codigo ,(per2.PER_apellidos  + ' ' + per2.PER_nombre ) as NombrePropietario, per2.PER_dni as DniPropietario ,lc.LIC_LugarProcedencia  as LICLugarProc
From UNIDAD u INNER JOIN PERSONA  per ON per.PER_codigo = u.CON_codigo INNER JOIN PERSONA per2 ON per2.PER_codigo = u.PRO_codigo LEFT JOIN LICENCIA_CONDUCCION lc ON u.CON_codigo = lc.CON_codigo LEFT JOIN ESTADO e ON e.EST_codigo = lc.LIC_estado INNER JOIN MODELO mo ON mo.MOD_codigo = u.MOD_codigo INNER JOIN MARCA mar ON mar.MAR_codigo = mo.MAR_codigo INNER JOIN ASOCIACION aso ON aso.ASO_codigo = u.ASO_codigo
where u.UNI_numerounidad    like '%' + @parametro + '%'  AND u.UNI_estado <> 3 AND  u.CON_codigo  <> 7 AND aso.ASO_codigo = @codigoasoc 
Order By CONVERT(integer,u.UNI_numerounidad) asc
GO
/****** Object:  StoredProcedure [dbo].[SP_Buscar_PapeletaEstado]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_Buscar_PapeletaEstado]
@anio int,
@valor varchar (20),
@opcion int

AS

If @opcion = 1

Select pa.PAP_codigo , pa.PAP_serie as Numero , pa.PAP_fechaemision as FechaEmision , pa.PAP_hora as Hora ,pa.PAP_lugar as LugarInfraccion , pa.INF_codigo , inf.INF_codigodesc as Infraccion , pa.UNI_codigo, u.UNI_placa  as PlacaUnidad,a.ASO_razonsocial  as Asociacion , u.PRO_codigo , (p.PER_apellidos + ' '+p.PER_nombre ) as Propietario , p.PER_dni as DniPropietario , pa.PAP_monto as Monto,pa.PAP_estado ,es1.EST_descripcion as EstadoPapeleta ,pa.PAP_dependencia ,es2.EST_descripcion as Dependencia ,pa.PAP_documento  as Motivo_documento

from PAPELETA pa INNER JOIN INFRACCION inf on inf.INF_codigo  = pa.INF_codigo
INNER JOIN UNIDAD u on u.UNI_codigo = pa.UNI_codigo  
INNER JOIN PERSONA p on p.PER_codigo = u.PRO_codigo 
INNER JOIN ASOCIACION a on a.ASO_codigo = u.ASO_codigo
INNER JOIN ESTADO es1 on es1 .EST_codigo = pa.PAP_estado 
INNER JOIN ESTADO es2 on es2.EST_codigo = pa.PAP_dependencia 

Where YEAR(pa.PAP_fechaemision ) = @anio AND pa.PAP_serie  like '%'+ @valor AND pa.PAP_estado  <> 3

Order By pa.PAP_fechaemision asc


If @opcion = 2

Select pa.PAP_codigo , pa.PAP_serie as Numero , pa.PAP_fechaemision as FechaEmision , pa.PAP_hora as Hora ,pa.PAP_lugar as LugarInfraccion , pa.INF_codigo , inf.INF_codigodesc as Infraccion , pa.UNI_codigo, u.UNI_placa  as PlacaUnidad,a.ASO_razonsocial  as Asociacion , u.PRO_codigo , (p.PER_apellidos + ' '+p.PER_nombre ) as Propietario , p.PER_dni as DniPropietario , pa.PAP_monto as Monto,pa.PAP_estado ,es1.EST_descripcion as EstadoPapeleta ,pa.PAP_dependencia ,es2.EST_descripcion as Dependencia ,pa.PAP_documento  as Motivo_documento 

from PAPELETA pa INNER JOIN INFRACCION inf on inf.INF_codigo  = pa.INF_codigo
INNER JOIN UNIDAD u on u.UNI_codigo = pa.UNI_codigo  
INNER JOIN PERSONA p on p.PER_codigo = u.PRO_codigo 
INNER JOIN ASOCIACION a on a.ASO_codigo = u.ASO_codigo
INNER JOIN ESTADO es1 on es1 .EST_codigo = pa.PAP_estado 
INNER JOIN ESTADO es2 on es2.EST_codigo = pa.PAP_dependencia

Where YEAR(pa.PAP_fechaemision ) = @anio AND u.UNI_placa  like @valor + '%' AND pa.PAP_estado  <> 3

Order By pa.PAP_fechaemision asc


IF @opcion = 3

Select pa.PAP_codigo , pa.PAP_serie as Numero , pa.PAP_fechaemision as FechaEmision , pa.PAP_hora as Hora ,pa.PAP_lugar as LugarInfraccion , pa.INF_codigo , inf.INF_codigodesc as Infraccion , pa.UNI_codigo, u.UNI_placa  as PlacaUnidad,a.ASO_razonsocial  as Asociacion , u.PRO_codigo , (p.PER_apellidos + ' '+p.PER_nombre ) as Propietario , p.PER_dni as DniPropietario , pa.PAP_monto as Monto,pa.PAP_estado ,es1.EST_descripcion as EstadoPapeleta ,pa.PAP_dependencia ,es2.EST_descripcion as Dependencia ,pa.PAP_documento  as Motivo_documento 

from PAPELETA pa INNER JOIN INFRACCION inf on inf.INF_codigo  = pa.INF_codigo
INNER JOIN UNIDAD u on u.UNI_codigo = pa.UNI_codigo  
INNER JOIN PERSONA p on p.PER_codigo = u.PRO_codigo 
INNER JOIN ASOCIACION a on a.ASO_codigo = u.ASO_codigo
INNER JOIN ESTADO es1 on es1 .EST_codigo = pa.PAP_estado 
INNER JOIN ESTADO es2 on es2.EST_codigo = pa.PAP_dependencia

Where YEAR(pa.PAP_fechaemision ) = @anio AND p.PER_dni   like @valor + '%' AND pa.PAP_estado  <> 3

Order By pa.PAP_fechaemision asc
GO
/****** Object:  StoredProcedure [dbo].[SP_Carnet_Capacitacion_Agregar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_Carnet_Capacitacion_Agregar]
@PER_codigo INT=NULL,
@TCA_serie INT=NULL,
@TCA_fecha_curso DATETIME=NULL,
@TCA_fecha_venci DATETIME=NULL,
@TCA_estado INT=NULL,
@TCA_estadosistema INT=NULL
AS

INSERT INTO CARNET_CAPACITACION (PER_codigo,TCA_serie,TCA_fecha_curso,TCA_fecha_venci,TCA_estado,TCA_estadosistema)
VALUES (@PER_codigo,@TCA_serie,@TCA_fecha_curso,@TCA_fecha_venci,@TCA_estado,@TCA_estadosistema)


GO
/****** Object:  StoredProcedure [dbo].[SP_Carnet_Capacitacion_Editar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_Carnet_Capacitacion_Editar]
@TCA_codigo INT=NULL,
@TCA_serie INT=NULL,
@TCA_fecha_curso DATETIME=NULL,
@TCA_fecha_venci DATETIME=NULL,
@TCA_estado INT=NULL,
@TCA_estadosistema INT=NULL,
@TIPO as INT=NULL
AS

IF @TIPO=1 --EDITA FECHAS DE CAPACITACION
  BEGIN
	UPDATE CARNET_CAPACITACION 
	SET TCA_fecha_curso=@TCA_fecha_curso,TCA_fecha_venci=@TCA_fecha_venci, TCA_estado=@TCA_estado
	WHERE TCA_codigo=@TCA_codigo
  END
  
IF @TIPO=2 --EDITA ESTADO SISTEMA DE CARNET
  BEGIN
	UPDATE CARNET_CAPACITACION 
	SET TCA_estadosistema=@TCA_estadosistema
	WHERE TCA_codigo=@TCA_codigo
  END
  
 IF @TIPO=3 --EDITA ESTADO SISTEMA Y SERIE DE CARNET 
  BEGIN
	UPDATE CARNET_CAPACITACION 
	SET TCA_estadosistema=@TCA_estadosistema,TCA_serie=@TCA_serie
	WHERE TCA_codigo=@TCA_codigo
  END
   
 IF @TIPO=4 --EDITA ESTADO VIGENCIA DE CARNET 
  BEGIN
	UPDATE CARNET_CAPACITACION 
	SET TCA_estado=@TCA_estado
	WHERE TCA_fecha_venci< GETDATE() AND TCA_estadosistema<>36 AND TCA_estadosistema<>37
  END
  
  
  
  
  
  


GO
/****** Object:  StoredProcedure [dbo].[SP_Carnet_Capacitacion_Listar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_Carnet_Capacitacion_Listar]
@TCA_codigo INT=NULL,
@PER_codigo INT=NULL,
@TIPO INT=NULL,
@FILTRO VARCHAR(10)=NULL
AS

IF @TIPO=1  --POR CODIGO DE CARNET DE CAPACITACION
  BEGIN
	SELECT P.PER_codigo,PER_dni,PER_nombre,PER_apellidos,(PER_nombre + ' ' + PER_apellidos) as Nombres, PER_direccion,PER_estado,PER_capacitacion,
       L.LIC_codigo,L.LIC_numero,L.LIC_clase,L.LIC_categoria,L.LIC_estado,
       C.TCA_codigo,C.TCA_serie,C.TCA_fecha_curso,C.TCA_fecha_venci,C.TCA_estado,C.TCA_estadosistema
	FROM   PERSONA P INNER JOIN LICENCIA_CONDUCCION L ON P.PER_codigo=L.CON_codigo
       INNER JOIN (SELECT MAX(TCA_codigo) AS TCA_codigo,PER_codigo FROM CARNET_CAPACITACION GROUP BY PER_codigo) 
       T ON T.PER_codigo=P.PER_codigo INNER JOIN CARNET_CAPACITACION C ON C.TCA_codigo=T.TCA_codigo
	WHERE C.TCA_codigo=@TCA_codigo
  END

IF @TIPO=2  --POR CODIGO DE PERSONA
  BEGIN		
	SELECT TOP 1 TCA_codigo,TCA_serie,TCA_fecha_curso,TCA_fecha_venci,TCA_estado,E.EST_descripcion,TCA_estadosistema,F.EST_descripcion
	FROM CARNET_CAPACITACION C INNER JOIN ESTADO E ON C.TCA_estado=E.EST_codigo INNER JOIN ESTADO F ON C.TCA_estadosistema=F.EST_codigo
	WHERE PER_codigo=@PER_codigo AND TCA_estadosistema<>36 AND TCA_estadosistema<>37
	ORDER BY TCA_codigo DESC
  END

IF @TIPO=3  --
  BEGIN	
	SELECT C.TCA_codigo,C.TCA_serie, C.TCA_fecha_curso,C.TCA_fecha_venci,C.TCA_estado,
           E.EST_descripcion,C.TCA_estadosistema,F.EST_descripcion,P.PER_codigo,PER_dni,
           PER_nombre,PER_apellidos,PER_direccion,L.LIC_numero,L.LIC_clase,L.LIC_categoria,L.LIC_estado, G.EST_descripcion       
	FROM   PERSONA P INNER JOIN LICENCIA_CONDUCCION L ON P.PER_codigo=L.CON_codigo
       INNER JOIN (SELECT MAX(TCA_codigo) AS TCA_codigo,PER_codigo FROM CARNET_CAPACITACION GROUP BY PER_codigo) 
       T ON T.PER_codigo=P.PER_codigo INNER JOIN CARNET_CAPACITACION C ON C.TCA_codigo=T.TCA_codigo
       INNER JOIN ESTADO E ON E.EST_codigo=C.TCA_estado INNER JOIN ESTADO F ON F.EST_codigo=C.TCA_estadosistema
       INNER JOIN ESTADO G ON G.EST_codigo=L.LIC_estado
	WHERE P.PER_dni like '%' + @FILTRO + '%' AND TCA_estadosistema<>37
  END	

IF @TIPO=4  --
  BEGIN	
	SELECT C.TCA_codigo,C.TCA_serie, C.TCA_fecha_curso,C.TCA_fecha_venci,C.TCA_estado,
           E.EST_descripcion,C.TCA_estadosistema,F.EST_descripcion,P.PER_codigo,PER_dni,
           PER_nombre,PER_apellidos,PER_direccion,L.LIC_numero,L.LIC_clase,L.LIC_categoria,L.LIC_estado, G.EST_descripcion       
	FROM   PERSONA P INNER JOIN LICENCIA_CONDUCCION L ON P.PER_codigo=L.CON_codigo
       INNER JOIN (SELECT MAX(TCA_codigo) AS TCA_codigo,PER_codigo FROM CARNET_CAPACITACION GROUP BY PER_codigo) 
       T ON T.PER_codigo=P.PER_codigo INNER JOIN CARNET_CAPACITACION C ON C.TCA_codigo=T.TCA_codigo
       INNER JOIN ESTADO E ON E.EST_codigo=C.TCA_estado INNER JOIN ESTADO F ON F.EST_codigo=C.TCA_estadosistema
       INNER JOIN ESTADO G ON G.EST_codigo=L.LIC_estado
	WHERE C.TCA_serie like '%' + @FILTRO + '%' AND TCA_estadosistema<>37
  END	



GO
/****** Object:  StoredProcedure [dbo].[SP_Carnet_Capacitacion_Reporte]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_Carnet_Capacitacion_Reporte]
@ASO_codigo VARCHAR(3)=NULL,
@TCA_condicion VARCHAR(3)=NULL,
@TCA_estado VARCHAR(3)=NULL
AS

SELECT RANK() OVER (ORDER BY TCA_codigo) as Ittem,
       C.TCA_codigo, C.PER_codigo, (P.PER_nombre + ' ' + P.PER_apellidos) as conductor, L.LIC_numero,
       U.ASO_codigo,A.ASO_razonsocial,
       U.UNI_numerounidad,u.UNI_placa,C.TCA_serie,
       CONVERT(VARCHAR(10),C.TCA_fecha_curso, 103) as fechacurso, CONVERT(VARCHAR(10),C.TCA_fecha_venci, 103) as fechavenci,              
       C.TCA_estado, E.EST_descripcion, 
       C.TCA_estadosistema, F.EST_descripcion
FROM   CARNET_CAPACITACION C 
INNER JOIN PERSONA P ON C.PER_codigo=P.PER_codigo
INNER JOIN ESTADO E ON C.TCA_estado=E.EST_codigo
INNER JOIN ESTADO F ON C.TCA_estadosistema=F.EST_codigo
INNER JOIN UNIDAD U ON U.CON_codigo=P.PER_codigo
INNER JOIN ASOCIACION A ON A.ASO_codigo=U.ASO_codigo
INNER JOIN LICENCIA_CONDUCCION L ON L.CON_codigo=P.PER_codigo
WHERE U.UNI_estado<>3 AND
      A.ASO_codigo like '%' + @ASO_codigo + '%' AND
      C.TCA_estado like '%' + @TCA_condicion + '%' AND
      C.TCA_estadosistema like '%' + @TCA_estado + '%'
ORDER BY TCA_codigo





GO
/****** Object:  StoredProcedure [dbo].[SP_Carnet_Capacitacón_Agregar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_Carnet_Capacitacón_Agregar]
@PER_codigo INT=NULL,
@TCA_serie INT=NULL,
@TCA_fecha_curso DATETIME=NULL,
@TCA_fecha_venci DATETIME=NULL,
@TCA_estado INT=NULL,
@TCA_estadosistema INT=NULL
AS

INSERT INTO CARNET_CAPACITACION (PER_codigo,TCA_serie,TCA_fecha_curso,TCA_fecha_venci,TCA_estado,TCA_estadosistema)
VALUES (@PER_codigo,@TCA_serie,@TCA_fecha_curso,@TCA_fecha_venci,@TCA_estado,@TCA_estadosistema)


GO
/****** Object:  StoredProcedure [dbo].[SP_Conductor_Editar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[SP_Conductor_Editar]

@UNI_codigo int,
@PRO_codigo int,
@PER_capacitacion int

AS

Update UNIDAD Set PRO_codigo = @PRO_codigo  Where UNI_codigo = @UNI_codigo 
Update PERSONA Set PER_capacitacion  = @PER_capacitacion  where PER_codigo = @PRO_codigo 
GO
/****** Object:  StoredProcedure [dbo].[SP_Conductor_Eliminar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SP_Conductor_Eliminar]
@UNI_codigo int,
@CON_codigo int

As

Update UNIDAD  SET CON_codigo = @CON_codigo  WHERE UNI_codigo = @UNI_codigo 
GO
/****** Object:  StoredProcedure [dbo].[SP_Conductor_Unidad]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_Conductor_Unidad]
@UNI_placa VARCHAR(11)=NULL
AS

BEGIN
	SELECT u.UNI_codigo, u.UNI_seriechasis, u.UNI_motor, u.MOD_codigo, mo.MOD_descripcion, mo.MAR_codigo, mar.MAR_descripcion,
		   u.ASO_codigo, aso.ASO_razonsocial, aso.ASO_ruc, u.PRO_codigo, (per.PER_nombre + ' ' + per.PER_apellidos) AS Propietario,
		   per.PER_dni, u.CON_codigo 
	FROM UNIDAD u INNER JOIN MODELO mo ON mo.MOD_codigo = u.MOD_codigo 
	INNER JOIN MARCA mar ON mar.MAR_codigo = mo.MAR_codigo 
	INNER JOIN ASOCIACION aso ON aso.ASO_codigo = u.ASO_codigo
	INNER JOIN PERSONA per ON per.PER_codigo = u.PRO_codigo 
	WHERE u.UNI_placa = @UNI_placa AND u.UNI_estado <> 3
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultaParaderos_Listar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_ConsultaParaderos_Listar]


@parametro int

As


Select  RES_codigo , RES_numero as NroResolucion,RES_fechaemision as Fecha_Emision ,RES_fechavencimiento as Fecha_Vencimiento  from RESOLUCION   where ASO_codigo  = @parametro AND TIR_codigo  = 2 AND RES_estado = 4
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultaParaderos_ListarParaderos]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_ConsultaParaderos_ListarParaderos]
@parametro int
as

Select PAR_descripcion as Paradero ,PAR_reten as Reten from RESOLUCION_PARADERO where RES_codigo =@parametro  
GO
/****** Object:  StoredProcedure [dbo].[SP_Credencial_Conductor_Agregar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_Credencial_Conductor_Agregar]
@PER_id INT=NULL
AS

INSERT INTO CREDENCIAL_CONDUCTOR (PER_id)
VALUES (@PER_id)


GO
/****** Object:  StoredProcedure [dbo].[SP_Credencial_Conductor_Impresion]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_Credencial_Conductor_Impresion]
@PER_id INT=NULL
AS


 SELECT TOP 1 
      C.PER_id,P.PER_dni,P.PER_nombre,P.PER_apellidos,
      L.LIC_codigo,L.LIC_numero,L.LIC_clase,L.LIC_categoria,L.LIC_LugarProcedencia,
      DCC_id,D.CCM_id,D.DCC_tipo_tramite,E.EST_descripcion AS DCC_tipo_tramite_desc,
      DATEDIFF(MM,D.DCC_vigencia_ini,D.DCC_vigencia_fin) AS DCC_vigencia_meses,
      D.DCC_serie,D.DCC_codigo_reg,D.DCC_codigo_imp,CONVERT(VARCHAR(12),D.DCC_vigencia_ini,103) AS DCC_vigencia_ini,CONVERT(VARCHAR(12),D.DCC_vigencia_fin,103) AS DCC_vigencia_fin,
      D.DCC_expediente,D.DCC_estado_vigencia,F.EST_descripcion AS DCC_estado_vigencia_desc,D.DCC_estado_sistema,G.EST_descripcion AS DCC_estado_sistema_desc,
      D.DCC_qr
 FROM CREDENCIAL_CONDUCTOR C                  
      INNER JOIN DETALLE_CREDENCIAL_CONDUCTOR D ON C.CCM_id=D.CCM_id
      INNER JOIN PERSONA P ON C.PER_id=P.PER_codigo
      INNER JOIN LICENCIA_CONDUCCION L ON P.PER_codigo=L.CON_codigo
      INNER JOIN ESTADO E ON D.DCC_tipo_tramite=E.EST_codigo AND E.EST_categoria=13
      INNER JOIN ESTADO F ON D.DCC_estado_vigencia=F.EST_codigo AND F.EST_categoria=2
      INNER JOIN ESTADO G ON D.DCC_estado_sistema=G.EST_codigo AND G.EST_categoria=12         
      INNER JOIN ESTADO H ON L.LIC_estado=H.EST_codigo AND H.EST_categoria=2         
  WHERE C.PER_id=@PER_id
  ORDER BY D.DCC_id DESC 
GO
/****** Object:  StoredProcedure [dbo].[SP_Credencial_Conductor_Listar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_Credencial_Conductor_Listar]
@CCM_id INT=NULL,
@PER_id INT=NULL,
@TIPO INT=NULL
AS

IF @TIPO=1  --SE OBTIENE EL ID DEL ULTIMO REGISTRO
  BEGIN
   	SELECT MAX(CCM_id) AS CCM_id  FROM CREDENCIAL_CONDUCTOR
  END

--IF @TIPO=2  --
--  BEGIN
--    SELECT *
--    FROM CREDENCIAL_CONDUCTOR
--    WHERE PER_id=@PER_id
--  END
GO
/****** Object:  StoredProcedure [dbo].[SP_Credencial_Conductor_Reporte]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_Credencial_Conductor_Reporte]
@FILTRO_Asociacion VARCHAR(3)=NULL,
@FILTRO_EstadoCredencial VARCHAR(3)=NULL,
@FILTRO_EstadoVigencia VARCHAR(3)=NULL
AS

 SELECT 
      C.PER_id,P.PER_dni,P.PER_nombre,P.PER_apellidos,
      L.LIC_codigo,L.LIC_numero,L.LIC_clase,L.LIC_categoria,L.LIC_LugarProcedencia,
      DCC_id,D.CCM_id,D.DCC_tipo_tramite,E.EST_descripcion AS DCC_tipo_tramite_desc,
      D.DCC_asociacion,A.ASO_razonsocial AS DCC_asociacion_desc,
      DATEDIFF(MM,D.DCC_vigencia_ini,D.DCC_vigencia_fin) AS DCC_vigencia_meses,
      D.DCC_serie,D.DCC_codigo_reg,D.DCC_codigo_imp,CONVERT(VARCHAR(12),D.DCC_vigencia_ini,103) AS DCC_vigencia_ini,CONVERT(VARCHAR(12),D.DCC_vigencia_fin,103) AS DCC_vigencia_fin,
      D.DCC_expediente,D.DCC_estado_vigencia,F.EST_descripcion AS DCC_estado_vigencia_desc,D.DCC_estado_sistema,G.EST_descripcion AS DCC_estado_sistema_desc
 FROM CREDENCIAL_CONDUCTOR C                  
      INNER JOIN (SELECT D.* FROM DETALLE_CREDENCIAL_CONDUCTOR D INNER JOIN (SELECT MAX(DCC_id) AS DCC_id,CCM_id FROM DETALLE_CREDENCIAL_CONDUCTOR GROUP BY CCM_id) AS E ON D.DCC_id=E.DCC_id) D ON C.CCM_id=D.CCM_id
      INNER JOIN PERSONA P ON C.PER_id=P.PER_codigo
      INNER JOIN LICENCIA_CONDUCCION L ON P.PER_codigo=L.CON_codigo
      INNER JOIN ESTADO E ON D.DCC_tipo_tramite=E.EST_codigo AND E.EST_categoria=13
      INNER JOIN ESTADO F ON D.DCC_estado_vigencia=F.EST_codigo AND F.EST_categoria=2
      INNER JOIN ESTADO G ON D.DCC_estado_sistema=G.EST_codigo AND G.EST_categoria=12         
      INNER JOIN ESTADO H ON L.LIC_estado=H.EST_codigo AND H.EST_categoria=2         
      INNER JOIN ASOCIACION A ON D.DCC_asociacion=A.ASO_codigo
  WHERE D.DCC_asociacion like '%' + @FILTRO_Asociacion + '%' AND
        D.DCC_estado_sistema like '%' + @FILTRO_EstadoCredencial + '%' AND
        D.DCC_estado_vigencia like '%' + @FILTRO_EstadoVigencia + '%'
  ORDER BY P.PER_apellidos,P.PER_nombre DESC 
  
   
  
GO
/****** Object:  StoredProcedure [dbo].[SP_Datos_Editar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[SP_Datos_Editar]
@DAT_cod int,
@DAT_diasdescuento int,
@DAT_descuento decimal (9,2),
@DAT_UIT int

as

Update DATOS set DAT_UIT = @DAT_UIT , DAT_diasdescuento = @DAT_diasdescuento , DAT_descuento = @DAT_descuento 
where DAT_cod = @DAT_cod
GO
/****** Object:  StoredProcedure [dbo].[SP_Datos_Listar_Credencial]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Datos_Listar_Credencial]
@PER_dni AS VARCHAR(11)=NULL
AS

                     
SELECT UNI.UNI_codigo, UNI.UNI_placa, UNI.CON_codigo, PER.PER_dni, PER.PER_apellidos AS CON_apellidos, PER.PER_nombre AS CON_nombres, PER.PER_direccion AS CON_direccion,        
       UNI.ASO_codigo, ASO.ASO_razonsocial,
       LIC.LIC_fechaemision, LIC.LIC_fechavencimiento, LIC.LIC_categoria,
       CAP_fecha = (SELECT TOP(1) TCA_fecha_curso FROM CARNET_CAPACITACION WHERE PER_codigo = PER.PER_codigo ORDER BY TCA_codigo DESC),
       PAP.PAP_fechaemision, INF.INF_codigodesc AS PAP_infraccion, PAP.PAP_observacion
FROM UNIDAD UNI
INNER JOIN PERSONA PER ON UNI.CON_codigo = PER.PER_codigo
INNER JOIN ASOCIACION ASO ON UNI.ASO_codigo = ASO.ASO_codigo
LEFT JOIN  LICENCIA_CONDUCCION LIC ON UNI.CON_codigo = LIC.CON_codigo
LEFT JOIN  PAPELETA PAP ON UNI.UNI_codigo = PAP.UNI_codigo AND PAP.PAP_tipo_persona = 'CONDUCTOR'
LEFT JOIN  INFRACCION INF ON PAP.INF_codigo = INF.INF_codigo
WHERE UNI.UNI_estado=6 AND PER.PER_dni = @PER_dni


GO
/****** Object:  StoredProcedure [dbo].[SP_Datos_Listar_Tarjeta_Circulacion]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Datos_Listar_Tarjeta_Circulacion]
@UNI_placa AS VARCHAR(11)=NULL
AS

SELECT TOP(1) TAR.TAR_codigo, TAR.TAR_serie, TAR.TAR_fechaemision, TAR.UNI_codigo, TAR.TAR_fechavencimiento, TAR.TAR_fechaentrega, TAR.TAR_estado AS TAR_estado_id, 
              EST.EST_descripcion AS TAR_estado_desc
INTO #TEMP              
FROM TARJETA_CIRCULACION AS TAR
INNER JOIN UNIDAD UNI ON TAR.UNI_codigo = UNI.UNI_codigo
INNER JOIN ESTADO AS EST ON TAR.TAR_estado = EST.EST_codigo
WHERE TAR.TAR_estadosistema = 29 AND UNI.UNI_placa = @UNI_placa
ORDER BY TAR.TAR_codigo DESC
                     
SELECT UNI.UNI_codigo, UNI.UNI_placa, UNI.PRO_codigo, PER.PER_apellidos AS PRO_apellidos, PER.PER_nombre AS PRO_nombres, PER.PER_direccion AS PRO_direccion, 
       ASV.ASE_codigo, ASE.ASE_descripcion,ASV.ASV_fechaemision AS ASE_fechaemision, ASV.ASV_fechavencimiento AS ASE_fechavencimiento, ASV.ASV_estado AS ASE_estado_id, EST.EST_descripcion AS ASE_estado_desc,        
       UNI.ASO_codigo, ASO.ASO_razonsocial,
       TEM.TAR_serie, TEM.TAR_fechaemision, TEM.TAR_fechavencimiento, TEM.TAR_estado_desc,
       PAP.PAP_fechaemision, INF.INF_codigodesc, PAP.PAP_observacion
FROM UNIDAD UNI
INNER JOIN PERSONA PER ON UNI.PRO_codigo = PER.PER_codigo
INNER JOIN ASOCIACION ASO ON UNI.ASO_codigo = ASO.ASO_codigo
LEFT JOIN  ASEGURADORA_VEHICULO ASV ON UNI.UNI_codigo = ASV.UNI_codigo
LEFT JOIN  ASEGURADORA ASE ON ASV.ASE_codigo = ASE.ASE_codigo
LEFT JOIN  #TEMP TEM ON UNI.UNI_codigo = TEM.UNI_codigo
LEFT JOIN  PAPELETA PAP ON UNI.UNI_codigo = PAP.UNI_codigo AND PAP.PAP_tipo_persona = 'PROPIETARIO'
LEFT JOIN INFRACCION INF ON PAP.INF_codigo = INF.INF_codigo
LEFT JOIN  ESTADO EST ON ASV.ASV_estado = EST.EST_codigo AND EST.EST_categoria=2
WHERE UNI.UNI_estado=6 AND UNI.UNI_placa = @UNI_placa

DROP TABLE #TEMP
GO
/****** Object:  StoredProcedure [dbo].[SP_Datos_Seleccionar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Datos_Seleccionar]
AS
Select  DAT_cod , DAT_UIT ,DAT_diasdescuento,DAT_descuento from DATOS  where DAT_cod = 1
GO
/****** Object:  StoredProcedure [dbo].[SP_Detalle_Credencial_Conductor_Agregar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_Detalle_Credencial_Conductor_Agregar]
@CCM_id INT=NULL,
@DCC_asociacion INT=NULL,
@DCC_tipo_tramite INT=NULL,
@DCC_serie VARCHAR(12)=NULL,
@DCC_codigo_reg VARCHAR(12)=NULL,
@DCC_codigo_imp VARCHAR(12)=NULL,
@DCC_vigencia_ini DATETIME=NULL,
@DCC_vigencia_fin DATETIME=NULL,
@DCC_expediente VARCHAR(12)=NULL,
@DCC_estado_vigencia INT=NULL,
@DCC_estado_sistema INT=NULL
AS

INSERT INTO DETALLE_CREDENCIAL_CONDUCTOR (CCM_id,DCC_asociacion,DCC_tipo_tramite,DCC_serie,DCC_codigo_reg,DCC_codigo_imp,DCC_vigencia_ini,DCC_vigencia_fin,DCC_expediente,DCC_estado_vigencia,DCC_estado_sistema)
VALUES (@CCM_id,@DCC_asociacion,@DCC_tipo_tramite,@DCC_serie,@DCC_codigo_reg,@DCC_codigo_imp,@DCC_vigencia_ini,@DCC_vigencia_fin,@DCC_expediente,@DCC_estado_vigencia,@DCC_estado_sistema)


GO
/****** Object:  StoredProcedure [dbo].[SP_Detalle_Credencial_Conductor_Editar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_Detalle_Credencial_Conductor_Editar]
@CCM_id INT=NULL,
@DCC_id INT=NULL,
@DCC_asociacion INT=NULL,
@DCC_tipo_tramite INT=NULL,
@DCC_serie VARCHAR(12)=NULL,
@DCC_codigo_imp VARCHAR(12)=NULL,
@DCC_vigencia_ini DATETIME=NULL,
@DCC_vigencia_fin DATETIME=NULL,
@DCC_expediente VARCHAR(12)=NULL,
@DCC_estado_vigencia INT=NULL,
@DCC_estado_sistema INT=NULL,
@DCC_qr IMAGE=NULL,
@TIPO as INT=NULL
AS

IF @TIPO=1 --ACTUALIZA DATOS DE CREDENCIAL, EN EL FORMULARIO DE REGISTRO DE CREDENCIAL
  BEGIN
	UPDATE DETALLE_CREDENCIAL_CONDUCTOR
	SET DCC_asociacion=@DCC_asociacion,DCC_tipo_tramite=@DCC_tipo_tramite,DCC_vigencia_ini=@DCC_vigencia_ini, DCC_vigencia_fin=@DCC_vigencia_fin,DCC_expediente=@DCC_expediente
	WHERE CCM_id=@CCM_id AND DCC_id=@DCC_id
  END
 
IF @TIPO=2 --ACTUALIZA EL ESTADO DE VIGENCIA DE UNA CREDENCIAL DE CONDUCTOR
  BEGIN
  	UPDATE DETALLE_CREDENCIAL_CONDUCTOR
	SET DCC_estado_vigencia=@DCC_estado_vigencia
	WHERE CCM_id=@CCM_id AND DCC_id=@DCC_id
  END
  
IF @TIPO=3 --ACTUALIZA EL NRO. DE SERIE, EL COD. DE IMPRESION Y ESTADO DE SISTEMA, DE UNA CREDENCIAL DE CONDUCTOR QUE SE IMPRIME
  BEGIN
  	UPDATE DETALLE_CREDENCIAL_CONDUCTOR
	SET DCC_serie=@DCC_serie, DCC_codigo_imp=@DCC_codigo_imp, DCC_estado_sistema=@DCC_estado_sistema
	WHERE DCC_id=@DCC_id
  END

IF @TIPO=4 --ACTUALIZA EL ESTADO DEL SISTEMA DE UNA CREDENCIAL DE CONDUCTOR
  BEGIN
  	UPDATE DETALLE_CREDENCIAL_CONDUCTOR
	SET DCC_estado_sistema=@DCC_estado_sistema
	WHERE DCC_id=@DCC_id
  END 
 
IF @TIPO=5 --ACTUALIZA DTAOS DEL QR
  BEGIN
  	UPDATE DETALLE_CREDENCIAL_CONDUCTOR
	SET DCC_qr=@DCC_qr
	WHERE DCC_id=@DCC_id
  END  
  
  
  
  


GO
/****** Object:  StoredProcedure [dbo].[SP_Detalle_Credencial_Conductor_Listar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_Detalle_Credencial_Conductor_Listar]
@CCM_id INT=NULL,
@PER_id INT=NULL,
@DCC_asociacion INT=NULL,
@DCC_tipo_tramite INT=NULL,
@DCC_serie VARCHAR(12)=NULL,
@DCC_codigo_reg VARCHAR(12)=NULL,
@DCC_codigo_imp VARCHAR(12)=NULL,
@DCC_estado_vigencia INT=NULL,
@DCC_estado_sistema INT=NULL,
@FILTRO VARCHAR(12)=NULL,
@TIPO INT=NULL
AS

IF @TIPO=1  --SE GENERA NUEVO CODIGO DE REGISTRO
  BEGIN
	DECLARE @CODI VARCHAR(12)
	DECLARE @CONT INT
		
	SET @CONT=(SELECT COUNT(*) FROM DETALLE_CREDENCIAL_CONDUCTOR)
    
    IF @CONT=0
      BEGIN
        SET @CODI=1
      END       
    ELSE
      BEGIN
        SET @CODI=(SELECT (MAX(SUBSTRING(DCC_codigo_reg,4,6)) + 1) FROM DETALLE_CREDENCIAL_CONDUCTOR)
      END
      		
	SELECT ('CR-' + (REPLICATE('0', 6 - DATALENGTH(@CODI)) + @CODI)) AS DCC_codigo_reg
  END

IF @TIPO=2  --OBTIENE DETALLE DE CREDENCIAL DE UN CONDUCTOR
  BEGIN		
    SELECT TOP 1 
           C.PER_id, P.PER_direccion, DCC_id,D.CCM_id, D.DCC_asociacion, D.DCC_tipo_tramite,E.EST_descripcion AS DCC_tipo_tramite_desc,
           D.DCC_serie,D.DCC_codigo_reg,D.DCC_codigo_imp,CONVERT(VARCHAR(12),D.DCC_vigencia_ini,103) AS DCC_vigencia_ini,CONVERT(VARCHAR(12),D.DCC_vigencia_fin,103) AS DCC_vigencia_fin,
           D.DCC_expediente,D.DCC_estado_vigencia,F.EST_descripcion AS DCC_estado_vigencia_desc,D.DCC_estado_sistema,G.EST_descripcion AS DCC_estado_sistema_desc
    FROM CREDENCIAL_CONDUCTOR C                  
         INNER JOIN DETALLE_CREDENCIAL_CONDUCTOR D ON C.CCM_id=D.CCM_id
         INNER JOIN PERSONA P ON C.PER_id=P.PER_codigo
         INNER JOIN ESTADO E ON D.DCC_tipo_tramite=E.EST_codigo AND E.EST_categoria=13
         INNER JOIN ESTADO F ON D.DCC_estado_vigencia=F.EST_codigo AND F.EST_categoria=2
         INNER JOIN ESTADO G ON D.DCC_estado_sistema=G.EST_codigo AND G.EST_categoria=12         
    WHERE C.PER_id=@PER_id
    ORDER BY D.DCC_id DESC    
  END

IF @TIPO=3  --OBTIENE TODOS LOS REGISTROS DE CREDENCIALES DE CONDUCTOR, CON SU ULTIMO DETALLE
  BEGIN	
    --DROP TABLE #TEMP1
    SELECT C.PER_id,C.CCM_id,MAX(D.DCC_id) AS DCC_id
    INTO #TEMP1
    FROM   CREDENCIAL_CONDUCTOR C INNER JOIN DETALLE_CREDENCIAL_CONDUCTOR D ON C.CCM_id=D.CCM_id
    GROUP BY C.PER_id,C.CCM_id
    
    SELECT T.PER_id, P.PER_dni,(P.PER_nombre + ' ' + P.PER_apellidos) AS PER_nombres,
           D.DCC_id,D.CCM_id,D.DCC_asociacion,A.ASO_razonsocial AS DCC_asociacion_desc, D.DCC_tipo_tramite,E.EST_descripcion AS DCC_tipo_tramite_desc,
           D.DCC_serie,D.DCC_codigo_reg,D.DCC_codigo_imp,CONVERT(VARCHAR(12),D.DCC_vigencia_ini,103) AS DCC_vigencia_ini,CONVERT(VARCHAR(12),D.DCC_vigencia_fin,103) AS DCC_vigencia_fin,
           D.DCC_expediente,D.DCC_estado_vigencia,F.EST_descripcion AS DCC_estado_vigencia_desc,D.DCC_estado_sistema,G.EST_descripcion AS DCC_estado_sistema_desc           
    FROM #TEMP1 T 
    INNER JOIN DETALLE_CREDENCIAL_CONDUCTOR D ON T.CCM_id=D.CCM_id AND T.DCC_id=D.DCC_id              
    INNER JOIN PERSONA P ON T.PER_id=P.PER_codigo
    INNER JOIN ESTADO E ON D.DCC_tipo_tramite=E.EST_codigo AND E.EST_categoria=13
    INNER JOIN ESTADO F ON D.DCC_estado_vigencia=F.EST_codigo AND F.EST_categoria=2
    INNER JOIN ESTADO G ON D.DCC_estado_sistema=G.EST_codigo AND G.EST_categoria=12
    INNER JOIN ASOCIACION A ON D.DCC_asociacion=A.ASO_codigo
  END	
  
IF @TIPO=4  --OBTIENE EL HISTORICO DEL DETALLE DE CREDENCIAL DE UN CONDUCTOR
  BEGIN	
    SELECT D.DCC_id,D.CCM_id,D.DCC_asociacion,A.ASO_razonsocial AS DCC_asociacion_desc,D.DCC_tipo_tramite,E.EST_descripcion AS DCC_tipo_tramite_desc,
           D.DCC_serie,D.DCC_codigo_reg,D.DCC_codigo_imp,CONVERT(VARCHAR(12),D.DCC_vigencia_ini,103) AS DCC_vigencia_ini,CONVERT(VARCHAR(12),D.DCC_vigencia_fin,103) AS DCC_vigencia_fin,
           D.DCC_expediente,D.DCC_estado_vigencia,F.EST_descripcion AS DCC_estado_vigencia_desc,D.DCC_estado_sistema,G.EST_descripcion AS DCC_estado_sistema_desc           
    FROM DETALLE_CREDENCIAL_CONDUCTOR D
    INNER JOIN ESTADO E ON D.DCC_tipo_tramite=E.EST_codigo AND E.EST_categoria=13
    INNER JOIN ESTADO F ON D.DCC_estado_vigencia=F.EST_codigo AND F.EST_categoria=2
    INNER JOIN ESTADO G ON D.DCC_estado_sistema=G.EST_codigo AND G.EST_categoria=12
    INNER JOIN ASOCIACION A ON D.DCC_asociacion=A.ASO_codigo
    WHERE CCM_id=@CCM_id
    ORDER BY DCC_id
  END

IF @TIPO=5  --OBTIENE LOS REGISTROS DE CREDENCIALES DE CONDUCTOR, CON SU ULTIMO DETALLE, FILTRADOS POR DNI
  BEGIN	
    --DROP TABLE #TEMP2
    SELECT C.PER_id,C.CCM_id,MAX(D.DCC_id) AS DCC_id
    INTO #TEMP2
    FROM   CREDENCIAL_CONDUCTOR C INNER JOIN DETALLE_CREDENCIAL_CONDUCTOR D ON C.CCM_id=D.CCM_id
    GROUP BY C.PER_id,C.CCM_id
    
    SELECT T.PER_id, P.PER_dni,(P.PER_nombre + ' ' + P.PER_apellidos) AS PER_nombres,
           D.DCC_id,D.CCM_id,D.DCC_asociacion,A.ASO_razonsocial AS DCC_asociacion_desc, D.DCC_tipo_tramite,E.EST_descripcion AS DCC_tipo_tramite_desc,
           D.DCC_serie,D.DCC_codigo_reg,D.DCC_codigo_imp,CONVERT(VARCHAR(12),D.DCC_vigencia_ini,103) AS DCC_vigencia_ini,CONVERT(VARCHAR(12),D.DCC_vigencia_fin,103) AS DCC_vigencia_fin,
           D.DCC_expediente,D.DCC_estado_vigencia,F.EST_descripcion AS DCC_estado_vigencia_desc,D.DCC_estado_sistema,G.EST_descripcion AS DCC_estado_sistema_desc           
    FROM #TEMP2 T 
    INNER JOIN DETALLE_CREDENCIAL_CONDUCTOR D ON T.CCM_id=D.CCM_id AND T.DCC_id=D.DCC_id              
    INNER JOIN PERSONA P ON T.PER_id=P.PER_codigo
    INNER JOIN ESTADO E ON D.DCC_tipo_tramite=E.EST_codigo AND E.EST_categoria=13
    INNER JOIN ESTADO F ON D.DCC_estado_vigencia=F.EST_codigo AND F.EST_categoria=2
    INNER JOIN ESTADO G ON D.DCC_estado_sistema=G.EST_codigo AND G.EST_categoria=12
    INNER JOIN ASOCIACION A ON D.DCC_asociacion=A.ASO_codigo
    WHERE P.PER_dni LIKE '%' + @FILTRO +'%'
  END	

IF @TIPO=6  --OBTIENE LOS REGISTROS DE CREDENCIALES DE CONDUCTOR, CON SU ULTIMO DETALLE, FILTRADOS POR CODIGO CREDENCIAL
  BEGIN	
    --DROP TABLE #TEMP3
    SELECT C.PER_id,C.CCM_id,MAX(D.DCC_id) AS DCC_id
    INTO #TEMP3
    FROM   CREDENCIAL_CONDUCTOR C INNER JOIN DETALLE_CREDENCIAL_CONDUCTOR D ON C.CCM_id=D.CCM_id
    GROUP BY C.PER_id,C.CCM_id
    
    SELECT T.PER_id, P.PER_dni,(P.PER_nombre + ' ' + P.PER_apellidos) AS PER_nombres,
           D.DCC_id,D.CCM_id,D.DCC_asociacion,A.ASO_razonsocial AS DCC_asociacion_desc, D.DCC_tipo_tramite,E.EST_descripcion AS DCC_tipo_tramite_desc,
           D.DCC_serie,D.DCC_codigo_reg,D.DCC_codigo_imp,CONVERT(VARCHAR(12),D.DCC_vigencia_ini,103) AS DCC_vigencia_ini,CONVERT(VARCHAR(12),D.DCC_vigencia_fin,103) AS DCC_vigencia_fin,
           D.DCC_expediente,D.DCC_estado_vigencia,F.EST_descripcion AS DCC_estado_vigencia_desc,D.DCC_estado_sistema,G.EST_descripcion AS DCC_estado_sistema_desc           
    FROM #TEMP3 T 
    INNER JOIN DETALLE_CREDENCIAL_CONDUCTOR D ON T.CCM_id=D.CCM_id AND T.DCC_id=D.DCC_id              
    INNER JOIN PERSONA P ON T.PER_id=P.PER_codigo
    INNER JOIN ESTADO E ON D.DCC_tipo_tramite=E.EST_codigo AND E.EST_categoria=13
    INNER JOIN ESTADO F ON D.DCC_estado_vigencia=F.EST_codigo AND F.EST_categoria=2
    INNER JOIN ESTADO G ON D.DCC_estado_sistema=G.EST_codigo AND G.EST_categoria=12
    INNER JOIN ASOCIACION A ON D.DCC_asociacion=A.ASO_codigo
    WHERE D.DCC_codigo_reg LIKE '%' + @FILTRO +'%'
  END
  
IF @TIPO=7  --SE GENERA NUEVO CODIGO DE IMPRESION
  BEGIN
	DECLARE @CODII VARCHAR(12)
	DECLARE @CONTI INT
		
	SET @CONTI=(SELECT COUNT(*) FROM DETALLE_CREDENCIAL_CONDUCTOR WHERE DCC_codigo_imp<>'0')
    
    IF @CONTI=0
      BEGIN
        SET @CODII=1
      END       
    ELSE
      BEGIN
        SET @CODII=(SELECT (MAX(SUBSTRING(DCC_codigo_imp,4,6)) + 1) FROM DETALLE_CREDENCIAL_CONDUCTOR)
      END
      		
	SELECT ('CD-' + (REPLICATE('0', 6 - DATALENGTH(@CODII)) + @CODII)) AS DCC_codigo_imp	
  END
  
IF @TIPO=8  --SE GENERA NUEVO NÚMERO DE SERIE
  BEGIN
	DECLARE @SERIE VARCHAR(12)
	DECLARE @CONTS INT
		
	SET @CONTS=(SELECT COUNT(*) FROM DETALLE_CREDENCIAL_CONDUCTOR WHERE DCC_serie<>'0')
		    
    IF @CONTS=0
      BEGIN
        SET @SERIE=1
      END       
    ELSE
      BEGIN        
        SET @SERIE=(SELECT (MAX(DCC_serie) + 1) FROM DETALLE_CREDENCIAL_CONDUCTOR WHERE DCC_serie<>'0')
      END
    
    SET @CONTS=(SELECT COUNT(*) FROM SERIES_ANULADAS WHERE CONVERT(INT,SER_numero,103)>=CONVERT(INT,@SERIE,103))
    
    IF @CONTS=0
      BEGIN
        SELECT ((REPLICATE('0', 6 - DATALENGTH(@SERIE)) + @SERIE)) AS DCC_serie  
      END 
    ELSE
      BEGIN
        SET @SERIE=CONVERT(INT,@SERIE,103) + @CONTS
        SELECT ((REPLICATE('0', 6 - DATALENGTH(@SERIE)) + @SERIE)) AS DCC_serie  
      END      			
  END
  
IF @TIPO=9  --OBTIENE LOS REGISTROS DE CREDENCIALES DE CONDUCTOR, CON SU ULTIMO DETALLE, FILTRADOS POR NRO DE SERIE
  BEGIN	
    --DROP TABLE #TEMP4
    SELECT C.PER_id,C.CCM_id,MAX(D.DCC_id) AS DCC_id
    INTO #TEMP4
    FROM   CREDENCIAL_CONDUCTOR C INNER JOIN DETALLE_CREDENCIAL_CONDUCTOR D ON C.CCM_id=D.CCM_id
    GROUP BY C.PER_id,C.CCM_id
    
    SELECT T.PER_id, P.PER_dni,(P.PER_nombre + ' ' + P.PER_apellidos) AS PER_nombres,
           D.DCC_id,D.CCM_id,D.DCC_asociacion,A.ASO_razonsocial AS DCC_asociacion_desc, D.DCC_tipo_tramite,E.EST_descripcion AS DCC_tipo_tramite_desc,
           D.DCC_serie,D.DCC_codigo_reg,D.DCC_codigo_imp,CONVERT(VARCHAR(12),D.DCC_vigencia_ini,103) AS DCC_vigencia_ini,CONVERT(VARCHAR(12),D.DCC_vigencia_fin,103) AS DCC_vigencia_fin,
           D.DCC_expediente,D.DCC_estado_vigencia,F.EST_descripcion AS DCC_estado_vigencia_desc,D.DCC_estado_sistema,G.EST_descripcion AS DCC_estado_sistema_desc           
    FROM #TEMP4 T 
    INNER JOIN DETALLE_CREDENCIAL_CONDUCTOR D ON T.CCM_id=D.CCM_id AND T.DCC_id=D.DCC_id              
    INNER JOIN PERSONA P ON T.PER_id=P.PER_codigo
    INNER JOIN ESTADO E ON D.DCC_tipo_tramite=E.EST_codigo AND E.EST_categoria=13
    INNER JOIN ESTADO F ON D.DCC_estado_vigencia=F.EST_codigo AND F.EST_categoria=2
    INNER JOIN ESTADO G ON D.DCC_estado_sistema=G.EST_codigo AND G.EST_categoria=12
    INNER JOIN ASOCIACION A ON D.DCC_asociacion=A.ASO_codigo
    WHERE D.DCC_serie LIKE '%' + @FILTRO +'%'
  END
GO
/****** Object:  StoredProcedure [dbo].[SP_Eliminar_Socio]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SP_Eliminar_Socio]
@SOC_codigo int
AS
Update SOCIO_ASOCIACION 
Set SOC_estado = 3
where SOC_codigo = @SOC_codigo
GO
/****** Object:  StoredProcedure [dbo].[SP_Estado_Listar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Estado_Listar]
@Tipo INT=NULL
AS

IF @Tipo=1
  BEGIN
    SELECT EST_codigo,EST_descripcion,EST_categoria
    FROM   ESTADO
    WHERE  EST_categoria=2
  END
  
IF @Tipo=2
  BEGIN
    SELECT EST_codigo,EST_descripcion,EST_categoria
    FROM   ESTADO
    WHERE  EST_categoria=12 AND EST_codigo<>33 AND EST_codigo<>37
  END
  
IF @Tipo=3
  BEGIN
    SELECT EST_codigo,EST_descripcion,EST_categoria
    FROM   ESTADO
    WHERE  EST_categoria=11
  END
  
IF @Tipo=4
  BEGIN
    SELECT EST_codigo,EST_descripcion,EST_categoria
    FROM   ESTADO
    WHERE  EST_categoria=13
  END

IF @Tipo=5
  BEGIN
    SELECT EST_codigo,EST_descripcion,EST_categoria
    FROM   ESTADO
    WHERE  EST_categoria=12 AND EST_codigo<>34 AND EST_codigo<>37
  END
  
IF @Tipo=6
  BEGIN
    SELECT EST_codigo,EST_descripcion,EST_categoria
    FROM   ESTADO
    WHERE  EST_categoria=6
  END
GO
/****** Object:  StoredProcedure [dbo].[SP_Estados_Actualizar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[SP_Estados_Actualizar]

AS

Update LICENCIA_CONDUCCION  SET LIC_estado = 5 Where LIC_fechavencimiento < GETDATE ()
Update RESOLUCION SET RES_estado = 5 Where RES_fechavencimiento < GETDATE ()
Update ASEGURADORA_VEHICULO SET ASV_estado = 5 Where ASV_fechavencimiento < GETDATE()
Update TARJETA_CIRCULACION  SET TAR_estado = 5 Where  TAR_fechavencimiento < GETDATE  ()
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_ModeloxMarca]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_Filtrar_ModeloxMarca]

@MAR_codigo int

As

Select MOD_codigo ,MOD_descripcion  
From MODELO 
Where MAR_codigo = @MAR_codigo
ORder by MOD_descripcion asc
GO
/****** Object:  StoredProcedure [dbo].[SP_Historial_acceso]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Historial_acceso]

@USU_codigo int,
@HIS_fecha datetime ,
@HIS_ocurrencia varchar (200)

As

Insert Into HISTORIAL (USU_codigo,HIS_fecha,HIS_ocurrencia)
values (@USU_codigo ,@HIS_fecha ,@HIS_ocurrencia )
GO
/****** Object:  StoredProcedure [dbo].[SP_Historial_Agregar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Historial_Agregar]
@USU_codigo int,
@HIS_fecha datetime ,
@HIS_ocurrencia varchar (200),
@HIS_tabla varchar (50),
@HIS_idcampo int
--@opcion int

As

--If @opcion = 1

Insert Into HISTORIAL (USU_codigo , HIS_fecha , HIS_ocurrencia , HIS_tabla , HIS_idcampo  )
values (@USU_codigo , @HIS_fecha ,@HIS_ocurrencia ,@HIS_tabla ,@HIS_idcampo )
GO
/****** Object:  StoredProcedure [dbo].[SP_Historial_Conductor_Agregar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Historial_Conductor_Agregar]
@HIC_fecha_asignacion DATETIME=NULL,
@HIC_fecha_baja DATETIME=NULL,
@UNI_codigo INTEGER=NULL,
@ASO_codigo INTEGER=NULL,
@CON_codigo INTEGER=NULL

AS


INSERT INTO HISTORIAL_CONDUCTOR (HIC_fecha_asignacion, HIC_fecha_baja, UNI_codigo, ASO_codigo, CON_codigo)
                         VALUES (@HIC_fecha_asignacion, @HIC_fecha_baja, @UNI_codigo, @ASO_codigo, @CON_codigo)
GO
/****** Object:  StoredProcedure [dbo].[SP_Historial_Conductor_Editar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Historial_Conductor_Editar]
@UNI_codigo INTEGER=NULL,
@ASO_codigo INTEGER=NULL,
@CON_codigo INTEGER=NULL,
@TIPO INTEGER=NULL
AS

IF @TIPO=1
  BEGIN
    UPDATE HISTORIAL_CONDUCTOR
    SET HIC_fecha_baja=GETDATE()
    WHERE UNI_codigo=@UNI_codigo and ASO_codigo=@ASO_codigo and HIC_fecha_baja='01/01/1990'  
  END

GO
/****** Object:  StoredProcedure [dbo].[SP_Historial_Conductor_Listar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Historial_Conductor_Listar]
@CON_dni VARCHAR(11)=NULL,
@TIPO INTEGER=NULL
AS

IF @TIPO=1
  BEGIN
    SELECT ROW_NUMBER() OVER(ORDER BY HC.HIC_fecha_asignacion ASC) AS Item, 
    HC.HIC_id, HC.HIC_fecha_asignacion, CASE HC.HIC_fecha_baja WHEN '01/01/1990' THEN NULL ELSE HC.HIC_fecha_baja END AS HIC_fecha_baja,
    UN.UNI_codigo, UN.UNI_placa, --UN.UNI_numerounidad,
    AC.ASO_codigo, AC.ASO_razonsocial,
    CD.PER_codigo, CD.PER_dni, CD.PER_apellidos, CD.PER_nombre
    FROM HISTORIAL_CONDUCTOR HC
    INNER JOIN UNIDAD UN ON HC.UNI_codigo=UN.UNI_codigo
    INNER JOIN ASOCIACION AC ON HC.ASO_codigo=AC.ASO_codigo
    INNER JOIN PERSONA CD ON HC.CON_codigo=CD.PER_codigo
    WHERE CD.PER_dni=@CON_dni
  END

GO
/****** Object:  StoredProcedure [dbo].[SP_Infraccion_Agregar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Infraccion_Agregar]
@INF_codigodesc varchar (5),
@INF_descripcion varchar (250),
@INF_penalidad int , 
@INF_grado int,
@INF_observacion varchar (150),
@INF_estado int,
@INF_medidaprev Varchar(150),
@INF_resposolidaria int


AS


Insert Into INFRACCION  (INF_codigodesc , INF_descripcion , INF_estado , INF_grado , INF_observacion , INF_penalidad , INF_medidaprev, INF_resposolidaria)
Values (@INF_codigodesc , @INF_descripcion , @INF_estado , @INF_grado , @INF_observacion , @INF_penalidad,@INF_medidaprev,@INF_resposolidaria  )
GO
/****** Object:  StoredProcedure [dbo].[SP_Infraccion_Conductor_Reporte]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_Infraccion_Conductor_Reporte]
@FILTRO_Asociacion VARCHAR(3)=NULL,
@FILTRO_FechaInfraccion VARCHAR(10)=NULL,
@FILTRO_GradoInfraccion VARCHAR(3)=NULL
AS

IF @FILTRO_FechaInfraccion = '' 
  BEGIN
    SELECT CON.PER_codigo AS CON_codigo, CON.PER_dni AS CON_dni,(CON.PER_apellidos + ' ' + CON.PER_nombre ) AS CON_nombres,
	   UNI.UNI_placa, ASO.ASO_codigo, ASO.ASO_razonsocial AS ASO_descrpcion,
	   PAP.PAP_codigo, PAP.PAP_serie, CONVERT(VARCHAR,PAP.PAP_fechaemision,103) AS PAP_fecha,
	   INF.INF_codigodesc AS INF_descripcion, INF.INF_grado AS INF_grado_id, ESI.EST_descripcion AS INF_grado_desc,
	   PAP.PAP_monto, ESP.EST_descripcion  AS PAP_estado
	FROM PAPELETA PAP 
	INNER JOIN INFRACCION INF on INF.INF_codigo = PAP.INF_codigo 
	INNER JOIN UNIDAD UNI ON UNI.UNI_codigo = PAP.UNI_codigo  
	INNER JOIN PERSONA CON ON CON.PER_codigo = UNI.CON_codigo 
	INNER JOIN ASOCIACION ASO ON ASO.ASO_codigo = UNI.ASO_codigo
	INNER JOIN ESTADO ESP ON ESP.EST_codigo = pap.PAP_estado  
	INNER JOIN ESTADO ESI ON INF.INF_grado=ESI.EST_codigo AND ESI.EST_categoria=6
	WHERE ASO.ASO_codigo LIKE '%' + @FILTRO_Asociacion + '%' AND
		  PAP.PAP_fechaemision LIKE '%' + @FILTRO_FechaInfraccion + '%' AND
		  INF.INF_grado LIKE '%' + @FILTRO_GradoInfraccion + '%'	
	ORDER BY pap.PAP_fechaemision ASC
  END
ELSE
  BEGIN
    SELECT CON.PER_codigo AS CON_codigo, CON.PER_dni AS CON_dni,(CON.PER_apellidos + ' ' + CON.PER_nombre ) AS CON_nombres,
	   UNI.UNI_placa, ASO.ASO_codigo, ASO.ASO_razonsocial AS ASO_descrpcion,
	   PAP.PAP_codigo, PAP.PAP_serie, CONVERT(VARCHAR,PAP.PAP_fechaemision,103) AS PAP_fecha,
	   INF.INF_codigodesc AS INF_descripcion, INF.INF_grado AS INF_grado_id, ESI.EST_descripcion AS INF_grado_desc,
	   PAP.PAP_monto, ESP.EST_descripcion  AS PAP_estado
	FROM PAPELETA PAP 
	INNER JOIN INFRACCION INF on INF.INF_codigo = PAP.INF_codigo 
	INNER JOIN UNIDAD UNI ON UNI.UNI_codigo = PAP.UNI_codigo  
	INNER JOIN PERSONA CON ON CON.PER_codigo = UNI.CON_codigo 
	INNER JOIN ASOCIACION ASO ON ASO.ASO_codigo = UNI.ASO_codigo
	INNER JOIN ESTADO ESP ON ESP.EST_codigo = pap.PAP_estado  
	INNER JOIN ESTADO ESI ON INF.INF_grado=ESI.EST_codigo AND ESI.EST_categoria=6
	WHERE ASO.ASO_codigo LIKE '%' + @FILTRO_Asociacion + '%' AND
		  CONVERT(VARCHAR(10),PAP.PAP_fechaemision,103) = @FILTRO_FechaInfraccion  AND
		  INF.INF_grado LIKE '%' + @FILTRO_GradoInfraccion + '%'	
	ORDER BY pap.PAP_fechaemision ASC
  END
GO
/****** Object:  StoredProcedure [dbo].[SP_Infraccion_Editar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Infraccion_Editar]

@INF_codigo int,
@INF_codigodesc varchar (5),
@INF_descripcion varchar (250),
@INF_penalidad int,
@INF_grado int,
@INF_observacion varchar (150),
@INF_medidaprev varchar (150),
@INF_resposolidaria int

As

Update INFRACCION  Set  INF_codigodesc = @INF_codigodesc , INF_descripcion = @INF_descripcion ,
INF_penalidad = @INF_penalidad ,  INF_grado = @INF_grado , INF_observacion = @INF_observacion , 
INF_medidaprev = @INF_medidaprev, INF_resposolidaria=@INF_resposolidaria

where INF_codigo = @INF_codigo 
GO
/****** Object:  StoredProcedure [dbo].[SP_Infraccion_Eliminar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SP_Infraccion_Eliminar]

@INF_codigo int

As


Update INFRACCION Set INF_estado = 3 where INF_codigo = @INF_codigo 
GO
/****** Object:  StoredProcedure [dbo].[SP_Infraccion_Filtrar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure  [dbo].[SP_Infraccion_Filtrar]

@parametro varchar (20)

AS

Select inf.INF_codigo , inf.INF_codigodesc as Codigo , inf.INF_descripcion as Descripcion ,inf.INF_grado,EST_descripcion as Grado ,(Convert(Varchar,inf.INF_penalidad) + '%' ) as Sancion, inf.INF_penalidad as SancionReal,inf.INF_medidaprev as MedidaPrev , inf.INF_observacion as Observacion 


from INFRACCION inf INNER JOIN ESTADO est on est.EST_codigo = inf.INF_grado 


where  INF_codigodesc like '%'+@parametro  AND inf.INF_estado  <> 3
GO
/****** Object:  StoredProcedure [dbo].[SP_LicConducir_Agregar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_LicConducir_Agregar]

@CON_codigo int,
@LIC_numero varchar(10),
@LIC_clase varchar(5),
@LIC_categoria varchar (6),
@LIC_fechaemision date,
@LIC_fechavencimiento date,
@LIC_estado int,
@LIC_lugarprocedencia varchar(200)

As

Insert Into LICENCIA_CONDUCCION (LIC_numero , LIC_clase , LIC_categoria , LIC_fechaemision , LIC_fechavencimiento,CON_codigo ,LIC_estado,LIC_lugarprocedencia)
values (@LIC_numero , @LIC_clase , @LIC_categoria , @LIC_fechaemision , @LIC_fechavencimiento , @CON_codigo ,@LIC_estado,@LIC_lugarprocedencia   )
GO
/****** Object:  StoredProcedure [dbo].[SP_LicConducir_Editar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_LicConducir_Editar]
@LIC_codigo int,
@LIC_numero varchar(10),
@LIC_clase varchar(5),
@LIC_categoria varchar (6),
@LIC_fechaemision date,
@LIC_fechavencimiento date,
@LIC_lugarprocedencia varchar (200),
@LIC_estado int



as


Update LICENCIA_CONDUCCION SET LIC_numero = @LIC_numero , LIC_clase = @LIC_clase , LIC_categoria = @LIC_categoria ,
LIC_fechaemision = @LIC_fechaemision , LIC_fechavencimiento = @LIC_fechavencimiento, LIC_lugarprocedencia = @LIC_lugarprocedencia , LIC_estado = @LIC_estado  
where LIC_codigo = @LIC_codigo  
GO
/****** Object:  StoredProcedure [dbo].[SP_Licencia_Conductor]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_Licencia_Conductor]

@CON_codigo int

AS

Select lc.LIC_codigo   ,lc.LIC_numero , lc.LIC_fechaemision , lc.LIC_fechavencimiento ,es.EST_descripcion   , lc.LIC_clase , lc.LIC_categoria, lc.LIC_lugarprocedencia
from LICENCIA_CONDUCCION lc INNER JOIN ESTADO es ON es.EST_codigo = lc.LIC_estado 

where lc.LIC_estado <> 3 AND lc.CON_codigo = @CON_codigo  
GO
/****** Object:  StoredProcedure [dbo].[SP_LicenciaConductor_Listar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_LicenciaConductor_Listar]
@parametro int

as

select lc.CON_codigo,(per.PER_nombre +' ' + per.PER_apellidos )as Conductor, per.PER_dni as DniConductor ,  lc.LIC_codigo   ,lc.LIC_numero as NroLicencia , lc.LIC_fechaemision as FechaExpedicion , lc.LIC_fechavencimiento as FechaRevalidacion ,es.EST_descripcion  as Estado  , lc.LIC_clase as Clase , lc.LIC_categoria as Categoria
from LICENCIA_CONDUCCION lc INNER JOIN ESTADO es ON es.EST_codigo = lc.LIC_estado
INNER JOIN PERSONA per ON per.PER_codigo = lc.CON_codigo 
where lc.LIC_estado <> 3 AND lc.CON_codigo = @parametro 
GO
/****** Object:  StoredProcedure [dbo].[SP_Marca_Agregar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Marca_Agregar]
@MAR_descripcion varchar(20),
@MAR_estado int
AS
Insert into MARCA (MAR_descripcion, MAR_estado )
values (@MAR_descripcion,@MAR_estado )
GO
/****** Object:  StoredProcedure [dbo].[SP_Marca_Editar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[SP_Marca_Editar]

@MAR_descripcion varchar (20),
@MAR_codigo int

as

Update MARCA SET MAR_descripcion = @MAR_descripcion  where MAR_codigo = @MAR_codigo 
GO
/****** Object:  StoredProcedure [dbo].[SP_Marca_Eliminar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[SP_Marca_Eliminar]

@MAR_codigo int

AS

Update MARCA SET MAR_estado = 3 where MAR_codigo  = @MAR_codigo
GO
/****** Object:  StoredProcedure [dbo].[SP_Marca_Filtrar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[SP_Marca_Filtrar]
@parametro varchar (50)

As

Select  MAR_codigo , MAR_descripcion as Marca from MARCA

where MAR_descripcion  like '%'+@parametro + '%'
GO
/****** Object:  StoredProcedure [dbo].[SP_Modelo_Agregar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Modelo_Agregar]
@MOD_descripcion varchar(20),
@MAR_codigo int,
@MOD_estado int

As

Insert into MODELO (MOD_descripcion,MAR_codigo,MOD_estado)
values( @MOD_descripcion , @MAR_codigo,@MOD_estado )
GO
/****** Object:  StoredProcedure [dbo].[SP_Modelo_Editar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[SP_Modelo_Editar]

@MOD_descripcion varchar (20),
@MOD_codigo int

as

Update MODELO  SET MOD_descripcion  = @MOD_descripcion  where MOD_codigo  = @MOD_codigo 
GO
/****** Object:  StoredProcedure [dbo].[SP_Modelo_Eliminar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SP_Modelo_Eliminar]
@MOD_codigo int

AS

Update MODELO  SET MOD_estado = 3 where MOD_codigo   = @MOD_codigo 
GO
/****** Object:  StoredProcedure [dbo].[SP_Modelo_Filtrar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_Modelo_Filtrar]
@parametro varchar(50),
@parametro2 int

AS
Select   MOD_codigo, MOD_descripcion  as Modelo from MODELO
where MOD_descripcion   like '%'+@parametro +'%' AND MAR_codigo = @parametro2 AND MOD_estado = 1
GO
/****** Object:  StoredProcedure [dbo].[SP_Modelo_Listar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Modelo_Listar]

@parametro int

As

Select  MOD_codigo , MOD_descripcion as Modelo  from MODELO  where MAR_codigo = @parametro AND MOD_estado = 1
GO
/****** Object:  StoredProcedure [dbo].[SP_Padron_Conductores]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Padron_Conductores]

@ASO_codigo int

AS


Select ROW_NUMBER() OVER (order by p.PER_apellidos )as Nro,a.ASO_codigo ,a.ASO_razonsocial as RazonSocial ,a.ASO_ruc as RUC ,a.ASO_colores as Colores,a.ASO_direccion as Direccion ,a.ASO_telefono as Telefono,
u.UNI_numerounidad,(p.PER_apellidos +' '+ p.PER_nombre ) as Conductor,p.PER_dni as DNI,p.PER_direccion  as Direccionc,lc.LIC_numero ,
u.UNI_placa as Placa , ma.MAR_descripcion  as Marca, u.UNI_seriechasis as SerieChasis, u.UNI_motor as Motor, mo.MOD_descripcion ,u.UNI_aniofabrica,tc.TAR_serie as TarjetaCirculacion


from ASOCIACION  a INNER JOIN UNIDAD u on u.ASO_codigo = a.ASO_codigo 
INNER JOIN PERSONA p on p.PER_codigo  = u.CON_codigo 
INNER JOIN MODELO mo on mo.MOD_codigo = u.MOD_codigo 
INNER JOIN MARCA ma on ma.MAR_codigo = mo.MAR_codigo 
LEFT JOIN LICENCIA_CONDUCCION lc on lc.CON_codigo = u.CON_codigo 
--LEFT JOIN TARJETA_CIRCULACION tc on tc.UNI_codigo = u.UNI_codigo      
LEFT JOIN (SELECT TC1.* FROM TARJETA_CIRCULACION TC1 INNER JOIN 
           (SELECT MAX(T.TAR_codigo) AS TAR_codigo,T.UNI_codigo
            FROM  TARJETA_CIRCULACION T GROUP BY T.UNI_codigo) TC2 ON TC1.TAR_codigo=TC2.TAR_codigo) tc on tc.UNI_codigo = u.UNI_codigo


Where a.ASO_codigo  = @ASO_codigo AND a.ASO_estado <> 3 AND u.UNI_estado <> 3  AND u.CON_codigo <> 7 AND p.PER_estado  <> 3 AND tc.TAR_estadosistema <> 30 AND tc.TAR_estado <> 30

ORDER BY p.PER_apellidos asc
GO
/****** Object:  StoredProcedure [dbo].[SP_Padron_Propietarios]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Padron_Propietarios]

@ASO_codigo int

AS


Select ROW_NUMBER() OVER (order by p.PER_apellidos )as Nro,a.ASO_codigo ,a.ASO_razonsocial as RazonSocial ,a.ASO_ruc as RUC ,a.ASO_colores as Colores,a.ASO_direccion as Direccion ,a.ASO_telefono as Telefono,
u.UNI_numerounidad,(p.PER_apellidos +' '+ p.PER_nombre ) as Propietario,p.PER_dni as DNI,p.PER_direccion  as Direccionp,u.UNI_tarjetapropiedad as TarjetaPropiedad ,
u.UNI_placa as Placa , ma.MAR_descripcion  as Marca, u.UNI_seriechasis as SerieChasis, u.UNI_motor as Motor, mo.MOD_descripcion ,u.UNI_aniofabrica,tc.TAR_serie as TarjetaCirculacion


from ASOCIACION  a INNER JOIN UNIDAD u on u.ASO_codigo = a.ASO_codigo 
INNER JOIN PERSONA p on p.PER_codigo  = u.PRO_codigo
INNER JOIN MODELO mo on mo.MOD_codigo = u.MOD_codigo 
INNER JOIN MARCA ma on ma.MAR_codigo = mo.MAR_codigo 
--LEFT JOIN TARJETA_CIRCULACION tc on tc.UNI_codigo = u.UNI_codigo      
LEFT JOIN (SELECT MAX(TAR_codigo) AS TAR_codigo,MAX(TAR_serie) AS TAR_serie,UNI_codigo,MAX(TAR_estado) AS TAR_estado,MAX(TAR_estadosistema) AS TAR_estadosistema
FROM  TARJETA_CIRCULACION
GROUP BY UNI_codigo) tc on tc.UNI_codigo = u.UNI_codigo      


Where a.ASO_codigo=@ASO_codigo   AND a.ASO_estado <> 3 AND u.UNI_estado <> 3  AND p.PER_estado <> 3 AND tc.TAR_estado  <> 30

ORDER BY p.PER_apellidos asc
GO
/****** Object:  StoredProcedure [dbo].[SP_Padron_Unidad]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Padron_Unidad]
@ASO_codigo int=null,
@TAR_estado int=null
AS


Select ROW_NUMBER() OVER (order by u.UNI_numerounidad )as Nro,a.ASO_codigo ,a.ASO_razonsocial as RazonSocial ,a.ASO_ruc as RUC ,a.ASO_colores as Colores,a.ASO_direccion as Direccion ,a.ASO_telefono as Telefono,
u.UNI_numerounidad,u.UNI_placa as Placa , ma.MAR_descripcion  as Marca, u.UNI_seriechasis as SerieChasis, u.UNI_motor as Motor, mo.MOD_descripcion ,u.UNI_aniofabrica,tc.TAR_serie as TarjetaCirculacion,tc.TAR_estado,c.EST_descripcion as EstadoTC,
e.EST_descripcion ,e2.EST_descripcion 


from ASOCIACION  a INNER JOIN UNIDAD u on u.ASO_codigo = a.ASO_codigo 
INNER JOIN PERSONA p on p.PER_codigo  = u.PRO_codigo
INNER JOIN MODELO mo on mo.MOD_codigo = u.MOD_codigo 
INNER JOIN MARCA ma on ma.MAR_codigo = mo.MAR_codigo 
LEFT JOIN TARJETA_CIRCULACION tc on tc.UNI_codigo = u.UNI_codigo 
INNER JOIN ESTADO e on e.EST_codigo = u.UNI_estado  
INNER JOIN ESTADO e2 on e2.EST_codigo = u.UNI_inspecciontec      
INNER JOIN ESTADO c on c.EST_codigo=tc.TAR_estado

Where a.ASO_codigo=@ASO_codigo AND a.ASO_estado <> 3 AND u.UNI_estado <> 3 AND 
      tc.TAR_estado = @TAR_estado

ORder by UNI_numerounidad asc
GO
/****** Object:  StoredProcedure [dbo].[SP_Papeleta_Agregar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Papeleta_Agregar]
@PAP_serie AS CHAR(6)=NULL,
@PAP_monto AS DECIMAL(9,2)=NULL,
@PAP_fechaemision AS DATE=NULL,
@PAP_hora AS VARCHAR(20)=NULL,
@PAP_observacion AS VARCHAR(150)=NULL,
@PAP_lugar AS VARCHAR(150)=NULL,
@PAP_inspector AS INT=NULL,
@UNI_codigo AS INT=NULL,
@ASO_codigo AS INT=NULL,
@INF_codigo AS INT=NULL,
@CON_codigo AS INT=NULL,
@PAP_estado AS INT=NULL,
@PAP_dependencia AS INT=NULL,
@PAP_fecharegistro AS DATE=NULL,
@PRO_codigo AS INT=NULL,
@PAP_tipo_persona AS VARCHAR(20)

AS

INSERT INTO PAPELETA(PAP_serie, PAP_monto, PAP_fechaemision, PAP_hora, PAP_observacion, PAP_lugar, PAP_inspector, UNI_codigo, ASO_codigo, INF_codigo, CON_codigo, PAP_estado, PAP_dependencia, PAP_fecharegistro, PRO_codigo, PAP_tipo_persona)
             Values (@PAP_serie, @PAP_monto, @PAP_fechaemision, @PAP_hora, @PAP_observacion, @PAP_lugar, @PAP_inspector, @UNI_codigo, @ASO_codigo, @INF_codigo, @CON_codigo, @PAP_estado,@PAP_dependencia, @PAP_fecharegistro, @PRO_codigo, @PAP_tipo_persona)
GO
/****** Object:  StoredProcedure [dbo].[SP_Papeleta_Datos1]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  procedure [dbo].[SP_Papeleta_Datos1]

@UNI_placa as varchar (11)

As
Select  u.UNI_codigo,  u.CON_codigo , con.PER_dni , (con.PER_apellidos  + ' '+ con.PER_nombre) as Conductor, con.PER_direccion,
u.PRO_codigo , pro.PER_dni , (pro.PER_apellidos + ' ' + pro.PER_nombre ) as Propietario, pro.PER_direccion , u.UNI_tarjetapropiedad,
u.ASO_codigo ,aso.ASO_razonsocial, aso.ASO_colores 
from  UNIDAD u  INNER JOIN

PERSONA con on con.PER_codigo = u.CON_codigo  INNER JOIN
PERSONA pro on pro.PER_codigo = u.PRO_codigo INNER JOIN
ASOCIACION aso on aso.ASO_codigo = u.ASO_codigo 


where u.UNI_placa  = @UNI_placa AND u.UNI_estado <> 3 
GO
/****** Object:  StoredProcedure [dbo].[SP_Papeleta_Editar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PRocedure [dbo].[SP_Papeleta_Editar]
@PAP_codigo int,
@PAP_serie as char (6),
@PAP_monto as decimal (9,2),
@PAP_fechaemision as date,
@PAP_hora as varchar (20),
@PAP_observacion as varchar(150),
@PAP_lugar as varchar (150),
@PAP_inspector as int,
@UNI_codigo as int,
@INF_codigo as int,
@CON_codigo as int,
@PRO_codigo AS INT=NULL,
@PAP_tipo_persona AS VARCHAR(20)
As

Update PAPELETA SET PAP_serie = @PAP_serie, PAP_monto = @PAP_monto ,PAP_fechaemision = @PAP_fechaemision,
PAP_hora = @PAP_hora , PAP_observacion  = @PAP_observacion, PAP_lugar = @PAP_lugar, PAP_inspector = @PAP_inspector,
UNI_codigo = @UNI_codigo ,INF_codigo =@INF_codigo,CON_codigo = @CON_codigo, PRO_codigo = @PRO_codigo, PAP_tipo_persona = @PAP_tipo_persona


Where PAP_codigo = @PAP_codigo
GO
/****** Object:  StoredProcedure [dbo].[SP_Papeleta_EditarDepenedencia]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Papeleta_EditarDepenedencia]

@PAP_codigo int,
@PAP_dependencia int

as
Update PAPELETA SET PAP_dependencia = @PAP_dependencia where PAP_codigo = @PAP_codigo  
GO
/****** Object:  StoredProcedure [dbo].[SP_Papeleta_EditarEstado]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Papeleta_EditarEstado]

@PAP_codigo int,
@PAP_documento varchar (100),
@PAP_monto decimal (9,2),
@PAP_estado int,
@PAP_fechapago date

as

Update PAPELETA  SET PAP_documento = @PAP_documento , PAP_monto = @PAP_monto , PAP_estado = @PAP_estado ,PAP_fechapago = @PAP_fechapago 
where PAP_codigo = @PAP_codigo
GO
/****** Object:  StoredProcedure [dbo].[SP_Papeleta_Eliminar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[SP_Papeleta_Eliminar]
@PAP_codigo int

as

Update PAPELETA  
Set PAP_estado  = 3
where PAP_codigo  = @PAP_codigo  
GO
/****** Object:  StoredProcedure [dbo].[SP_Papeleta_Filtrar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Papeleta_Filtrar]
@anio int,
@valor varchar (20),
@opcion int

AS

If @opcion = 1


Select pap.PAP_codigo , pap.PAP_serie as  Nro_Serie ,inf.INF_codigo ,inf.INF_codigodesc as Infraccion,pap.UNI_codigo , u.UNI_placa as Placa,tc.TAR_serie as Tarjeta_Circulacion,u.PRO_codigo ,p2.PER_direccion,(p2.PER_apellidos +' '+p2.PER_nombre ) as PROPIETARIO,p2.PER_dni as DNIPropietario,u.UNI_tarjetapropiedad as Tarjeta_Propiedad ,pap.PAP_fechaemision as FechaEmision , pap.PAP_hora as Hora , pap.PAP_lugar as Lugar, pap.PAP_inspector ,p.PER_direccion,p.PER_telefono ,(p.PER_nombre +' '+p.PER_apellidos )as INSPECTOR,p.PER_dni as DniInspector,u.ASO_codigo, a.ASO_razonsocial as ASOCIACION , a.ASO_colores ,pap.CON_codigo ,p3.PER_direccion,(p3.PER_nombre +' '+p3.PER_apellidos )as CONDUCTOR,p3.PER_dni as DniConductor,pap.PAP_observacion as OBSERVACION ,es2.EST_descripcion as Estado ,pap.PAP_dependencia  , es.EST_descripcion as Dependencia, pap.PAP_tipo_persona
 from PAPELETA pap INNER JOIN PERSONA p on p.PER_codigo  = pap.PAP_inspector
  INNER JOIN UNIDAD u on u.UNI_codigo = pap.UNI_codigo
  INNER JOIN PERSONA p2 on p2.PER_codigo = u.PRO_codigo 
  INNER JOIN ASOCIACION a on a.ASO_codigo = u.ASO_codigo 
  INNER JOIN INFRACCION inf on inf.INF_codigo = pap.INF_codigo 
  INNER JOIN PERSONA p3 on  p3.PER_codigo = pap.CON_codigo 
  LEFT JOIN TARJETA_CIRCULACION  tc on tc.UNI_codigo = u.UNI_codigo 
  INNER JOIN ESTADO es on es.EST_codigo =  pap.PAP_dependencia 
  INNER JOIN ESTADO es2 on es2.EST_codigo = pap.PAP_estado 

Where YEAR(pap.PAP_fechaemision ) = @anio AND pap.PAP_serie  like '%'+ @valor AND  pap.PAP_estado  <> 3



If @opcion = 2

Select pap.PAP_codigo , pap.PAP_serie as  Nro_Serie ,inf.INF_codigo ,inf.INF_codigodesc as Infraccion,pap.UNI_codigo , u.UNI_placa as Placa,tc.TAR_serie as Tarjeta_Circulacion,u.PRO_codigo ,p2.PER_direccion,(p2.PER_apellidos +' '+p2.PER_nombre ) as PROPIETARIO,p2.PER_dni as DNIPropietario,u.UNI_tarjetapropiedad as Tarjeta_Propiedad ,pap.PAP_fechaemision as FechaEmision , pap.PAP_hora as Hora , pap.PAP_lugar as Lugar, pap.PAP_inspector ,p.PER_direccion,p.PER_telefono ,(p.PER_nombre +' '+p.PER_apellidos )as INSPECTOR,p.PER_dni as DniInspector,u.ASO_codigo, a.ASO_razonsocial as ASOCIACION , a.ASO_colores ,pap.CON_codigo ,p3.PER_direccion,(p3.PER_nombre +' '+p3.PER_apellidos )as CONDUCTOR,p3.PER_dni as DniConductor,pap.PAP_observacion as OBSERVACION ,es2.EST_descripcion as Estado  ,pap.PAP_dependencia , es.EST_descripcion as Dependencia, pap.PAP_tipo_persona
 from PAPELETA pap INNER JOIN PERSONA p on p.PER_codigo  = pap.PAP_inspector
  INNER JOIN UNIDAD u on u.UNI_codigo = pap.UNI_codigo
  INNER JOIN PERSONA p2 on p2.PER_codigo = u.PRO_codigo 
  INNER JOIN ASOCIACION a on a.ASO_codigo = u.ASO_codigo 
  INNER JOIN INFRACCION inf on inf.INF_codigo = pap.INF_codigo 
  INNER JOIN PERSONA p3 on  p3.PER_codigo = pap.CON_codigo 
  LEFT JOIN TARJETA_CIRCULACION  tc on tc.UNI_codigo = u.UNI_codigo 
  INNER JOIN ESTADO es on es.EST_codigo =  pap.PAP_dependencia 
  INNER JOIN ESTADO es2 on es2.EST_codigo = pap.PAP_estado 
Where YEAR(pap.PAP_fechaemision ) = @anio AND u.UNI_placa  like @valor + '%' AND  pap.PAP_estado  <> 3


IF @opcion = 3

Select pap.PAP_codigo , pap.PAP_serie as  Nro_Serie ,inf.INF_codigo ,inf.INF_codigodesc as Infraccion,pap.UNI_codigo , u.UNI_placa as Placa,tc.TAR_serie as Tarjeta_Circulacion,u.PRO_codigo ,p2.PER_direccion,(p2.PER_apellidos +' '+p2.PER_nombre ) as PROPIETARIO,p2.PER_dni as DNIPropietario,u.UNI_tarjetapropiedad as Tarjeta_Propiedad ,pap.PAP_fechaemision as FechaEmision , pap.PAP_hora as Hora , pap.PAP_lugar as Lugar, pap.PAP_inspector ,p.PER_direccion,p.PER_telefono ,(p.PER_nombre +' '+p.PER_apellidos )as INSPECTOR,p.PER_dni as DniInspector,u.ASO_codigo, a.ASO_razonsocial as ASOCIACION , a.ASO_colores ,pap.CON_codigo ,p3.PER_direccion,(p3.PER_nombre +' '+p3.PER_apellidos )as CONDUCTOR,p3.PER_dni as DniConductor,pap.PAP_observacion as OBSERVACION ,es2.EST_descripcion as Estado  ,pap.PAP_dependencia , es.EST_descripcion as Dependencia, pap.PAP_tipo_persona
 from PAPELETA pap INNER JOIN PERSONA p on p.PER_codigo  = pap.PAP_inspector
  INNER JOIN UNIDAD u on u.UNI_codigo = pap.UNI_codigo
  INNER JOIN PERSONA p2 on p2.PER_codigo = u.PRO_codigo 
  INNER JOIN ASOCIACION a on a.ASO_codigo = u.ASO_codigo 
  INNER JOIN INFRACCION inf on inf.INF_codigo = pap.INF_codigo 
  INNER JOIN PERSONA p3 on  p3.PER_codigo = pap.CON_codigo 
  LEFT JOIN TARJETA_CIRCULACION  tc on tc.UNI_codigo = u.UNI_codigo 
  INNER JOIN ESTADO es on es.EST_codigo =  pap.PAP_dependencia 
  INNER JOIN ESTADO es2 on es2.EST_codigo = pap.PAP_estado 
  
Where YEAR(pap.PAP_fechaemision ) = @anio AND p2.PER_dni   like @valor + '%' AND  pap.PAP_estado  <> 3
GO
/****** Object:  StoredProcedure [dbo].[SP_Papeleta_LicConducir]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[SP_Papeleta_LicConducir]

@CON_codigo int

as

Select  lc.LIC_numero, es.EST_descripcion 

from LICENCIA_CONDUCCION  lc INNER JOIN ESTADO es on es.EST_codigo = lc.LIC_estado 

Where lc.CON_codigo = @CON_codigo
GO
/****** Object:  StoredProcedure [dbo].[SP_Papeleta_Obtener_Serie]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Papeleta_Obtener_Serie]

AS

SELECT TOP 1 REPLICATE('0', 6 - DATALENGTH(CONVERT(VARCHAR(6),CONVERT(INT,PAP_serie,103) + 1,103))) + CONVERT(VARCHAR(6),CONVERT(INT,PAP_serie,103) + 1,103) AS PAP_serie
FROM PAPELETA pap 
ORDER BY PAP_codigo DESC

GO
/****** Object:  StoredProcedure [dbo].[SP_Papeleta_Resolucion]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Papeleta_Resolucion]

@ASO_codigo int

As

Select r.RES_numero ,es.EST_descripcion  

from RESOLUCION r inner join ASOCIACION a
on a.ASO_codigo = r.ASO_codigo  inner join ESTADO es
on es.EST_codigo = r.RES_estado 

where r.TIR_codigo =1 AND r.RES_estado = 4 AND r.RES_estado <> 3AND a.ASO_codigo = @ASO_codigo
GO
/****** Object:  StoredProcedure [dbo].[SP_Papeleta_TarjetaCirc]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Papeleta_TarjetaCirc]

@UNI_codigo int

As


Select tc.TAR_serie ,EST_descripcion 

from TARJETA_CIRCULACION  tc INNER JOIN
ESTADO es on  es.EST_codigo = tc.TAR_estado

Where UNI_codigo = @UNI_codigo
GO
/****** Object:  StoredProcedure [dbo].[SP_Paradero_Agregar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[SP_Paradero_Agregar]
@PAR_descripcion varchar (250),
@PAR_referencia varchar (250),
@PAR_reten varchar (250),
@PAR_retenreferencia varchar(250),
@RES_codigo int,
@PAR_estado int

as

Insert Into RESOLUCION_PARADERO  (PAR_descripcion ,PAR_referencia ,PAR_reten ,PAR_retenreferencia ,RES_codigo ,PAR_estado )
values (@PAR_descripcion ,@PAR_referencia ,@PAR_reten ,@PAR_retenreferencia ,@RES_codigo ,@PAR_estado )
GO
/****** Object:  StoredProcedure [dbo].[SP_Paradero_Editar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_Paradero_Editar]

@PAR_codigo int,
@PAR_descripcion varchar (250),
@PAR_referencia varchar (250),
@PAR_reten varchar (250),
@PAR_retenreferencia varchar(250),
@RES_codigo int

as

Update RESOLUCION_PARADERO SET PAR_descripcion = @PAR_descripcion , PAR_referencia = @PAR_referencia , PAR_reten = @PAR_reten , PAR_retenreferencia = @PAR_retenreferencia , RES_codigo = @RES_codigo 
where PAR_codigo = @PAR_codigo 
GO
/****** Object:  StoredProcedure [dbo].[SP_Paradero_Eliminar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SP_Paradero_Eliminar]

@PAR_codigo int

as

Update RESOLUCION_PARADERO  set PAR_estado = 3 where PAR_codigo = @PAR_codigo 
GO
/****** Object:  StoredProcedure [dbo].[SP_Paradero_Resolucion]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Paradero_Resolucion]

@RES_numero varchar (20),
@anio int

AS

Select res .RES_codigo ,res.RES_numero ,res.RES_fechaemision ,res.ASO_codigo ,a.ASO_razonsocial , e.EST_descripcion, res.TIR_codigo  

from RESOLUCION res INNER JOIN ESTADO e on e.EST_codigo = res.RES_estado 
INNER JOIN ASOCIACION a on a.ASO_codigo = res.ASO_codigo 

where res.RES_numero = @RES_numero AND YEAR(res.RES_fechaemision)= @anio AND res.RES_estado = 4 AND res.TIR_codigo  = 2
GO
/****** Object:  StoredProcedure [dbo].[SP_Persona_Editar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[SP_Persona_Editar]

@PER_codigo int,
@PER_dni char(8),
@PER_nombre varchar(100),
@PER_apellidos varchar  (100),
@PER_direccion varchar  (200),
@PER_telefono varchar (10),
@PER_estado Int

As

Update PERSONA SET PER_dni = @PER_dni , PER_nombre = @PER_nombre , PER_apellidos = @PER_apellidos , PER_direccion = @PER_direccion , PER_telefono = @PER_telefono , PER_estado = @PER_estado  
Where PER_codigo = @PER_codigo
GO
/****** Object:  StoredProcedure [dbo].[SP_Persona_Editar2]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Persona_Editar2]
@PER_codigo INT=NULL,
@PER_capacitacion INT=NULL
AS

UPDATE PERSONA SET PER_capacitacion = @PER_capacitacion 
WHERE PER_codigo = @PER_codigo
GO
/****** Object:  StoredProcedure [dbo].[SP_Persona_Eliminar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Persona_Eliminar]

@PER_codigo int

As

Update PERSONA  SET PER_estado = 3 Where PER_codigo = @PER_codigo 
GO
/****** Object:  StoredProcedure [dbo].[SP_Persona_Filtrar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Persona_Filtrar]

@parametro varchar(50)

As

Select  p.PER_codigo, p.PER_dni as DNI, p.PER_apellidos as Apellidos, p.PER_nombre as Nombre, p.PER_direccion as Direccion, p.PER_telefono as Telefono
From PERSONA p 
where (cast(p.PER_dni  as char(8)) + rtrim( p.PER_nombre  +  '  ' + p.PER_apellidos)) like '%'+@parametro + '%' AND p.PER_estado <> 3
Order by p.PER_apellidos
GO
/****** Object:  StoredProcedure [dbo].[SP_Persona_Filtrar2]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_Persona_Filtrar2]
@parametro varchar (50)

As

Select p.PER_codigo, p.PER_dni as DNI, p.PER_apellidos as Apellidos, p.PER_nombre as Nombre, p.PER_direccion as Direccion, p.PER_telefono as Telefono, lc.LIC_numero as LicenciaConducir, es.EST_descripcion as Estado
from PERSONA p left join LICENCIA_CONDUCCION  lc on lc.CON_codigo =p.PER_codigo
left join ESTADO es on es.EST_codigo = lc.LIC_estado  
--where (cast(p.PER_dni  as char(8)) + rtrim( p.PER_nombre  +  '  ' + p.PER_apellidos)) like '%'+@parametro + '%' AND P.PER_codigo  not in (Select CON_codigo from UNIDAD where UNI_estado <> 3 AND CON_codigo IS NOT NULL) AND p.PER_estado <> 3
where (cast(p.PER_dni  as char(8)) + rtrim( p.PER_nombre  +  '  ' + p.PER_apellidos)) like '%'+@parametro + '%' AND p.PER_estado <> 3
Order by p.PER_apellidos


GO
/****** Object:  StoredProcedure [dbo].[SP_Persona_Filtrar3]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Persona_Filtrar3]
@parametro as varchar(50)=NULL,
@filtro as integer=NULL
AS

IF @filtro=0
  BEGIN
	SELECT PER_codigo , PER_dni as DNI, PER_apellidos as Apellidos, PER_nombre as Nombres,  PER_direccion as Direccion, PER_telefono as Telefono ,PER_capacitacion
	FROM PERSONA 
	WHERE (cast(PER_dni   as char(8)) + rtrim( PER_nombre   +  '  ' + PER_apellidos )) like '%'+@parametro + '%' 
	AND PER_codigo IN ( Select CON_codigo   from UNIDAD  where UNI_estado <> 3) 
	AND PER_estado <> 3 
	ORDER BY PER_apellidos
  END

IF @filtro=1
  BEGIN
	SELECT PER_codigo , PER_dni as DNI, PER_apellidos as Apellidos, PER_nombre as NOmbres, PER_direccion as Direccion, PER_telefono as Telefono ,PER_capacitacion
	FROM PERSONA 
	WHERE (cast(PER_dni   as char(8)) + rtrim( PER_nombre   +  '  ' + PER_apellidos )) like '%'+@parametro + '%' 
	--AND PER_codigo IN ( Select CON_codigo   from UNIDAD  where UNI_estado <> 3) 
	AND PER_estado <> 3 
	ORDER BY PER_apellidos
  END  
GO
/****** Object:  StoredProcedure [dbo].[SP_Persona_Operaciones]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Persona_Operaciones]

@PER_dni char(8),
@PER_nombre varchar(100),
@PER_apellidos varchar  (100),
@PER_direccion varchar  (200),
@PER_telefono varchar (10),
@PER_estado Int,
@Opcion Int

AS

If @Opcion = 1
Insert into PERSONA (PER_dni ,PER_nombre ,PER_apellidos , PER_direccion , PER_telefono ,PER_estado , PER_capacitacion)
Values (@PER_dni,@PER_nombre ,@PER_apellidos ,@PER_direccion ,@PER_telefono , @PER_estado , 0)
GO
/****** Object:  StoredProcedure [dbo].[SP_prueba]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_prueba]
@dni int,
@variable int
AS
Insert into PERSONA (PER_dni,PER_nombre,PER_apellidos,PER_direccion)
Values ('@dni' , 'lalo', 'lolo' ,'lili')
SET @variable = (Select PER_codigo from PERSONA where PER_DNI = @dni)
Insert into CONDUCTOR(CON_codigo) values (@variable)
GO
/****** Object:  StoredProcedure [dbo].[SP_Reporte_RecordInfracciones]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_Reporte_RecordInfracciones]

@PER_codigo int

As

SELECT ROW_NUMBER() OVER (ORDER BY CONVERT(VARCHAR, PAP.PAP_fechaemision,103))AS Nro,
       (PER.PER_apellidos + ' ' + PER.PER_nombre ) AS Conductor , PER.PER_dni, PER.PER_direccion,
        PER.PER_telefono, CONVERT(VARCHAR,PAP.PAP_fechaemision,103) AS Fecha, INF.INF_codigodesc,
        PAP.PAP_lugar, INF.INF_descripcion, INF.INF_grado, EST.EST_descripcion AS Descripcion,
        INF.INF_medidaprev, INF.INF_penalidad, INF.INF_observacion,
        PAP.UNI_codigo, UNI.UNI_placa, PAP.ASO_codigo, ASO.ASO_razonsocial
FROM PAPELETA PAP 
INNER JOIN INFRACCION INF ON INF.INF_codigo = PAP.INF_codigo 
INNER JOIN PERSONA PER ON PER.PER_codigo  = PAP.CON_codigo 
INNER JOIN ESTADO EST ON EST.EST_codigo = INF.INF_grado 
INNER JOIN UNIDAD UNI ON PAP.UNI_codigo=UNI.UNI_codigo
INNER JOIN ASOCIACION ASO ON PAP.ASO_codigo=ASO.ASO_codigo
WHERE PER.PER_codigo = @PER_codigo and  PAP.PAP_estado <> 3
 
GO
/****** Object:  StoredProcedure [dbo].[SP_Reporte_RecordPapeleta_General]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Reporte_RecordPapeleta_General]
@UNI_codigo INT=NULL,
@CON_codigo INT=NULL,
@TIPO INT=NULL
AS

IF @TIPO=1 
  BEGIN
    SELECT u.UNI_placa AS Placa, a.ASO_razonsocial AS Asociacion,(p.PER_apellidos + ' ' + p.PER_nombre ) AS Propietario,
       p.PER_dni AS DNI, pap.PAP_serie, inf.INF_codigodesc AS INFRACCION, 
       CONVERT(VARCHAR,pap.PAP_fechaemision,103) AS FechaEMision, pap.PAP_hora AS Hora, pap.PAP_lugar,
       pap.PAP_monto AS Monto, e.EST_descripcion 
	FROM PAPELETA pap 
	INNER JOIN INFRACCION inf on inf.INF_codigo = pap.INF_codigo 
	INNER JOIN UNIDAD u on u.UNI_codigo = pap.UNI_codigo  
	INNER JOIN PERSONA p on p.PER_codigo = u.PRO_codigo 
	INNER JOIN ASOCIACION a on a.ASO_codigo = u.ASO_codigo
	INNER JOIN ESTADO e on e.EST_codigo = pap.PAP_estado  
	WHERE pap.UNI_codigo = @UNI_codigo
	ORDER BY pap.PAP_fechaemision ASC
  END

IF @TIPO=2
  BEGIN
    SELECT u.UNI_placa AS Placa, a.ASO_razonsocial AS Asociacion,(p.PER_apellidos + ' ' + p.PER_nombre ) AS Propietario,
       p.PER_dni AS DNI, pap.PAP_serie, inf.INF_codigodesc AS INFRACCION, f.EST_descripcion AS GRADO,
       CONVERT(VARCHAR,pap.PAP_fechaemision,103) AS FechaEMision, pap.PAP_hora AS Hora, pap.PAP_lugar,
       pap.PAP_monto AS Monto, e.EST_descripcion 
	FROM PAPELETA pap 
	INNER JOIN INFRACCION inf on inf.INF_codigo = pap.INF_codigo 
	INNER JOIN UNIDAD u on u.UNI_codigo = pap.UNI_codigo  
	INNER JOIN PERSONA p on p.PER_codigo = u.CON_codigo 
	INNER JOIN ASOCIACION a on a.ASO_codigo = u.ASO_codigo
	INNER JOIN ESTADO e on e.EST_codigo = pap.PAP_estado  
	INNER JOIN ESTADO f ON inf.INF_grado=f.EST_codigo AND f.EST_categoria=6
	WHERE p.PER_codigo = @CON_codigo
	ORDER BY pap.PAP_fechaemision ASC
  END
  
GO
/****** Object:  StoredProcedure [dbo].[SP_Resolucion_Agregar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[SP_Resolucion_Agregar]

@RES_numero varchar(20),
@RES_fechaemision date,
@RES_fechavencimiento date,
@RES_observacion varchar(150),
@TIR_codigo int,
@ASO_codigo int,
@RES_estado int

As

Insert Into RESOLUCION (RES_numero ,RES_fechaemision ,RES_fechavencimiento ,RES_observacion ,TIR_codigo ,ASO_codigo ,RES_estado )
values (@RES_numero ,@RES_fechaemision ,@RES_fechavencimiento ,@RES_observacion ,@TIR_codigo ,@ASO_codigo , @RES_estado )
GO
/****** Object:  StoredProcedure [dbo].[SP_Resolucion_Editar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[SP_Resolucion_Editar]
@RES_numero varchar (20),
@RES_fechaemision date,
@RES_fechavencimiento date,
@RES_observacion varchar (150),
@TIR_codigo int,
@ASO_codigo int,
@RES_estado int,
@RES_codigo int

As

Update RESOLUCION   
SET RES_numero = @RES_numero , RES_fechaemision = @RES_fechaemision , RES_fechavencimiento = @RES_fechavencimiento , RES_observacion = @RES_observacion ,
TIR_codigo = @TIR_codigo , ASO_codigo = @ASO_codigo ,RES_estado =@RES_estado
Where  RES_codigo = @RES_codigo 
GO
/****** Object:  StoredProcedure [dbo].[SP_Resolucion_Eliminar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create  procedure [dbo].[SP_Resolucion_Eliminar]
@RES_codigo int

AS

Update RESOLUCION 
Set RES_estado = 3
where RES_codigo = @RES_codigo 
GO
/****** Object:  StoredProcedure [dbo].[SP_Resolucion_Filtrar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Resolucion_Filtrar]

@parametro varchar(50),
@anio varchar (5),
@tipores int

As

SELECT  r.RES_codigo, r.RES_numero as Numero, r.RES_fechaemision as FechaEmision, r.RES_fechavencimiento as FechaVencimiento, r.TIR_codigo,tr.TIR_descripcion as TipoResolucion , r.ASO_codigo,a.ASO_razonsocial as Asociacion,a.ASO_ruc as RUC, r.RES_estado ,e.EST_descripcion  as Estado, r.RES_observacion as Observacion
FROM RESOLUCION r inner join TIPO_RESOLUCION tr ON tr.TIR_codigo = r.TIR_codigo 
inner join ASOCIACION a ON a.ASO_codigo = r.ASO_codigo inner join ESTADO e ON e.EST_codigo = r.RES_estado 
Where r.RES_numero like  '%'+@parametro AND r.RES_estado <> 3 AND YEAR(r.RES_fechaemision ) = @anio  AND r.TIR_codigo  = @tipores 
GO
/****** Object:  StoredProcedure [dbo].[SP_Series_Anuladas_CC_Agregar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_Series_Anuladas_CC_Agregar]
@SER_numero VARCHAR(12)=NULL,
@SER_fecha DATETIME=NULL,
@SER_observacion VARCHAR(200)=NULL,
@SER_usuario VARCHAR(50)=NULL
AS

INSERT INTO SERIES_ANULADAS (SER_numero,SER_fecha,SER_observacion,SER_usuario)
                     VALUES (@SER_numero,@SER_fecha,@SER_observacion,@SER_usuario)


GO
/****** Object:  StoredProcedure [dbo].[SP_Series_Anuladas_CC_Listar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_Series_Anuladas_CC_Listar]
@SER_id INT=NULL,
@SER_numero VARCHAR(12)=NULL,
@TIPO INT=NULL
AS

IF @TIPO=1  --SE LISTA TODOS LOS REGISTROS DE SERIES ANULADAS
  BEGIN
	SELECT SER_id,SER_numero,CONVERT(VARCHAR(12),SER_fecha,103) AS SER_fecha,SER_observacion,SER_usuario
	FROM SERIES_ANULADAS
  END
GO
/****** Object:  StoredProcedure [dbo].[SP_Socio_Reporte]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SP_Socio_Reporte]
@ASO_codigo int

as


Select ROW_NUMBER() OVER (order by so.SOC_codigo )as Nro,p.PER_dni as DNI , (p.PER_apellidos + ' ' +p.PER_nombre ) as Nombre, p.PER_direccion as Direccion, p.PER_telefono as Telefono,a.ASO_ruc  as RUC , a.ASO_razonsocial as RAZONSOCIAL, a.ASO_telefono as TELEFONO,a.ASO_colores as COLORES

from SOCIO_ASOCIACION so INNER JOIN PERSONA p on p.PER_codigo = so.PER_codigo
INNER JOIN ASOCIACION a on a.ASO_codigo = so.ASO_codigo  


Where so.ASO_codigo = @ASO_codigo AND so.SOC_estado=1
GO
/****** Object:  StoredProcedure [dbo].[SP_Tarjeta_Circulacion_Reporte]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_Tarjeta_Circulacion_Reporte]
@ASO_codigo VARCHAR(3)=NULL,
@TAR_condicion VARCHAR(3)=NULL,
@TAR_estado VARCHAR(3)=NULL
AS

SELECT U1.UNI_codigo, U1.UNI_placa, UNI_seriechasis, UNI_motor, UNI_tarjetapropiedad, UNI_aniofabrica, UNI_estado, MOD_codigo, ASO_codigo, UNI_numerounidad, CON_codigo, PRO_codigo, UNI_inspecciontec
INTO #UNIDAD
FROM UNIDAD U1 INNER JOIN (SELECT MAX(UNI_codigo) AS UNI_codigo, UNI_placa FROM UNIDAD GROUP BY UNI_placa) U2 ON U1.UNI_codigo=U2.UNI_codigo
WHERE U1.UNI_estado  <> 3


SELECT ROW_NUMBER() OVER (ORDER BY p.PER_apellidos +' '+p.PER_nombre) as Ittem,A.ASO_razonsocial,A.ASO_colores, u.UNI_numerounidad,(p.PER_apellidos +' '+p.PER_nombre ) as Propietario,p.PER_direccion,
       ('R.A.N°'+ r.RES_numero + '-' + CONVERT (varchar,YEAR(r.RES_fechaemision))+'-MDE') as Operaciones,('R.A.N°'+ r2.RES_numero + '-' + CONVERT (varchar,YEAR(r2.RES_fechaemision))+'-MDE')as Paradero,
       u.UNI_placa,m.MAR_descripcion,ase.ASE_descripcion ,u.UNI_seriechasis,
       CONVERT(VARCHAR(10),tc.TAR_fechaemision,103) as Fechaemision,
       CONVERT(VARCHAR(10),tc.TAR_fechavencimiento,103) as FechaVencimiento,tc.TAR_serie,tc.TAR_codigo,       
       E.EST_descripcion,F.EST_descripcion,tc.TAR_estado,tc.TAR_estadosistema
       --,U.UNI_estado
FROM   dbo.ASOCIACION AS A
       --INNER JOIN dbo.UNIDAD AS u ON u.ASO_codigo=a.ASO_codigo 
       INNER JOIN #UNIDAD U ON u.ASO_codigo=a.ASO_codigo 
       INNER JOIN dbo.PERSONA AS p ON p.PER_codigo=u.PRO_codigo 
       INNER JOIN dbo.MODELO AS mo ON mo.MOD_codigo=u.MOD_codigo 
       INNER JOIN dbo.MARCA AS m ON m.MAR_codigo=mo.MAR_codigo   
       INNER JOIN dbo.RESOLUCION AS r ON r.ASO_codigo=A.ASO_codigo 
       LEFT JOIN temporal AS r2 ON r2.ASO_codigo=A.ASO_codigo  
       INNER JOIN dbo.ASEGURADORA_VEHICULO AS av ON av.UNI_codigo=u.UNI_codigo  
       INNER JOIN dbo.ASEGURADORA AS ase ON ase.ASE_codigo=av.ASE_codigo  
       INNER JOIN dbo.TARJETA_CIRCULACION AS tc ON tc.UNI_codigo=u.UNI_codigo               
       INNER JOIN ESTADO E ON tc.TAR_estado=E.EST_codigo --AND E.EST_categoria=2
       INNER JOIN ESTADO F ON tc.TAR_estadosistema=F.EST_codigo --AND F.EST_categoria=11
WHERE  a.ASO_estado <> 3 AND r.RES_estado=4 AND r.TIR_codigo=1 AND
       --AND tc.TAR_estado=4 AND --AND tc.UNI_codigo=@UNI_codigo
       A.ASO_codigo like '%' + @ASO_codigo + '%' AND
       TC.TAR_estado like '%' + @TAR_condicion + '%' AND
       TC.TAR_estadosistema like '%' + @TAR_estado + '%' AND
       tc.TAR_codigo IN (SELECT MAX(TAR_codigo) AS TAR_codigo
                         FROM TARJETA_CIRCULACION T 
                         INNER JOIN UNIDAD U ON T.UNI_codigo=U.UNI_codigo
                         GROUP BY U.UNI_placa)
--ORDER BY tc.TAR_codigo
--ORDER BY tc.TAR_fechavencimiento
ORDER BY p.PER_apellidos,p.PER_nombre

DROP TABLE #UNIDAD
GO
/****** Object:  StoredProcedure [dbo].[SP_Tarjeta_EditarEstado]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Tarjeta_EditarEstado]
@TAR_codigo int,
@TAR_estadosistema int
--@TAR_estado int

as

Update TARJETA_CIRCULACION  SET TAR_estadosistema = @TAR_estadosistema where TAR_codigo = @TAR_codigo 
GO
/****** Object:  StoredProcedure [dbo].[SP_Tarjeta_EditarEstado2]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Tarjeta_EditarEstado2]
@TAR_codigo int,
@TAR_estadosistema int,
@TAR_estado int

as

Update TARJETA_CIRCULACION  SET TAR_estadosistema = @TAR_estadosistema, TAR_estado = @TAR_estado  where TAR_codigo = @TAR_codigo 
GO
/****** Object:  StoredProcedure [dbo].[SP_Tarjeta_EditarFechaEntrega]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Tarjeta_EditarFechaEntrega]
@TAR_codigo INT=NULL,
@TAR_fechaentrega DATE=NULL
AS

UPDATE TARJETA_CIRCULACION  
SET TAR_fechaentrega = @TAR_fechaentrega 
WHERE TAR_codigo = @TAR_codigo 






GO
/****** Object:  StoredProcedure [dbo].[SP_TarjetaCirculacion_Agregar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_TarjetaCirculacion_Agregar]

@TAR_serie int,
@TAR_fechaemision date,
@UNI_codigo int,
@TAR_fechavencimiento date,
@TAR_estado int,
@TAR_estadosistema int


as

Insert INTO TARJETA_CIRCULACION  (TAR_serie , TAR_fechaemision , UNI_codigo , TAR_fechavencimiento , TAR_estado, TAR_estadosistema )
values (@TAR_serie , @TAR_fechaemision , @UNI_codigo , @TAR_fechavencimiento , @TAR_estado , @TAR_estadosistema )
GO
/****** Object:  StoredProcedure [dbo].[SP_TarjetaCirculacion_Filtrar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_TarjetaCirculacion_Filtrar]

@anio int,
@valor varchar (20),
@opcion int

AS

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='temporal2')DROP TABLE temporal2 
SELECT RES_codigo,RES_numero,TIR_codigo,R.ASO_codigo,R.RES_fechaemision  INTO temporal2 FROM Resolucion as R Inner Join ASOCIACION as A On R.ASO_codigo=A.ASO_codigo where R.TIR_codigo=2 AND R.RES_fechaemision = (Select MAX(r3.RES_fechaemision) from RESOLUCION r3 where r3.RES_estado = 4 AND r3.ASO_codigo = R.ASO_codigo) 


IF @opcion=1
  BEGIN
  --SELECT  tc.TAR_codigo,tc.TAR_serie ,u.UNI_placa as PlacaUnidad,a.ASO_razonsocial as RazonSocial, a.ASO_colores as Colores, u.UNI_numerounidad as NroUnidad, (p.PER_apellidos +' '+p.PER_nombre ) as Propietario,p.PER_direccion as Direccion ,('R.A.N°'+ r.RES_numero + '-' + CONVERT (varchar,YEAR(r.RES_fechaemision))+'-MDE') as NroOperaciones,( 'R.A.N°'+ r2.RES_numero + '-' + CONVERT (varchar,YEAR(r2.RES_fechaemision))+'-MDE') as NroParadero,m.MAR_descripcion as Marca,ase.ASE_descripcion as Aseguradora,u.UNI_seriechasis as SerieChasis,CONVERT(VARCHAR(10),tc.TAR_fechaemision, 103) as Fechaemision ,CONVERT(VARCHAR(10),tc.TAR_fechavencimiento, 103) as FechaVencimiento,tc.TAR_estadosistema,e2.EST_descripcion  as EstadoSistema ,tc.TAR_estado,e1.EST_descripcion  as Estado,tc.UNI_codigo 
  --FROM dbo.ASOCIACION AS a INNER JOIN dbo.UNIDAD AS u ON u.ASO_codigo = a.ASO_codigo INNER JOIN dbo.PERSONA as p on p.PER_codigo = u.PRO_codigo INNER JOIN dbo.MODELO as mo on mo.MOD_codigo = u.MOD_codigo INNER JOIN dbo.MARCA as m on m.MAR_codigo =mo.MAR_codigo INNER JOIN dbo.RESOLUCION  as r on r.ASO_codigo = a.ASO_codigo LEFT JOIN temporal2 as r2 on r2.ASO_codigo = a.ASO_codigo INNER JOIN dbo.ASEGURADORA_VEHICULO as av on av.UNI_codigo = u.UNI_codigo INNER JOIN dbo.ASEGURADORA as ase on ase.ASE_codigo = av.ASE_codigo INNER JOIN dbo.TARJETA_CIRCULACION  as tc on tc.UNI_codigo = u.UNI_codigo INNER JOIN ESTADO e1 on e1.EST_codigo = tc.TAR_estado INNER JOIN ESTADO e2 on e2.EST_codigo = tc.TAR_estadosistema 
  --where a.ASO_estado <> 3 AND r.RES_estado  = 4 AND r.TIR_codigo = 1 AND tc.TAR_estado <> 3 
  -- AND YEAR(tc.TAR_fechaemision) = @anio AND tc.TAR_serie   like '%'+ @valor + '%'
 
	SELECT TC.TAR_codigo,TC.TAR_serie,U.UNI_placa as PlacaUnidad,
		   A.ASO_razonsocial as RazonSocial, A.ASO_colores as Colores, 
		   U.UNI_numerounidad as NroUnidad, 
		   (P.PER_apellidos+' '+P.PER_nombre) as Propietario,P.PER_direccion as Direccion,
		  ('R.A.N°'+ R.RES_numero + '-' + CONVERT (varchar,YEAR(R.RES_fechaemision))+'-MDE') as NroOperaciones,
		  ('R.A.N°'+ R.RES_numero + '-' + CONVERT (varchar,YEAR(R.RES_fechaemision))+'-MDE') as NroParadero,
		  --( 'R.A.N°'+ R2.RES_numero + '-' + CONVERT (varchar,YEAR(R2.RES_fechaemision))+'-MDE') as NroParadero,
		   Ma.MAR_descripcion as Marca,Ae.ASE_descripcion as Aseguradora,
		   U.UNI_seriechasis as SerieChasis,CONVERT(VARCHAR(10),TC.TAR_fechaemision, 103) as Fechaemision ,
		   CONVERT(VARCHAR(10),TC.TAR_fechavencimiento, 103) as FechaVencimiento, CONVERT(VARCHAR(10),TC.TAR_fechaentrega, 103) as FechaEntrega,
		   TC.TAR_estadosistema,E2.EST_descripcion as EstadoSistema,TC.TAR_estado,E1.EST_descripcion as Estado,TC.UNI_codigo 
	FROM                             
		 TARJETA_CIRCULACION TC INNER JOIN 
		 UNIDAD               U  ON  TC.UNI_codigo=u.UNI_codigo INNER JOIN
		 ASOCIACION           A  ON  U.ASO_codigo=A.ASO_codigo INNER JOIN         
		 PERSONA              P  ON  P.PER_codigo=U.PRO_codigo INNER JOIN      
		 MODELO               Mo ON  Mo.MOD_codigo=U.MOD_codigo INNER JOIN      
		 MARCA                Ma ON  Ma.MAR_codigo=Mo.MAR_codigo INNER JOIN
		 RESOLUCION           R  ON  R.ASO_codigo=A.ASO_codigo INNER JOIN      
		 --Temporal as R2 on R2.ASO_codigo = A.ASO_codigo INNER JOIN      
		 ASEGURADORA_VEHICULO Av ON  Av.UNI_codigo=U.UNI_codigo INNER JOIN 
		 ASEGURADORA          Ae ON  Ae.ASE_codigo = Av.ASE_codigo INNER JOIN 
		 ESTADO               E1 ON  E1.EST_codigo = TC.TAR_estado INNER JOIN 
		 ESTADO               E2 ON  E2.EST_codigo = TC.TAR_estadosistema 
	WHERE A.ASO_estado <> 3 
		  AND
		  R.RES_estado = 4 
		  AND 
		  R.TIR_codigo = 1 
		  AND 
		  TC.TAR_estado <> 3 
		  AND 
		  YEAR(TC.TAR_fechaemision)=@anio
		  AND 
		  TC.TAR_serie like '%'+ @valor + '%'		  		  
  END

IF @opcion = 2
  BEGIN 
    --SELECT  tc.TAR_codigo,tc.TAR_serie ,u.UNI_placa as PlacaUnidad,a.ASO_razonsocial as RazonSocial, a.ASO_colores as Colores, u.UNI_numerounidad as NroUnidad, (p.PER_apellidos +' '+p.PER_nombre ) as Propietario,p.PER_direccion as Direccion ,('R.A.N°'+ r.RES_numero + '-' + CONVERT (varchar,YEAR(r.RES_fechaemision))+'-MDE') as NroOperaciones,( 'R.A.N°'+ r2.RES_numero + '-' + CONVERT (varchar,YEAR(r2.RES_fechaemision))+'-MDE') as NroParadero,m.MAR_descripcion as Marca,ase.ASE_descripcion as Aseguradora,u.UNI_seriechasis as SerieChasis,CONVERT(VARCHAR(10),tc.TAR_fechaemision, 103) as Fechaemision ,CONVERT(VARCHAR(10),tc.TAR_fechavencimiento, 103) as FechaVencimiento,tc.TAR_estadosistema,e2.EST_descripcion  as EstadoSistema ,tc.TAR_estado,e1.EST_descripcion  as Estado,tc.UNI_codigo 
    --FROM dbo.ASOCIACION AS a INNER JOIN dbo.UNIDAD AS u ON u.ASO_codigo = a.ASO_codigo INNER JOIN dbo.PERSONA as p on p.PER_codigo = u.PRO_codigo INNER JOIN dbo.MODELO as mo on mo.MOD_codigo = u.MOD_codigo INNER JOIN dbo.MARCA as m on m.MAR_codigo =mo.MAR_codigo INNER JOIN dbo.RESOLUCION  as r on r.ASO_codigo = a.ASO_codigo LEFT JOIN temporal2 as r2 on r2.ASO_codigo = a.ASO_codigo INNER JOIN dbo.ASEGURADORA_VEHICULO as av on av.UNI_codigo = u.UNI_codigo INNER JOIN dbo.ASEGURADORA as ase on ase.ASE_codigo = av.ASE_codigo INNER JOIN dbo.TARJETA_CIRCULACION  as tc on tc.UNI_codigo = u.UNI_codigo INNER JOIN ESTADO e1 on e1.EST_codigo = tc.TAR_estado INNER JOIN ESTADO e2 on e2.EST_codigo = tc.TAR_estadosistema 
    --where a.ASO_estado <> 3 AND r.RES_estado  = 4 AND r.TIR_codigo = 1 AND tc.TAR_estado <> 3
    --AND YEAR(tc.TAR_fechaemision) = @anio AND u.UNI_placa   like '%'+ @valor + '%'
        
	SELECT TC.TAR_codigo,TC.TAR_serie,U.UNI_placa as PlacaUnidad,
		   A.ASO_razonsocial as RazonSocial, A.ASO_colores as Colores, 
		   U.UNI_numerounidad as NroUnidad, 
		   (P.PER_apellidos+' '+P.PER_nombre) as Propietario,P.PER_direccion as Direccion,
		  ('R.A.N°'+ R.RES_numero + '-' + CONVERT (varchar,YEAR(R.RES_fechaemision))+'-MDE') as NroOperaciones,
		  ('R.A.N°'+ R.RES_numero + '-' + CONVERT (varchar,YEAR(R.RES_fechaemision))+'-MDE') as NroParadero,
		  --( 'R.A.N°'+ R2.RES_numero + '-' + CONVERT (varchar,YEAR(R2.RES_fechaemision))+'-MDE') as NroParadero,
		   Ma.MAR_descripcion as Marca,Ae.ASE_descripcion as Aseguradora,
		   U.UNI_seriechasis as SerieChasis,CONVERT(VARCHAR(10),TC.TAR_fechaemision, 103) as Fechaemision ,
		   CONVERT(VARCHAR(10),TC.TAR_fechavencimiento, 103) as FechaVencimiento,TAR_fechaentrega AS FechaEntrega,TC.TAR_estadosistema,E2.EST_descripcion as EstadoSistema,TC.TAR_estado,E1.EST_descripcion as Estado,TC.UNI_codigo 
	FROM                             
		 TARJETA_CIRCULACION TC INNER JOIN 
		 UNIDAD               U  ON  TC.UNI_codigo=u.UNI_codigo INNER JOIN
		 ASOCIACION           A  ON  U.ASO_codigo=A.ASO_codigo INNER JOIN         
		 PERSONA              P  ON  P.PER_codigo=U.PRO_codigo INNER JOIN      
		 MODELO               Mo ON  Mo.MOD_codigo=U.MOD_codigo INNER JOIN      
		 MARCA                Ma ON  Ma.MAR_codigo=Mo.MAR_codigo INNER JOIN
		 RESOLUCION           R  ON  R.ASO_codigo=A.ASO_codigo INNER JOIN      
		 --Temporal as R2 on R2.ASO_codigo = A.ASO_codigo INNER JOIN      
		 ASEGURADORA_VEHICULO Av ON  Av.UNI_codigo=U.UNI_codigo INNER JOIN 
		 ASEGURADORA          Ae ON  Ae.ASE_codigo = Av.ASE_codigo INNER JOIN 
		 ESTADO               E1 ON  E1.EST_codigo = TC.TAR_estado INNER JOIN 
		 ESTADO               E2 ON  E2.EST_codigo = TC.TAR_estadosistema 
	WHERE A.ASO_estado <> 3 
		  AND
		  R.RES_estado = 4 
		  AND 
		  R.TIR_codigo = 1 
		  AND 
		  TC.TAR_estado <> 3 
		  AND 
		  YEAR(TC.TAR_fechaemision)=@anio
		  AND 
		  U.UNI_placa like '%'+ @valor + '%'		  		  
  END
GO
/****** Object:  StoredProcedure [dbo].[SP_TarjetaCirculacion_Reporte]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_TarjetaCirculacion_Reporte]


@UNI_codigo int



As

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='temporal')DROP TABLE temporal 



SELECT RES_codigo,RES_numero,TIR_codigo,R.ASO_codigo,R.RES_fechaemision  INTO temporal FROM Resolucion as R Inner Join ASOCIACION as A
On R.ASO_codigo=A.ASO_codigo where R.TIR_codigo=2



SELECT      a.ASO_razonsocial, a.ASO_colores, u.UNI_numerounidad, (p.PER_apellidos +' '+p.PER_nombre ) as Propietario,p.PER_direccion
            ,( 'R.A.N°'+ r.RES_numero + '-' + CONVERT (varchar,YEAR(r.RES_fechaemision))+'-MDE') as Operaciones,( 'R.A.N°'+ r2.RES_numero + '-' + CONVERT (varchar,YEAR(r2.RES_fechaemision))+'-MDE')as Paradero,u.UNI_placa,m.MAR_descripcion,ase.ASE_descripcion ,u.UNI_seriechasis,
            CONVERT(VARCHAR(10),  tc.TAR_fechaemision, 103) as Fechaemision ,CONVERT(VARCHAR(10),  tc.TAR_fechavencimiento, 103) as FechaVencimiento  ,tc.TAR_serie , tc.TAR_codigo

FROM         dbo.ASOCIACION AS a INNER JOIN
             dbo.UNIDAD AS u ON u.ASO_codigo = a.ASO_codigo INNER JOIN
             dbo.PERSONA as p on p.PER_codigo = u.PRO_codigo INNER JOIN
             dbo.MODELO as mo on mo.MOD_codigo = u.MOD_codigo INNER JOIN
             dbo.MARCA as m on m.MAR_codigo =mo.MAR_codigo   INNER JOIN
             dbo.RESOLUCION  as r on r.ASO_codigo = a.ASO_codigo left JOIN
             temporal as r2 on r2.ASO_codigo = a.ASO_codigo  INNER JOIN
             dbo.ASEGURADORA_VEHICULO as av on av.UNI_codigo = u.UNI_codigo  INNER JOIN
             dbo.ASEGURADORA as ase on ase.ASE_codigo = av.ASE_codigo  INNER JOIN
             dbo.TARJETA_CIRCULACION  as tc on tc.UNI_codigo = u.UNI_codigo   
             
Where a.ASO_estado <> 3 AND r.RES_estado  = 4 AND r.TIR_codigo = 1 
AND tc.TAR_estado = 4 AND tc.UNI_codigo   = @UNI_codigo

Order By r2.RES_fechaemision desc
GO
/****** Object:  StoredProcedure [dbo].[SP_Unidad_Agregar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Unidad_Agregar]

@UNI_placa varchar(11),
@UNI_seriechasis varchar (20),
@UNI_motor varchar(20),
@UNI_tarjetapropiedad varchar (20),
@UNI_aniofabrica int,
@UNI_estado int,
@CON_codigo int,
@PRO_codigo int ,
@MOD_codigo int,
@ASO_codigo int,
@UNI_numerounidad varchar (6),
@UNI_inspecciontec int


AS
Insert into UNIDAD (UNI_placa, UNI_seriechasis,UNI_motor,UNI_tarjetapropiedad,UNI_aniofabrica,UNI_estado,CON_codigo,PRO_codigo,MOD_codigo,ASO_codigo,UNI_numerounidad,UNI_inspecciontec)
values (@UNI_placa,@UNI_seriechasis,@UNI_motor,@UNI_tarjetapropiedad,@UNI_aniofabrica,@UNI_estado,@CON_codigo,@PRO_codigo,@MOD_codigo,@ASO_codigo,@UNI_numerounidad,@UNI_inspecciontec)
GO
/****** Object:  StoredProcedure [dbo].[SP_Unidad_Editar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_Unidad_Editar]

@UNI_placa varchar(11)=null,
@UNI_seriechasis varchar (20)=null,
@UNI_motor varchar(20)=null,
@UNI_tarjetapropiedad varchar (20)=null,
@UNI_aniofabrica int=null,
@UNI_estado int=null,
@PRO_codigo int=null,
@MOD_codigo int=null,
@ASO_codigo int=null,
@CON_codigo int=null,
@UNI_numerounidad varchar(6)=null,
@UNI_inspecciontec int=null,
@UNI_codigo int=null,
@UNI_tipo int=null
AS

if @UNI_tipo=1
 Begin
  Update UNIDAD SET UNI_placa = @UNI_placa , UNI_seriechasis = @UNI_seriechasis,UNI_motor =@UNI_motor,UNI_tarjetapropiedad =@UNI_tarjetapropiedad,UNI_aniofabrica =@UNI_aniofabrica   , UNI_estado  = @UNI_estado ,
  PRO_codigo =@PRO_codigo ,MOD_codigo = @MOD_codigo, CON_codigo=@CON_codigo, ASO_codigo = @ASO_codigo ,UNI_numerounidad =@UNI_numerounidad, UNI_inspecciontec =@UNI_inspecciontec 
  Where UNI_codigo = @UNI_codigo 
 End
 
 if @UNI_tipo=2
  Begin
   Update UNIDAD SET UNI_estado=@UNI_estado
   Where UNI_codigo = @UNI_codigo 
  End
 
 
 
GO
/****** Object:  StoredProcedure [dbo].[SP_Unidad_Eliminar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Unidad_Eliminar]

@UNI_codigo int

AS

Update UNIDAD  Set UNI_estado = 3 Where UNI_codigo = @UNI_codigo 
Update ASEGURADORA_VEHICULO SET ASV_estado = 3  where UNI_codigo = @UNI_codigo
GO
/****** Object:  StoredProcedure [dbo].[SP_Unidad_Filtrar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Unidad_Filtrar]
@parametro as varchar (50)

AS

Select  u.UNI_codigo ,u.UNI_numerounidad as NroUnidad ,u.UNI_placa as Placa,u.UNI_seriechasis as SerieChasis,u.UNI_motor as NroMotor,u.UNI_inspecciontec, es2.EST_descripcion as InspeccionTec,mo.MAR_codigo ,ma.MAR_descripcion as Marca ,u.MOD_codigo,mo.MOD_descripcion as Modelo ,u.UNI_aniofabrica as AñoFabrica ,av.ASV_tiposeguro,es4.EST_descripcion as TipoSeguro ,ase.ASE_codigo ,ase.ASE_descripcion as EmpAseguradora ,av.ASV_numerocertificado as NroSeguro ,av.ASV_fechaemision as FechaEmisionSEguro ,av.ASV_fechavencimiento as FechaVencimientoSeguro,av.ASV_estado ,es3.EST_descripcion as EstadoSeguro  ,u.UNI_estado,es.EST_descripcion as EstadoUnidad,u.ASO_codigo,a.ASO_razonsocial as Asociacion ,a.ASO_ruc as Ruc,u.PRO_codigo,per.PER_dni as DniPropietario ,(per.PER_nombre+' '+per.PER_apellidos) as Propietario,per.PER_direccion as Direccion ,per.PER_telefono as Telefono,u.UNI_tarjetapropiedad as TarjetaPropiedad
 
From  UNIDAD u INNER JOIN MODELO mo ON mo.MOD_codigo  = u.MOD_codigo 
               INNER JOIN MARCA ma ON ma.MAR_codigo  = mo.MAR_codigo 
               INNER JOIN ESTADO es ON es.EST_codigo = u.UNI_estado 
               INNER JOIN ASOCIACION a ON a.ASO_codigo = u.ASO_codigo 
               INNER JOIN ESTADO es2 ON es2.EST_codigo = u.UNI_inspecciontec 
               INNER JOIN PERSONA per ON  per.PER_codigo  = u.PRO_codigo 
               INNER JOIN ASEGURADORA_VEHICULO av ON av.UNI_codigo = u.UNI_codigo
               INNER JOIN ASEGURADORA ase ON ase.ASE_codigo =av.ASE_codigo 
               INNER JOIN ESTADO es3 ON es3.EST_codigo = av.ASV_estado 
               INNER JOIN ESTADO es4 ON es4.EST_codigo = av.ASV_tiposeguro
               
where u.UNI_placa  like  @parametro + '%' AND u.UNI_estado  <> 3
GO
/****** Object:  StoredProcedure [dbo].[SP_Unidad_Filtrar_Asoc]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Unidad_Filtrar_Asoc]
@parametro as varchar(50)=NULL,
@asocodigo as integer=NULL,
@operacionbuscar as integer=NULL

AS

if @operacionbuscar=1
BEGIN 
Select  u.UNI_codigo ,u.UNI_numerounidad as NroUnidad ,u.UNI_placa as Placa,u.UNI_seriechasis as SerieChasis,u.UNI_motor as NroMotor,u.UNI_inspecciontec, es2.EST_descripcion as InspeccionTec,mo.MAR_codigo ,ma.MAR_descripcion as Marca ,u.MOD_codigo,mo.MOD_descripcion as Modelo ,u.UNI_aniofabrica as AñoFabrica ,av.ASV_tiposeguro,es4.EST_descripcion as TipoSeguro ,ase.ASE_codigo ,ase.ASE_descripcion as EmpAseguradora ,av.ASV_numerocertificado as NroSeguro ,av.ASV_fechaemision as FechaEmisionSEguro ,av.ASV_fechavencimiento as FechaVencimientoSeguro,av.ASV_estado ,es3.EST_descripcion as EstadoSeguro  ,u.UNI_estado,es.EST_descripcion as EstadoUnidad,u.ASO_codigo,a.ASO_razonsocial as Asociacion ,a.ASO_ruc as Ruc,u.PRO_codigo,per.PER_dni as DniPropietario ,(per.PER_nombre+' '+per.PER_apellidos) as Propietario,per.PER_direccion as Direccion ,per.PER_telefono as Telefono,u.UNI_tarjetapropiedad as TarjetaPropiedad 
From  UNIDAD u INNER JOIN MODELO mo ON mo.MOD_codigo  = u.MOD_codigo 
               INNER JOIN MARCA ma ON ma.MAR_codigo  = mo.MAR_codigo 
               INNER JOIN ESTADO es ON es.EST_codigo = u.UNI_estado 
               INNER JOIN ASOCIACION a ON a.ASO_codigo = u.ASO_codigo 
               INNER JOIN ESTADO es2 ON es2.EST_codigo = u.UNI_inspecciontec 
               INNER JOIN PERSONA per ON  per.PER_codigo  = u.PRO_codigo 
               INNER JOIN ASEGURADORA_VEHICULO av ON av.UNI_codigo = u.UNI_codigo
               INNER JOIN ASEGURADORA ase ON ase.ASE_codigo =av.ASE_codigo 
               INNER JOIN ESTADO es3 ON es3.EST_codigo = av.ASV_estado 
               INNER JOIN ESTADO es4 ON es4.EST_codigo = av.ASV_tiposeguro               
where a.ASO_codigo=@asocodigo AND u.UNI_placa like '%' + @parametro + '%' AND u.UNI_estado  <> 3
order by cast(u.UNI_numerounidad as int) asc
END

if @operacionbuscar=2
BEGIN 
Select  u.UNI_codigo ,u.UNI_numerounidad as NroUnidad ,u.UNI_placa as Placa,u.UNI_seriechasis as SerieChasis,u.UNI_motor as NroMotor,u.UNI_inspecciontec, es2.EST_descripcion as InspeccionTec,mo.MAR_codigo ,ma.MAR_descripcion as Marca ,u.MOD_codigo,mo.MOD_descripcion as Modelo ,u.UNI_aniofabrica as AñoFabrica ,av.ASV_tiposeguro,es4.EST_descripcion as TipoSeguro ,ase.ASE_codigo ,ase.ASE_descripcion as EmpAseguradora ,av.ASV_numerocertificado as NroSeguro ,av.ASV_fechaemision as FechaEmisionSEguro ,av.ASV_fechavencimiento as FechaVencimientoSeguro,av.ASV_estado ,es3.EST_descripcion as EstadoSeguro  ,u.UNI_estado,es.EST_descripcion as EstadoUnidad,u.ASO_codigo,a.ASO_razonsocial as Asociacion ,a.ASO_ruc as Ruc,u.PRO_codigo,per.PER_dni as DniPropietario ,(per.PER_nombre+' '+per.PER_apellidos) as Propietario,per.PER_direccion as Direccion ,per.PER_telefono as Telefono,u.UNI_tarjetapropiedad as TarjetaPropiedad 
From  UNIDAD u INNER JOIN MODELO mo ON mo.MOD_codigo  = u.MOD_codigo 
               INNER JOIN MARCA ma ON ma.MAR_codigo  = mo.MAR_codigo 
               INNER JOIN ESTADO es ON es.EST_codigo = u.UNI_estado 
               INNER JOIN ASOCIACION a ON a.ASO_codigo = u.ASO_codigo 
               INNER JOIN ESTADO es2 ON es2.EST_codigo = u.UNI_inspecciontec 
               INNER JOIN PERSONA per ON  per.PER_codigo  = u.PRO_codigo 
               INNER JOIN ASEGURADORA_VEHICULO av ON av.UNI_codigo = u.UNI_codigo
               INNER JOIN ASEGURADORA ase ON ase.ASE_codigo =av.ASE_codigo 
               INNER JOIN ESTADO es3 ON es3.EST_codigo = av.ASV_estado 
               INNER JOIN ESTADO es4 ON es4.EST_codigo = av.ASV_tiposeguro               
where a.ASO_codigo=@asocodigo AND u.UNI_numerounidad=@parametro AND u.UNI_estado  <> 3
order by cast(u.UNI_numerounidad as int) asc
END

if @operacionbuscar=3
BEGIN 
Select  u.UNI_codigo ,u.UNI_numerounidad as NroUnidad ,u.UNI_placa as Placa,u.UNI_seriechasis as SerieChasis,u.UNI_motor as NroMotor,u.UNI_inspecciontec, es2.EST_descripcion as InspeccionTec,mo.MAR_codigo ,ma.MAR_descripcion as Marca ,u.MOD_codigo,mo.MOD_descripcion as Modelo ,u.UNI_aniofabrica as AñoFabrica ,av.ASV_tiposeguro,es4.EST_descripcion as TipoSeguro ,ase.ASE_codigo ,ase.ASE_descripcion as EmpAseguradora ,av.ASV_numerocertificado as NroSeguro ,av.ASV_fechaemision as FechaEmisionSEguro ,av.ASV_fechavencimiento as FechaVencimientoSeguro,av.ASV_estado ,es3.EST_descripcion as EstadoSeguro  ,u.UNI_estado,es.EST_descripcion as EstadoUnidad,u.ASO_codigo,a.ASO_razonsocial as Asociacion ,a.ASO_ruc as Ruc,u.PRO_codigo,per.PER_dni as DniPropietario ,(per.PER_nombre+' '+per.PER_apellidos) as Propietario,per.PER_direccion as Direccion ,per.PER_telefono as Telefono,u.UNI_tarjetapropiedad as TarjetaPropiedad 
From  UNIDAD u INNER JOIN MODELO mo ON mo.MOD_codigo  = u.MOD_codigo 
               INNER JOIN MARCA ma ON ma.MAR_codigo  = mo.MAR_codigo 
               INNER JOIN ESTADO es ON es.EST_codigo = u.UNI_estado 
               INNER JOIN ASOCIACION a ON a.ASO_codigo = u.ASO_codigo 
               INNER JOIN ESTADO es2 ON es2.EST_codigo = u.UNI_inspecciontec 
               INNER JOIN PERSONA per ON  per.PER_codigo  = u.PRO_codigo 
               INNER JOIN ASEGURADORA_VEHICULO av ON av.UNI_codigo = u.UNI_codigo
               INNER JOIN ASEGURADORA ase ON ase.ASE_codigo =av.ASE_codigo 
               INNER JOIN ESTADO es3 ON es3.EST_codigo = av.ASV_estado 
               INNER JOIN ESTADO es4 ON es4.EST_codigo = av.ASV_tiposeguro               
where u.UNI_placa like '%' + @parametro + '%' AND u.UNI_estado  <> 3
order by cast(u.UNI_numerounidad as int) asc
END

if @operacionbuscar=4
BEGIN 
Select  u.UNI_codigo ,u.UNI_numerounidad as NroUnidad ,u.UNI_placa as Placa,u.UNI_seriechasis as SerieChasis,u.UNI_motor as NroMotor,u.UNI_inspecciontec, es2.EST_descripcion as InspeccionTec,mo.MAR_codigo ,ma.MAR_descripcion as Marca ,u.MOD_codigo,mo.MOD_descripcion as Modelo ,u.UNI_aniofabrica as AñoFabrica ,av.ASV_tiposeguro,es4.EST_descripcion as TipoSeguro ,ase.ASE_codigo ,ase.ASE_descripcion as EmpAseguradora ,av.ASV_numerocertificado as NroSeguro ,av.ASV_fechaemision as FechaEmisionSEguro ,av.ASV_fechavencimiento as FechaVencimientoSeguro,av.ASV_estado ,es3.EST_descripcion as EstadoSeguro  ,u.UNI_estado,es.EST_descripcion as EstadoUnidad,u.ASO_codigo,a.ASO_razonsocial as Asociacion ,a.ASO_ruc as Ruc,u.PRO_codigo,per.PER_dni as DniPropietario ,(per.PER_nombre+' '+per.PER_apellidos) as Propietario,per.PER_direccion as Direccion ,per.PER_telefono as Telefono,u.UNI_tarjetapropiedad as TarjetaPropiedad 
From  UNIDAD u INNER JOIN MODELO mo ON mo.MOD_codigo  = u.MOD_codigo 
               INNER JOIN MARCA ma ON ma.MAR_codigo  = mo.MAR_codigo 
               INNER JOIN ESTADO es ON es.EST_codigo = u.UNI_estado 
               INNER JOIN ASOCIACION a ON a.ASO_codigo = u.ASO_codigo 
               INNER JOIN ESTADO es2 ON es2.EST_codigo = u.UNI_inspecciontec 
               INNER JOIN PERSONA per ON  per.PER_codigo  = u.PRO_codigo 
               INNER JOIN ASEGURADORA_VEHICULO av ON av.UNI_codigo = u.UNI_codigo
               INNER JOIN ASEGURADORA ase ON ase.ASE_codigo =av.ASE_codigo 
               INNER JOIN ESTADO es3 ON es3.EST_codigo = av.ASV_estado 
               INNER JOIN ESTADO es4 ON es4.EST_codigo = av.ASV_tiposeguro               
where u.UNI_numerounidad=@parametro AND u.UNI_estado  <> 3
order by cast(u.UNI_numerounidad as int) asc
END













GO
/****** Object:  StoredProcedure [dbo].[SP_Unidad_Filtrar_Cod]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Unidad_Filtrar_Cod]
@UNI_codigo INT=NULL,
@Tipo as INT=NULL
AS

IF @Tipo=1
  BEGIN
	SELECT *
	FROM   TARJETA_CIRCULACION
	WHERE  UNI_codigo=@UNI_codigo AND 
		   TAR_estado=4 AND TAR_estadosistema=29
  END 

IF @Tipo=2
  BEGIN
    SELECT *
	FROM   TARJETA_CIRCULACION
	WHERE  UNI_codigo=@UNI_codigo	
  END

IF @Tipo=3
  BEGIN
    SELECT *
	FROM   TARJETA_CIRCULACION
	WHERE  UNI_codigo=@UNI_codigo AND 
		   TAR_estadosistema=28
  END
GO
/****** Object:  StoredProcedure [dbo].[SP_UnidadConductor_Editar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  procedure [dbo].[SP_UnidadConductor_Editar]
@UNI_codigo int,
@CON_codigo int,
@PER_capacitacion bit

as

update UNIDAD set CON_codigo = @CON_codigo 
where UNI_codigo = @UNI_codigo 

update PERSONA set PER_capacitacion = @PER_capacitacion
where PER_codigo = @CON_codigo 
GO
/****** Object:  StoredProcedure [dbo].[SP_Usuario_Agregar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create  procedure [dbo].[SP_Usuario_Agregar]
@USU_usuario varchar (15),
@USU_password varchar (10),
@USU_estado int,
@USU_rol int,
@PER_codigo int

as

insert into USUARIO (USU_usuario , USU_password , USU_estado , USU_rol , PER_codigo )
values (@USU_usuario , @USU_password , @USU_estado , @USU_rol , @PER_codigo )
GO
/****** Object:  StoredProcedure [dbo].[SP_Usuario_Aplicativo_Validar]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Usuario_Aplicativo_Validar]
@USU_usuario VARCHAR (15),
@USU_password VARCHAR(10)

AS

SELECT * 
FROM USUARIO_APLICATIVO 
WHERE USU_usuario = @USU_usuario AND USU_password = @USU_password AND USU_estado = 1
GO
/****** Object:  StoredProcedure [dbo].[SP_Usuario_datos]    Script Date: 23/08/2023 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_Usuario_datos]
@USU_usuario varchar (15)

as

Select  u.USU_codigo , u.USU_usuario , u.USU_password ,u.USU_estado ,u.USU_rol,u.PER_codigo, p.PER_dni ,(p.PER_nombre + ' '+ p.PER_apellidos ) as Nombre 
 
From USUARIO u INNER JOIN PERSONA p on p.PER_codigo = u.PER_codigo 

Where u.USU_usuario = @USU_usuario 
GO
/****** Object:  StoredProcedure [dbo].[SP_Usuario_DatosRol]    Script Date: 23/08/2023 17:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[SP_Usuario_DatosRol]
@USU_codigo int

As

Select u.USU_codigo , u.USU_rol, e.EST_descripcion,(p.PER_apellidos +' '+ p.PER_nombre ) as Nombre  


from USUARIO  u INNER JOIN PERSONA p on p.PER_codigo = u.PER_codigo 
INNER JOIN ESTADO e on e.EST_codigo = u.USU_rol 


where USU_codigo = @USU_codigo 
 
GO
/****** Object:  StoredProcedure [dbo].[SP_Usuario_Editar]    Script Date: 23/08/2023 17:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Usuario_Editar]

@USU_codigo int,
@USU_rol int

As

Update USUARIO  set USU_rol = @USU_rol  where USU_codigo  = @USU_codigo
GO
/****** Object:  StoredProcedure [dbo].[SP_Usuario_EditarPass]    Script Date: 23/08/2023 17:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SP_Usuario_EditarPass]
@USU_codigo int,
@USU_password varchar (10)
as
Update USUARIO set USU_password = @USU_password  where USU_codigo = @USU_codigo 
GO
/****** Object:  StoredProcedure [dbo].[SP_Usuario_Validar]    Script Date: 23/08/2023 17:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Usuario_Validar]

@USU_usuario varchar (15),
@USU_password varchar(9)

AS

Select * From USUARIO where USU_usuario = @USU_usuario AND USU_password = @USU_password AND USU_estado = 1
GO
USE [master]
GO
ALTER DATABASE [TRANSPORTE] SET  READ_WRITE 
GO
