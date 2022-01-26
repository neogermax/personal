USE [QA_Vision]
GO
/****** Object:  Schema [Backup]    Script Date: 25/01/2022 9:32:41 p. m. ******/
CREATE SCHEMA [Backup]
GO
/****** Object:  Schema [Configuracion]    Script Date: 25/01/2022 9:32:41 p. m. ******/
CREATE SCHEMA [Configuracion]
GO
/****** Object:  Schema [Proceso]    Script Date: 25/01/2022 9:32:41 p. m. ******/
CREATE SCHEMA [Proceso]
GO
/****** Object:  Schema [Seguridad]    Script Date: 25/01/2022 9:32:41 p. m. ******/
CREATE SCHEMA [Seguridad]
GO
/****** Object:  Table [Backup].[BloqueEvaluacion]    Script Date: 25/01/2022 9:32:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Backup].[BloqueEvaluacion](
	[Id] [bigint] NOT NULL,
	[FormularioId] [bigint] NOT NULL,
	[CargoId] [bigint] NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[Peso] [varchar](5) NOT NULL,
	[PesoCargo] [varchar](5) NULL,
	[Estado] [int] NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_BloqueEvaluacion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Backup].[Cargos]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Backup].[Cargos](
	[Id] [bigint] NOT NULL,
	[CampanaId] [bigint] NOT NULL,
	[FormularioId] [bigint] NOT NULL,
	[Descripcion] [varchar](500) NOT NULL,
	[Peso] [varchar](5) NULL,
	[Estado] [int] NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_Cargos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Backup].[FocoMejoras]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Backup].[FocoMejoras](
	[Id] [bigint] NOT NULL,
	[PuntosEntrenamientoId] [bigint] NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[Peso] [varchar](5) NOT NULL,
	[Estado] [int] NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_FocoMejoras] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Backup].[Formulacion_Config_Monitoreo]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Backup].[Formulacion_Config_Monitoreo](
	[Id] [bigint] NOT NULL,
	[FormularioId] [bigint] NOT NULL,
	[Ope_Nivel_0] [int] NULL,
	[Ope_Nivel_1] [int] NULL,
	[VariosOperadores] [int] NULL,
	[Ope_Nivel_2] [int] NULL,
	[Ope_Nivel_3] [int] NULL,
	[Ope_Nivel_4] [int] NULL,
	[OpcCumple] [int] NULL,
	[OpcNoCumple] [int] NULL,
	[OpcNoAplica] [int] NULL,
	[NoAplicaPeso] [int] NULL,
	[MonitoreoXDefecto] [varchar](2) NULL,
	[AplicaErrorCritico] [int] NULL,
	[FechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_Formulacion_Config_Monitoreo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Backup].[Formulario]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Backup].[Formulario](
	[Id] [bigint] NOT NULL,
	[CampanaId] [bigint] NOT NULL,
	[Descripcion] [varchar](500) NULL,
	[ValorMaximoEvaluar] [int] NULL,
	[Estado] [int] NOT NULL,
	[Nivel_0] [int] NULL,
	[Nivel_1] [int] NULL,
	[Nivel_2] [int] NULL,
	[Nivel_3] [int] NULL,
	[Nivel_4] [int] NULL,
	[ErrorCriticoNivel] [int] NULL,
	[PesoPonderadoNivel] [int] NULL,
	[FechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_Formulario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Backup].[Monitoreo]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Backup].[Monitoreo](
	[Id] [bigint] NOT NULL,
	[FormularioId] [bigint] NOT NULL,
	[AgenteId] [bigint] NOT NULL,
	[CoordinadorId] [bigint] NOT NULL,
	[MonitorId] [bigint] NOT NULL,
	[EscaladoId] [bigint] NULL,
	[TipoProcesoId] [bigint] NOT NULL,
	[TipoMonitoreoId] [bigint] NOT NULL,
	[IdTransaccion] [varchar](25) NULL,
	[FechaTransaccion] [date] NOT NULL,
	[NotaFinal] [varchar](5) NULL,
	[NotaPEC] [int] NULL,
	[NotaPECUF] [int] NULL,
	[NotaPECN] [int] NULL,
	[NotaPECC] [int] NULL,
	[EstadoId] [bigint] NOT NULL,
	[FechaRegistro] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Backup].[MonitoreoObservacion]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Backup].[MonitoreoObservacion](
	[Id] [bigint] NOT NULL,
	[MonitoreoId] [bigint] NOT NULL,
	[UsuarioId] [bigint] NOT NULL,
	[EstadoId] [bigint] NOT NULL,
	[Observacion] [varchar](max) NULL,
	[FechaObservacion] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Backup].[MonitoreoResultado]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Backup].[MonitoreoResultado](
	[Id] [bigint] NOT NULL,
	[MonitoreoId] [bigint] NOT NULL,
	[OpeNivel] [int] NOT NULL,
	[NivelId] [bigint] NOT NULL,
	[Opc] [varchar](3) NOT NULL,
	[FechaRegistro] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Backup].[NotasDescriptivas]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Backup].[NotasDescriptivas](
	[Id] [bigint] NOT NULL,
	[BloqueEvaluacionId] [bigint] NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[EstadoProcesoId] [bigint] NULL,
	[Peso] [varchar](5) NOT NULL,
	[PesoPonderado] [varchar](5) NULL,
	[Estado] [int] NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_NotasDescriptivas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Backup].[PuntosEntrenamiento]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Backup].[PuntosEntrenamiento](
	[Id] [bigint] NOT NULL,
	[NotasDescriptivasId] [bigint] NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[EstadoProcesoId] [bigint] NOT NULL,
	[Peso] [varchar](5) NOT NULL,
	[PesoPonderado] [varchar](5) NULL,
	[Estado] [int] NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_PuntosEntrenamiento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Configuracion].[CorreoCampana]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Configuracion].[CorreoCampana](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CampanaId] [bigint] NOT NULL,
	[EMAIL_FROM] [varchar](250) NULL,
	[SMTP] [varchar](250) NULL,
	[EMAIL_CONFIG] [varchar](250) NULL,
	[EMAIL_PASS] [varchar](250) NULL,
	[FechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_CorreoCampana] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Configuracion].[Dato]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Configuracion].[Dato](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PadreId] [bigint] NULL,
	[TablaId] [bigint] NOT NULL,
	[Codigo] [varchar](30) NULL,
	[Nombre] [varchar](150) NOT NULL,
	[Valor] [bigint] NULL,
	[Activo] [int] NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
	[Campo_Add_1] [varchar](500) NULL,
	[Campo_Add_2] [varchar](500) NULL,
	[Campo_Add_3] [varchar](500) NULL,
	[Campo_Add_4] [varchar](500) NULL,
	[Campo_Add_5] [varchar](500) NULL,
 CONSTRAINT [PK__Dato__3214EC07071534BC] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Configuracion].[EstiloCampana]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Configuracion].[EstiloCampana](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CampanaId] [bigint] NULL,
	[Logo] [varchar](500) NULL,
	[ColorBack] [varchar](50) NULL,
	[ColorHeaderTitle] [varchar](50) NULL,
	[ColorLabel] [varchar](50) NULL,
	[ColorAlerta] [varchar](50) NULL,
	[FechaCreacion] [datetime] NULL,
 CONSTRAINT [PK_EstiloCampana] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Configuracion].[EstructuraFormularioCampana]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Configuracion].[EstructuraFormularioCampana](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CampanaId] [bigint] NOT NULL,
	[Title_Nivel0] [varchar](250) NULL,
	[Title_Nivel1] [varchar](250) NULL,
	[Title_Nivel2] [varchar](250) NULL,
	[Title_Nivel3] [varchar](250) NULL,
	[Title_Nivel4] [varchar](250) NULL,
	[FechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_EstructuraFormularioCampana] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Configuracion].[Mensajes]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Configuracion].[Mensajes](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TipoMensajeId] [bigint] NOT NULL,
	[CuerpoMensaje] [varchar](max) NOT NULL,
	[MaquetaMensaje_Head] [varchar](max) NULL,
	[MaquetaMensaje_Fotter] [varchar](max) NULL,
	[CuerpoMensaje_Interno] [varchar](max) NOT NULL,
	[Url] [varchar](max) NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_Mensajes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Configuracion].[Tabla]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Configuracion].[Tabla](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
	[Activo] [int] NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK__Tabla__3214EC0748B73602] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Configuracion].[Temp_CargaForm]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Configuracion].[Temp_CargaForm](
	[Nivel_0] [nvarchar](4000) NULL,
	[Nivel_1] [nvarchar](4000) NULL,
	[Nivel_2] [nvarchar](4000) NULL,
	[Nivel_3] [nvarchar](4000) NULL,
	[Nivel_4] [nvarchar](4000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Configuracion].[Temp_CargaMasivaUsers]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Configuracion].[Temp_CargaMasivaUsers](
	[Nombre] [nvarchar](4000) NULL,
	[Apellido] [nvarchar](4000) NULL,
	[Documento] [nvarchar](4000) NULL,
	[Correo] [nvarchar](4000) NULL,
	[Gestionable] [nvarchar](4000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Proceso].[BloqueEvaluacion]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proceso].[BloqueEvaluacion](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FormularioId] [bigint] NOT NULL,
	[CargoId] [bigint] NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[Peso] [varchar](5) NOT NULL,
	[PesoCargo] [varchar](5) NULL,
	[Estado] [int] NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_BloqueEvaluacion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Proceso].[Campana]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proceso].[Campana](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ClienteId] [bigint] NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
	[CantidadMonitoreos] [int] NOT NULL,
	[FrecuenciaMonitoreoId] [bigint] NOT NULL,
	[CoordinadorMonitorea] [int] NULL,
	[Estado] [int] NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK__Campana__3214EC07EB0016B2] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Proceso].[Cargos]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proceso].[Cargos](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CampanaId] [bigint] NOT NULL,
	[FormularioId] [bigint] NOT NULL,
	[Descripcion] [varchar](500) NOT NULL,
	[Peso] [varchar](5) NULL,
	[Estado] [int] NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_Cargos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Proceso].[Cliente]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proceso].[Cliente](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
	[Nit] [varchar](50) NULL,
	[Estado] [int] NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK__Cliente__3214EC07876CDBAE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Proceso].[ControlCargue]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proceso].[ControlCargue](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TipoCargueId] [bigint] NULL,
	[CampanaId] [bigint] NOT NULL,
	[UsuarioId] [bigint] NOT NULL,
	[CantidadRegistros] [bigint] NOT NULL,
	[CantidadRegistrosCreados] [bigint] NOT NULL,
	[CantidadRegistrosActualizados] [bigint] NOT NULL,
	[CantidadRegistros_NoInsertados] [bigint] NULL,
	[FechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_ControlCargue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Proceso].[FocoMejoras]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proceso].[FocoMejoras](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PuntosEntrenamientoId] [bigint] NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[Peso] [varchar](5) NOT NULL,
	[Estado] [int] NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_FocoMejoras] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Proceso].[Formulacion_Config_Monitoreo]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proceso].[Formulacion_Config_Monitoreo](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FormularioId] [bigint] NOT NULL,
	[Ope_Nivel_0] [int] NULL,
	[Ope_Nivel_1] [int] NULL,
	[VariosOperadores] [int] NULL,
	[Ope_Nivel_2] [int] NULL,
	[Ope_Nivel_3] [int] NULL,
	[Ope_Nivel_4] [int] NULL,
	[OpcCumple] [int] NULL,
	[OpcNoCumple] [int] NULL,
	[OpcNoAplica] [int] NULL,
	[NoAplicaPeso] [int] NULL,
	[MonitoreoXDefecto] [varchar](2) NULL,
	[AplicaErrorCritico] [int] NULL,
	[FechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_Formulacion_Config_Monitoreo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Proceso].[Formulario]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proceso].[Formulario](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CampanaId] [bigint] NOT NULL,
	[Descripcion] [varchar](500) NULL,
	[ValorMaximoEvaluar] [int] NULL,
	[Estado] [int] NOT NULL,
	[Nivel_0] [int] NULL,
	[Nivel_1] [int] NULL,
	[Nivel_2] [int] NULL,
	[Nivel_3] [int] NULL,
	[Nivel_4] [int] NULL,
	[ErrorCriticoNivel] [int] NULL,
	[PesoPonderadoNivel] [int] NULL,
	[FechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_Formulario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Proceso].[GrupoTrabajo]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proceso].[GrupoTrabajo](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CampanaId] [bigint] NOT NULL,
	[CoordinadorId] [bigint] NULL,
	[UsuarioId] [bigint] NOT NULL,
	[ValueRolId] [bigint] NULL,
 CONSTRAINT [PK_GrupoTrabajo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Proceso].[Monitoreo]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proceso].[Monitoreo](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FormularioId] [bigint] NOT NULL,
	[AgenteId] [bigint] NOT NULL,
	[CoordinadorId] [bigint] NOT NULL,
	[MonitorId] [bigint] NOT NULL,
	[EscaladoId] [bigint] NULL,
	[TipoProcesoId] [bigint] NOT NULL,
	[TipoMonitoreoId] [bigint] NOT NULL,
	[IdTransaccion] [varchar](25) NULL,
	[FechaTransaccion] [date] NOT NULL,
	[NotaFinal] [varchar](5) NULL,
	[NotaPEC] [int] NULL,
	[NotaPECUF] [int] NULL,
	[NotaPECN] [int] NULL,
	[NotaPECC] [int] NULL,
	[EstadoId] [bigint] NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_Monitoreo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Proceso].[MonitoreoObservacion]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proceso].[MonitoreoObservacion](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MonitoreoId] [bigint] NOT NULL,
	[UsuarioId] [bigint] NOT NULL,
	[EstadoId] [bigint] NOT NULL,
	[Observacion] [varchar](max) NULL,
	[FechaObservacion] [datetime] NOT NULL,
 CONSTRAINT [PK_MonitoreoObservacion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Proceso].[MonitoreoResultado]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proceso].[MonitoreoResultado](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MonitoreoId] [bigint] NOT NULL,
	[OpeNivel] [int] NOT NULL,
	[NivelId] [bigint] NOT NULL,
	[Opc] [varchar](3) NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_MonitoreoResultado] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Proceso].[NotasDescriptivas]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proceso].[NotasDescriptivas](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[BloqueEvaluacionId] [bigint] NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[EstadoProcesoId] [bigint] NULL,
	[Peso] [varchar](5) NOT NULL,
	[PesoPonderado] [varchar](5) NULL,
	[Estado] [int] NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_NotasDescriptivas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Proceso].[Notificaciones]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proceso].[Notificaciones](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ModuloId] [bigint] NOT NULL,
	[UsuarioId] [bigint] NOT NULL,
	[IndicativoId] [bigint] NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[Flag_Visto] [int] NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_Notificaciones] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Proceso].[PuntosEntrenamiento]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proceso].[PuntosEntrenamiento](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[NotasDescriptivasId] [bigint] NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[EstadoProcesoId] [bigint] NOT NULL,
	[Peso] [varchar](5) NOT NULL,
	[PesoPonderado] [varchar](5) NULL,
	[Estado] [int] NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_PuntosEntrenamiento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Proceso].[UsuarioCampana]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proceso].[UsuarioCampana](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CampanaId] [bigint] NOT NULL,
	[UsuarioId] [bigint] NOT NULL,
	[ValueRolId] [bigint] NULL,
	[Estado] [int] NOT NULL,
 CONSTRAINT [PK_UsuarioCampana] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Seguridad].[Acceso]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Seguridad].[Acceso](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[IP_Acceso] [varchar](20) NOT NULL,
	[Usuario_Id] [bigint] NOT NULL,
	[Fecha_Acceso] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Seguridad].[HistoricoPassword]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Seguridad].[HistoricoPassword](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UsuarioId] [bigint] NOT NULL,
	[IP] [nvarchar](100) NOT NULL,
	[OpcionPasswordId] [bigint] NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_HistoricoPassword] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Seguridad].[LogError]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Seguridad].[LogError](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Accion] [tinyint] NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
	[Objeto] [varchar](100) NULL,
	[Datos] [varchar](3000) NULL,
	[Error] [varchar](3000) NULL,
	[InnerException] [varchar](3000) NULL,
	[UsuarioId] [bigint] NOT NULL,
 CONSTRAINT [PK_LOGERROR] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Seguridad].[Pagina]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Seguridad].[Pagina](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PadreId] [bigint] NULL,
	[Nombre] [varchar](200) NOT NULL,
	[Descripcion] [varchar](500) NOT NULL,
	[Orden] [int] NOT NULL,
	[Color] [int] NULL,
	[Url] [varchar](500) NULL,
	[Imagen] [varchar](200) NULL,
	[TipoMenuId] [bigint] NULL,
	[FechaCreacion] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Seguridad].[PermisoPagina]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Seguridad].[PermisoPagina](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RolId] [bigint] NOT NULL,
	[ValueRol] [bigint] NULL,
	[CampanaId] [bigint] NULL,
	[PaginaId] [bigint] NULL,
	[Visible] [int] NULL,
	[FechaCreacion] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Seguridad].[Rol]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Seguridad].[Rol](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CampanaId] [bigint] NOT NULL,
	[ValueRolId] [bigint] NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
	[Estado] [int] NOT NULL,
	[FechaRegistro] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Seguridad].[Usuario]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Seguridad].[Usuario](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Documento] [varchar](25) NULL,
	[Nombres] [varchar](150) NULL,
	[Apellidos] [varchar](150) NULL,
	[Password] [nvarchar](200) NOT NULL,
	[Correo] [nvarchar](250) NULL,
	[Gestionable] [int] NULL,
	[CambioPassword] [int] NULL,
	[FechaPassword] [datetime] NULL,
	[Estado] [int] NOT NULL,
	[FechaRegistro] [datetime] NULL,
	[RolId] [bigint] NOT NULL,
	[ColorId] [bigint] NULL
) ON [PRIMARY]
GO
INSERT [Backup].[Monitoreo] ([Id], [FormularioId], [AgenteId], [CoordinadorId], [MonitorId], [EscaladoId], [TipoProcesoId], [TipoMonitoreoId], [IdTransaccion], [FechaTransaccion], [NotaFinal], [NotaPEC], [NotaPECUF], [NotaPECN], [NotaPECC], [EstadoId], [FechaRegistro]) VALUES (2, 18, 6, 8, 1, 9, 121, 114, N'494585780FRG', CAST(N'2021-09-02' AS Date), N'95.7', 0, 100, 100, 0, 129, CAST(N'2021-09-16T22:02:26.677' AS DateTime))
GO
INSERT [Backup].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (6, 2, 1, 124, N'Validar las opciones en configuración de la herramienta', CAST(N'2021-09-26T01:32:18.803' AS DateTime))
GO
INSERT [Backup].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (7, 2, 8, 126, N'se realiza rechazo por falta de detalle en que herramienta se debe configurar', CAST(N'2021-10-02T01:36:41.010' AS DateTime))
GO
INSERT [Backup].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (20, 2, 1, 129, N'Se debe eliminar por falta de información', CAST(N'2021-10-03T15:36:55.210' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (49, 2, 2, 503, N'C', CAST(N'2021-09-16T22:02:27.033' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (50, 2, 2, 504, N'C', CAST(N'2021-09-16T22:02:27.050' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (51, 2, 2, 505, N'C', CAST(N'2021-09-16T22:02:27.073' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (52, 2, 2, 506, N'C', CAST(N'2021-09-16T22:02:27.083' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (53, 2, 2, 507, N'C', CAST(N'2021-09-16T22:02:27.100' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (54, 2, 2, 508, N'C', CAST(N'2021-09-16T22:02:27.107' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (55, 2, 2, 509, N'C', CAST(N'2021-09-16T22:02:27.107' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (56, 2, 2, 510, N'C', CAST(N'2021-09-16T22:02:27.110' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (57, 2, 2, 511, N'C', CAST(N'2021-09-16T22:02:27.113' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (58, 2, 2, 512, N'C', CAST(N'2021-09-16T22:02:27.117' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (59, 2, 2, 513, N'C', CAST(N'2021-09-16T22:02:27.117' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (60, 2, 2, 514, N'C', CAST(N'2021-09-16T22:02:27.120' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (61, 2, 2, 515, N'C', CAST(N'2021-09-16T22:02:27.150' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (62, 2, 2, 516, N'C', CAST(N'2021-09-16T22:02:27.160' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (63, 2, 2, 517, N'C', CAST(N'2021-09-16T22:02:27.160' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (64, 2, 2, 518, N'C', CAST(N'2021-09-16T22:02:27.167' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (65, 2, 2, 519, N'C', CAST(N'2021-09-16T22:02:27.180' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (66, 2, 2, 520, N'C', CAST(N'2021-09-16T22:02:27.180' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (67, 2, 2, 521, N'C', CAST(N'2021-09-16T22:02:27.187' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (68, 2, 2, 522, N'C', CAST(N'2021-09-16T22:02:27.200' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (69, 2, 2, 523, N'C', CAST(N'2021-09-16T22:02:27.200' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (70, 2, 2, 524, N'C', CAST(N'2021-09-16T22:02:27.203' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (71, 2, 2, 525, N'C', CAST(N'2021-09-16T22:02:27.213' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (72, 2, 2, 526, N'C', CAST(N'2021-09-16T22:02:27.217' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (73, 2, 2, 527, N'C', CAST(N'2021-09-16T22:02:27.220' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (74, 2, 2, 528, N'C', CAST(N'2021-09-16T22:02:27.230' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (75, 2, 2, 529, N'C', CAST(N'2021-09-16T22:02:27.230' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (76, 2, 2, 530, N'C', CAST(N'2021-09-16T22:02:27.230' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (77, 2, 2, 531, N'C', CAST(N'2021-09-16T22:02:27.233' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (78, 2, 2, 532, N'C', CAST(N'2021-09-16T22:02:27.237' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (79, 2, 2, 533, N'C', CAST(N'2021-09-16T22:02:27.237' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (80, 2, 2, 534, N'C', CAST(N'2021-09-16T22:02:27.240' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (81, 2, 2, 535, N'C', CAST(N'2021-09-16T22:02:27.240' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (82, 2, 2, 536, N'C', CAST(N'2021-09-16T22:02:27.240' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (83, 2, 2, 537, N'C', CAST(N'2021-09-16T22:02:27.243' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (84, 2, 2, 538, N'C', CAST(N'2021-09-16T22:02:27.243' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (85, 2, 2, 539, N'C', CAST(N'2021-09-16T22:02:27.247' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (86, 2, 2, 540, N'C', CAST(N'2021-09-16T22:02:27.247' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (87, 2, 2, 541, N'C', CAST(N'2021-09-16T22:02:27.250' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (88, 2, 2, 542, N'C', CAST(N'2021-09-16T22:02:27.250' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (89, 2, 2, 543, N'C', CAST(N'2021-09-16T22:02:27.250' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (90, 2, 2, 544, N'NC', CAST(N'2021-09-16T22:02:27.280' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (91, 2, 2, 545, N'C', CAST(N'2021-09-16T22:02:27.283' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (92, 2, 2, 546, N'C', CAST(N'2021-09-16T22:02:27.300' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (93, 2, 2, 547, N'C', CAST(N'2021-09-16T22:02:27.300' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (94, 2, 2, 548, N'NC', CAST(N'2021-09-16T22:02:27.303' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (95, 2, 2, 549, N'C', CAST(N'2021-09-16T22:02:27.313' AS DateTime))
GO
INSERT [Backup].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (96, 2, 2, 550, N'C', CAST(N'2021-09-16T22:02:27.313' AS DateTime))
GO
SET IDENTITY_INSERT [Configuracion].[CorreoCampana] ON 
GO
INSERT [Configuracion].[CorreoCampana] ([Id], [CampanaId], [EMAIL_FROM], [SMTP], [EMAIL_CONFIG], [EMAIL_PASS], [FechaRegistro]) VALUES (1, 1, N'neogermax@hotmail.com', N'smtp.office365.com', N'neogermax@hotmail.com', N'1016090569BGR/*', CAST(N'2021-06-03T23:11:19.420' AS DateTime))
GO
INSERT [Configuracion].[CorreoCampana] ([Id], [CampanaId], [EMAIL_FROM], [SMTP], [EMAIL_CONFIG], [EMAIL_PASS], [FechaRegistro]) VALUES (2, 2, N'neogermax@hotmail.com', N'smtp.office365.com', N'neogermax@hotmail.com', N'1016090569BGR/*', CAST(N'2021-06-03T23:13:12.887' AS DateTime))
GO
INSERT [Configuracion].[CorreoCampana] ([Id], [CampanaId], [EMAIL_FROM], [SMTP], [EMAIL_CONFIG], [EMAIL_PASS], [FechaRegistro]) VALUES (3, 3, N'neogermax@hotmail.com', N'smtp.office365.com', N'neogermax@hotmail.com', N'1016090569BGR/*', CAST(N'2021-07-16T21:36:03.010' AS DateTime))
GO
INSERT [Configuracion].[CorreoCampana] ([Id], [CampanaId], [EMAIL_FROM], [SMTP], [EMAIL_CONFIG], [EMAIL_PASS], [FechaRegistro]) VALUES (4, 4, N'neogermax@hotmail.com', N'smtp.office365.com', N'neogermax@hotmail.com', N'1016090569BGR/*', CAST(N'2021-10-24T21:55:11.120' AS DateTime))
GO
SET IDENTITY_INSERT [Configuracion].[CorreoCampana] OFF
GO
SET IDENTITY_INSERT [Configuracion].[Dato] ON 
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (1, 0, 1, N'RP', N'ADMINISTRADOR', 1, 1, CAST(N'2021-05-25T21:02:25.977' AS DateTime), N'ADMINISTRADOR DEL SISTEMA', NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (2, 0, 1, N'RP', N'SUPERVISOR MONITOR', 2, 1, CAST(N'2021-05-25T21:03:22.557' AS DateTime), N'MONITOREA LOS PROCESOS DEL AGENTE EN EL SERVICIO DE ATENCION AL CLIENTE', NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (3, 0, 1, N'RP', N'MONITOR', 3, 1, CAST(N'2021-05-25T21:03:52.100' AS DateTime), N'MONITOREA LOS PROCESOS DEL AGENTE EN EL SERVICIO DE ATENCION AL CLIENTE', NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (4, 0, 1, N'RP', N'COORDINADOR', 4, 1, CAST(N'2021-05-25T21:04:15.850' AS DateTime), N'ROL DE LA PERSONA QUE ES LA RESPONSABLE DE LA CUENTA O CAMPAÑA', NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (5, 0, 1, N'RP', N'AGENTE', 5, 1, CAST(N'2021-05-25T21:04:34.817' AS DateTime), N'ROL DE LA PERSONA DE OFRECER O ATENDER SOLICITUDES DEL CLIENTE FINAL DEL SERVICIO PRESTADO', NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (6, 0, 1, N'RP', N'CLIENTE', 6, 1, CAST(N'2021-05-25T21:05:01.110' AS DateTime), N'ROL DE LA PERSONA QUE ESTA DE PARTE DEL CLIENTE', NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (7, 0, 2, N'FM', N'X Dia', 1, 1, CAST(N'2021-05-24T06:01:37.467' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (8, 0, 2, N'FM', N'X Semana', 2, 1, CAST(N'2021-05-24T06:01:55.060' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (9, 0, 2, N'FM', N'X Mes', 3, 1, CAST(N'2021-05-24T06:02:32.520' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (10, 0, 3, N'TC', N'Users', 1, 1, CAST(N'2021-05-31T23:05:29.750' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (11, 0, 4, N'TM', N'Cambio Contraseña', 1, 1, CAST(N'2021-06-05T00:31:00.343' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (12, 0, 4, N'TM', N'Nuevo Usuario', 2, 1, CAST(N'2021-06-05T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (13, 0, 5, N'PC', N'ONECALI ', 1, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (14, 0, 5, N'PC', N'EMPRESA DE EXPLOTACION PETROLERA COLOMBIANA EMEXPETROCOL', 2, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (15, 0, 5, N'PC', N'ECOPETROL ', 3, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (16, 0, 5, N'PC', N'COMUNICACION CELULAR  COMCEL ', 4, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (17, 0, 5, N'PC', N'ORGANIZACION TERPEL ', 5, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (18, 0, 5, N'PC', N'BANCO BILBAO VIZCAYA ARGENTARIA COLOMBIA ', 6, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (19, 0, 5, N'PC', N'FRONTERA ENERGY CORPORATION', 7, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (20, 0, 5, N'PC', N'NUEVA EMPRESA PROMOTORA DE SALUD', 8, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (21, 0, 5, N'PC', N'KOPPS COMMERCIAL ', 9, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (22, 0, 5, N'PC', N'CODENSA ', 10, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (23, 0, 5, N'PC', N'COLOMBIA TELECOMUNICACIONES ', 11, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (24, 0, 5, N'PC', N'OLEODUCTO CENTRAL ', 12, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (25, 0, 5, N'PC', N'CENIT TRANSPORTE Y LOGISTICA DE HIDROCARBUROS ', 13, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (26, 0, 5, N'PC', N'BANCO DAVIVIENDA ', 14, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (27, 0, 5, N'PC', N'PRIMAX COLOMBIA ', 15, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (28, 0, 5, N'PC', N'TRANSLIQUIDOS GR ', 16, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (29, 0, 5, N'PC', N'CAJA COLOMBIANA DE SUBSIDIO FAMILIAR COLSUBSIDIO', 17, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (30, 0, 5, N'PC', N'CAJA DE COMPENSACION FAMILIAR COMPENSAR', 18, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (31, 0, 5, N'PC', N'EMGESA  ESP', 19, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (32, 0, 5, N'PC', N'FRONTERA ENERGY COLOMBIA CORP SUCURSAL COLOMBIA', 20, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (33, 0, 5, N'PC', N'ENTIDAD PROMOTORA DE SALUD SANITAS ', 21, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (34, 0, 5, N'PC', N'BAVARIA Y COMPANIA S C A', 22, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (35, 0, 5, N'PC', N'PRECOOPERATIVA INTEGRAL DE TRABAJO ASOCIADO SOLUCIONES', 23, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (36, 0, 5, N'PC', N'CENCOSUD COLOMBIA ', 24, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (37, 0, 5, N'PC', N'C I TRAFIGURA PETROLEUM COLOMBIA ', 25, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (38, 0, 5, N'PC', N'CARBONES DEL CERREJON LIMITED', 26, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (39, 0, 5, N'PC', N'POSITIVA COMPANIA DE SEGUROS ', 27, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (40, 0, 5, N'PC', N'SAMSUNG ELECTRONICS COLOMBIA ', 28, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (41, 0, 5, N'PC', N'JERONIMO MARTINS COLOMBIA SAS', 29, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (42, 0, 5, N'PC', N'BANCO DE BOGOTA', 30, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (43, 0, 5, N'PC', N'ENTIDAD PROMOTORA DE SALUD FAMISANAR ', 31, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (44, 0, 5, N'PC', N'CHEVRON PETROLEUM COMPANY', 32, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (45, 0, 5, N'PC', N'GENERAL MOTORS COLMOTORES ', 33, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (46, 0, 5, N'PC', N'GRUPO AVAL ACCIONES Y VALORES ', 34, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (47, 0, 5, N'PC', N'DROGUERIAS Y FARMACIAS CRUZ VERDE ', 35, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (48, 0, 5, N'PC', N'MERCADERIA ', 36, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (49, 0, 5, N'PC', N'VANTI  ESP', 37, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (50, 0, 5, N'PC', N'INDUSTRIA NACIONAL DE GASEOSAS ', 38, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (51, 0, 5, N'PC', N'LH TECNOLOGIA SAS', 39, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (52, 0, 5, N'PC', N'BIOMAX BIOCOMBUSTIBLES ', 40, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (53, 0, 5, N'PC', N'COLOMBIA MOVIL  E S P', 41, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (54, 0, 5, N'PC', N'SEGUROS DEL ESTADO ', 42, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (55, 0, 5, N'PC', N'CAJA DE COMPENSACION FAMILIAR CAFAM', 43, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (56, 0, 5, N'PC', N'FALABELLA DE COLOMBIA ', 44, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (57, 0, 5, N'PC', N'DIANA CORPORACION ', 45, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (58, 0, 5, N'PC', N'ITALCOL ', 46, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (59, 0, 5, N'PC', N'CERRO MATOSO ', 47, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (60, 0, 5, N'PC', N'HOCOL ', 48, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (61, 0, 5, N'PC', N'TRANSPORTADORA DE GAS INTERNACIONAL  ESP', 49, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (62, 0, 5, N'PC', N'VERANO ENERGY LIMITED SUCURSAL', 50, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (63, 0, 5, N'PC', N'GRAN TIERRA ENERGY COLOMBIA LLC SUCURSAL', 51, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (64, 0, 5, N'PC', N'COMPANIA DE MEDICINA PREPAGADA COLSANITAS ', 52, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (65, 0, 5, N'PC', N'NESTLE DE COLOMBIA ', 53, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (66, 0, 5, N'PC', N'SEGUROS DE VIDA ALFA  VIDALFA ', 54, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (67, 0, 5, N'PC', N'BASE NAVAL ARC BOGOTA', 55, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (68, 0, 5, N'PC', N'CEMEX COLOMBIA ', 56, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (69, 0, 5, N'PC', N'COMPANIA DE SEGUROS BOLIVAR ', 57, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (70, 0, 5, N'PC', N'EMPRESA DE TELECOMUNICACIONES DE BOGOTA  ', 58, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (71, 0, 5, N'PC', N'ITAU ', 59, 1, CAST(N'2021-06-10T00:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (72, 0, 6, N'TCP', N'Autogestión', 1, 1, CAST(N'2021-06-21T12:59:56.933' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (73, 0, 6, N'TCP', N'Solicitado', 2, 1, CAST(N'2021-06-21T13:01:04.153' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (74, 0, 6, N'TCP', N'Cambio primera vez', 3, 1, CAST(N'2021-06-24T23:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (75, 0, 7, N'LC', N'AMARILLO', 2, 1, CAST(N'2021-06-24T23:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (76, 0, 7, N'LC', N'AZUL', 3, 1, CAST(N'2021-06-24T23:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (77, 0, 7, N'LC', N'AZUL CLARO', 4, 1, CAST(N'2021-06-24T23:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (78, 0, 7, N'LC', N'BEIGE', 5, 1, CAST(N'2021-06-24T23:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (79, 0, 7, N'LC', N'BLANCO', 6, 1, CAST(N'2021-06-24T23:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (80, 0, 7, N'LC', N'BORGOÑA', 7, 1, CAST(N'2021-06-24T23:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (81, 0, 7, N'LC', N'CIAN', 8, 1, CAST(N'2021-06-24T23:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (82, 0, 7, N'LC', N'CIRUELA', 9, 1, CAST(N'2021-06-24T23:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (83, 0, 7, N'LC', N'FUCSIA', 10, 1, CAST(N'2021-06-24T23:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (84, 0, 7, N'LC', N'GRANATE', 11, 1, CAST(N'2021-06-24T23:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (85, 0, 7, N'LC', N'GRIS', 12, 1, CAST(N'2021-06-24T23:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (86, 0, 7, N'LC', N'LAVANDA', 13, 1, CAST(N'2021-06-24T23:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (87, 0, 7, N'LC', N'LILA', 14, 1, CAST(N'2021-06-24T23:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (88, 0, 7, N'LC', N'MAGENTA', 15, 1, CAST(N'2021-06-24T23:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (89, 0, 7, N'LC', N'MALVA', 16, 1, CAST(N'2021-06-24T23:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (90, 0, 7, N'LC', N'MARRÓN', 17, 1, CAST(N'2021-06-24T23:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (91, 0, 7, N'LC', N'MELOCOTÓN', 18, 1, CAST(N'2021-06-24T23:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (92, 0, 7, N'LC', N'MOSTAZA', 19, 1, CAST(N'2021-06-24T23:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (93, 0, 7, N'LC', N'NARANJA', 20, 1, CAST(N'2021-06-24T23:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (94, 0, 7, N'LC', N'NEGRO', 21, 1, CAST(N'2021-06-24T23:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (95, 0, 7, N'LC', N'OCRE', 22, 1, CAST(N'2021-06-24T23:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (96, 0, 7, N'LC', N'PÚRPURA', 23, 1, CAST(N'2021-06-24T23:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (97, 0, 7, N'LC', N'PÚRPURA OSCURO', 24, 1, CAST(N'2021-06-24T23:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (98, 0, 7, N'LC', N'ROJO', 25, 1, CAST(N'2021-06-24T23:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (99, 0, 7, N'LC', N'ROSA', 26, 1, CAST(N'2021-06-24T23:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (100, 0, 7, N'LC', N'ROSADO', 27, 1, CAST(N'2021-06-24T23:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (101, 0, 7, N'LC', N'SALMÓN', 28, 1, CAST(N'2021-06-24T23:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (102, 0, 7, N'LC', N'TAN', 29, 1, CAST(N'2021-06-24T23:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (103, 0, 7, N'LC', N'TRULLO', 30, 1, CAST(N'2021-06-24T23:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (104, 0, 7, N'LC', N'TURQUESA', 31, 1, CAST(N'2021-06-24T23:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (105, 0, 7, N'LC', N'VERDE', 32, 1, CAST(N'2021-06-24T23:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (106, 0, 7, N'LC', N'VERDE CLARO', 33, 1, CAST(N'2021-06-24T23:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (107, 0, 7, N'LC', N'VERDE LIMA', 34, 1, CAST(N'2021-06-24T23:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (108, 0, 7, N'LC', N'VERDE MENTA', 35, 1, CAST(N'2021-06-24T23:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (109, 0, 7, N'LC', N'VERDE OLIVA', 36, 1, CAST(N'2021-06-24T23:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (110, 0, 7, N'LC', N'VERDE OSCURO', 37, 1, CAST(N'2021-06-24T23:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (111, 0, 7, N'LC', N'VIOLETA', 38, 1, CAST(N'2021-06-24T23:33:56.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (112, 0, 10, N'TM', N'DASH BOARD', 1, 1, CAST(N'2021-06-30T23:01:40.707' AS DateTime), N'', N'', N'', N'', N'')
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (113, 0, 10, N'TM', N'MENU LATERAL', 1, 1, CAST(N'2021-06-30T23:01:53.557' AS DateTime), N'', N'', N'', N'', N'')
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (114, 0, 9, N'TDM', N'AL LADO', 1, 1, CAST(N'2021-06-30T23:02:06.507' AS DateTime), N'', N'', N'', N'', N'')
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (115, 0, 9, N'TDM', N'EN LÍNEA', 1, 1, CAST(N'2021-07-02T09:37:43.827' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (116, 0, 9, N'TDM', N'REMOTO', 1, 1, CAST(N'2021-07-02T09:38:13.557' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (117, 0, 11, N'TE', N'Usuario Final', 1, 1, CAST(N'2021-07-12T16:08:32.433' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (118, 0, 11, N'TE', N'Negocio', 2, 1, CAST(N'2021-07-12T16:08:53.547' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (119, 0, 11, N'TE', N'Cumplimiento', 3, 1, CAST(N'2021-07-12T16:09:28.633' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (120, 0, 11, N'TE', N'No Aplica', 4, 1, CAST(N'2021-07-12T16:09:49.007' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (121, 0, 8, N'PRC', N'OUTBOUND', 1, 1, CAST(N'2021-07-16T21:36:03.167' AS DateTime), N'1', N'', N'', N'', N'')
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (122, 0, 8, N'PRC', N'INBOUND', 1, 1, CAST(N'2021-07-17T18:02:02.557' AS DateTime), N'1', N'', N'', N'', N'')
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (123, 0, 3, N'TC', N'Form', 1, 1, CAST(N'2021-05-31T23:05:29.750' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (124, 0, 12, N'EM', N'Monitoreo', 1, 1, CAST(N'2021-09-13T23:08:57.900' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (125, 0, 12, N'EM', N'Retroalimentación', 2, 1, CAST(N'2021-09-13T23:09:50.373' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (126, 0, 12, N'EM', N'Objeción Coordinador', 3, 1, CAST(N'2021-09-13T23:10:41.317' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (127, 0, 12, N'EM', N'Monitoreo Cerrado', 4, 1, CAST(N'2021-09-13T23:12:02.853' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (128, 0, 12, N'EM', N'Objeción Agente', 5, 1, CAST(N'2021-09-13T23:13:07.017' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (129, 0, 12, N'EM', N'Escalamiento', 6, 1, CAST(N'2021-10-02T21:17:05.380' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (130, 0, 13, N'N', N'Monitoreo', 1, 1, CAST(N'2021-10-03T23:48:17.923' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (131, 0, 4, N'TM', N'Monitoreo Creado', 1, 1, CAST(N'2021-10-05T20:03:50.690' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (132, 0, 4, N'TM', N'Monitoreo Retroalimentado', 1, 1, CAST(N'2021-10-09T09:35:03.113' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (133, 0, 4, N'TM', N'Monitoreo Rechazado x coordinador', 1, 1, CAST(N'2021-10-09T18:46:53.883' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (134, 0, 4, N'TM', N'Monitoreo Compromisos', 1, 1, CAST(N'2021-10-09T22:53:07.830' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (135, 0, 4, N'TM', N'Monitoreo Rechazado x agente', 1, 1, CAST(N'2021-10-10T09:35:35.750' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (136, 0, 4, N'TM', N'Monitoreo Eliminado', 1, 1, CAST(N'2021-10-10T11:00:34.647' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (137, 0, 8, N'PRC', N'INBOUNT', 1, 1, CAST(N'2021-10-24T21:55:11.650' AS DateTime), N'4', N'', N'', N'', N'')
GO
INSERT [Configuracion].[Dato] ([Id], [PadreId], [TablaId], [Codigo], [Nombre], [Valor], [Activo], [FechaRegistro], [Campo_Add_1], [Campo_Add_2], [Campo_Add_3], [Campo_Add_4], [Campo_Add_5]) VALUES (138, 0, 8, N'PRC', N'GESTION', 1, 1, CAST(N'2021-10-24T21:55:11.673' AS DateTime), N'4', N'', N'', N'', N'')
GO
SET IDENTITY_INSERT [Configuracion].[Dato] OFF
GO
SET IDENTITY_INSERT [Configuracion].[EstiloCampana] ON 
GO
INSERT [Configuracion].[EstiloCampana] ([Id], [CampanaId], [Logo], [ColorBack], [ColorHeaderTitle], [ColorLabel], [ColorAlerta], [FechaCreacion]) VALUES (1, 1, N'LOGO_PRINCIPAL.JPG', N'#04083e', N'#e9e9ed', N'#04083e', N'#fd5d08', CAST(N'2021-05-23T10:31:52.617' AS DateTime))
GO
INSERT [Configuracion].[EstiloCampana] ([Id], [CampanaId], [Logo], [ColorBack], [ColorHeaderTitle], [ColorLabel], [ColorAlerta], [FechaCreacion]) VALUES (2, 2, N'LOGO_AIRE.JPG', N'#81dccb', N'#0056b3', N'#0053b3', N'#1d5b06', CAST(N'2021-05-26T12:49:57.470' AS DateTime))
GO
INSERT [Configuracion].[EstiloCampana] ([Id], [CampanaId], [Logo], [ColorBack], [ColorHeaderTitle], [ColorLabel], [ColorAlerta], [FechaCreacion]) VALUES (3, 3, N'LOGO_AFINIA.JPG', N'#9a0909', N'#0006b3', N'#040648', N'#b85000', CAST(N'2021-07-16T21:36:03.003' AS DateTime))
GO
INSERT [Configuracion].[EstiloCampana] ([Id], [CampanaId], [Logo], [ColorBack], [ColorHeaderTitle], [ColorLabel], [ColorAlerta], [FechaCreacion]) VALUES (4, 4, N'LOGO_DESARROLLO.JPG', N'#10da43', N'#fafafa', N'#4cbd68', N'#712323', CAST(N'2021-10-24T21:55:11.073' AS DateTime))
GO
SET IDENTITY_INSERT [Configuracion].[EstiloCampana] OFF
GO
SET IDENTITY_INSERT [Configuracion].[EstructuraFormularioCampana] ON 
GO
INSERT [Configuracion].[EstructuraFormularioCampana] ([Id], [CampanaId], [Title_Nivel0], [Title_Nivel1], [Title_Nivel2], [Title_Nivel3], [Title_Nivel4], [FechaRegistro]) VALUES (1, 1, N'Cargo', N'Bloque Evaluación', N'Notas Descriptivas', N'Punto Entrenamiento', N'Foco Mejora', CAST(N'2021-07-14T01:00:41.360' AS DateTime))
GO
INSERT [Configuracion].[EstructuraFormularioCampana] ([Id], [CampanaId], [Title_Nivel0], [Title_Nivel1], [Title_Nivel2], [Title_Nivel3], [Title_Nivel4], [FechaRegistro]) VALUES (2, 2, N'Solicitante', N'Valoración', N'Descripción', N'Entradas', N'Retroalimentación', CAST(N'2021-07-14T01:03:46.733' AS DateTime))
GO
INSERT [Configuracion].[EstructuraFormularioCampana] ([Id], [CampanaId], [Title_Nivel0], [Title_Nivel1], [Title_Nivel2], [Title_Nivel3], [Title_Nivel4], [FechaRegistro]) VALUES (3, 3, N'asistente', N'valoracion', N'descripción', N'Entrenamiento', N'Foco Mejora', CAST(N'2021-07-16T21:36:03.023' AS DateTime))
GO
INSERT [Configuracion].[EstructuraFormularioCampana] ([Id], [CampanaId], [Title_Nivel0], [Title_Nivel1], [Title_Nivel2], [Title_Nivel3], [Title_Nivel4], [FechaRegistro]) VALUES (4, 4, N'Cargo', N'B. Evaluación', N'Notas Des.', N'Punto Ent.', N'Foco Mejora', CAST(N'2021-10-24T21:55:11.180' AS DateTime))
GO
SET IDENTITY_INSERT [Configuracion].[EstructuraFormularioCampana] OFF
GO
SET IDENTITY_INSERT [Configuracion].[Mensajes] ON 
GO
INSERT [Configuracion].[Mensajes] ([Id], [TipoMensajeId], [CuerpoMensaje], [MaquetaMensaje_Head], [MaquetaMensaje_Fotter], [CuerpoMensaje_Interno], [Url], [FechaRegistro]) VALUES (2, 11, N'<tr>
								<td align=''center'' valign=''top''>
									<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
										<tbody><tr>
											<td align=''center'' valign=''top''>
												<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' class=''flexibleContainer''>
													<tbody><tr>
														<td align=''center'' valign=''top'' width=''500'' class=''flexibleContainerCell''>
															<table border=''0'' cellpadding=''30'' cellspacing=''0'' width=''100%''>
																<tbody><tr>
																	<td align=''center'' valign=''top''>

																		<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
																			<tbody><tr>
																				<td valign=''top'' class=''textContent''>
																					 <div style=''text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;margin-top:3px;color:#5F5F5F;line-height:135%;''>Hola, <strong>[User]</strong></div>
																					 <div style=''margin-bottom: 30px;''></div>      
																					 <div style=''text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;margin-top:3px;color:#5F5F5F;line-height:135%;''>El supervisor del área acaba de generar el cambio de contraseña</div>
																					 <div style=''margin-bottom: 15px;''></div>
																					 <div style=''text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;margin-top:3px;color:#5F5F5F;line-height:135%;''>Para ingresar al sistema presione <b><a href=''[Url]'' target=''_blank''>Aqui</a></b> </div>
																				</td>
																			</tr>
																		</tbody></table>
																	</td>
																</tr>
															</tbody></table>
														</td>
													</tr>
												</tbody></table>
											</td>
										</tr>
									</tbody></table>
								</td>
							</tr>', N'<!DOCTYPE html PUBLIC ''-//W3C//DTD XHTML 1.0 Strict//EN'' ''http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd''>
	<html xmlns=''http://www.w3.org/1999/xhtml''>
	<head>
		<meta http-equiv=''Content-Type'' content=''text/html; charset=UTF-8'' />
		<meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
		<meta http-equiv=''X-UA-Compatible'' content=''IE=edge,chrome=1''>
		<meta name=''format-detection'' content=''telephone=no'' /> <!-- disable auto telephone linking in iOS -->
		<title>Respuesta del SOME</title>
		<style type=''text/css''>
			/* RESET STYLES */
			html { background-color:#E1E1E1; margin:0; padding:0; }
			body, #bodyTable, #bodyCell, #bodyCell{height:100% !important; margin:0; padding:0; width:100% !important;font-family:Helvetica, Arial, ''Lucida Grande'', sans-serif;}
			table{border-collapse:collapse;}
			table[id=bodyTable] {width:100%!important;margin:auto;max-width:500px!important;color:#7A7A7A;font-weight:normal;}
			img, a img{border:0; outline:none; text-decoration:none;height:auto; line-height:100%;}
			a {text-decoration:none !important;border-bottom: 1px solid;}
			h1, h2, h3, h4, h5, h6{color:#5F5F5F; font-weight:normal; font-family:Helvetica; font-size:20px; line-height:125%; text-align:Left; letter-spacing:normal;margin-top:0;margin-right:0;margin-bottom:10px;margin-left:0;padding-top:0;padding-bottom:0;padding-left:0;padding-right:0;}

			/* CLIENT-SPECIFIC STYLES */
			.ReadMsgBody{width:100%;} .ExternalClass{width:100%;} /* Force Hotmail/Outlook.com to display emails at full width. */
			.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div{line-height:100%;} /* Force Hotmail/Outlook.com to display line heights normally. */
			table, td{mso-table-lspace:0pt; mso-table-rspace:0pt;} /* Remove spacing between tables in Outlook 2007 and up. */
			#outlook a{padding:0;} /* Force Outlook 2007 and up to provide a ''view in browser'' message. */
			img{-ms-interpolation-mode: bicubic;display:block;outline:none; text-decoration:none;} /* Force IE to smoothly render resized images. */
			body, table, td, p, a, li, blockquote{-ms-text-size-adjust:100%; -webkit-text-size-adjust:100%; font-weight:normal!important;} /* Prevent Windows- and Webkit-based mobile platforms from changing declared text sizes. */
			.ExternalClass td[class=''ecxflexibleContainerBox''] h3 {padding-top: 10px !important;} /* Force hotmail to push 2-grid sub headers down */

			/* /\/\/\/\/\/\/\/\/ TEMPLATE STYLES /\/\/\/\/\/\/\/\/ */

			/* ========== Page Styles ========== */
			h1{display:block;font-size:26px;font-style:normal;font-weight:normal;line-height:100%;}
			h2{display:block;font-size:20px;font-style:normal;font-weight:normal;line-height:120%;}
			h3{display:block;font-size:17px;font-style:normal;font-weight:normal;line-height:110%;}
			h4{display:block;font-size:18px;font-style:italic;font-weight:normal;line-height:100%;}
			.flexibleImage{height:auto;}
			.linkRemoveBorder{border-bottom:0 !important;}
			table[class=flexibleContainerCellDivider] {padding-bottom:0 !important;padding-top:0 !important;}

			body, #bodyTable{background-color:#E1E1E1;}
			#emailHeader{background-color:#E1E1E1;}
			#emailBody{background-color:#FFFFFF;}
			#emailFooter{background-color:#E1E1E1;}
			.nestedContainer{background-color:#F8F8F8; border:1px solid #CCCCCC;}
			.emailButton{background-color:#205478; border-collapse:separate;}
			.buttonContent{color:#FFFFFF; font-family:Helvetica; font-size:18px; font-weight:bold; line-height:100%; padding:15px; text-align:center;}
			.buttonContent a{color:#FFFFFF; display:block; text-decoration:none!important; border:0!important;}
			.emailCalendar{background-color:#FFFFFF; border:1px solid #CCCCCC;}
			.emailCalendarMonth{background-color:#205478; color:#FFFFFF; font-family:Helvetica, Arial, sans-serif; font-size:16px; font-weight:bold; padding-top:10px; padding-bottom:10px; text-align:center;}
			.emailCalendarDay{color:#205478; font-family:Helvetica, Arial, sans-serif; font-size:60px; font-weight:bold; line-height:100%; padding-top:20px; padding-bottom:20px; text-align:center;}
			.imageContentText {margin-top: 10px;line-height:0;}
			.imageContentText a {line-height:0;}
			#invisibleIntroduction {display:none !important;} /* Removing the introduction text from the view */

			/*FRAMEWORK HACKS & OVERRIDES */
			span[class=ios-color-hack] a {color:#275100!important;text-decoration:none!important;} /* Remove all link colors in IOS (below are duplicates based on the color preference) */
			span[class=ios-color-hack2] a {color:#205478!important;text-decoration:none!important;}
			span[class=ios-color-hack3] a {color:#8B8B8B!important;text-decoration:none!important;}
			/* A nice and clean way to target phone numbers you want clickable and avoid a mobile phone from linking other numbers that look like, but are not phone numbers.  Use these two blocks of code to ''unstyle'' any numbers that may be linked.  The second block gives you a class to apply with a span tag to the numbers you would like linked and styled.
			Inspired by Campaign Monitor''s article on using phone numbers in email: http://www.campaignmonitor.com/blog/post/3571/using-phone-numbers-in-html-email/.
			*/
			.a[href^=''tel''], a[href^=''sms''] {text-decoration:none!important;color:#606060!important;pointer-events:none!important;cursor:default!important;}
			.mobile_link a[href^=''tel''], .mobile_link a[href^=''sms''] {text-decoration:none!important;color:#606060!important;pointer-events:auto!important;cursor:default!important;}


			/* MOBILE STYLES */
			@media only screen and (max-width: 480px){
				/*////// CLIENT-SPECIFIC STYLES //////*/
				body{width:100% !important; min-width:100% !important;} /* Force iOS Mail to render the email at full width. */

				/* FRAMEWORK STYLES */
				/*
				CSS selectors are written in attribute
				selector format to prevent Yahoo Mail
				from rendering media query styles on
				desktop.
				*/
				/*td[class=''textContent''], td[class=''flexibleContainerCell''] { width: 100%; padding-left: 10px !important; padding-right: 10px !important; }*/
				table[id=''emailHeader''],
				table[id=''emailBody''],
				table[id=''emailFooter''],
				table[class=''flexibleContainer''],
				td[class=''flexibleContainerCell''] {width:100% !important;}
				td[class=''flexibleContainerBox''], td[class=''flexibleContainerBox''] table {display: block;width: 100%;text-align: left;}
				/*
				The following style rule makes any
				image classed with ''flexibleImage''
				fluid when the query activates.
				Make sure you add an inline max-width
				to those images to prevent them
				from blowing out.
				*/
				td[class=''imageContent''] img {height:auto !important; width:100% !important; max-width:100% !important; }
				img[class=''flexibleImage'']{height:auto !important; width:100% !important;max-width:100% !important;}
				img[class=''flexibleImageSmall'']{height:auto !important; width:auto !important;}


				/*
				Create top space for every second element in a block
				*/
				table[class=''flexibleContainerBoxNext'']{padding-top: 10px !important;}

				/*
				Make buttons in the email span the
				full width of their container, allowing
				for left- or right-handed ease of use.
				*/
				table[class=''emailButton'']{width:100% !important;}
				td[class=''buttonContent'']{padding:0 !important;}
				td[class=''buttonContent''] a{padding:15px !important;}

			}

			/*  CONDITIONS FOR ANDROID DEVICES ONLY
			*   http://developer.android.com/guide/webapps/targeting.html
			*   http://pugetworks.com/2011/04/css-media-queries-for-targeting-different-mobile-devices/ ;
			=====================================================*/

			@media only screen and (-webkit-device-pixel-ratio:.75){
				/* Put CSS for low density (ldpi) Android layouts in here */
			}

			@media only screen and (-webkit-device-pixel-ratio:1){
				/* Put CSS for medium density (mdpi) Android layouts in here */
			}

			@media only screen and (-webkit-device-pixel-ratio:1.5){
				/* Put CSS for high density (hdpi) Android layouts in here */
			}
			/* end Android targeting */

			/* CONDITIONS FOR IOS DEVICES ONLY
			=====================================================*/
			@media only screen and (min-device-width : 320px) and (max-device-width:568px) {

			}
			/* end IOS targeting */
		</style>
		<!--
			Outlook Conditional CSS

			These two style blocks target Outlook 2007 & 2010 specifically, forcing
			columns into a single vertical stack as on mobile clients. This is
			primarily done to avoid the ''page break bug'' and is optional.

			More information here:
			http://templates.mailchimp.com/development/css/outlook-conditional-css
		-->
		<!--[if mso 12]>
			<style type=''text/css''>
				.flexibleContainer{display:block !important; width:100% !important;}
			</style>
		<![endif]-->
		<!--[if mso 14]>
			<style type=''text/css''>
				.flexibleContainer{display:block !important; width:100% !important;}
			</style>
		<![endif]-->
	</head>
	<body bgcolor=''#E1E1E1'' leftmargin=''0'' marginwidth=''0'' topmargin=''0'' marginheight=''0'' offset=''0''>

		<center style=''background-color:#E1E1E1;''>
			<table border=''0'' cellpadding=''0'' cellspacing=''0'' height=''100%'' width=''100%'' id=''bodyTable'' style=''table-layout: fixed;max-width:100% !important;width: 100% !important;min-width: 100% !important;''>
				<tr>
					<td align=''center'' valign=''top'' id=''bodyCell''>
						<table bgcolor=''#E1E1E1'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' id=''emailHeader''>
							<tr>
								<td align=''center'' valign=''top''>
									<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
										<tr>
											<td align=''center'' valign=''top''>
												<table border=''0'' cellpadding=''10'' cellspacing=''0'' width=''500'' class=''flexibleContainer''>
													<tr>
														<td valign=''top'' width=''500'' class=''flexibleContainerCell''>
															<table align=''left'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
																<tr>
																	<td align=''left'' valign=''middle'' id=''invisibleIntroduction'' class=''flexibleContainerBox'' style=''display:none !important; mso-hide:all;''>
																		<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%'' style=''max-width:100%;''>
																			<tr>
																				<td align=''left'' class=''textContent''>
																					<div style=''font-family:Helvetica,Arial,sans-serif;font-size:13px;color:#828282;text-align:center;line-height:120%;''>
																						SOME - Sistema Operacional de Monitoreo Empresarial
																					</div>
																				</td>
																			</tr>
																		</table>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<table bgcolor=''#FFFFFF''  border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' id=''emailBody''>
							<tr>
								<td align=''center'' valign=''top''>
									<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%'' style=''color:#FFFFFF;'' bgcolor=''[vl_BGColor]''>
										<tr>
											<td align=''center'' valign=''top''>
												<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' class=''flexibleContainer''>
													<tr>
														<td align=''center'' valign=''top'' width=''500'' class=''flexibleContainerCell''>
															<table border=''0'' cellpadding=''30'' cellspacing=''0'' width=''100%''>
																<tr>
																	<td align=''center'' valign=''top'' class=''textContent''>
																		<!--<h2 style=''color:#92ebff;text-align:center;font-weight:normal;font-family:Helvetica,Arial,sans-serif;font-size:23px;margin-bottom:10px;line-height:135%;''>N°[Num] [Project]</h2>-->
																		<h1 style=''color:[vl_TitleColor];line-height:100%;font-family:Helvetica,Arial,sans-serif;font-size:35px;font-weight:normal;margin-bottom:5px;text-align:center;''>[accion]</h1>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>', N'<tr>
								<td align=''center'' valign=''top''>
									<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
										<tr>
											<td align=''center'' valign=''top''>
												<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' class=''flexibleContainer''>
													<tr>
														<td align=''center'' valign=''top'' width=''500'' class=''flexibleContainerCell''>
															<table class=''flexibleContainerCellDivider'' border=''0'' cellpadding=''30'' cellspacing=''0'' width=''100%''>
																<tr>
																	<td align=''center'' valign=''top'' style=''padding-top:0px;padding-bottom:0px;''>
																		<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
																			<tr>
																				<td align=''center'' valign=''top'' style=''border-top:1px solid #C8C8C8;''></td>
																			</tr>
																		</table>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<table bgcolor=''#E1E1E1'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' id=''emailFooter''>
							<tr>
								<td align=''center'' valign=''top''>
									<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
										<tr>
											<td align=''center'' valign=''top''>
												<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' class=''flexibleContainer''>
													<tr>
														<td align=''center'' valign=''top'' width=''500'' class=''flexibleContainerCell''>
															<table border=''0'' cellpadding=''30'' cellspacing=''0'' width=''100%''>
																<tr>
																	<td valign=''top'' bgcolor=''#E1E1E1''>

																		<div style=''font-family:Helvetica,Arial,sans-serif;font-size:13px;color:#828282;text-align:center;line-height:120%;''>
																			<div>[Date_Now]</div>
																			<div>Copyright &#169; 2021 reserved.</div>
																		</div>

																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</center>
	</body>
</html>
', N'El administrador del sistema acaba de generar el cambio de contraseña', N'www.google.com', CAST(N'2021-06-05T01:03:44.270' AS DateTime))
GO
INSERT [Configuracion].[Mensajes] ([Id], [TipoMensajeId], [CuerpoMensaje], [MaquetaMensaje_Head], [MaquetaMensaje_Fotter], [CuerpoMensaje_Interno], [Url], [FechaRegistro]) VALUES (3, 12, N'							<tr>
								<td align=''center'' valign=''top''>
									<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
										<tbody><tr>
											<td align=''center'' valign=''top''>
												<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' class=''flexibleContainer''>
													<tbody><tr>
														<td align=''center'' valign=''top'' width=''500'' class=''flexibleContainerCell''>
															<table border=''0'' cellpadding=''30'' cellspacing=''0'' width=''100%''>
																<tbody><tr>
																	<td align=''center'' valign=''top''>

																		<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
																			<tbody><tr>
																				<td valign=''top'' class=''textContent''>
																					<div style=''text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;margin-top:3px;color:#5F5F5F;line-height:135%;''>Hola, <strong>[User]</strong></div>
																					<div style=''margin-bottom: 30px;''></div>
																					<div style=''text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;margin-top:3px;color:#5F5F5F;line-height:135%;''>Te damos la bienvenida a SOME, en la plataforma estarás registrado para realizar diferentes funciones relacionadas a tu cargo. </div>
																					<div style=''margin-bottom: 15px;''></div>
																					<div style=''text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;margin-top:3px;color:#5F5F5F;line-height:135%;''>Al ingresar por primera vez deberás cambiar la contraseña genérica, recuerda es el mismo número de documento. </div>
																					<div style=''margin-bottom: 15px;''></div>
																					<div style=''text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;margin-top:3px;color:#5F5F5F;line-height:135%;''>Para ingresar al sistema presione <b><a href=''[Url]'' target=''_blank''>Aqui</a></b> </div>
																				</td>
																			</tr>
																		</tbody></table>
																	</td>
																</tr>
															</tbody></table>
														</td>
													</tr>
												</tbody></table>
											</td>
										</tr>
									</tbody></table>
								</td>
							</tr>', N'<!DOCTYPE html PUBLIC ''-//W3C//DTD XHTML 1.0 Strict//EN'' ''http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd''>
	<html xmlns=''http://www.w3.org/1999/xhtml''>
	<head>
		<meta http-equiv=''Content-Type'' content=''text/html; charset=UTF-8'' />
		<meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
		<meta http-equiv=''X-UA-Compatible'' content=''IE=edge,chrome=1''>
		<meta name=''format-detection'' content=''telephone=no'' /> <!-- disable auto telephone linking in iOS -->
		<title>Respuesta del SOME</title>
		<style type=''text/css''>
			/* RESET STYLES */
			html { background-color:#E1E1E1; margin:0; padding:0; }
			body, #bodyTable, #bodyCell, #bodyCell{height:100% !important; margin:0; padding:0; width:100% !important;font-family:Helvetica, Arial, ''Lucida Grande'', sans-serif;}
			table{border-collapse:collapse;}
			table[id=bodyTable] {width:100%!important;margin:auto;max-width:500px!important;color:#7A7A7A;font-weight:normal;}
			img, a img{border:0; outline:none; text-decoration:none;height:auto; line-height:100%;}
			a {text-decoration:none !important;border-bottom: 1px solid;}
			h1, h2, h3, h4, h5, h6{color:#5F5F5F; font-weight:normal; font-family:Helvetica; font-size:20px; line-height:125%; text-align:Left; letter-spacing:normal;margin-top:0;margin-right:0;margin-bottom:10px;margin-left:0;padding-top:0;padding-bottom:0;padding-left:0;padding-right:0;}

			/* CLIENT-SPECIFIC STYLES */
			.ReadMsgBody{width:100%;} .ExternalClass{width:100%;} /* Force Hotmail/Outlook.com to display emails at full width. */
			.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div{line-height:100%;} /* Force Hotmail/Outlook.com to display line heights normally. */
			table, td{mso-table-lspace:0pt; mso-table-rspace:0pt;} /* Remove spacing between tables in Outlook 2007 and up. */
			#outlook a{padding:0;} /* Force Outlook 2007 and up to provide a ''view in browser'' message. */
			img{-ms-interpolation-mode: bicubic;display:block;outline:none; text-decoration:none;} /* Force IE to smoothly render resized images. */
			body, table, td, p, a, li, blockquote{-ms-text-size-adjust:100%; -webkit-text-size-adjust:100%; font-weight:normal!important;} /* Prevent Windows- and Webkit-based mobile platforms from changing declared text sizes. */
			.ExternalClass td[class=''ecxflexibleContainerBox''] h3 {padding-top: 10px !important;} /* Force hotmail to push 2-grid sub headers down */

			/* /\/\/\/\/\/\/\/\/ TEMPLATE STYLES /\/\/\/\/\/\/\/\/ */

			/* ========== Page Styles ========== */
			h1{display:block;font-size:26px;font-style:normal;font-weight:normal;line-height:100%;}
			h2{display:block;font-size:20px;font-style:normal;font-weight:normal;line-height:120%;}
			h3{display:block;font-size:17px;font-style:normal;font-weight:normal;line-height:110%;}
			h4{display:block;font-size:18px;font-style:italic;font-weight:normal;line-height:100%;}
			.flexibleImage{height:auto;}
			.linkRemoveBorder{border-bottom:0 !important;}
			table[class=flexibleContainerCellDivider] {padding-bottom:0 !important;padding-top:0 !important;}

			body, #bodyTable{background-color:#E1E1E1;}
			#emailHeader{background-color:#E1E1E1;}
			#emailBody{background-color:#FFFFFF;}
			#emailFooter{background-color:#E1E1E1;}
			.nestedContainer{background-color:#F8F8F8; border:1px solid #CCCCCC;}
			.emailButton{background-color:#205478; border-collapse:separate;}
			.buttonContent{color:#FFFFFF; font-family:Helvetica; font-size:18px; font-weight:bold; line-height:100%; padding:15px; text-align:center;}
			.buttonContent a{color:#FFFFFF; display:block; text-decoration:none!important; border:0!important;}
			.emailCalendar{background-color:#FFFFFF; border:1px solid #CCCCCC;}
			.emailCalendarMonth{background-color:#205478; color:#FFFFFF; font-family:Helvetica, Arial, sans-serif; font-size:16px; font-weight:bold; padding-top:10px; padding-bottom:10px; text-align:center;}
			.emailCalendarDay{color:#205478; font-family:Helvetica, Arial, sans-serif; font-size:60px; font-weight:bold; line-height:100%; padding-top:20px; padding-bottom:20px; text-align:center;}
			.imageContentText {margin-top: 10px;line-height:0;}
			.imageContentText a {line-height:0;}
			#invisibleIntroduction {display:none !important;} /* Removing the introduction text from the view */

			/*FRAMEWORK HACKS & OVERRIDES */
			span[class=ios-color-hack] a {color:#275100!important;text-decoration:none!important;} /* Remove all link colors in IOS (below are duplicates based on the color preference) */
			span[class=ios-color-hack2] a {color:#205478!important;text-decoration:none!important;}
			span[class=ios-color-hack3] a {color:#8B8B8B!important;text-decoration:none!important;}
			/* A nice and clean way to target phone numbers you want clickable and avoid a mobile phone from linking other numbers that look like, but are not phone numbers.  Use these two blocks of code to ''unstyle'' any numbers that may be linked.  The second block gives you a class to apply with a span tag to the numbers you would like linked and styled.
			Inspired by Campaign Monitor''s article on using phone numbers in email: http://www.campaignmonitor.com/blog/post/3571/using-phone-numbers-in-html-email/.
			*/
			.a[href^=''tel''], a[href^=''sms''] {text-decoration:none!important;color:#606060!important;pointer-events:none!important;cursor:default!important;}
			.mobile_link a[href^=''tel''], .mobile_link a[href^=''sms''] {text-decoration:none!important;color:#606060!important;pointer-events:auto!important;cursor:default!important;}


			/* MOBILE STYLES */
			@media only screen and (max-width: 480px){
				/*////// CLIENT-SPECIFIC STYLES //////*/
				body{width:100% !important; min-width:100% !important;} /* Force iOS Mail to render the email at full width. */

				/* FRAMEWORK STYLES */
				/*
				CSS selectors are written in attribute
				selector format to prevent Yahoo Mail
				from rendering media query styles on
				desktop.
				*/
				/*td[class=''textContent''], td[class=''flexibleContainerCell''] { width: 100%; padding-left: 10px !important; padding-right: 10px !important; }*/
				table[id=''emailHeader''],
				table[id=''emailBody''],
				table[id=''emailFooter''],
				table[class=''flexibleContainer''],
				td[class=''flexibleContainerCell''] {width:100% !important;}
				td[class=''flexibleContainerBox''], td[class=''flexibleContainerBox''] table {display: block;width: 100%;text-align: left;}
				/*
				The following style rule makes any
				image classed with ''flexibleImage''
				fluid when the query activates.
				Make sure you add an inline max-width
				to those images to prevent them
				from blowing out.
				*/
				td[class=''imageContent''] img {height:auto !important; width:100% !important; max-width:100% !important; }
				img[class=''flexibleImage'']{height:auto !important; width:100% !important;max-width:100% !important;}
				img[class=''flexibleImageSmall'']{height:auto !important; width:auto !important;}


				/*
				Create top space for every second element in a block
				*/
				table[class=''flexibleContainerBoxNext'']{padding-top: 10px !important;}

				/*
				Make buttons in the email span the
				full width of their container, allowing
				for left- or right-handed ease of use.
				*/
				table[class=''emailButton'']{width:100% !important;}
				td[class=''buttonContent'']{padding:0 !important;}
				td[class=''buttonContent''] a{padding:15px !important;}

			}

			/*  CONDITIONS FOR ANDROID DEVICES ONLY
			*   http://developer.android.com/guide/webapps/targeting.html
			*   http://pugetworks.com/2011/04/css-media-queries-for-targeting-different-mobile-devices/ ;
			=====================================================*/

			@media only screen and (-webkit-device-pixel-ratio:.75){
				/* Put CSS for low density (ldpi) Android layouts in here */
			}

			@media only screen and (-webkit-device-pixel-ratio:1){
				/* Put CSS for medium density (mdpi) Android layouts in here */
			}

			@media only screen and (-webkit-device-pixel-ratio:1.5){
				/* Put CSS for high density (hdpi) Android layouts in here */
			}
			/* end Android targeting */

			/* CONDITIONS FOR IOS DEVICES ONLY
			=====================================================*/
			@media only screen and (min-device-width : 320px) and (max-device-width:568px) {

			}
			/* end IOS targeting */
		</style>
		<!--
			Outlook Conditional CSS

			These two style blocks target Outlook 2007 & 2010 specifically, forcing
			columns into a single vertical stack as on mobile clients. This is
			primarily done to avoid the ''page break bug'' and is optional.

			More information here:
			http://templates.mailchimp.com/development/css/outlook-conditional-css
		-->
		<!--[if mso 12]>
			<style type=''text/css''>
				.flexibleContainer{display:block !important; width:100% !important;}
			</style>
		<![endif]-->
		<!--[if mso 14]>
			<style type=''text/css''>
				.flexibleContainer{display:block !important; width:100% !important;}
			</style>
		<![endif]-->
	</head>
	<body bgcolor=''#E1E1E1'' leftmargin=''0'' marginwidth=''0'' topmargin=''0'' marginheight=''0'' offset=''0''>

		<center style=''background-color:#E1E1E1;''>
			<table border=''0'' cellpadding=''0'' cellspacing=''0'' height=''100%'' width=''100%'' id=''bodyTable'' style=''table-layout: fixed;max-width:100% !important;width: 100% !important;min-width: 100% !important;''>
				<tr>
					<td align=''center'' valign=''top'' id=''bodyCell''>
						<table bgcolor=''#E1E1E1'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' id=''emailHeader''>
							<tr>
								<td align=''center'' valign=''top''>
									<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
										<tr>
											<td align=''center'' valign=''top''>
												<table border=''0'' cellpadding=''10'' cellspacing=''0'' width=''500'' class=''flexibleContainer''>
													<tr>
														<td valign=''top'' width=''500'' class=''flexibleContainerCell''>
															<table align=''left'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
																<tr>
																	<td align=''left'' valign=''middle'' id=''invisibleIntroduction'' class=''flexibleContainerBox'' style=''display:none !important; mso-hide:all;''>
																		<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%'' style=''max-width:100%;''>
																			<tr>
																				<td align=''left'' class=''textContent''>
																					<div style=''font-family:Helvetica,Arial,sans-serif;font-size:13px;color:#828282;text-align:center;line-height:120%;''>
																						SOME - Sistema Operacional de Monitoreo Empresarial
																					</div>
																				</td>
																			</tr>
																		</table>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<table bgcolor=''#FFFFFF''  border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' id=''emailBody''>
							<tr>
								<td align=''center'' valign=''top''>
									<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%'' style=''color:#FFFFFF;'' bgcolor=''[vl_BGColor]''>
										<tr>
											<td align=''center'' valign=''top''>
												<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' class=''flexibleContainer''>
													<tr>
														<td align=''center'' valign=''top'' width=''500'' class=''flexibleContainerCell''>
															<table border=''0'' cellpadding=''30'' cellspacing=''0'' width=''100%''>
																<tr>
																	<td align=''center'' valign=''top'' class=''textContent''>
																		<!--<h2 style=''color:#92ebff;text-align:center;font-weight:normal;font-family:Helvetica,Arial,sans-serif;font-size:23px;margin-bottom:10px;line-height:135%;''>N°[Num] [Project]</h2>-->
																		<h1 style=''color:[vl_TitleColor];line-height:100%;font-family:Helvetica,Arial,sans-serif;font-size:35px;font-weight:normal;margin-bottom:5px;text-align:center;''>[accion]</h1>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>', N'<tr>
								<td align=''center'' valign=''top''>
									<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
										<tr>
											<td align=''center'' valign=''top''>
												<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' class=''flexibleContainer''>
													<tr>
														<td align=''center'' valign=''top'' width=''500'' class=''flexibleContainerCell''>
															<table class=''flexibleContainerCellDivider'' border=''0'' cellpadding=''30'' cellspacing=''0'' width=''100%''>
																<tr>
																	<td align=''center'' valign=''top'' style=''padding-top:0px;padding-bottom:0px;''>
																		<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
																			<tr>
																				<td align=''center'' valign=''top'' style=''border-top:1px solid #C8C8C8;''></td>
																			</tr>
																		</table>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<table bgcolor=''#E1E1E1'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' id=''emailFooter''>
							<tr>
								<td align=''center'' valign=''top''>
									<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
										<tr>
											<td align=''center'' valign=''top''>
												<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' class=''flexibleContainer''>
													<tr>
														<td align=''center'' valign=''top'' width=''500'' class=''flexibleContainerCell''>
															<table border=''0'' cellpadding=''30'' cellspacing=''0'' width=''100%''>
																<tr>
																	<td valign=''top'' bgcolor=''#E1E1E1''>

																		<div style=''font-family:Helvetica,Arial,sans-serif;font-size:13px;color:#828282;text-align:center;line-height:120%;''>
																			<div>[Date_Now]</div>
																			<div>Copyright &#169; 2021 reserved.</div>
																		</div>

																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</center>
	</body>
</html>
', N'Se ha creado un nuevo usuario en la plataforma', N'www.google.com', CAST(N'2021-06-25T10:01:46.543' AS DateTime))
GO
INSERT [Configuracion].[Mensajes] ([Id], [TipoMensajeId], [CuerpoMensaje], [MaquetaMensaje_Head], [MaquetaMensaje_Fotter], [CuerpoMensaje_Interno], [Url], [FechaRegistro]) VALUES (4, 131, N'<tr>
								<td align=''center'' valign=''top''>
									<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
										<tr>
											<td align=''center'' valign=''top''>
												<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' class=''flexibleContainer''>
													<tr>
														<td align=''center'' valign=''top'' width=''500'' class=''flexibleContainerCell''>
															<table border=''0'' cellpadding=''30'' cellspacing=''0'' width=''100%''>
																<tr>
																	<td align=''center'' valign=''top''>

																		<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
																			<tr>
																				<td valign=''top'' class=''textContent''>
																					 <div style=''text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;margin-top:3px;color:#5F5F5F;line-height:135%;''>Hola, <strong>[User]</strong></div>
																					 <div style=''margin-bottom: 30px;''></div>      
																					 <div style=''text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;margin-top:3px;color:#5F5F5F;line-height:135%;''>El [Cargo] [UserMonitor] acaba de crear el motitoreo N°[Num], el cual pasa para la retroalimentación correspondiente por el [CargoC]</div>
																					 <div style=''margin-bottom: 15px;''></div>
																					 <div style=''text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;margin-top:3px;color:#5F5F5F;line-height:135%;''>Para ingresar al sistema presione <b><a href=''[Url]'' target=''_blank''>Aqui</a></b> </div>
																				</td>
																			</tr>
																		</table>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>', N'<!DOCTYPE html PUBLIC ''-//W3C//DTD XHTML 1.0 Strict//EN'' ''http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd''>
	<html xmlns=''http://www.w3.org/1999/xhtml''>
	<head>
		<meta http-equiv=''Content-Type'' content=''text/html; charset=UTF-8'' />
		<meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
		<meta http-equiv=''X-UA-Compatible'' content=''IE=edge,chrome=1''>
		<meta name=''format-detection'' content=''telephone=no'' /> <!-- disable auto telephone linking in iOS -->
		<title>Respuesta del SOME</title>
		<style type=''text/css''>
			/* RESET STYLES */
			html { background-color:#E1E1E1; margin:0; padding:0; }
			body, #bodyTable, #bodyCell, #bodyCell{height:100% !important; margin:0; padding:0; width:100% !important;font-family:Helvetica, Arial, ''Lucida Grande'', sans-serif;}
			table{border-collapse:collapse;}
			table[id=bodyTable] {width:100%!important;margin:auto;max-width:500px!important;color:#7A7A7A;font-weight:normal;}
			img, a img{border:0; outline:none; text-decoration:none;height:auto; line-height:100%;}
			a {text-decoration:none !important;border-bottom: 1px solid;}
			h1, h2, h3, h4, h5, h6{color:#5F5F5F; font-weight:normal; font-family:Helvetica; font-size:20px; line-height:125%; text-align:Left; letter-spacing:normal;margin-top:0;margin-right:0;margin-bottom:10px;margin-left:0;padding-top:0;padding-bottom:0;padding-left:0;padding-right:0;}

			/* CLIENT-SPECIFIC STYLES */
			.ReadMsgBody{width:100%;} .ExternalClass{width:100%;} /* Force Hotmail/Outlook.com to display emails at full width. */
			.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div{line-height:100%;} /* Force Hotmail/Outlook.com to display line heights normally. */
			table, td{mso-table-lspace:0pt; mso-table-rspace:0pt;} /* Remove spacing between tables in Outlook 2007 and up. */
			#outlook a{padding:0;} /* Force Outlook 2007 and up to provide a ''view in browser'' message. */
			img{-ms-interpolation-mode: bicubic;display:block;outline:none; text-decoration:none;} /* Force IE to smoothly render resized images. */
			body, table, td, p, a, li, blockquote{-ms-text-size-adjust:100%; -webkit-text-size-adjust:100%; font-weight:normal!important;} /* Prevent Windows- and Webkit-based mobile platforms from changing declared text sizes. */
			.ExternalClass td[class=''ecxflexibleContainerBox''] h3 {padding-top: 10px !important;} /* Force hotmail to push 2-grid sub headers down */

			/* /\/\/\/\/\/\/\/\/ TEMPLATE STYLES /\/\/\/\/\/\/\/\/ */

			/* ========== Page Styles ========== */
			h1{display:block;font-size:26px;font-style:normal;font-weight:normal;line-height:100%;}
			h2{display:block;font-size:20px;font-style:normal;font-weight:normal;line-height:120%;}
			h3{display:block;font-size:17px;font-style:normal;font-weight:normal;line-height:110%;}
			h4{display:block;font-size:18px;font-style:italic;font-weight:normal;line-height:100%;}
			.flexibleImage{height:auto;}
			.linkRemoveBorder{border-bottom:0 !important;}
			table[class=flexibleContainerCellDivider] {padding-bottom:0 !important;padding-top:0 !important;}

			body, #bodyTable{background-color:#E1E1E1;}
			#emailHeader{background-color:#E1E1E1;}
			#emailBody{background-color:#FFFFFF;}
			#emailFooter{background-color:#E1E1E1;}
			.nestedContainer{background-color:#F8F8F8; border:1px solid #CCCCCC;}
			.emailButton{background-color:#205478; border-collapse:separate;}
			.buttonContent{color:#FFFFFF; font-family:Helvetica; font-size:18px; font-weight:bold; line-height:100%; padding:15px; text-align:center;}
			.buttonContent a{color:#FFFFFF; display:block; text-decoration:none!important; border:0!important;}
			.emailCalendar{background-color:#FFFFFF; border:1px solid #CCCCCC;}
			.emailCalendarMonth{background-color:#205478; color:#FFFFFF; font-family:Helvetica, Arial, sans-serif; font-size:16px; font-weight:bold; padding-top:10px; padding-bottom:10px; text-align:center;}
			.emailCalendarDay{color:#205478; font-family:Helvetica, Arial, sans-serif; font-size:60px; font-weight:bold; line-height:100%; padding-top:20px; padding-bottom:20px; text-align:center;}
			.imageContentText {margin-top: 10px;line-height:0;}
			.imageContentText a {line-height:0;}
			#invisibleIntroduction {display:none !important;} /* Removing the introduction text from the view */

			/*FRAMEWORK HACKS & OVERRIDES */
			span[class=ios-color-hack] a {color:#275100!important;text-decoration:none!important;} /* Remove all link colors in IOS (below are duplicates based on the color preference) */
			span[class=ios-color-hack2] a {color:#205478!important;text-decoration:none!important;}
			span[class=ios-color-hack3] a {color:#8B8B8B!important;text-decoration:none!important;}
			/* A nice and clean way to target phone numbers you want clickable and avoid a mobile phone from linking other numbers that look like, but are not phone numbers.  Use these two blocks of code to ''unstyle'' any numbers that may be linked.  The second block gives you a class to apply with a span tag to the numbers you would like linked and styled.
			Inspired by Campaign Monitor''s article on using phone numbers in email: http://www.campaignmonitor.com/blog/post/3571/using-phone-numbers-in-html-email/.
			*/
			.a[href^=''tel''], a[href^=''sms''] {text-decoration:none!important;color:#606060!important;pointer-events:none!important;cursor:default!important;}
			.mobile_link a[href^=''tel''], .mobile_link a[href^=''sms''] {text-decoration:none!important;color:#606060!important;pointer-events:auto!important;cursor:default!important;}


			/* MOBILE STYLES */
			@media only screen and (max-width: 480px){
				/*////// CLIENT-SPECIFIC STYLES //////*/
				body{width:100% !important; min-width:100% !important;} /* Force iOS Mail to render the email at full width. */

				/* FRAMEWORK STYLES */
				/*
				CSS selectors are written in attribute
				selector format to prevent Yahoo Mail
				from rendering media query styles on
				desktop.
				*/
				/*td[class=''textContent''], td[class=''flexibleContainerCell''] { width: 100%; padding-left: 10px !important; padding-right: 10px !important; }*/
				table[id=''emailHeader''],
				table[id=''emailBody''],
				table[id=''emailFooter''],
				table[class=''flexibleContainer''],
				td[class=''flexibleContainerCell''] {width:100% !important;}
				td[class=''flexibleContainerBox''], td[class=''flexibleContainerBox''] table {display: block;width: 100%;text-align: left;}
				/*
				The following style rule makes any
				image classed with ''flexibleImage''
				fluid when the query activates.
				Make sure you add an inline max-width
				to those images to prevent them
				from blowing out.
				*/
				td[class=''imageContent''] img {height:auto !important; width:100% !important; max-width:100% !important; }
				img[class=''flexibleImage'']{height:auto !important; width:100% !important;max-width:100% !important;}
				img[class=''flexibleImageSmall'']{height:auto !important; width:auto !important;}


				/*
				Create top space for every second element in a block
				*/
				table[class=''flexibleContainerBoxNext'']{padding-top: 10px !important;}

				/*
				Make buttons in the email span the
				full width of their container, allowing
				for left- or right-handed ease of use.
				*/
				table[class=''emailButton'']{width:100% !important;}
				td[class=''buttonContent'']{padding:0 !important;}
				td[class=''buttonContent''] a{padding:15px !important;}

			}

			/*  CONDITIONS FOR ANDROID DEVICES ONLY
			*   http://developer.android.com/guide/webapps/targeting.html
			*   http://pugetworks.com/2011/04/css-media-queries-for-targeting-different-mobile-devices/ ;
			=====================================================*/

			@media only screen and (-webkit-device-pixel-ratio:.75){
				/* Put CSS for low density (ldpi) Android layouts in here */
			}

			@media only screen and (-webkit-device-pixel-ratio:1){
				/* Put CSS for medium density (mdpi) Android layouts in here */
			}

			@media only screen and (-webkit-device-pixel-ratio:1.5){
				/* Put CSS for high density (hdpi) Android layouts in here */
			}
			/* end Android targeting */

			/* CONDITIONS FOR IOS DEVICES ONLY
			=====================================================*/
			@media only screen and (min-device-width : 320px) and (max-device-width:568px) {

			}
			/* end IOS targeting */
		</style>
		<!--
			Outlook Conditional CSS

			These two style blocks target Outlook 2007 & 2010 specifically, forcing
			columns into a single vertical stack as on mobile clients. This is
			primarily done to avoid the ''page break bug'' and is optional.

			More information here:
			http://templates.mailchimp.com/development/css/outlook-conditional-css
		-->
		<!--[if mso 12]>
			<style type=''text/css''>
				.flexibleContainer{display:block !important; width:100% !important;}
			</style>
		<![endif]-->
		<!--[if mso 14]>
			<style type=''text/css''>
				.flexibleContainer{display:block !important; width:100% !important;}
			</style>
		<![endif]-->
	</head>
	<body bgcolor=''#E1E1E1'' leftmargin=''0'' marginwidth=''0'' topmargin=''0'' marginheight=''0'' offset=''0''>

		<center style=''background-color:#E1E1E1;''>
			<table border=''0'' cellpadding=''0'' cellspacing=''0'' height=''100%'' width=''100%'' id=''bodyTable'' style=''table-layout: fixed;max-width:100% !important;width: 100% !important;min-width: 100% !important;''>
				<tr>
					<td align=''center'' valign=''top'' id=''bodyCell''>
						<table bgcolor=''#E1E1E1'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' id=''emailHeader''>
							<tr>
								<td align=''center'' valign=''top''>
									<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
										<tr>
											<td align=''center'' valign=''top''>
												<table border=''0'' cellpadding=''10'' cellspacing=''0'' width=''500'' class=''flexibleContainer''>
													<tr>
														<td valign=''top'' width=''500'' class=''flexibleContainerCell''>
															<table align=''left'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
																<tr>
																	<td align=''left'' valign=''middle'' id=''invisibleIntroduction'' class=''flexibleContainerBox'' style=''display:none !important; mso-hide:all;''>
																		<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%'' style=''max-width:100%;''>
																			<tr>
																				<td align=''left'' class=''textContent''>
																					<div style=''font-family:Helvetica,Arial,sans-serif;font-size:13px;color:#828282;text-align:center;line-height:120%;''>
																						SOME - Sistema Operacional de Monitoreo Empresarial
																					</div>
																				</td>
																			</tr>
																		</table>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<table bgcolor=''#FFFFFF''  border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' id=''emailBody''>
							<tr>
								<td align=''center'' valign=''top''>
									<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%'' style=''color:#FFFFFF;'' bgcolor=''[vl_BGColor]''>
										<tr>
											<td align=''center'' valign=''top''>
												<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' class=''flexibleContainer''>
													<tr>
														<td align=''center'' valign=''top'' width=''500'' class=''flexibleContainerCell''>
															<table border=''0'' cellpadding=''30'' cellspacing=''0'' width=''100%''>
																<tr>
																	<td align=''center'' valign=''top'' class=''textContent''>
																		<!--<h2 style=''color:#92ebff;text-align:center;font-weight:normal;font-family:Helvetica,Arial,sans-serif;font-size:23px;margin-bottom:10px;line-height:135%;''>N°[Num] [Project]</h2>-->
																		<h1 style=''color:[vl_TitleColor];line-height:100%;font-family:Helvetica,Arial,sans-serif;font-size:35px;font-weight:normal;margin-bottom:5px;text-align:center;''>[accion]</h1>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>', N'<tr>
								<td align=''center'' valign=''top''>
									<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
										<tr>
											<td align=''center'' valign=''top''>
												<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' class=''flexibleContainer''>
													<tr>
														<td align=''center'' valign=''top'' width=''500'' class=''flexibleContainerCell''>
															<table class=''flexibleContainerCellDivider'' border=''0'' cellpadding=''30'' cellspacing=''0'' width=''100%''>
																<tr>
																	<td align=''center'' valign=''top'' style=''padding-top:0px;padding-bottom:0px;''>
																		<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
																			<tr>
																				<td align=''center'' valign=''top'' style=''border-top:1px solid #C8C8C8;''></td>
																			</tr>
																		</table>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<table bgcolor=''#E1E1E1'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' id=''emailFooter''>
							<tr>
								<td align=''center'' valign=''top''>
									<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
										<tr>
											<td align=''center'' valign=''top''>
												<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' class=''flexibleContainer''>
													<tr>
														<td align=''center'' valign=''top'' width=''500'' class=''flexibleContainerCell''>
															<table border=''0'' cellpadding=''30'' cellspacing=''0'' width=''100%''>
																<tr>
																	<td valign=''top'' bgcolor=''#E1E1E1''>

																		<div style=''font-family:Helvetica,Arial,sans-serif;font-size:13px;color:#828282;text-align:center;line-height:120%;''>
																			<div>[Date_Now]</div>
																			<div>Copyright &#169; 2021 reserved.</div>
																		</div>

																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</center>
	</body>
</html>
', N'Se crea el monitoreo N° [Num], el cual pasa para retroalimentación por parte del [Cargo]', N'www.google.com', CAST(N'2021-10-05T21:56:54.117' AS DateTime))
GO
INSERT [Configuracion].[Mensajes] ([Id], [TipoMensajeId], [CuerpoMensaje], [MaquetaMensaje_Head], [MaquetaMensaje_Fotter], [CuerpoMensaje_Interno], [Url], [FechaRegistro]) VALUES (5, 132, N'<tr>
								<td align=''center'' valign=''top''>
									<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
										<tbody><tr>
											<td align=''center'' valign=''top''>
												<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' class=''flexibleContainer''>
													<tbody><tr>
														<td align=''center'' valign=''top'' width=''500'' class=''flexibleContainerCell''>
															<table border=''0'' cellpadding=''30'' cellspacing=''0'' width=''100%''>
																<tbody><tr>
																	<td align=''center'' valign=''top''>

																		<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
																			<tbody><tr>
																				<td valign=''top'' class=''textContent''>
																					 <div style=''text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;margin-top:3px;color:#5F5F5F;line-height:135%;''>Hola, <strong>[User]</strong></div>
																					 <div style=''margin-bottom: 30px;''></div>      
																					 <div style=''text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;margin-top:3px;color:#5F5F5F;line-height:135%;''>El [CargoC] [UserCordi] acaba de realizar la retroalimentación del motitoreo N°[Num], en este momento queda listo para generar los compromisos correspondientes por parte del [CargoA] [UserAgente]</div>
																					 <div style=''margin-bottom: 15px;''></div>
																					 <div style=''text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;margin-top:3px;color:#5F5F5F;line-height:135%;''>Para ingresar al sistema presione <b><a href=''[Url]'' target=''_blank''>Aqui</a></b> </div>
																				</td>
																			</tr>
																		</tbody></table>
																	</td>
																</tr>
															</tbody></table>
														</td>
													</tr>
												</tbody></table>
											</td>
										</tr>
									</tbody></table>
								</td>
							</tr>', N'<!DOCTYPE html PUBLIC ''-//W3C//DTD XHTML 1.0 Strict//EN'' ''http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd''>
	<html xmlns=''http://www.w3.org/1999/xhtml''>
	<head>
		<meta http-equiv=''Content-Type'' content=''text/html; charset=UTF-8'' />
		<meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
		<meta http-equiv=''X-UA-Compatible'' content=''IE=edge,chrome=1''>
		<meta name=''format-detection'' content=''telephone=no'' /> <!-- disable auto telephone linking in iOS -->
		<title>Respuesta del SOME</title>
		<style type=''text/css''>
			/* RESET STYLES */
			html { background-color:#E1E1E1; margin:0; padding:0; }
			body, #bodyTable, #bodyCell, #bodyCell{height:100% !important; margin:0; padding:0; width:100% !important;font-family:Helvetica, Arial, ''Lucida Grande'', sans-serif;}
			table{border-collapse:collapse;}
			table[id=bodyTable] {width:100%!important;margin:auto;max-width:500px!important;color:#7A7A7A;font-weight:normal;}
			img, a img{border:0; outline:none; text-decoration:none;height:auto; line-height:100%;}
			a {text-decoration:none !important;border-bottom: 1px solid;}
			h1, h2, h3, h4, h5, h6{color:#5F5F5F; font-weight:normal; font-family:Helvetica; font-size:20px; line-height:125%; text-align:Left; letter-spacing:normal;margin-top:0;margin-right:0;margin-bottom:10px;margin-left:0;padding-top:0;padding-bottom:0;padding-left:0;padding-right:0;}

			/* CLIENT-SPECIFIC STYLES */
			.ReadMsgBody{width:100%;} .ExternalClass{width:100%;} /* Force Hotmail/Outlook.com to display emails at full width. */
			.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div{line-height:100%;} /* Force Hotmail/Outlook.com to display line heights normally. */
			table, td{mso-table-lspace:0pt; mso-table-rspace:0pt;} /* Remove spacing between tables in Outlook 2007 and up. */
			#outlook a{padding:0;} /* Force Outlook 2007 and up to provide a ''view in browser'' message. */
			img{-ms-interpolation-mode: bicubic;display:block;outline:none; text-decoration:none;} /* Force IE to smoothly render resized images. */
			body, table, td, p, a, li, blockquote{-ms-text-size-adjust:100%; -webkit-text-size-adjust:100%; font-weight:normal!important;} /* Prevent Windows- and Webkit-based mobile platforms from changing declared text sizes. */
			.ExternalClass td[class=''ecxflexibleContainerBox''] h3 {padding-top: 10px !important;} /* Force hotmail to push 2-grid sub headers down */

			/* /\/\/\/\/\/\/\/\/ TEMPLATE STYLES /\/\/\/\/\/\/\/\/ */

			/* ========== Page Styles ========== */
			h1{display:block;font-size:26px;font-style:normal;font-weight:normal;line-height:100%;}
			h2{display:block;font-size:20px;font-style:normal;font-weight:normal;line-height:120%;}
			h3{display:block;font-size:17px;font-style:normal;font-weight:normal;line-height:110%;}
			h4{display:block;font-size:18px;font-style:italic;font-weight:normal;line-height:100%;}
			.flexibleImage{height:auto;}
			.linkRemoveBorder{border-bottom:0 !important;}
			table[class=flexibleContainerCellDivider] {padding-bottom:0 !important;padding-top:0 !important;}

			body, #bodyTable{background-color:#E1E1E1;}
			#emailHeader{background-color:#E1E1E1;}
			#emailBody{background-color:#FFFFFF;}
			#emailFooter{background-color:#E1E1E1;}
			.nestedContainer{background-color:#F8F8F8; border:1px solid #CCCCCC;}
			.emailButton{background-color:#205478; border-collapse:separate;}
			.buttonContent{color:#FFFFFF; font-family:Helvetica; font-size:18px; font-weight:bold; line-height:100%; padding:15px; text-align:center;}
			.buttonContent a{color:#FFFFFF; display:block; text-decoration:none!important; border:0!important;}
			.emailCalendar{background-color:#FFFFFF; border:1px solid #CCCCCC;}
			.emailCalendarMonth{background-color:#205478; color:#FFFFFF; font-family:Helvetica, Arial, sans-serif; font-size:16px; font-weight:bold; padding-top:10px; padding-bottom:10px; text-align:center;}
			.emailCalendarDay{color:#205478; font-family:Helvetica, Arial, sans-serif; font-size:60px; font-weight:bold; line-height:100%; padding-top:20px; padding-bottom:20px; text-align:center;}
			.imageContentText {margin-top: 10px;line-height:0;}
			.imageContentText a {line-height:0;}
			#invisibleIntroduction {display:none !important;} /* Removing the introduction text from the view */

			/*FRAMEWORK HACKS & OVERRIDES */
			span[class=ios-color-hack] a {color:#275100!important;text-decoration:none!important;} /* Remove all link colors in IOS (below are duplicates based on the color preference) */
			span[class=ios-color-hack2] a {color:#205478!important;text-decoration:none!important;}
			span[class=ios-color-hack3] a {color:#8B8B8B!important;text-decoration:none!important;}
			/* A nice and clean way to target phone numbers you want clickable and avoid a mobile phone from linking other numbers that look like, but are not phone numbers.  Use these two blocks of code to ''unstyle'' any numbers that may be linked.  The second block gives you a class to apply with a span tag to the numbers you would like linked and styled.
			Inspired by Campaign Monitor''s article on using phone numbers in email: http://www.campaignmonitor.com/blog/post/3571/using-phone-numbers-in-html-email/.
			*/
			.a[href^=''tel''], a[href^=''sms''] {text-decoration:none!important;color:#606060!important;pointer-events:none!important;cursor:default!important;}
			.mobile_link a[href^=''tel''], .mobile_link a[href^=''sms''] {text-decoration:none!important;color:#606060!important;pointer-events:auto!important;cursor:default!important;}


			/* MOBILE STYLES */
			@media only screen and (max-width: 480px){
				/*////// CLIENT-SPECIFIC STYLES //////*/
				body{width:100% !important; min-width:100% !important;} /* Force iOS Mail to render the email at full width. */

				/* FRAMEWORK STYLES */
				/*
				CSS selectors are written in attribute
				selector format to prevent Yahoo Mail
				from rendering media query styles on
				desktop.
				*/
				/*td[class=''textContent''], td[class=''flexibleContainerCell''] { width: 100%; padding-left: 10px !important; padding-right: 10px !important; }*/
				table[id=''emailHeader''],
				table[id=''emailBody''],
				table[id=''emailFooter''],
				table[class=''flexibleContainer''],
				td[class=''flexibleContainerCell''] {width:100% !important;}
				td[class=''flexibleContainerBox''], td[class=''flexibleContainerBox''] table {display: block;width: 100%;text-align: left;}
				/*
				The following style rule makes any
				image classed with ''flexibleImage''
				fluid when the query activates.
				Make sure you add an inline max-width
				to those images to prevent them
				from blowing out.
				*/
				td[class=''imageContent''] img {height:auto !important; width:100% !important; max-width:100% !important; }
				img[class=''flexibleImage'']{height:auto !important; width:100% !important;max-width:100% !important;}
				img[class=''flexibleImageSmall'']{height:auto !important; width:auto !important;}


				/*
				Create top space for every second element in a block
				*/
				table[class=''flexibleContainerBoxNext'']{padding-top: 10px !important;}

				/*
				Make buttons in the email span the
				full width of their container, allowing
				for left- or right-handed ease of use.
				*/
				table[class=''emailButton'']{width:100% !important;}
				td[class=''buttonContent'']{padding:0 !important;}
				td[class=''buttonContent''] a{padding:15px !important;}

			}

			/*  CONDITIONS FOR ANDROID DEVICES ONLY
			*   http://developer.android.com/guide/webapps/targeting.html
			*   http://pugetworks.com/2011/04/css-media-queries-for-targeting-different-mobile-devices/ ;
			=====================================================*/

			@media only screen and (-webkit-device-pixel-ratio:.75){
				/* Put CSS for low density (ldpi) Android layouts in here */
			}

			@media only screen and (-webkit-device-pixel-ratio:1){
				/* Put CSS for medium density (mdpi) Android layouts in here */
			}

			@media only screen and (-webkit-device-pixel-ratio:1.5){
				/* Put CSS for high density (hdpi) Android layouts in here */
			}
			/* end Android targeting */

			/* CONDITIONS FOR IOS DEVICES ONLY
			=====================================================*/
			@media only screen and (min-device-width : 320px) and (max-device-width:568px) {

			}
			/* end IOS targeting */
		</style>
		<!--
			Outlook Conditional CSS

			These two style blocks target Outlook 2007 & 2010 specifically, forcing
			columns into a single vertical stack as on mobile clients. This is
			primarily done to avoid the ''page break bug'' and is optional.

			More information here:
			http://templates.mailchimp.com/development/css/outlook-conditional-css
		-->
		<!--[if mso 12]>
			<style type=''text/css''>
				.flexibleContainer{display:block !important; width:100% !important;}
			</style>
		<![endif]-->
		<!--[if mso 14]>
			<style type=''text/css''>
				.flexibleContainer{display:block !important; width:100% !important;}
			</style>
		<![endif]-->
	</head>
	<body bgcolor=''#E1E1E1'' leftmargin=''0'' marginwidth=''0'' topmargin=''0'' marginheight=''0'' offset=''0''>

		<center style=''background-color:#E1E1E1;''>
			<table border=''0'' cellpadding=''0'' cellspacing=''0'' height=''100%'' width=''100%'' id=''bodyTable'' style=''table-layout: fixed;max-width:100% !important;width: 100% !important;min-width: 100% !important;''>
				<tr>
					<td align=''center'' valign=''top'' id=''bodyCell''>
						<table bgcolor=''#E1E1E1'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' id=''emailHeader''>
							<tr>
								<td align=''center'' valign=''top''>
									<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
										<tr>
											<td align=''center'' valign=''top''>
												<table border=''0'' cellpadding=''10'' cellspacing=''0'' width=''500'' class=''flexibleContainer''>
													<tr>
														<td valign=''top'' width=''500'' class=''flexibleContainerCell''>
															<table align=''left'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
																<tr>
																	<td align=''left'' valign=''middle'' id=''invisibleIntroduction'' class=''flexibleContainerBox'' style=''display:none !important; mso-hide:all;''>
																		<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%'' style=''max-width:100%;''>
																			<tr>
																				<td align=''left'' class=''textContent''>
																					<div style=''font-family:Helvetica,Arial,sans-serif;font-size:13px;color:#828282;text-align:center;line-height:120%;''>
																						SOME - Sistema Operacional de Monitoreo Empresarial
																					</div>
																				</td>
																			</tr>
																		</table>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<table bgcolor=''#FFFFFF''  border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' id=''emailBody''>
							<tr>
								<td align=''center'' valign=''top''>
									<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%'' style=''color:#FFFFFF;'' bgcolor=''[vl_BGColor]''>
										<tr>
											<td align=''center'' valign=''top''>
												<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' class=''flexibleContainer''>
													<tr>
														<td align=''center'' valign=''top'' width=''500'' class=''flexibleContainerCell''>
															<table border=''0'' cellpadding=''30'' cellspacing=''0'' width=''100%''>
																<tr>
																	<td align=''center'' valign=''top'' class=''textContent''>
																		<!--<h2 style=''color:#92ebff;text-align:center;font-weight:normal;font-family:Helvetica,Arial,sans-serif;font-size:23px;margin-bottom:10px;line-height:135%;''>N°[Num] [Project]</h2>-->
																		<h1 style=''color:[vl_TitleColor];line-height:100%;font-family:Helvetica,Arial,sans-serif;font-size:35px;font-weight:normal;margin-bottom:5px;text-align:center;''>[accion]</h1>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>', N'<tr>
								<td align=''center'' valign=''top''>
									<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
										<tr>
											<td align=''center'' valign=''top''>
												<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' class=''flexibleContainer''>
													<tr>
														<td align=''center'' valign=''top'' width=''500'' class=''flexibleContainerCell''>
															<table class=''flexibleContainerCellDivider'' border=''0'' cellpadding=''30'' cellspacing=''0'' width=''100%''>
																<tr>
																	<td align=''center'' valign=''top'' style=''padding-top:0px;padding-bottom:0px;''>
																		<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
																			<tr>
																				<td align=''center'' valign=''top'' style=''border-top:1px solid #C8C8C8;''></td>
																			</tr>
																		</table>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<table bgcolor=''#E1E1E1'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' id=''emailFooter''>
							<tr>
								<td align=''center'' valign=''top''>
									<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
										<tr>
											<td align=''center'' valign=''top''>
												<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' class=''flexibleContainer''>
													<tr>
														<td align=''center'' valign=''top'' width=''500'' class=''flexibleContainerCell''>
															<table border=''0'' cellpadding=''30'' cellspacing=''0'' width=''100%''>
																<tr>
																	<td valign=''top'' bgcolor=''#E1E1E1''>

																		<div style=''font-family:Helvetica,Arial,sans-serif;font-size:13px;color:#828282;text-align:center;line-height:120%;''>
																			<div>[Date_Now]</div>
																			<div>Copyright &#169; 2021 reserved.</div>
																		</div>

																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</center>
	</body>
</html>
', N'Se realiza la retroalimentación del monitoreo N° [Num], el cual pasa a realizar compromisos por parte del [Cargo] ', N'www.google.com', CAST(N'2021-10-09T09:48:38.427' AS DateTime))
GO
INSERT [Configuracion].[Mensajes] ([Id], [TipoMensajeId], [CuerpoMensaje], [MaquetaMensaje_Head], [MaquetaMensaje_Fotter], [CuerpoMensaje_Interno], [Url], [FechaRegistro]) VALUES (6, 133, N'<tr>
								<td align=''center'' valign=''top''>
									<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
										<tr>
											<td align=''center'' valign=''top''>
												<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' class=''flexibleContainer''>
													<tr>
														<td align=''center'' valign=''top'' width=''500'' class=''flexibleContainerCell''>
															<table border=''0'' cellpadding=''30'' cellspacing=''0'' width=''100%''>
																<tr>
																	<td align=''center'' valign=''top''>

																		<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
																			<tr>
																				<td valign=''top'' class=''textContent''>
																					 <div style=''text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;margin-top:3px;color:#5F5F5F;line-height:135%;''>Hola, <strong>[User]</strong></div>
																					 <div style=''margin-bottom: 30px;''></div>      
																					 <div style=''text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;margin-top:3px;color:#5F5F5F;line-height:135%;''>El [CargoC] [UserCordi] acaba de rechazar el motitoreo N°[Num]</div>
																					 <div style=''margin-bottom: 30px;''></div>      
																					 <div style=''text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;margin-top:3px;color:#5F5F5F;line-height:135%;''>Por el concepto: [Rechazo]</div>
																					 <div style=''margin-bottom: 15px;''></div>
																					 <div style=''text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;margin-top:3px;color:#5F5F5F;line-height:135%;''>Para ingresar al sistema presione <b><a href=''[Url]'' target=''_blank''>Aqui</a></b> </div>
																				</td>
																			</tr>
																		</table>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>', N'<!DOCTYPE html PUBLIC ''-//W3C//DTD XHTML 1.0 Strict//EN'' ''http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd''>
	<html xmlns=''http://www.w3.org/1999/xhtml''>
	<head>
		<meta http-equiv=''Content-Type'' content=''text/html; charset=UTF-8'' />
		<meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
		<meta http-equiv=''X-UA-Compatible'' content=''IE=edge,chrome=1''>
		<meta name=''format-detection'' content=''telephone=no'' /> <!-- disable auto telephone linking in iOS -->
		<title>Respuesta del SOME</title>
		<style type=''text/css''>
			/* RESET STYLES */
			html { background-color:#E1E1E1; margin:0; padding:0; }
			body, #bodyTable, #bodyCell, #bodyCell{height:100% !important; margin:0; padding:0; width:100% !important;font-family:Helvetica, Arial, ''Lucida Grande'', sans-serif;}
			table{border-collapse:collapse;}
			table[id=bodyTable] {width:100%!important;margin:auto;max-width:500px!important;color:#7A7A7A;font-weight:normal;}
			img, a img{border:0; outline:none; text-decoration:none;height:auto; line-height:100%;}
			a {text-decoration:none !important;border-bottom: 1px solid;}
			h1, h2, h3, h4, h5, h6{color:#5F5F5F; font-weight:normal; font-family:Helvetica; font-size:20px; line-height:125%; text-align:Left; letter-spacing:normal;margin-top:0;margin-right:0;margin-bottom:10px;margin-left:0;padding-top:0;padding-bottom:0;padding-left:0;padding-right:0;}

			/* CLIENT-SPECIFIC STYLES */
			.ReadMsgBody{width:100%;} .ExternalClass{width:100%;} /* Force Hotmail/Outlook.com to display emails at full width. */
			.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div{line-height:100%;} /* Force Hotmail/Outlook.com to display line heights normally. */
			table, td{mso-table-lspace:0pt; mso-table-rspace:0pt;} /* Remove spacing between tables in Outlook 2007 and up. */
			#outlook a{padding:0;} /* Force Outlook 2007 and up to provide a ''view in browser'' message. */
			img{-ms-interpolation-mode: bicubic;display:block;outline:none; text-decoration:none;} /* Force IE to smoothly render resized images. */
			body, table, td, p, a, li, blockquote{-ms-text-size-adjust:100%; -webkit-text-size-adjust:100%; font-weight:normal!important;} /* Prevent Windows- and Webkit-based mobile platforms from changing declared text sizes. */
			.ExternalClass td[class=''ecxflexibleContainerBox''] h3 {padding-top: 10px !important;} /* Force hotmail to push 2-grid sub headers down */

			/* /\/\/\/\/\/\/\/\/ TEMPLATE STYLES /\/\/\/\/\/\/\/\/ */

			/* ========== Page Styles ========== */
			h1{display:block;font-size:26px;font-style:normal;font-weight:normal;line-height:100%;}
			h2{display:block;font-size:20px;font-style:normal;font-weight:normal;line-height:120%;}
			h3{display:block;font-size:17px;font-style:normal;font-weight:normal;line-height:110%;}
			h4{display:block;font-size:18px;font-style:italic;font-weight:normal;line-height:100%;}
			.flexibleImage{height:auto;}
			.linkRemoveBorder{border-bottom:0 !important;}
			table[class=flexibleContainerCellDivider] {padding-bottom:0 !important;padding-top:0 !important;}

			body, #bodyTable{background-color:#E1E1E1;}
			#emailHeader{background-color:#E1E1E1;}
			#emailBody{background-color:#FFFFFF;}
			#emailFooter{background-color:#E1E1E1;}
			.nestedContainer{background-color:#F8F8F8; border:1px solid #CCCCCC;}
			.emailButton{background-color:#205478; border-collapse:separate;}
			.buttonContent{color:#FFFFFF; font-family:Helvetica; font-size:18px; font-weight:bold; line-height:100%; padding:15px; text-align:center;}
			.buttonContent a{color:#FFFFFF; display:block; text-decoration:none!important; border:0!important;}
			.emailCalendar{background-color:#FFFFFF; border:1px solid #CCCCCC;}
			.emailCalendarMonth{background-color:#205478; color:#FFFFFF; font-family:Helvetica, Arial, sans-serif; font-size:16px; font-weight:bold; padding-top:10px; padding-bottom:10px; text-align:center;}
			.emailCalendarDay{color:#205478; font-family:Helvetica, Arial, sans-serif; font-size:60px; font-weight:bold; line-height:100%; padding-top:20px; padding-bottom:20px; text-align:center;}
			.imageContentText {margin-top: 10px;line-height:0;}
			.imageContentText a {line-height:0;}
			#invisibleIntroduction {display:none !important;} /* Removing the introduction text from the view */

			/*FRAMEWORK HACKS & OVERRIDES */
			span[class=ios-color-hack] a {color:#275100!important;text-decoration:none!important;} /* Remove all link colors in IOS (below are duplicates based on the color preference) */
			span[class=ios-color-hack2] a {color:#205478!important;text-decoration:none!important;}
			span[class=ios-color-hack3] a {color:#8B8B8B!important;text-decoration:none!important;}
			/* A nice and clean way to target phone numbers you want clickable and avoid a mobile phone from linking other numbers that look like, but are not phone numbers.  Use these two blocks of code to ''unstyle'' any numbers that may be linked.  The second block gives you a class to apply with a span tag to the numbers you would like linked and styled.
			Inspired by Campaign Monitor''s article on using phone numbers in email: http://www.campaignmonitor.com/blog/post/3571/using-phone-numbers-in-html-email/.
			*/
			.a[href^=''tel''], a[href^=''sms''] {text-decoration:none!important;color:#606060!important;pointer-events:none!important;cursor:default!important;}
			.mobile_link a[href^=''tel''], .mobile_link a[href^=''sms''] {text-decoration:none!important;color:#606060!important;pointer-events:auto!important;cursor:default!important;}


			/* MOBILE STYLES */
			@media only screen and (max-width: 480px){
				/*////// CLIENT-SPECIFIC STYLES //////*/
				body{width:100% !important; min-width:100% !important;} /* Force iOS Mail to render the email at full width. */

				/* FRAMEWORK STYLES */
				/*
				CSS selectors are written in attribute
				selector format to prevent Yahoo Mail
				from rendering media query styles on
				desktop.
				*/
				/*td[class=''textContent''], td[class=''flexibleContainerCell''] { width: 100%; padding-left: 10px !important; padding-right: 10px !important; }*/
				table[id=''emailHeader''],
				table[id=''emailBody''],
				table[id=''emailFooter''],
				table[class=''flexibleContainer''],
				td[class=''flexibleContainerCell''] {width:100% !important;}
				td[class=''flexibleContainerBox''], td[class=''flexibleContainerBox''] table {display: block;width: 100%;text-align: left;}
				/*
				The following style rule makes any
				image classed with ''flexibleImage''
				fluid when the query activates.
				Make sure you add an inline max-width
				to those images to prevent them
				from blowing out.
				*/
				td[class=''imageContent''] img {height:auto !important; width:100% !important; max-width:100% !important; }
				img[class=''flexibleImage'']{height:auto !important; width:100% !important;max-width:100% !important;}
				img[class=''flexibleImageSmall'']{height:auto !important; width:auto !important;}


				/*
				Create top space for every second element in a block
				*/
				table[class=''flexibleContainerBoxNext'']{padding-top: 10px !important;}

				/*
				Make buttons in the email span the
				full width of their container, allowing
				for left- or right-handed ease of use.
				*/
				table[class=''emailButton'']{width:100% !important;}
				td[class=''buttonContent'']{padding:0 !important;}
				td[class=''buttonContent''] a{padding:15px !important;}

			}

			/*  CONDITIONS FOR ANDROID DEVICES ONLY
			*   http://developer.android.com/guide/webapps/targeting.html
			*   http://pugetworks.com/2011/04/css-media-queries-for-targeting-different-mobile-devices/ ;
			=====================================================*/

			@media only screen and (-webkit-device-pixel-ratio:.75){
				/* Put CSS for low density (ldpi) Android layouts in here */
			}

			@media only screen and (-webkit-device-pixel-ratio:1){
				/* Put CSS for medium density (mdpi) Android layouts in here */
			}

			@media only screen and (-webkit-device-pixel-ratio:1.5){
				/* Put CSS for high density (hdpi) Android layouts in here */
			}
			/* end Android targeting */

			/* CONDITIONS FOR IOS DEVICES ONLY
			=====================================================*/
			@media only screen and (min-device-width : 320px) and (max-device-width:568px) {

			}
			/* end IOS targeting */
		</style>
		<!--
			Outlook Conditional CSS

			These two style blocks target Outlook 2007 & 2010 specifically, forcing
			columns into a single vertical stack as on mobile clients. This is
			primarily done to avoid the ''page break bug'' and is optional.

			More information here:
			http://templates.mailchimp.com/development/css/outlook-conditional-css
		-->
		<!--[if mso 12]>
			<style type=''text/css''>
				.flexibleContainer{display:block !important; width:100% !important;}
			</style>
		<![endif]-->
		<!--[if mso 14]>
			<style type=''text/css''>
				.flexibleContainer{display:block !important; width:100% !important;}
			</style>
		<![endif]-->
	</head>
	<body bgcolor=''#E1E1E1'' leftmargin=''0'' marginwidth=''0'' topmargin=''0'' marginheight=''0'' offset=''0''>

		<center style=''background-color:#E1E1E1;''>
			<table border=''0'' cellpadding=''0'' cellspacing=''0'' height=''100%'' width=''100%'' id=''bodyTable'' style=''table-layout: fixed;max-width:100% !important;width: 100% !important;min-width: 100% !important;''>
				<tr>
					<td align=''center'' valign=''top'' id=''bodyCell''>
						<table bgcolor=''#E1E1E1'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' id=''emailHeader''>
							<tr>
								<td align=''center'' valign=''top''>
									<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
										<tr>
											<td align=''center'' valign=''top''>
												<table border=''0'' cellpadding=''10'' cellspacing=''0'' width=''500'' class=''flexibleContainer''>
													<tr>
														<td valign=''top'' width=''500'' class=''flexibleContainerCell''>
															<table align=''left'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
																<tr>
																	<td align=''left'' valign=''middle'' id=''invisibleIntroduction'' class=''flexibleContainerBox'' style=''display:none !important; mso-hide:all;''>
																		<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%'' style=''max-width:100%;''>
																			<tr>
																				<td align=''left'' class=''textContent''>
																					<div style=''font-family:Helvetica,Arial,sans-serif;font-size:13px;color:#828282;text-align:center;line-height:120%;''>
																						SOME - Sistema Operacional de Monitoreo Empresarial
																					</div>
																				</td>
																			</tr>
																		</table>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<table bgcolor=''#FFFFFF''  border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' id=''emailBody''>
							<tr>
								<td align=''center'' valign=''top''>
									<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%'' style=''color:#FFFFFF;'' bgcolor=''[vl_BGColor]''>
										<tr>
											<td align=''center'' valign=''top''>
												<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' class=''flexibleContainer''>
													<tr>
														<td align=''center'' valign=''top'' width=''500'' class=''flexibleContainerCell''>
															<table border=''0'' cellpadding=''30'' cellspacing=''0'' width=''100%''>
																<tr>
																	<td align=''center'' valign=''top'' class=''textContent''>
																		<!--<h2 style=''color:#92ebff;text-align:center;font-weight:normal;font-family:Helvetica,Arial,sans-serif;font-size:23px;margin-bottom:10px;line-height:135%;''>N°[Num] [Project]</h2>-->
																		<h1 style=''color:[vl_TitleColor];line-height:100%;font-family:Helvetica,Arial,sans-serif;font-size:35px;font-weight:normal;margin-bottom:5px;text-align:center;''>[accion]</h1>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>', N'<tr>
								<td align=''center'' valign=''top''>
									<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
										<tr>
											<td align=''center'' valign=''top''>
												<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' class=''flexibleContainer''>
													<tr>
														<td align=''center'' valign=''top'' width=''500'' class=''flexibleContainerCell''>
															<table class=''flexibleContainerCellDivider'' border=''0'' cellpadding=''30'' cellspacing=''0'' width=''100%''>
																<tr>
																	<td align=''center'' valign=''top'' style=''padding-top:0px;padding-bottom:0px;''>
																		<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
																			<tr>
																				<td align=''center'' valign=''top'' style=''border-top:1px solid #C8C8C8;''></td>
																			</tr>
																		</table>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<table bgcolor=''#E1E1E1'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' id=''emailFooter''>
							<tr>
								<td align=''center'' valign=''top''>
									<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
										<tr>
											<td align=''center'' valign=''top''>
												<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' class=''flexibleContainer''>
													<tr>
														<td align=''center'' valign=''top'' width=''500'' class=''flexibleContainerCell''>
															<table border=''0'' cellpadding=''30'' cellspacing=''0'' width=''100%''>
																<tr>
																	<td valign=''top'' bgcolor=''#E1E1E1''>

																		<div style=''font-family:Helvetica,Arial,sans-serif;font-size:13px;color:#828282;text-align:center;line-height:120%;''>
																			<div>[Date_Now]</div>
																			<div>Copyright &#169; 2021 reserved.</div>
																		</div>

																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</center>
	</body>
</html>
', N'Se realiza el rechazo del monitoreo N° [Num], el cual pasa a revisión por parte del [Cargo] ', N'www.google.com', CAST(N'2021-10-09T18:47:46.053' AS DateTime))
GO
INSERT [Configuracion].[Mensajes] ([Id], [TipoMensajeId], [CuerpoMensaje], [MaquetaMensaje_Head], [MaquetaMensaje_Fotter], [CuerpoMensaje_Interno], [Url], [FechaRegistro]) VALUES (8, 134, N'<tr>
								<td align=''center'' valign=''top''>
									<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
										<tr>
											<td align=''center'' valign=''top''>
												<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' class=''flexibleContainer''>
													<tr>
														<td align=''center'' valign=''top'' width=''500'' class=''flexibleContainerCell''>
															<table border=''0'' cellpadding=''30'' cellspacing=''0'' width=''100%''>
																<tr>
																	<td align=''center'' valign=''top''>

																		<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
																			<tr>
																				<td valign=''top'' class=''textContent''>
																					 <div style=''text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;margin-top:3px;color:#5F5F5F;line-height:135%;''>Hola, <strong>[User]</strong></div>
																					 <div style=''margin-bottom: 30px;''></div>      
																					 <div style=''text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;margin-top:3px;color:#5F5F5F;line-height:135%;''>El [CargoA] [UserA] acaba de generar los compromisos del motitoreo N°[Num] y cierre del mismo</div>
																					 <div style=''margin-bottom: 15px;''></div>
																					 <div style=''text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;margin-top:3px;color:#5F5F5F;line-height:135%;''>Para ingresar al sistema presione <b><a href=''[Url]'' target=''_blank''>Aqui</a></b> </div>
																				</td>
																			</tr>
																		</table>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>', N'<!DOCTYPE html PUBLIC ''-//W3C//DTD XHTML 1.0 Strict//EN'' ''http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd''>
	<html xmlns=''http://www.w3.org/1999/xhtml''>
	<head>
		<meta http-equiv=''Content-Type'' content=''text/html; charset=UTF-8'' />
		<meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
		<meta http-equiv=''X-UA-Compatible'' content=''IE=edge,chrome=1''>
		<meta name=''format-detection'' content=''telephone=no'' /> <!-- disable auto telephone linking in iOS -->
		<title>Respuesta del SOME</title>
		<style type=''text/css''>
			/* RESET STYLES */
			html { background-color:#E1E1E1; margin:0; padding:0; }
			body, #bodyTable, #bodyCell, #bodyCell{height:100% !important; margin:0; padding:0; width:100% !important;font-family:Helvetica, Arial, ''Lucida Grande'', sans-serif;}
			table{border-collapse:collapse;}
			table[id=bodyTable] {width:100%!important;margin:auto;max-width:500px!important;color:#7A7A7A;font-weight:normal;}
			img, a img{border:0; outline:none; text-decoration:none;height:auto; line-height:100%;}
			a {text-decoration:none !important;border-bottom: 1px solid;}
			h1, h2, h3, h4, h5, h6{color:#5F5F5F; font-weight:normal; font-family:Helvetica; font-size:20px; line-height:125%; text-align:Left; letter-spacing:normal;margin-top:0;margin-right:0;margin-bottom:10px;margin-left:0;padding-top:0;padding-bottom:0;padding-left:0;padding-right:0;}

			/* CLIENT-SPECIFIC STYLES */
			.ReadMsgBody{width:100%;} .ExternalClass{width:100%;} /* Force Hotmail/Outlook.com to display emails at full width. */
			.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div{line-height:100%;} /* Force Hotmail/Outlook.com to display line heights normally. */
			table, td{mso-table-lspace:0pt; mso-table-rspace:0pt;} /* Remove spacing between tables in Outlook 2007 and up. */
			#outlook a{padding:0;} /* Force Outlook 2007 and up to provide a ''view in browser'' message. */
			img{-ms-interpolation-mode: bicubic;display:block;outline:none; text-decoration:none;} /* Force IE to smoothly render resized images. */
			body, table, td, p, a, li, blockquote{-ms-text-size-adjust:100%; -webkit-text-size-adjust:100%; font-weight:normal!important;} /* Prevent Windows- and Webkit-based mobile platforms from changing declared text sizes. */
			.ExternalClass td[class=''ecxflexibleContainerBox''] h3 {padding-top: 10px !important;} /* Force hotmail to push 2-grid sub headers down */

			/* /\/\/\/\/\/\/\/\/ TEMPLATE STYLES /\/\/\/\/\/\/\/\/ */

			/* ========== Page Styles ========== */
			h1{display:block;font-size:26px;font-style:normal;font-weight:normal;line-height:100%;}
			h2{display:block;font-size:20px;font-style:normal;font-weight:normal;line-height:120%;}
			h3{display:block;font-size:17px;font-style:normal;font-weight:normal;line-height:110%;}
			h4{display:block;font-size:18px;font-style:italic;font-weight:normal;line-height:100%;}
			.flexibleImage{height:auto;}
			.linkRemoveBorder{border-bottom:0 !important;}
			table[class=flexibleContainerCellDivider] {padding-bottom:0 !important;padding-top:0 !important;}

			body, #bodyTable{background-color:#E1E1E1;}
			#emailHeader{background-color:#E1E1E1;}
			#emailBody{background-color:#FFFFFF;}
			#emailFooter{background-color:#E1E1E1;}
			.nestedContainer{background-color:#F8F8F8; border:1px solid #CCCCCC;}
			.emailButton{background-color:#205478; border-collapse:separate;}
			.buttonContent{color:#FFFFFF; font-family:Helvetica; font-size:18px; font-weight:bold; line-height:100%; padding:15px; text-align:center;}
			.buttonContent a{color:#FFFFFF; display:block; text-decoration:none!important; border:0!important;}
			.emailCalendar{background-color:#FFFFFF; border:1px solid #CCCCCC;}
			.emailCalendarMonth{background-color:#205478; color:#FFFFFF; font-family:Helvetica, Arial, sans-serif; font-size:16px; font-weight:bold; padding-top:10px; padding-bottom:10px; text-align:center;}
			.emailCalendarDay{color:#205478; font-family:Helvetica, Arial, sans-serif; font-size:60px; font-weight:bold; line-height:100%; padding-top:20px; padding-bottom:20px; text-align:center;}
			.imageContentText {margin-top: 10px;line-height:0;}
			.imageContentText a {line-height:0;}
			#invisibleIntroduction {display:none !important;} /* Removing the introduction text from the view */

			/*FRAMEWORK HACKS & OVERRIDES */
			span[class=ios-color-hack] a {color:#275100!important;text-decoration:none!important;} /* Remove all link colors in IOS (below are duplicates based on the color preference) */
			span[class=ios-color-hack2] a {color:#205478!important;text-decoration:none!important;}
			span[class=ios-color-hack3] a {color:#8B8B8B!important;text-decoration:none!important;}
			/* A nice and clean way to target phone numbers you want clickable and avoid a mobile phone from linking other numbers that look like, but are not phone numbers.  Use these two blocks of code to ''unstyle'' any numbers that may be linked.  The second block gives you a class to apply with a span tag to the numbers you would like linked and styled.
			Inspired by Campaign Monitor''s article on using phone numbers in email: http://www.campaignmonitor.com/blog/post/3571/using-phone-numbers-in-html-email/.
			*/
			.a[href^=''tel''], a[href^=''sms''] {text-decoration:none!important;color:#606060!important;pointer-events:none!important;cursor:default!important;}
			.mobile_link a[href^=''tel''], .mobile_link a[href^=''sms''] {text-decoration:none!important;color:#606060!important;pointer-events:auto!important;cursor:default!important;}


			/* MOBILE STYLES */
			@media only screen and (max-width: 480px){
				/*////// CLIENT-SPECIFIC STYLES //////*/
				body{width:100% !important; min-width:100% !important;} /* Force iOS Mail to render the email at full width. */

				/* FRAMEWORK STYLES */
				/*
				CSS selectors are written in attribute
				selector format to prevent Yahoo Mail
				from rendering media query styles on
				desktop.
				*/
				/*td[class=''textContent''], td[class=''flexibleContainerCell''] { width: 100%; padding-left: 10px !important; padding-right: 10px !important; }*/
				table[id=''emailHeader''],
				table[id=''emailBody''],
				table[id=''emailFooter''],
				table[class=''flexibleContainer''],
				td[class=''flexibleContainerCell''] {width:100% !important;}
				td[class=''flexibleContainerBox''], td[class=''flexibleContainerBox''] table {display: block;width: 100%;text-align: left;}
				/*
				The following style rule makes any
				image classed with ''flexibleImage''
				fluid when the query activates.
				Make sure you add an inline max-width
				to those images to prevent them
				from blowing out.
				*/
				td[class=''imageContent''] img {height:auto !important; width:100% !important; max-width:100% !important; }
				img[class=''flexibleImage'']{height:auto !important; width:100% !important;max-width:100% !important;}
				img[class=''flexibleImageSmall'']{height:auto !important; width:auto !important;}


				/*
				Create top space for every second element in a block
				*/
				table[class=''flexibleContainerBoxNext'']{padding-top: 10px !important;}

				/*
				Make buttons in the email span the
				full width of their container, allowing
				for left- or right-handed ease of use.
				*/
				table[class=''emailButton'']{width:100% !important;}
				td[class=''buttonContent'']{padding:0 !important;}
				td[class=''buttonContent''] a{padding:15px !important;}

			}

			/*  CONDITIONS FOR ANDROID DEVICES ONLY
			*   http://developer.android.com/guide/webapps/targeting.html
			*   http://pugetworks.com/2011/04/css-media-queries-for-targeting-different-mobile-devices/ ;
			=====================================================*/

			@media only screen and (-webkit-device-pixel-ratio:.75){
				/* Put CSS for low density (ldpi) Android layouts in here */
			}

			@media only screen and (-webkit-device-pixel-ratio:1){
				/* Put CSS for medium density (mdpi) Android layouts in here */
			}

			@media only screen and (-webkit-device-pixel-ratio:1.5){
				/* Put CSS for high density (hdpi) Android layouts in here */
			}
			/* end Android targeting */

			/* CONDITIONS FOR IOS DEVICES ONLY
			=====================================================*/
			@media only screen and (min-device-width : 320px) and (max-device-width:568px) {

			}
			/* end IOS targeting */
		</style>
		<!--
			Outlook Conditional CSS

			These two style blocks target Outlook 2007 & 2010 specifically, forcing
			columns into a single vertical stack as on mobile clients. This is
			primarily done to avoid the ''page break bug'' and is optional.

			More information here:
			http://templates.mailchimp.com/development/css/outlook-conditional-css
		-->
		<!--[if mso 12]>
			<style type=''text/css''>
				.flexibleContainer{display:block !important; width:100% !important;}
			</style>
		<![endif]-->
		<!--[if mso 14]>
			<style type=''text/css''>
				.flexibleContainer{display:block !important; width:100% !important;}
			</style>
		<![endif]-->
	</head>
	<body bgcolor=''#E1E1E1'' leftmargin=''0'' marginwidth=''0'' topmargin=''0'' marginheight=''0'' offset=''0''>

		<center style=''background-color:#E1E1E1;''>
			<table border=''0'' cellpadding=''0'' cellspacing=''0'' height=''100%'' width=''100%'' id=''bodyTable'' style=''table-layout: fixed;max-width:100% !important;width: 100% !important;min-width: 100% !important;''>
				<tr>
					<td align=''center'' valign=''top'' id=''bodyCell''>
						<table bgcolor=''#E1E1E1'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' id=''emailHeader''>
							<tr>
								<td align=''center'' valign=''top''>
									<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
										<tr>
											<td align=''center'' valign=''top''>
												<table border=''0'' cellpadding=''10'' cellspacing=''0'' width=''500'' class=''flexibleContainer''>
													<tr>
														<td valign=''top'' width=''500'' class=''flexibleContainerCell''>
															<table align=''left'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
																<tr>
																	<td align=''left'' valign=''middle'' id=''invisibleIntroduction'' class=''flexibleContainerBox'' style=''display:none !important; mso-hide:all;''>
																		<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%'' style=''max-width:100%;''>
																			<tr>
																				<td align=''left'' class=''textContent''>
																					<div style=''font-family:Helvetica,Arial,sans-serif;font-size:13px;color:#828282;text-align:center;line-height:120%;''>
																						SOME - Sistema Operacional de Monitoreo Empresarial
																					</div>
																				</td>
																			</tr>
																		</table>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<table bgcolor=''#FFFFFF''  border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' id=''emailBody''>
							<tr>
								<td align=''center'' valign=''top''>
									<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%'' style=''color:#FFFFFF;'' bgcolor=''[vl_BGColor]''>
										<tr>
											<td align=''center'' valign=''top''>
												<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' class=''flexibleContainer''>
													<tr>
														<td align=''center'' valign=''top'' width=''500'' class=''flexibleContainerCell''>
															<table border=''0'' cellpadding=''30'' cellspacing=''0'' width=''100%''>
																<tr>
																	<td align=''center'' valign=''top'' class=''textContent''>
																		<!--<h2 style=''color:#92ebff;text-align:center;font-weight:normal;font-family:Helvetica,Arial,sans-serif;font-size:23px;margin-bottom:10px;line-height:135%;''>N°[Num] [Project]</h2>-->
																		<h1 style=''color:[vl_TitleColor];line-height:100%;font-family:Helvetica,Arial,sans-serif;font-size:35px;font-weight:normal;margin-bottom:5px;text-align:center;''>[accion]</h1>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>', N'<tr>
								<td align=''center'' valign=''top''>
									<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
										<tr>
											<td align=''center'' valign=''top''>
												<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' class=''flexibleContainer''>
													<tr>
														<td align=''center'' valign=''top'' width=''500'' class=''flexibleContainerCell''>
															<table class=''flexibleContainerCellDivider'' border=''0'' cellpadding=''30'' cellspacing=''0'' width=''100%''>
																<tr>
																	<td align=''center'' valign=''top'' style=''padding-top:0px;padding-bottom:0px;''>
																		<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
																			<tr>
																				<td align=''center'' valign=''top'' style=''border-top:1px solid #C8C8C8;''></td>
																			</tr>
																		</table>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<table bgcolor=''#E1E1E1'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' id=''emailFooter''>
							<tr>
								<td align=''center'' valign=''top''>
									<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
										<tr>
											<td align=''center'' valign=''top''>
												<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' class=''flexibleContainer''>
													<tr>
														<td align=''center'' valign=''top'' width=''500'' class=''flexibleContainerCell''>
															<table border=''0'' cellpadding=''30'' cellspacing=''0'' width=''100%''>
																<tr>
																	<td valign=''top'' bgcolor=''#E1E1E1''>

																		<div style=''font-family:Helvetica,Arial,sans-serif;font-size:13px;color:#828282;text-align:center;line-height:120%;''>
																			<div>[Date_Now]</div>
																			<div>Copyright &#169; 2021 reserved.</div>
																		</div>

																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</center>
	</body>
</html>
', N'Se realiza los compromisos del monitoreo N° [Num] por parte del [Cargo]  ', N'www.google.com', CAST(N'2021-10-09T23:33:48.000' AS DateTime))
GO
INSERT [Configuracion].[Mensajes] ([Id], [TipoMensajeId], [CuerpoMensaje], [MaquetaMensaje_Head], [MaquetaMensaje_Fotter], [CuerpoMensaje_Interno], [Url], [FechaRegistro]) VALUES (9, 135, N'<tr>
								<td align=''center'' valign=''top''>
									<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
										<tr>
											<td align=''center'' valign=''top''>
												<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' class=''flexibleContainer''>
													<tr>
														<td align=''center'' valign=''top'' width=''500'' class=''flexibleContainerCell''>
															<table border=''0'' cellpadding=''30'' cellspacing=''0'' width=''100%''>
																<tr>
																	<td align=''center'' valign=''top''>

																		<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
																			<tr>
																				<td valign=''top'' class=''textContent''>
																					 <div style=''text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;margin-top:3px;color:#5F5F5F;line-height:135%;''>Hola, <strong>[User]</strong></div>
																					 <div style=''margin-bottom: 30px;''></div>      
																					 <div style=''text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;margin-top:3px;color:#5F5F5F;line-height:135%;''>El [CargoA] [UserA] acaba de rechazar el motitoreo N°[Num]</div>
																					 <div style=''margin-bottom: 30px;''></div>      
																					 <div style=''text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;margin-top:3px;color:#5F5F5F;line-height:135%;''>Por el concepto: [Rechazo]</div>
																					 <div style=''margin-bottom: 15px;''></div>
																					 <div style=''text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;margin-top:3px;color:#5F5F5F;line-height:135%;''>Para ingresar al sistema presione <b><a href=''[Url]'' target=''_blank''>Aqui</a></b> </div>
																				</td>
																			</tr>
																		</table>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>', N'<!DOCTYPE html PUBLIC ''-//W3C//DTD XHTML 1.0 Strict//EN'' ''http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd''>
	<html xmlns=''http://www.w3.org/1999/xhtml''>
	<head>
		<meta http-equiv=''Content-Type'' content=''text/html; charset=UTF-8'' />
		<meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
		<meta http-equiv=''X-UA-Compatible'' content=''IE=edge,chrome=1''>
		<meta name=''format-detection'' content=''telephone=no'' /> <!-- disable auto telephone linking in iOS -->
		<title>Respuesta del SOME</title>
		<style type=''text/css''>
			/* RESET STYLES */
			html { background-color:#E1E1E1; margin:0; padding:0; }
			body, #bodyTable, #bodyCell, #bodyCell{height:100% !important; margin:0; padding:0; width:100% !important;font-family:Helvetica, Arial, ''Lucida Grande'', sans-serif;}
			table{border-collapse:collapse;}
			table[id=bodyTable] {width:100%!important;margin:auto;max-width:500px!important;color:#7A7A7A;font-weight:normal;}
			img, a img{border:0; outline:none; text-decoration:none;height:auto; line-height:100%;}
			a {text-decoration:none !important;border-bottom: 1px solid;}
			h1, h2, h3, h4, h5, h6{color:#5F5F5F; font-weight:normal; font-family:Helvetica; font-size:20px; line-height:125%; text-align:Left; letter-spacing:normal;margin-top:0;margin-right:0;margin-bottom:10px;margin-left:0;padding-top:0;padding-bottom:0;padding-left:0;padding-right:0;}

			/* CLIENT-SPECIFIC STYLES */
			.ReadMsgBody{width:100%;} .ExternalClass{width:100%;} /* Force Hotmail/Outlook.com to display emails at full width. */
			.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div{line-height:100%;} /* Force Hotmail/Outlook.com to display line heights normally. */
			table, td{mso-table-lspace:0pt; mso-table-rspace:0pt;} /* Remove spacing between tables in Outlook 2007 and up. */
			#outlook a{padding:0;} /* Force Outlook 2007 and up to provide a ''view in browser'' message. */
			img{-ms-interpolation-mode: bicubic;display:block;outline:none; text-decoration:none;} /* Force IE to smoothly render resized images. */
			body, table, td, p, a, li, blockquote{-ms-text-size-adjust:100%; -webkit-text-size-adjust:100%; font-weight:normal!important;} /* Prevent Windows- and Webkit-based mobile platforms from changing declared text sizes. */
			.ExternalClass td[class=''ecxflexibleContainerBox''] h3 {padding-top: 10px !important;} /* Force hotmail to push 2-grid sub headers down */

			/* /\/\/\/\/\/\/\/\/ TEMPLATE STYLES /\/\/\/\/\/\/\/\/ */

			/* ========== Page Styles ========== */
			h1{display:block;font-size:26px;font-style:normal;font-weight:normal;line-height:100%;}
			h2{display:block;font-size:20px;font-style:normal;font-weight:normal;line-height:120%;}
			h3{display:block;font-size:17px;font-style:normal;font-weight:normal;line-height:110%;}
			h4{display:block;font-size:18px;font-style:italic;font-weight:normal;line-height:100%;}
			.flexibleImage{height:auto;}
			.linkRemoveBorder{border-bottom:0 !important;}
			table[class=flexibleContainerCellDivider] {padding-bottom:0 !important;padding-top:0 !important;}

			body, #bodyTable{background-color:#E1E1E1;}
			#emailHeader{background-color:#E1E1E1;}
			#emailBody{background-color:#FFFFFF;}
			#emailFooter{background-color:#E1E1E1;}
			.nestedContainer{background-color:#F8F8F8; border:1px solid #CCCCCC;}
			.emailButton{background-color:#205478; border-collapse:separate;}
			.buttonContent{color:#FFFFFF; font-family:Helvetica; font-size:18px; font-weight:bold; line-height:100%; padding:15px; text-align:center;}
			.buttonContent a{color:#FFFFFF; display:block; text-decoration:none!important; border:0!important;}
			.emailCalendar{background-color:#FFFFFF; border:1px solid #CCCCCC;}
			.emailCalendarMonth{background-color:#205478; color:#FFFFFF; font-family:Helvetica, Arial, sans-serif; font-size:16px; font-weight:bold; padding-top:10px; padding-bottom:10px; text-align:center;}
			.emailCalendarDay{color:#205478; font-family:Helvetica, Arial, sans-serif; font-size:60px; font-weight:bold; line-height:100%; padding-top:20px; padding-bottom:20px; text-align:center;}
			.imageContentText {margin-top: 10px;line-height:0;}
			.imageContentText a {line-height:0;}
			#invisibleIntroduction {display:none !important;} /* Removing the introduction text from the view */

			/*FRAMEWORK HACKS & OVERRIDES */
			span[class=ios-color-hack] a {color:#275100!important;text-decoration:none!important;} /* Remove all link colors in IOS (below are duplicates based on the color preference) */
			span[class=ios-color-hack2] a {color:#205478!important;text-decoration:none!important;}
			span[class=ios-color-hack3] a {color:#8B8B8B!important;text-decoration:none!important;}
			/* A nice and clean way to target phone numbers you want clickable and avoid a mobile phone from linking other numbers that look like, but are not phone numbers.  Use these two blocks of code to ''unstyle'' any numbers that may be linked.  The second block gives you a class to apply with a span tag to the numbers you would like linked and styled.
			Inspired by Campaign Monitor''s article on using phone numbers in email: http://www.campaignmonitor.com/blog/post/3571/using-phone-numbers-in-html-email/.
			*/
			.a[href^=''tel''], a[href^=''sms''] {text-decoration:none!important;color:#606060!important;pointer-events:none!important;cursor:default!important;}
			.mobile_link a[href^=''tel''], .mobile_link a[href^=''sms''] {text-decoration:none!important;color:#606060!important;pointer-events:auto!important;cursor:default!important;}


			/* MOBILE STYLES */
			@media only screen and (max-width: 480px){
				/*////// CLIENT-SPECIFIC STYLES //////*/
				body{width:100% !important; min-width:100% !important;} /* Force iOS Mail to render the email at full width. */

				/* FRAMEWORK STYLES */
				/*
				CSS selectors are written in attribute
				selector format to prevent Yahoo Mail
				from rendering media query styles on
				desktop.
				*/
				/*td[class=''textContent''], td[class=''flexibleContainerCell''] { width: 100%; padding-left: 10px !important; padding-right: 10px !important; }*/
				table[id=''emailHeader''],
				table[id=''emailBody''],
				table[id=''emailFooter''],
				table[class=''flexibleContainer''],
				td[class=''flexibleContainerCell''] {width:100% !important;}
				td[class=''flexibleContainerBox''], td[class=''flexibleContainerBox''] table {display: block;width: 100%;text-align: left;}
				/*
				The following style rule makes any
				image classed with ''flexibleImage''
				fluid when the query activates.
				Make sure you add an inline max-width
				to those images to prevent them
				from blowing out.
				*/
				td[class=''imageContent''] img {height:auto !important; width:100% !important; max-width:100% !important; }
				img[class=''flexibleImage'']{height:auto !important; width:100% !important;max-width:100% !important;}
				img[class=''flexibleImageSmall'']{height:auto !important; width:auto !important;}


				/*
				Create top space for every second element in a block
				*/
				table[class=''flexibleContainerBoxNext'']{padding-top: 10px !important;}

				/*
				Make buttons in the email span the
				full width of their container, allowing
				for left- or right-handed ease of use.
				*/
				table[class=''emailButton'']{width:100% !important;}
				td[class=''buttonContent'']{padding:0 !important;}
				td[class=''buttonContent''] a{padding:15px !important;}

			}

			/*  CONDITIONS FOR ANDROID DEVICES ONLY
			*   http://developer.android.com/guide/webapps/targeting.html
			*   http://pugetworks.com/2011/04/css-media-queries-for-targeting-different-mobile-devices/ ;
			=====================================================*/

			@media only screen and (-webkit-device-pixel-ratio:.75){
				/* Put CSS for low density (ldpi) Android layouts in here */
			}

			@media only screen and (-webkit-device-pixel-ratio:1){
				/* Put CSS for medium density (mdpi) Android layouts in here */
			}

			@media only screen and (-webkit-device-pixel-ratio:1.5){
				/* Put CSS for high density (hdpi) Android layouts in here */
			}
			/* end Android targeting */

			/* CONDITIONS FOR IOS DEVICES ONLY
			=====================================================*/
			@media only screen and (min-device-width : 320px) and (max-device-width:568px) {

			}
			/* end IOS targeting */
		</style>
		<!--
			Outlook Conditional CSS

			These two style blocks target Outlook 2007 & 2010 specifically, forcing
			columns into a single vertical stack as on mobile clients. This is
			primarily done to avoid the ''page break bug'' and is optional.

			More information here:
			http://templates.mailchimp.com/development/css/outlook-conditional-css
		-->
		<!--[if mso 12]>
			<style type=''text/css''>
				.flexibleContainer{display:block !important; width:100% !important;}
			</style>
		<![endif]-->
		<!--[if mso 14]>
			<style type=''text/css''>
				.flexibleContainer{display:block !important; width:100% !important;}
			</style>
		<![endif]-->
	</head>
	<body bgcolor=''#E1E1E1'' leftmargin=''0'' marginwidth=''0'' topmargin=''0'' marginheight=''0'' offset=''0''>

		<center style=''background-color:#E1E1E1;''>
			<table border=''0'' cellpadding=''0'' cellspacing=''0'' height=''100%'' width=''100%'' id=''bodyTable'' style=''table-layout: fixed;max-width:100% !important;width: 100% !important;min-width: 100% !important;''>
				<tr>
					<td align=''center'' valign=''top'' id=''bodyCell''>
						<table bgcolor=''#E1E1E1'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' id=''emailHeader''>
							<tr>
								<td align=''center'' valign=''top''>
									<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
										<tr>
											<td align=''center'' valign=''top''>
												<table border=''0'' cellpadding=''10'' cellspacing=''0'' width=''500'' class=''flexibleContainer''>
													<tr>
														<td valign=''top'' width=''500'' class=''flexibleContainerCell''>
															<table align=''left'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
																<tr>
																	<td align=''left'' valign=''middle'' id=''invisibleIntroduction'' class=''flexibleContainerBox'' style=''display:none !important; mso-hide:all;''>
																		<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%'' style=''max-width:100%;''>
																			<tr>
																				<td align=''left'' class=''textContent''>
																					<div style=''font-family:Helvetica,Arial,sans-serif;font-size:13px;color:#828282;text-align:center;line-height:120%;''>
																						SOME - Sistema Operacional de Monitoreo Empresarial
																					</div>
																				</td>
																			</tr>
																		</table>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<table bgcolor=''#FFFFFF''  border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' id=''emailBody''>
							<tr>
								<td align=''center'' valign=''top''>
									<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%'' style=''color:#FFFFFF;'' bgcolor=''[vl_BGColor]''>
										<tr>
											<td align=''center'' valign=''top''>
												<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' class=''flexibleContainer''>
													<tr>
														<td align=''center'' valign=''top'' width=''500'' class=''flexibleContainerCell''>
															<table border=''0'' cellpadding=''30'' cellspacing=''0'' width=''100%''>
																<tr>
																	<td align=''center'' valign=''top'' class=''textContent''>
																		<!--<h2 style=''color:#92ebff;text-align:center;font-weight:normal;font-family:Helvetica,Arial,sans-serif;font-size:23px;margin-bottom:10px;line-height:135%;''>N°[Num] [Project]</h2>-->
																		<h1 style=''color:[vl_TitleColor];line-height:100%;font-family:Helvetica,Arial,sans-serif;font-size:35px;font-weight:normal;margin-bottom:5px;text-align:center;''>[accion]</h1>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>', N'<tr>
								<td align=''center'' valign=''top''>
									<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
										<tr>
											<td align=''center'' valign=''top''>
												<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' class=''flexibleContainer''>
													<tr>
														<td align=''center'' valign=''top'' width=''500'' class=''flexibleContainerCell''>
															<table class=''flexibleContainerCellDivider'' border=''0'' cellpadding=''30'' cellspacing=''0'' width=''100%''>
																<tr>
																	<td align=''center'' valign=''top'' style=''padding-top:0px;padding-bottom:0px;''>
																		<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
																			<tr>
																				<td align=''center'' valign=''top'' style=''border-top:1px solid #C8C8C8;''></td>
																			</tr>
																		</table>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<table bgcolor=''#E1E1E1'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' id=''emailFooter''>
							<tr>
								<td align=''center'' valign=''top''>
									<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
										<tr>
											<td align=''center'' valign=''top''>
												<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' class=''flexibleContainer''>
													<tr>
														<td align=''center'' valign=''top'' width=''500'' class=''flexibleContainerCell''>
															<table border=''0'' cellpadding=''30'' cellspacing=''0'' width=''100%''>
																<tr>
																	<td valign=''top'' bgcolor=''#E1E1E1''>

																		<div style=''font-family:Helvetica,Arial,sans-serif;font-size:13px;color:#828282;text-align:center;line-height:120%;''>
																			<div>[Date_Now]</div>
																			<div>Copyright &#169; 2021 reserved.</div>
																		</div>

																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</center>
	</body>
</html>
', N'Se realiza el rechazo del monitoreo N° [Num], el cual pasa a revisión por parte del [Cargo] ', N'www.google.com', CAST(N'2021-10-10T09:37:09.410' AS DateTime))
GO
INSERT [Configuracion].[Mensajes] ([Id], [TipoMensajeId], [CuerpoMensaje], [MaquetaMensaje_Head], [MaquetaMensaje_Fotter], [CuerpoMensaje_Interno], [Url], [FechaRegistro]) VALUES (10, 136, N'<tr>
								<td align=''center'' valign=''top''>
									<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
										<tr>
											<td align=''center'' valign=''top''>
												<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' class=''flexibleContainer''>
													<tr>
														<td align=''center'' valign=''top'' width=''500'' class=''flexibleContainerCell''>
															<table border=''0'' cellpadding=''30'' cellspacing=''0'' width=''100%''>
																<tr>
																	<td align=''center'' valign=''top''>

																		<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
																			<tr>
																				<td valign=''top'' class=''textContent''>
																					 <div style=''text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;margin-top:3px;color:#5F5F5F;line-height:135%;''>Hola, <strong>[User]</strong></div>
																					 <div style=''margin-bottom: 30px;''></div>      
																					 <div style=''text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;margin-top:3px;color:#5F5F5F;line-height:135%;''>El [CargoM] [UserAM] acaba de escalar el motitoreo N°[Num] para eliminar.</div>
																					 <div style=''margin-bottom: 30px;''></div>      
																					 <div style=''text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;margin-top:3px;color:#5F5F5F;line-height:135%;''>Por el concepto: [Rechazo]</div>
																					 <div style=''margin-bottom: 15px;''></div>
																					 <div style=''text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:15px;margin-bottom:0;margin-top:3px;color:#5F5F5F;line-height:135%;''>Para ingresar al sistema presione <b><a href=''[Url]'' target=''_blank''>Aqui</a></b> </div>
																				</td>
																			</tr>
																		</table>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>', N'<!DOCTYPE html PUBLIC ''-//W3C//DTD XHTML 1.0 Strict//EN'' ''http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd''>
	<html xmlns=''http://www.w3.org/1999/xhtml''>
	<head>
		<meta http-equiv=''Content-Type'' content=''text/html; charset=UTF-8'' />
		<meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
		<meta http-equiv=''X-UA-Compatible'' content=''IE=edge,chrome=1''>
		<meta name=''format-detection'' content=''telephone=no'' /> <!-- disable auto telephone linking in iOS -->
		<title>Respuesta del SOME</title>
		<style type=''text/css''>
			/* RESET STYLES */
			html { background-color:#E1E1E1; margin:0; padding:0; }
			body, #bodyTable, #bodyCell, #bodyCell{height:100% !important; margin:0; padding:0; width:100% !important;font-family:Helvetica, Arial, ''Lucida Grande'', sans-serif;}
			table{border-collapse:collapse;}
			table[id=bodyTable] {width:100%!important;margin:auto;max-width:500px!important;color:#7A7A7A;font-weight:normal;}
			img, a img{border:0; outline:none; text-decoration:none;height:auto; line-height:100%;}
			a {text-decoration:none !important;border-bottom: 1px solid;}
			h1, h2, h3, h4, h5, h6{color:#5F5F5F; font-weight:normal; font-family:Helvetica; font-size:20px; line-height:125%; text-align:Left; letter-spacing:normal;margin-top:0;margin-right:0;margin-bottom:10px;margin-left:0;padding-top:0;padding-bottom:0;padding-left:0;padding-right:0;}

			/* CLIENT-SPECIFIC STYLES */
			.ReadMsgBody{width:100%;} .ExternalClass{width:100%;} /* Force Hotmail/Outlook.com to display emails at full width. */
			.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div{line-height:100%;} /* Force Hotmail/Outlook.com to display line heights normally. */
			table, td{mso-table-lspace:0pt; mso-table-rspace:0pt;} /* Remove spacing between tables in Outlook 2007 and up. */
			#outlook a{padding:0;} /* Force Outlook 2007 and up to provide a ''view in browser'' message. */
			img{-ms-interpolation-mode: bicubic;display:block;outline:none; text-decoration:none;} /* Force IE to smoothly render resized images. */
			body, table, td, p, a, li, blockquote{-ms-text-size-adjust:100%; -webkit-text-size-adjust:100%; font-weight:normal!important;} /* Prevent Windows- and Webkit-based mobile platforms from changing declared text sizes. */
			.ExternalClass td[class=''ecxflexibleContainerBox''] h3 {padding-top: 10px !important;} /* Force hotmail to push 2-grid sub headers down */

			/* /\/\/\/\/\/\/\/\/ TEMPLATE STYLES /\/\/\/\/\/\/\/\/ */

			/* ========== Page Styles ========== */
			h1{display:block;font-size:26px;font-style:normal;font-weight:normal;line-height:100%;}
			h2{display:block;font-size:20px;font-style:normal;font-weight:normal;line-height:120%;}
			h3{display:block;font-size:17px;font-style:normal;font-weight:normal;line-height:110%;}
			h4{display:block;font-size:18px;font-style:italic;font-weight:normal;line-height:100%;}
			.flexibleImage{height:auto;}
			.linkRemoveBorder{border-bottom:0 !important;}
			table[class=flexibleContainerCellDivider] {padding-bottom:0 !important;padding-top:0 !important;}

			body, #bodyTable{background-color:#E1E1E1;}
			#emailHeader{background-color:#E1E1E1;}
			#emailBody{background-color:#FFFFFF;}
			#emailFooter{background-color:#E1E1E1;}
			.nestedContainer{background-color:#F8F8F8; border:1px solid #CCCCCC;}
			.emailButton{background-color:#205478; border-collapse:separate;}
			.buttonContent{color:#FFFFFF; font-family:Helvetica; font-size:18px; font-weight:bold; line-height:100%; padding:15px; text-align:center;}
			.buttonContent a{color:#FFFFFF; display:block; text-decoration:none!important; border:0!important;}
			.emailCalendar{background-color:#FFFFFF; border:1px solid #CCCCCC;}
			.emailCalendarMonth{background-color:#205478; color:#FFFFFF; font-family:Helvetica, Arial, sans-serif; font-size:16px; font-weight:bold; padding-top:10px; padding-bottom:10px; text-align:center;}
			.emailCalendarDay{color:#205478; font-family:Helvetica, Arial, sans-serif; font-size:60px; font-weight:bold; line-height:100%; padding-top:20px; padding-bottom:20px; text-align:center;}
			.imageContentText {margin-top: 10px;line-height:0;}
			.imageContentText a {line-height:0;}
			#invisibleIntroduction {display:none !important;} /* Removing the introduction text from the view */

			/*FRAMEWORK HACKS & OVERRIDES */
			span[class=ios-color-hack] a {color:#275100!important;text-decoration:none!important;} /* Remove all link colors in IOS (below are duplicates based on the color preference) */
			span[class=ios-color-hack2] a {color:#205478!important;text-decoration:none!important;}
			span[class=ios-color-hack3] a {color:#8B8B8B!important;text-decoration:none!important;}
			/* A nice and clean way to target phone numbers you want clickable and avoid a mobile phone from linking other numbers that look like, but are not phone numbers.  Use these two blocks of code to ''unstyle'' any numbers that may be linked.  The second block gives you a class to apply with a span tag to the numbers you would like linked and styled.
			Inspired by Campaign Monitor''s article on using phone numbers in email: http://www.campaignmonitor.com/blog/post/3571/using-phone-numbers-in-html-email/.
			*/
			.a[href^=''tel''], a[href^=''sms''] {text-decoration:none!important;color:#606060!important;pointer-events:none!important;cursor:default!important;}
			.mobile_link a[href^=''tel''], .mobile_link a[href^=''sms''] {text-decoration:none!important;color:#606060!important;pointer-events:auto!important;cursor:default!important;}


			/* MOBILE STYLES */
			@media only screen and (max-width: 480px){
				/*////// CLIENT-SPECIFIC STYLES //////*/
				body{width:100% !important; min-width:100% !important;} /* Force iOS Mail to render the email at full width. */

				/* FRAMEWORK STYLES */
				/*
				CSS selectors are written in attribute
				selector format to prevent Yahoo Mail
				from rendering media query styles on
				desktop.
				*/
				/*td[class=''textContent''], td[class=''flexibleContainerCell''] { width: 100%; padding-left: 10px !important; padding-right: 10px !important; }*/
				table[id=''emailHeader''],
				table[id=''emailBody''],
				table[id=''emailFooter''],
				table[class=''flexibleContainer''],
				td[class=''flexibleContainerCell''] {width:100% !important;}
				td[class=''flexibleContainerBox''], td[class=''flexibleContainerBox''] table {display: block;width: 100%;text-align: left;}
				/*
				The following style rule makes any
				image classed with ''flexibleImage''
				fluid when the query activates.
				Make sure you add an inline max-width
				to those images to prevent them
				from blowing out.
				*/
				td[class=''imageContent''] img {height:auto !important; width:100% !important; max-width:100% !important; }
				img[class=''flexibleImage'']{height:auto !important; width:100% !important;max-width:100% !important;}
				img[class=''flexibleImageSmall'']{height:auto !important; width:auto !important;}


				/*
				Create top space for every second element in a block
				*/
				table[class=''flexibleContainerBoxNext'']{padding-top: 10px !important;}

				/*
				Make buttons in the email span the
				full width of their container, allowing
				for left- or right-handed ease of use.
				*/
				table[class=''emailButton'']{width:100% !important;}
				td[class=''buttonContent'']{padding:0 !important;}
				td[class=''buttonContent''] a{padding:15px !important;}

			}

			/*  CONDITIONS FOR ANDROID DEVICES ONLY
			*   http://developer.android.com/guide/webapps/targeting.html
			*   http://pugetworks.com/2011/04/css-media-queries-for-targeting-different-mobile-devices/ ;
			=====================================================*/

			@media only screen and (-webkit-device-pixel-ratio:.75){
				/* Put CSS for low density (ldpi) Android layouts in here */
			}

			@media only screen and (-webkit-device-pixel-ratio:1){
				/* Put CSS for medium density (mdpi) Android layouts in here */
			}

			@media only screen and (-webkit-device-pixel-ratio:1.5){
				/* Put CSS for high density (hdpi) Android layouts in here */
			}
			/* end Android targeting */

			/* CONDITIONS FOR IOS DEVICES ONLY
			=====================================================*/
			@media only screen and (min-device-width : 320px) and (max-device-width:568px) {

			}
			/* end IOS targeting */
		</style>
		<!--
			Outlook Conditional CSS

			These two style blocks target Outlook 2007 & 2010 specifically, forcing
			columns into a single vertical stack as on mobile clients. This is
			primarily done to avoid the ''page break bug'' and is optional.

			More information here:
			http://templates.mailchimp.com/development/css/outlook-conditional-css
		-->
		<!--[if mso 12]>
			<style type=''text/css''>
				.flexibleContainer{display:block !important; width:100% !important;}
			</style>
		<![endif]-->
		<!--[if mso 14]>
			<style type=''text/css''>
				.flexibleContainer{display:block !important; width:100% !important;}
			</style>
		<![endif]-->
	</head>
	<body bgcolor=''#E1E1E1'' leftmargin=''0'' marginwidth=''0'' topmargin=''0'' marginheight=''0'' offset=''0''>

		<center style=''background-color:#E1E1E1;''>
			<table border=''0'' cellpadding=''0'' cellspacing=''0'' height=''100%'' width=''100%'' id=''bodyTable'' style=''table-layout: fixed;max-width:100% !important;width: 100% !important;min-width: 100% !important;''>
				<tr>
					<td align=''center'' valign=''top'' id=''bodyCell''>
						<table bgcolor=''#E1E1E1'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' id=''emailHeader''>
							<tr>
								<td align=''center'' valign=''top''>
									<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
										<tr>
											<td align=''center'' valign=''top''>
												<table border=''0'' cellpadding=''10'' cellspacing=''0'' width=''500'' class=''flexibleContainer''>
													<tr>
														<td valign=''top'' width=''500'' class=''flexibleContainerCell''>
															<table align=''left'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
																<tr>
																	<td align=''left'' valign=''middle'' id=''invisibleIntroduction'' class=''flexibleContainerBox'' style=''display:none !important; mso-hide:all;''>
																		<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%'' style=''max-width:100%;''>
																			<tr>
																				<td align=''left'' class=''textContent''>
																					<div style=''font-family:Helvetica,Arial,sans-serif;font-size:13px;color:#828282;text-align:center;line-height:120%;''>
																						SOME - Sistema Operacional de Monitoreo Empresarial
																					</div>
																				</td>
																			</tr>
																		</table>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<table bgcolor=''#FFFFFF''  border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' id=''emailBody''>
							<tr>
								<td align=''center'' valign=''top''>
									<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%'' style=''color:#FFFFFF;'' bgcolor=''[vl_BGColor]''>
										<tr>
											<td align=''center'' valign=''top''>
												<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' class=''flexibleContainer''>
													<tr>
														<td align=''center'' valign=''top'' width=''500'' class=''flexibleContainerCell''>
															<table border=''0'' cellpadding=''30'' cellspacing=''0'' width=''100%''>
																<tr>
																	<td align=''center'' valign=''top'' class=''textContent''>
																		<!--<h2 style=''color:#92ebff;text-align:center;font-weight:normal;font-family:Helvetica,Arial,sans-serif;font-size:23px;margin-bottom:10px;line-height:135%;''>N°[Num] [Project]</h2>-->
																		<h1 style=''color:[vl_TitleColor];line-height:100%;font-family:Helvetica,Arial,sans-serif;font-size:35px;font-weight:normal;margin-bottom:5px;text-align:center;''>[accion]</h1>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>', N'<tr>
								<td align=''center'' valign=''top''>
									<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
										<tr>
											<td align=''center'' valign=''top''>
												<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' class=''flexibleContainer''>
													<tr>
														<td align=''center'' valign=''top'' width=''500'' class=''flexibleContainerCell''>
															<table class=''flexibleContainerCellDivider'' border=''0'' cellpadding=''30'' cellspacing=''0'' width=''100%''>
																<tr>
																	<td align=''center'' valign=''top'' style=''padding-top:0px;padding-bottom:0px;''>
																		<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
																			<tr>
																				<td align=''center'' valign=''top'' style=''border-top:1px solid #C8C8C8;''></td>
																			</tr>
																		</table>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<table bgcolor=''#E1E1E1'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' id=''emailFooter''>
							<tr>
								<td align=''center'' valign=''top''>
									<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>
										<tr>
											<td align=''center'' valign=''top''>
												<table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''500'' class=''flexibleContainer''>
													<tr>
														<td align=''center'' valign=''top'' width=''500'' class=''flexibleContainerCell''>
															<table border=''0'' cellpadding=''30'' cellspacing=''0'' width=''100%''>
																<tr>
																	<td valign=''top'' bgcolor=''#E1E1E1''>

																		<div style=''font-family:Helvetica,Arial,sans-serif;font-size:13px;color:#828282;text-align:center;line-height:120%;''>
																			<div>[Date_Now]</div>
																			<div>Copyright &#169; 2021 reserved.</div>
																		</div>

																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</center>
	</body>
</html>
', N'Se realiza el escalamiento del monitoreo N° [Num], para la eliminación por parte del [Cargo] ', N'www.google.com', CAST(N'2021-10-10T11:14:34.930' AS DateTime))
GO
SET IDENTITY_INSERT [Configuracion].[Mensajes] OFF
GO
SET IDENTITY_INSERT [Configuracion].[Tabla] ON 
GO
INSERT [Configuracion].[Tabla] ([Id], [Nombre], [Activo], [FechaRegistro]) VALUES (1, N'Roles Procesos', 1, CAST(N'2021-05-25T21:01:31.653' AS DateTime))
GO
INSERT [Configuracion].[Tabla] ([Id], [Nombre], [Activo], [FechaRegistro]) VALUES (2, N'Frecuencia Monitoreo', 2, CAST(N'2021-05-25T21:07:35.750' AS DateTime))
GO
INSERT [Configuracion].[Tabla] ([Id], [Nombre], [Activo], [FechaRegistro]) VALUES (3, N'Tipo Cargues', 1, CAST(N'2021-05-31T23:04:46.757' AS DateTime))
GO
INSERT [Configuracion].[Tabla] ([Id], [Nombre], [Activo], [FechaRegistro]) VALUES (4, N'Tipo Mensajes', 1, CAST(N'2021-06-05T00:29:57.157' AS DateTime))
GO
INSERT [Configuracion].[Tabla] ([Id], [Nombre], [Activo], [FechaRegistro]) VALUES (5, N'Pregunta Empresas', 2, CAST(N'2021-06-10T10:16:21.577' AS DateTime))
GO
INSERT [Configuracion].[Tabla] ([Id], [Nombre], [Activo], [FechaRegistro]) VALUES (6, N'Tipo Cambio Password', 1, CAST(N'2021-06-21T12:58:53.350' AS DateTime))
GO
INSERT [Configuracion].[Tabla] ([Id], [Nombre], [Activo], [FechaRegistro]) VALUES (7, N'Lista Colores', 2, CAST(N'2021-06-24T23:16:00.093' AS DateTime))
GO
INSERT [Configuracion].[Tabla] ([Id], [Nombre], [Activo], [FechaRegistro]) VALUES (8, N'Procesos de Cuenta', 1, CAST(N'2021-06-29T17:43:02.990' AS DateTime))
GO
INSERT [Configuracion].[Tabla] ([Id], [Nombre], [Activo], [FechaRegistro]) VALUES (9, N'Tipos de Monitoreos', 2, CAST(N'2021-06-30T10:47:29.747' AS DateTime))
GO
INSERT [Configuracion].[Tabla] ([Id], [Nombre], [Activo], [FechaRegistro]) VALUES (10, N'Tipo Menu', 1, CAST(N'2021-07-02T09:36:33.710' AS DateTime))
GO
INSERT [Configuracion].[Tabla] ([Id], [Nombre], [Activo], [FechaRegistro]) VALUES (11, N'Tipo Error', 2, CAST(N'2021-07-12T16:07:36.010' AS DateTime))
GO
INSERT [Configuracion].[Tabla] ([Id], [Nombre], [Activo], [FechaRegistro]) VALUES (12, N'Estado Monitoreo', 1, CAST(N'2021-09-13T23:07:26.933' AS DateTime))
GO
INSERT [Configuracion].[Tabla] ([Id], [Nombre], [Activo], [FechaRegistro]) VALUES (13, N'Modulos', 1, CAST(N'2021-10-03T23:47:37.613' AS DateTime))
GO
SET IDENTITY_INSERT [Configuracion].[Tabla] OFF
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, N'ATENCIÓN', N'Aplicación de protocolos', N'El asesor no hace uso apropiado de los guiones establecidos.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, NULL, N'El asesor no personaliza o lo hace de manera errada.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, N'Lenguaje adecuado y claridad en la exposición del mensaje', N'El asesor muestra inseguridad al brindar la información.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, NULL, N'Utiliza muletillas, frases coloquiales y/o tutea.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, NULL, N'Utiliza tecnicismos.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, NULL, N'Utiliza expresiones gramaticales incorrectas.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, NULL, N'El tono de la voz no es el adecuado.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, NULL, N'El ritmo de voz no es adecuado.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, NULL, N'No maneja adecuadamente la dicción.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, NULL, N'No expone sus ideas de manera organizada. No es coherente en su comunicación.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, N'Realiza escucha activa', N'En los silencios prolongados el asesor no acompaña al cliente a través de expresiones de retroalimentación.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, NULL, N'Vuelve a preguntar información ya suministrada  por el cliente.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, N'Manejo adecuado de la llamada', N'El asesor interrumpe al cliente.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, NULL, N'Culpa la gestión de un contacto anterior cuando en éste se ha realizado un procedimiento errado.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, NULL, N'No maneja adecuadamente al cliente que propicia alargue innecesario de la llamada.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, N'Atención de la llamada ', N'El asesor no contesta la llamada induciendo a que el cliente cuelgue. ', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, NULL, N'El asesor no retoma la conversación en los tiempos de espera acordados, ocasionando que el cliente abandone la llamada.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, NULL, N'El asesor cuelga la llamada.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, N'Actitud de servicio y amabilidad ', N'No realiza manejo adecuado de un cliente difícil.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, NULL, N'Solicita información al cliente y no utiliza frases de cortesía.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, NULL, N'Demuestra desinterés al atender los requerimientos del cliente.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, NULL, N'El asesor se comporta imperativo, manifestando imposición con el cliente.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, NULL, N'El asesor utiliza expresiones ofensivas hacia el cliente. ', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, NULL, N'Se muestra intolerante e impaciente con el cliente.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, N'Manejo de tiempos de espera ', N'El asesor recibe la llamada utilizando inmediatamente el hold.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, NULL, N'El asesor no contesta inmediatamente ingresa la llamada.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, NULL, N'No le informa al cliente el tiempo de espera en minutos.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, NULL, N'No retoma la llamada dentro del tiempo solicitado.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, NULL, N'El asesor no maneja la espera con el cliente por medio de hold. ', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, NULL, N'Se presentan tiempos muertos o silencios durante la llamada superiores a 10 seg.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, NULL, N'La duración de los tiempos de espera son inadecuados con relación al motivo de consulta.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, NULL, N'No agradece el tiempo de espera al retomar la llamada.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, N'PROCESO -AFECTACIÓN A USUARIO FINAL', N'Identificación del cliente y de la llamada ', N'No solicita la información necesaria ni utiliza las opciones de búsqueda disponibles para ubicar al cliente en el sistema.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, NULL, N'No confirma la información del cliente en el sistema para validar que se está haciendo la gestión en el servicio correspondiente.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, NULL, N'No suministra el número de consulta y/o lo indica de manera errada.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, N'Información brindada al cliente', N'No suministra información correcta y/o completa, de acuerdo al caso planteado, teniendo en cuenta lo establecido en los procedimientos y/o en los aplicativos de consulta.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, NULL, N'No resuelve todos los requerimientos del cliente antes de transferir la llamada.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, N'PROCESO - AFECTACIÓN A NEGOCIO', N'Aplicación correcta del proceso establecido por negocio', N'Realiza incorrectamente las validaciones establecidas en los procedimientos.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, NULL, N'No agota todas las validaciones posibles con el cliente antes de crear un aviso de ayuda.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, NULL, N'Realiza incorrectamente las actuaciones establecidas en los procedimientos, incluyendo utilización de aplicativos.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, NULL, N'En el caso de existir una persona posiblemente afectada en la red, el asesor crea el aviso pero no registra correctamente el caso en SINAC.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, NULL, N'La transferencia realizada por el asesor no es acorde con los lineamientos establecidos.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, N'Escala el caso al área correspondiente', N'No escala el caso cuando lo amerita o lo realiza de manera incorrecta.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, NULL, N'Escala el caso innecesariamente pudiendo solucionar en primer contacto.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, N'Codificación', N'El asesor no codifica la llamada o lo realiza de manera errada.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, NULL, N'Registra las observaciones de forma incompleta e incorrecta, en el aplicativo correspondiente, según lo establecido.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, NULL, N'La ortografía de la información digitada en los aplicativos es incorrecta.', NULL)
GO
INSERT [Configuracion].[Temp_CargaForm] ([Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4]) VALUES (NULL, NULL, NULL, N'La redacción de la información digitada en los aplicativos es incorrecta.', NULL)
GO
INSERT [Configuracion].[Temp_CargaMasivaUsers] ([Nombre], [Apellido], [Documento], [Correo], [Gestionable]) VALUES (N'martha karin', N'donoso yepes', N'12345678916', N'neogermax@gmail.com', N's')
GO
SET IDENTITY_INSERT [Proceso].[BloqueEvaluacion] ON 
GO
INSERT [Proceso].[BloqueEvaluacion] ([Id], [FormularioId], [CargoId], [Descripcion], [Peso], [PesoCargo], [Estado], [FechaRegistro]) VALUES (80, 18, 0, N'ATENCIÓN', N'30', N'0', 1, CAST(N'2021-08-26T20:32:49.470' AS DateTime))
GO
INSERT [Proceso].[BloqueEvaluacion] ([Id], [FormularioId], [CargoId], [Descripcion], [Peso], [PesoCargo], [Estado], [FechaRegistro]) VALUES (81, 18, 0, N'PROCESO -AFECTACIÓN A USUARIO FINAL', N'30', N'0', 1, CAST(N'2021-08-26T20:32:49.507' AS DateTime))
GO
INSERT [Proceso].[BloqueEvaluacion] ([Id], [FormularioId], [CargoId], [Descripcion], [Peso], [PesoCargo], [Estado], [FechaRegistro]) VALUES (82, 18, 0, N'PROCESO - AFECTACIÓN A NEGOCIO', N'40', N'0', 1, CAST(N'2021-08-26T20:32:49.510' AS DateTime))
GO
INSERT [Proceso].[BloqueEvaluacion] ([Id], [FormularioId], [CargoId], [Descripcion], [Peso], [PesoCargo], [Estado], [FechaRegistro]) VALUES (10083, 10019, 0, N'ATENCIÓN', N'30', N'0', 1, CAST(N'2021-11-03T23:02:11.890' AS DateTime))
GO
INSERT [Proceso].[BloqueEvaluacion] ([Id], [FormularioId], [CargoId], [Descripcion], [Peso], [PesoCargo], [Estado], [FechaRegistro]) VALUES (10084, 10019, 0, N'PROCESO -AFECTACIÓN A USUARIO FINAL', N'30', N'0', 1, CAST(N'2021-11-03T23:02:11.913' AS DateTime))
GO
INSERT [Proceso].[BloqueEvaluacion] ([Id], [FormularioId], [CargoId], [Descripcion], [Peso], [PesoCargo], [Estado], [FechaRegistro]) VALUES (10085, 10019, 0, N'PROCESO - AFECTACIÓN A NEGOCIO', N'40', N'0', 1, CAST(N'2021-11-03T23:02:11.917' AS DateTime))
GO
SET IDENTITY_INSERT [Proceso].[BloqueEvaluacion] OFF
GO
SET IDENTITY_INSERT [Proceso].[Campana] ON 
GO
INSERT [Proceso].[Campana] ([Id], [ClienteId], [Nombre], [CantidadMonitoreos], [FrecuenciaMonitoreoId], [CoordinadorMonitorea], [Estado], [FechaRegistro]) VALUES (1, 1, N'PRINCIPAL', 7, 8, 0, 1, CAST(N'2021-05-16T23:43:06.283' AS DateTime))
GO
INSERT [Proceso].[Campana] ([Id], [ClienteId], [Nombre], [CantidadMonitoreos], [FrecuenciaMonitoreoId], [CoordinadorMonitorea], [Estado], [FechaRegistro]) VALUES (2, 2, N'AIRE', 2, 7, 0, 1, CAST(N'2021-05-26T12:49:56.133' AS DateTime))
GO
INSERT [Proceso].[Campana] ([Id], [ClienteId], [Nombre], [CantidadMonitoreos], [FrecuenciaMonitoreoId], [CoordinadorMonitorea], [Estado], [FechaRegistro]) VALUES (3, 3, N'AFINIA', 3, 7, 1, 1, CAST(N'2021-07-16T21:36:02.990' AS DateTime))
GO
INSERT [Proceso].[Campana] ([Id], [ClienteId], [Nombre], [CantidadMonitoreos], [FrecuenciaMonitoreoId], [CoordinadorMonitorea], [Estado], [FechaRegistro]) VALUES (4, 4, N'DESARROLLO', 2, 7, 0, 1, CAST(N'2021-10-24T21:55:10.950' AS DateTime))
GO
SET IDENTITY_INSERT [Proceso].[Campana] OFF
GO
SET IDENTITY_INSERT [Proceso].[Cliente] ON 
GO
INSERT [Proceso].[Cliente] ([Id], [Nombre], [Nit], [Estado], [FechaRegistro]) VALUES (1, N'QA VISION', N'123456789', 1, CAST(N'2021-05-25T21:17:00.700' AS DateTime))
GO
INSERT [Proceso].[Cliente] ([Id], [Nombre], [Nit], [Estado], [FechaRegistro]) VALUES (2, N'AIRE', N'32323232', 1, CAST(N'2021-05-25T23:16:41.657' AS DateTime))
GO
INSERT [Proceso].[Cliente] ([Id], [Nombre], [Nit], [Estado], [FechaRegistro]) VALUES (3, N'AFINIA', N'43043034030', 1, CAST(N'2021-07-16T21:18:26.540' AS DateTime))
GO
INSERT [Proceso].[Cliente] ([Id], [Nombre], [Nit], [Estado], [FechaRegistro]) VALUES (4, N'GT SOFT', N'798842497', 1, CAST(N'2021-10-24T21:50:33.593' AS DateTime))
GO
SET IDENTITY_INSERT [Proceso].[Cliente] OFF
GO
SET IDENTITY_INSERT [Proceso].[ControlCargue] ON 
GO
INSERT [Proceso].[ControlCargue] ([Id], [TipoCargueId], [CampanaId], [UsuarioId], [CantidadRegistros], [CantidadRegistrosCreados], [CantidadRegistrosActualizados], [CantidadRegistros_NoInsertados], [FechaRegistro]) VALUES (1, 10, 1, 1, 4, 4, 0, 0, CAST(N'2021-07-17T13:30:21.807' AS DateTime))
GO
INSERT [Proceso].[ControlCargue] ([Id], [TipoCargueId], [CampanaId], [UsuarioId], [CantidadRegistros], [CantidadRegistrosCreados], [CantidadRegistrosActualizados], [CantidadRegistros_NoInsertados], [FechaRegistro]) VALUES (2, 123, 1, 1, 48, 63, 0, 0, CAST(N'2021-07-26T20:42:21.677' AS DateTime))
GO
INSERT [Proceso].[ControlCargue] ([Id], [TipoCargueId], [CampanaId], [UsuarioId], [CantidadRegistros], [CantidadRegistrosCreados], [CantidadRegistrosActualizados], [CantidadRegistros_NoInsertados], [FechaRegistro]) VALUES (3, 123, 1, 1, 0, 0, 0, 0, CAST(N'2021-07-26T20:43:37.440' AS DateTime))
GO
INSERT [Proceso].[ControlCargue] ([Id], [TipoCargueId], [CampanaId], [UsuarioId], [CantidadRegistros], [CantidadRegistrosCreados], [CantidadRegistrosActualizados], [CantidadRegistros_NoInsertados], [FechaRegistro]) VALUES (4, 123, 1, 1, 62, 98, 0, 0, CAST(N'2021-07-26T20:49:00.293' AS DateTime))
GO
INSERT [Proceso].[ControlCargue] ([Id], [TipoCargueId], [CampanaId], [UsuarioId], [CantidadRegistros], [CantidadRegistrosCreados], [CantidadRegistrosActualizados], [CantidadRegistros_NoInsertados], [FechaRegistro]) VALUES (5, 123, 1, 1, 62, 98, 0, 0, CAST(N'2021-07-26T20:54:33.990' AS DateTime))
GO
INSERT [Proceso].[ControlCargue] ([Id], [TipoCargueId], [CampanaId], [UsuarioId], [CantidadRegistros], [CantidadRegistrosCreados], [CantidadRegistrosActualizados], [CantidadRegistros_NoInsertados], [FechaRegistro]) VALUES (6, 123, 1, 1, 48, 63, 0, 0, CAST(N'2021-08-03T19:15:53.097' AS DateTime))
GO
INSERT [Proceso].[ControlCargue] ([Id], [TipoCargueId], [CampanaId], [UsuarioId], [CantidadRegistros], [CantidadRegistrosCreados], [CantidadRegistrosActualizados], [CantidadRegistros_NoInsertados], [FechaRegistro]) VALUES (7, 123, 1, 1, 62, 98, 0, 0, CAST(N'2021-08-14T19:43:42.800' AS DateTime))
GO
INSERT [Proceso].[ControlCargue] ([Id], [TipoCargueId], [CampanaId], [UsuarioId], [CantidadRegistros], [CantidadRegistrosCreados], [CantidadRegistrosActualizados], [CantidadRegistros_NoInsertados], [FechaRegistro]) VALUES (8, 123, 1, 1, 48, 63, 0, 0, CAST(N'2021-08-14T19:46:14.920' AS DateTime))
GO
INSERT [Proceso].[ControlCargue] ([Id], [TipoCargueId], [CampanaId], [UsuarioId], [CantidadRegistros], [CantidadRegistrosCreados], [CantidadRegistrosActualizados], [CantidadRegistros_NoInsertados], [FechaRegistro]) VALUES (9, 10, 2, 1, 7, 6, 1, 0, CAST(N'2021-10-20T21:07:08.907' AS DateTime))
GO
INSERT [Proceso].[ControlCargue] ([Id], [TipoCargueId], [CampanaId], [UsuarioId], [CantidadRegistros], [CantidadRegistrosCreados], [CantidadRegistrosActualizados], [CantidadRegistros_NoInsertados], [FechaRegistro]) VALUES (10, 10, 2, 1, 2, 2, 0, 0, CAST(N'2021-10-20T21:18:57.950' AS DateTime))
GO
INSERT [Proceso].[ControlCargue] ([Id], [TipoCargueId], [CampanaId], [UsuarioId], [CantidadRegistros], [CantidadRegistrosCreados], [CantidadRegistrosActualizados], [CantidadRegistros_NoInsertados], [FechaRegistro]) VALUES (11, 10, 2, 1, 1, 1, 0, 0, CAST(N'2021-10-20T21:35:46.737' AS DateTime))
GO
SET IDENTITY_INSERT [Proceso].[ControlCargue] OFF
GO
SET IDENTITY_INSERT [Proceso].[Formulacion_Config_Monitoreo] ON 
GO
INSERT [Proceso].[Formulacion_Config_Monitoreo] ([Id], [FormularioId], [Ope_Nivel_0], [Ope_Nivel_1], [VariosOperadores], [Ope_Nivel_2], [Ope_Nivel_3], [Ope_Nivel_4], [OpcCumple], [OpcNoCumple], [OpcNoAplica], [NoAplicaPeso], [MonitoreoXDefecto], [AplicaErrorCritico], [FechaRegistro]) VALUES (10010, 18, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, N'NC', 1, CAST(N'2021-08-26T20:32:49.707' AS DateTime))
GO
INSERT [Proceso].[Formulacion_Config_Monitoreo] ([Id], [FormularioId], [Ope_Nivel_0], [Ope_Nivel_1], [VariosOperadores], [Ope_Nivel_2], [Ope_Nivel_3], [Ope_Nivel_4], [OpcCumple], [OpcNoCumple], [OpcNoAplica], [NoAplicaPeso], [MonitoreoXDefecto], [AplicaErrorCritico], [FechaRegistro]) VALUES (20011, 10019, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, N'C', 1, CAST(N'2021-11-03T23:02:12.120' AS DateTime))
GO
SET IDENTITY_INSERT [Proceso].[Formulacion_Config_Monitoreo] OFF
GO
SET IDENTITY_INSERT [Proceso].[Formulario] ON 
GO
INSERT [Proceso].[Formulario] ([Id], [CampanaId], [Descripcion], [ValorMaximoEvaluar], [Estado], [Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4], [ErrorCriticoNivel], [PesoPonderadoNivel], [FechaRegistro]) VALUES (18, 1, N'por defecto no cumple', 100, 3, 0, 3, 12, 48, 0, 2, 2, CAST(N'2021-08-26T20:32:49.197' AS DateTime))
GO
INSERT [Proceso].[Formulario] ([Id], [CampanaId], [Descripcion], [ValorMaximoEvaluar], [Estado], [Nivel_0], [Nivel_1], [Nivel_2], [Nivel_3], [Nivel_4], [ErrorCriticoNivel], [PesoPonderadoNivel], [FechaRegistro]) VALUES (10019, 1, N'por defecto cumple', 100, 2, 0, 3, 12, 48, 0, 2, 2, CAST(N'2021-11-03T23:02:11.783' AS DateTime))
GO
SET IDENTITY_INSERT [Proceso].[Formulario] OFF
GO
SET IDENTITY_INSERT [Proceso].[GrupoTrabajo] ON 
GO
INSERT [Proceso].[GrupoTrabajo] ([Id], [CampanaId], [CoordinadorId], [UsuarioId], [ValueRolId]) VALUES (1, 1, 1, 1, 1)
GO
INSERT [Proceso].[GrupoTrabajo] ([Id], [CampanaId], [CoordinadorId], [UsuarioId], [ValueRolId]) VALUES (2, 1, 2, 2, 1)
GO
INSERT [Proceso].[GrupoTrabajo] ([Id], [CampanaId], [CoordinadorId], [UsuarioId], [ValueRolId]) VALUES (3, 1, 3, 3, 2)
GO
INSERT [Proceso].[GrupoTrabajo] ([Id], [CampanaId], [CoordinadorId], [UsuarioId], [ValueRolId]) VALUES (4, 1, 8, 4, 5)
GO
INSERT [Proceso].[GrupoTrabajo] ([Id], [CampanaId], [CoordinadorId], [UsuarioId], [ValueRolId]) VALUES (5, 1, 8, 5, 5)
GO
INSERT [Proceso].[GrupoTrabajo] ([Id], [CampanaId], [CoordinadorId], [UsuarioId], [ValueRolId]) VALUES (6, 1, 11, 6, 5)
GO
INSERT [Proceso].[GrupoTrabajo] ([Id], [CampanaId], [CoordinadorId], [UsuarioId], [ValueRolId]) VALUES (7, 1, 11, 7, 5)
GO
INSERT [Proceso].[GrupoTrabajo] ([Id], [CampanaId], [CoordinadorId], [UsuarioId], [ValueRolId]) VALUES (8, 1, 8, 8, 4)
GO
INSERT [Proceso].[GrupoTrabajo] ([Id], [CampanaId], [CoordinadorId], [UsuarioId], [ValueRolId]) VALUES (9, 1, 9, 9, 6)
GO
INSERT [Proceso].[GrupoTrabajo] ([Id], [CampanaId], [CoordinadorId], [UsuarioId], [ValueRolId]) VALUES (10, 1, 11, 10, 5)
GO
INSERT [Proceso].[GrupoTrabajo] ([Id], [CampanaId], [CoordinadorId], [UsuarioId], [ValueRolId]) VALUES (11, 1, 11, 11, 4)
GO
INSERT [Proceso].[GrupoTrabajo] ([Id], [CampanaId], [CoordinadorId], [UsuarioId], [ValueRolId]) VALUES (12, 1, 11, 12, 5)
GO
INSERT [Proceso].[GrupoTrabajo] ([Id], [CampanaId], [CoordinadorId], [UsuarioId], [ValueRolId]) VALUES (13, 2, 13, 13, 5)
GO
INSERT [Proceso].[GrupoTrabajo] ([Id], [CampanaId], [CoordinadorId], [UsuarioId], [ValueRolId]) VALUES (14, 2, 14, 14, 5)
GO
INSERT [Proceso].[GrupoTrabajo] ([Id], [CampanaId], [CoordinadorId], [UsuarioId], [ValueRolId]) VALUES (15, 2, 15, 15, 5)
GO
INSERT [Proceso].[GrupoTrabajo] ([Id], [CampanaId], [CoordinadorId], [UsuarioId], [ValueRolId]) VALUES (16, 2, 16, 16, 5)
GO
INSERT [Proceso].[GrupoTrabajo] ([Id], [CampanaId], [CoordinadorId], [UsuarioId], [ValueRolId]) VALUES (17, 2, 17, 17, 5)
GO
INSERT [Proceso].[GrupoTrabajo] ([Id], [CampanaId], [CoordinadorId], [UsuarioId], [ValueRolId]) VALUES (18, 2, 18, 18, 5)
GO
INSERT [Proceso].[GrupoTrabajo] ([Id], [CampanaId], [CoordinadorId], [UsuarioId], [ValueRolId]) VALUES (19, 2, 19, 19, 5)
GO
INSERT [Proceso].[GrupoTrabajo] ([Id], [CampanaId], [CoordinadorId], [UsuarioId], [ValueRolId]) VALUES (20, 2, 20, 20, 5)
GO
INSERT [Proceso].[GrupoTrabajo] ([Id], [CampanaId], [CoordinadorId], [UsuarioId], [ValueRolId]) VALUES (21, 2, 21, 21, 5)
GO
INSERT [Proceso].[GrupoTrabajo] ([Id], [CampanaId], [CoordinadorId], [UsuarioId], [ValueRolId]) VALUES (22, 1, 11, 22, 5)
GO
INSERT [Proceso].[GrupoTrabajo] ([Id], [CampanaId], [CoordinadorId], [UsuarioId], [ValueRolId]) VALUES (23, 1, 23, 23, 3)
GO
SET IDENTITY_INSERT [Proceso].[GrupoTrabajo] OFF
GO
SET IDENTITY_INSERT [Proceso].[Monitoreo] ON 
GO
INSERT [Proceso].[Monitoreo] ([Id], [FormularioId], [AgenteId], [CoordinadorId], [MonitorId], [EscaladoId], [TipoProcesoId], [TipoMonitoreoId], [IdTransaccion], [FechaTransaccion], [NotaFinal], [NotaPEC], [NotaPECUF], [NotaPECN], [NotaPECC], [EstadoId], [FechaRegistro]) VALUES (1, 18, 5, 8, 6, 0, 121, 115, N'545423456WD', CAST(N'2021-09-02' AS Date), N'92.2', 100, 100, 100, 100, 129, CAST(N'2021-09-13T22:27:20.940' AS DateTime))
GO
INSERT [Proceso].[Monitoreo] ([Id], [FormularioId], [AgenteId], [CoordinadorId], [MonitorId], [EscaladoId], [TipoProcesoId], [TipoMonitoreoId], [IdTransaccion], [FechaTransaccion], [NotaFinal], [NotaPEC], [NotaPECUF], [NotaPECN], [NotaPECC], [EstadoId], [FechaRegistro]) VALUES (3, 18, 7, 8, 6, 0, 121, 114, N'0454545', CAST(N'2021-09-16' AS Date), N'87.4', 0, 100, 100, 0, 127, CAST(N'2021-09-24T22:35:16.570' AS DateTime))
GO
INSERT [Proceso].[Monitoreo] ([Id], [FormularioId], [AgenteId], [CoordinadorId], [MonitorId], [EscaladoId], [TipoProcesoId], [TipoMonitoreoId], [IdTransaccion], [FechaTransaccion], [NotaFinal], [NotaPEC], [NotaPECUF], [NotaPECN], [NotaPECC], [EstadoId], [FechaRegistro]) VALUES (4, 18, 4, 8, 6, 0, 122, 115, N'we40559', CAST(N'2021-09-15' AS Date), N'81.0', 100, 100, 100, 100, 125, CAST(N'2021-09-28T21:13:59.203' AS DateTime))
GO
INSERT [Proceso].[Monitoreo] ([Id], [FormularioId], [AgenteId], [CoordinadorId], [MonitorId], [EscaladoId], [TipoProcesoId], [TipoMonitoreoId], [IdTransaccion], [FechaTransaccion], [NotaFinal], [NotaPEC], [NotaPECUF], [NotaPECN], [NotaPECC], [EstadoId], [FechaRegistro]) VALUES (5, 18, 5, 8, 6, 0, 122, 114, N'ASD121213', CAST(N'2021-09-15' AS Date), N'99.8', 100, 100, 100, 100, 127, CAST(N'2021-09-29T23:26:19.830' AS DateTime))
GO
INSERT [Proceso].[Monitoreo] ([Id], [FormularioId], [AgenteId], [CoordinadorId], [MonitorId], [EscaladoId], [TipoProcesoId], [TipoMonitoreoId], [IdTransaccion], [FechaTransaccion], [NotaFinal], [NotaPEC], [NotaPECUF], [NotaPECN], [NotaPECC], [EstadoId], [FechaRegistro]) VALUES (6, 18, 7, 8, 23, 0, 121, 115, N'0454545', CAST(N'2021-09-16' AS Date), N'97.4', 100, 100, 100, 100, 127, CAST(N'2021-09-30T22:21:01.157' AS DateTime))
GO
INSERT [Proceso].[Monitoreo] ([Id], [FormularioId], [AgenteId], [CoordinadorId], [MonitorId], [EscaladoId], [TipoProcesoId], [TipoMonitoreoId], [IdTransaccion], [FechaTransaccion], [NotaFinal], [NotaPEC], [NotaPECUF], [NotaPECN], [NotaPECC], [EstadoId], [FechaRegistro]) VALUES (7, 18, 4, 8, 6, 9, 122, 114, N'ASD454545', CAST(N'2021-10-02' AS Date), N'97.2', 100, 100, 100, 100, 129, CAST(N'2021-10-06T22:42:14.037' AS DateTime))
GO
INSERT [Proceso].[Monitoreo] ([Id], [FormularioId], [AgenteId], [CoordinadorId], [MonitorId], [EscaladoId], [TipoProcesoId], [TipoMonitoreoId], [IdTransaccion], [FechaTransaccion], [NotaFinal], [NotaPEC], [NotaPECUF], [NotaPECN], [NotaPECC], [EstadoId], [FechaRegistro]) VALUES (8, 18, 4, 8, 6, 0, 121, 115, N'0454545', CAST(N'2021-10-02' AS Date), N'99.6', 100, 100, 100, 100, 126, CAST(N'2021-10-06T22:50:45.813' AS DateTime))
GO
INSERT [Proceso].[Monitoreo] ([Id], [FormularioId], [AgenteId], [CoordinadorId], [MonitorId], [EscaladoId], [TipoProcesoId], [TipoMonitoreoId], [IdTransaccion], [FechaTransaccion], [NotaFinal], [NotaPEC], [NotaPECUF], [NotaPECN], [NotaPECC], [EstadoId], [FechaRegistro]) VALUES (9, 18, 5, 8, 6, 0, 121, 115, N'QWS454545', CAST(N'2021-10-07' AS Date), N'93.0', 100, 100, 100, 100, 127, CAST(N'2021-10-09T10:14:48.153' AS DateTime))
GO
INSERT [Proceso].[Monitoreo] ([Id], [FormularioId], [AgenteId], [CoordinadorId], [MonitorId], [EscaladoId], [TipoProcesoId], [TipoMonitoreoId], [IdTransaccion], [FechaTransaccion], [NotaFinal], [NotaPEC], [NotaPECUF], [NotaPECN], [NotaPECC], [EstadoId], [FechaRegistro]) VALUES (10, 18, 7, 8, 23, 0, 122, 115, N'ASDQ212133', CAST(N'2021-10-07' AS Date), N'84.8', 0, 100, 100, 0, 125, CAST(N'2021-10-10T10:13:29.330' AS DateTime))
GO
INSERT [Proceso].[Monitoreo] ([Id], [FormularioId], [AgenteId], [CoordinadorId], [MonitorId], [EscaladoId], [TipoProcesoId], [TipoMonitoreoId], [IdTransaccion], [FechaTransaccion], [NotaFinal], [NotaPEC], [NotaPECUF], [NotaPECN], [NotaPECC], [EstadoId], [FechaRegistro]) VALUES (11, 18, 6, 8, 23, 0, 121, 114, N'QAZ454545', CAST(N'2021-10-08' AS Date), N'94.7', 100, 100, 100, 100, 125, CAST(N'2021-10-10T23:33:27.400' AS DateTime))
GO
INSERT [Proceso].[Monitoreo] ([Id], [FormularioId], [AgenteId], [CoordinadorId], [MonitorId], [EscaladoId], [TipoProcesoId], [TipoMonitoreoId], [IdTransaccion], [FechaTransaccion], [NotaFinal], [NotaPEC], [NotaPECUF], [NotaPECN], [NotaPECC], [EstadoId], [FechaRegistro]) VALUES (12, 18, 22, 11, 23, 0, 121, 114, N'asa121213', CAST(N'2021-10-29' AS Date), N'97.2', 100, 100, 100, 100, 127, CAST(N'2021-11-01T18:40:40.637' AS DateTime))
GO
INSERT [Proceso].[Monitoreo] ([Id], [FormularioId], [AgenteId], [CoordinadorId], [MonitorId], [EscaladoId], [TipoProcesoId], [TipoMonitoreoId], [IdTransaccion], [FechaTransaccion], [NotaFinal], [NotaPEC], [NotaPECUF], [NotaPECN], [NotaPECC], [EstadoId], [FechaRegistro]) VALUES (13, 18, 22, 11, 23, 0, 122, 115, N'ew4343343', CAST(N'2021-11-01' AS Date), N'93.7', 0, 100, 100, 0, 124, CAST(N'2021-11-01T19:21:34.057' AS DateTime))
GO
SET IDENTITY_INSERT [Proceso].[Monitoreo] OFF
GO
SET IDENTITY_INSERT [Proceso].[MonitoreoObservacion] ON 
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (1, 5, 1, 124, N'se encuentra entre lo aceptable de la campaña', CAST(N'2021-09-29T23:26:57.427' AS DateTime))
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (2, 6, 1, 124, N'Reforzar el tema de concentración al momento de realizar una llamada', CAST(N'2021-09-30T22:21:01.197' AS DateTime))
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (4, 6, 8, 125, N'Se le realizara un refuerzo en manejo de la concentración y trabajo bajo presión', CAST(N'2021-09-30T22:58:05.490' AS DateTime))
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (5, 1, 1, 124, N'Reforzar la ortografía con nuestros cursos', CAST(N'2021-09-25T01:32:18.803' AS DateTime))
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (8, 6, 7, 127, N'De mi parte me comprometo a estar mas concentrado en el proceso y no inmiscuir mis temas laborales con los personales', CAST(N'2021-10-02T01:51:48.027' AS DateTime))
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (9, 3, 1, 124, N'Validar el tema de proceso de la aplicacion CRM de falabela', CAST(N'2021-09-27T02:20:16.457' AS DateTime))
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (10, 3, 8, 125, N'se revisara el crm para verificar la gestión del agente', CAST(N'2021-10-02T02:22:28.190' AS DateTime))
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (11, 3, 7, 127, N'Rechazo el monitoreo por el simple hecho de que el día en que se estaba gestionando la llamada del cliente el CRM se cayo y entregue evidencias al coordinador', CAST(N'2021-10-02T02:26:26.270' AS DateTime))
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (12, 5, 8, 125, N'se dara el proceso de visto bueno', CAST(N'2021-10-02T02:28:35.527' AS DateTime))
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (13, 5, 5, 128, N'rechazo el monitoreo porque debe de ser el 100% si no tengo retroalimentación.', CAST(N'2021-10-02T02:31:35.873' AS DateTime))
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (14, 5, 8, 125, N'no es necesaria la retroalimentación a partir del 90% en adelante', CAST(N'2021-10-02T11:28:42.633' AS DateTime))
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (15, 5, 5, 127, N'siendo así mi compromiso seria el seguir aportando a la campaña como vengo haciéndolo', CAST(N'2021-10-02T11:45:23.683' AS DateTime))
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (16, 1, 8, 125, N'Se realizará con el agente cursos y talleres de refuerzo en la ortografía', CAST(N'2021-10-02T12:19:19.950' AS DateTime))
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (17, 1, 5, 128, N'el monitoreo no tenia la razón del proceso', CAST(N'2021-10-02T12:22:47.460' AS DateTime))
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (18, 1, 8, 126, N'cierto se reviso el historial de la campaña y el monitoreo esta mal definido no puede ser por ortografía', CAST(N'2021-10-02T12:24:26.150' AS DateTime))
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (19, 1, 1, 129, N'Se debe eliminar este monitoreo ya que la operación ajusto el negocio y no informo del cambio el cual hizo que el monitoreo este mal evaluado', CAST(N'2021-10-03T10:11:08.893' AS DateTime))
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (21, 7, 3, 124, N'monitoreo con manejo de proceso impecable, solo se recomienda mas concentración el diligenciamiento del aplicativo', CAST(N'2021-10-06T22:42:14.143' AS DateTime))
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (22, 8, 3, 124, N'prueba sin fallas', CAST(N'2021-10-06T22:50:45.933' AS DateTime))
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (23, 9, 1, 124, N'se realiza monitoreo de pruebas satisfactorio', CAST(N'2021-10-09T10:14:48.167' AS DateTime))
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (24, 9, 8, 125, N'se realiza prueba de monitoreo retro alimentación', CAST(N'2021-10-09T11:08:06.507' AS DateTime))
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (25, 8, 8, 126, N'se revisa y probamos rechazo', CAST(N'2021-10-09T22:32:13.360' AS DateTime))
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (26, 7, 8, 126, N'para revisión del rechazo', CAST(N'2021-10-09T22:39:38.163' AS DateTime))
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (27, 9, 5, 127, N'se realiza la prueba de notificación de compromisos', CAST(N'2021-10-10T09:29:56.660' AS DateTime))
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (28, 10, 1, 124, N'PRUEBA FLUJO MONITOREO', CAST(N'2021-10-10T10:13:29.503' AS DateTime))
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (29, 10, 8, 125, N'prueba retroalimentación', CAST(N'2021-10-10T10:15:36.567' AS DateTime))
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (30, 10, 7, 128, N'prueba notificaciones objeción agente ', CAST(N'2021-10-10T10:17:24.470' AS DateTime))
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (31, 10, 8, 125, N'prueba otra vez', CAST(N'2021-10-10T10:19:30.153' AS DateTime))
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (32, 10, 7, 128, N'reviso otra vez la notificaciones de objeción ', CAST(N'2021-10-10T10:25:18.200' AS DateTime))
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (33, 7, 3, 129, N'prueba notificacion para escalar al propio', CAST(N'2021-10-10T13:14:56.230' AS DateTime))
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (34, 4, 1, 124, N'se encuentra entre lo aceptable de la campaña', CAST(N'2021-09-30T22:21:01.197' AS DateTime))
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (35, 4, 8, 125, N'se realiza la prueba de proceso', CAST(N'2021-10-10T22:48:10.153' AS DateTime))
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (36, 11, 3, 124, N'se realiza monitoreo ex', CAST(N'2021-10-10T23:33:27.440' AS DateTime))
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (37, 10, 8, 126, N'seria para revisión de flujo', CAST(N'2021-10-10T23:36:18.593' AS DateTime))
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (38, 11, 8, 125, N'prueba', CAST(N'2021-10-13T21:24:49.533' AS DateTime))
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (39, 12, 1, 124, N'cumple a cabalidad con las tareas, recomendación deja de escalar los temas tan seguido', CAST(N'2021-11-01T18:40:40.687' AS DateTime))
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (40, 12, 11, 125, N'se realiza el proceso de validación para bajar el escalamiento del agente', CAST(N'2021-11-01T18:48:55.643' AS DateTime))
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (41, 12, 22, 128, N'me parece que el tema se había aclarado con el coordinador antes de realizar este monitoreo por regla de negocio', CAST(N'2021-11-01T18:52:10.967' AS DateTime))
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (42, 12, 11, 125, N'el tema si se aclaro el cual el monitor vio conveniente la oportunidad de mejora', CAST(N'2021-11-01T18:56:05.203' AS DateTime))
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (43, 12, 22, 127, N'ok, seguiré los consejos del proceso para los futuros monitoreos', CAST(N'2021-11-01T18:58:58.713' AS DateTime))
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (44, 13, 1, 124, N'prueba 2', CAST(N'2021-11-01T19:21:34.177' AS DateTime))
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (46, 10, 1, 124, N'revisión de nuevo monitoreo', CAST(N'2021-11-02T22:37:48.257' AS DateTime))
GO
INSERT [Proceso].[MonitoreoObservacion] ([Id], [MonitoreoId], [UsuarioId], [EstadoId], [Observacion], [FechaObservacion]) VALUES (47, 10, 8, 125, N'se revisa flujo monitoreo', CAST(N'2021-11-02T22:48:01.833' AS DateTime))
GO
SET IDENTITY_INSERT [Proceso].[MonitoreoObservacion] OFF
GO
SET IDENTITY_INSERT [Proceso].[MonitoreoResultado] ON 
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (1, 1, 2, 503, N'C', CAST(N'2021-09-13T22:28:42.857' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (2, 1, 2, 504, N'C', CAST(N'2021-09-13T22:28:59.390' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (3, 1, 2, 505, N'C', CAST(N'2021-09-13T22:29:14.983' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (4, 1, 2, 506, N'C', CAST(N'2021-09-13T22:29:14.997' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (5, 1, 2, 507, N'C', CAST(N'2021-09-13T22:29:15.000' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (6, 1, 2, 508, N'NC', CAST(N'2021-09-13T22:29:15.000' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (7, 1, 2, 509, N'NC', CAST(N'2021-09-13T22:29:15.003' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (8, 1, 2, 510, N'C', CAST(N'2021-09-13T22:29:15.003' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (9, 1, 2, 511, N'C', CAST(N'2021-09-13T22:29:15.003' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (10, 1, 2, 512, N'C', CAST(N'2021-09-13T22:29:15.007' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (11, 1, 2, 513, N'C', CAST(N'2021-09-13T22:29:15.007' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (12, 1, 2, 514, N'C', CAST(N'2021-09-13T22:29:15.010' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (13, 1, 2, 515, N'C', CAST(N'2021-09-13T22:29:15.010' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (14, 1, 2, 516, N'C', CAST(N'2021-09-13T22:29:15.010' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (15, 1, 2, 517, N'C', CAST(N'2021-09-13T22:29:15.013' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (16, 1, 2, 518, N'C', CAST(N'2021-09-13T22:29:15.013' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (17, 1, 2, 519, N'C', CAST(N'2021-09-13T22:29:15.017' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (18, 1, 2, 520, N'C', CAST(N'2021-09-13T22:29:15.017' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (19, 1, 2, 521, N'C', CAST(N'2021-09-13T22:29:15.017' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (20, 1, 2, 522, N'C', CAST(N'2021-09-13T22:29:15.020' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (21, 1, 2, 523, N'C', CAST(N'2021-09-13T22:29:15.020' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (22, 1, 2, 524, N'C', CAST(N'2021-09-13T22:29:15.020' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (23, 1, 2, 525, N'C', CAST(N'2021-09-13T22:29:15.020' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (24, 1, 2, 526, N'C', CAST(N'2021-09-13T22:29:15.023' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (25, 1, 2, 527, N'C', CAST(N'2021-09-13T22:29:15.023' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (26, 1, 2, 528, N'C', CAST(N'2021-09-13T22:29:15.027' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (27, 1, 2, 529, N'C', CAST(N'2021-09-13T22:29:15.027' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (28, 1, 2, 530, N'C', CAST(N'2021-09-13T22:29:15.030' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (29, 1, 2, 531, N'C', CAST(N'2021-09-13T22:29:15.030' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (30, 1, 2, 532, N'C', CAST(N'2021-09-13T22:29:15.030' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (31, 1, 2, 533, N'C', CAST(N'2021-09-13T22:29:15.030' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (32, 1, 2, 534, N'C', CAST(N'2021-09-13T22:29:15.033' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (33, 1, 2, 535, N'C', CAST(N'2021-09-13T22:29:15.033' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (34, 1, 2, 536, N'C', CAST(N'2021-09-13T22:29:15.033' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (35, 1, 2, 537, N'C', CAST(N'2021-09-13T22:29:15.037' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (36, 1, 2, 538, N'C', CAST(N'2021-09-13T22:29:15.037' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (37, 1, 2, 539, N'C', CAST(N'2021-09-13T22:29:15.037' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (38, 1, 2, 540, N'C', CAST(N'2021-09-13T22:29:15.040' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (39, 1, 2, 541, N'C', CAST(N'2021-09-13T22:29:15.040' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (40, 1, 2, 542, N'C', CAST(N'2021-09-13T22:29:15.040' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (41, 1, 2, 543, N'C', CAST(N'2021-09-13T22:29:15.043' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (42, 1, 2, 544, N'C', CAST(N'2021-09-13T22:29:15.043' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (43, 1, 2, 545, N'C', CAST(N'2021-09-13T22:29:15.043' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (44, 1, 2, 546, N'C', CAST(N'2021-09-13T22:29:15.047' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (45, 1, 2, 547, N'C', CAST(N'2021-09-13T22:29:15.047' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (46, 1, 2, 548, N'C', CAST(N'2021-09-13T22:29:15.047' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (47, 1, 2, 549, N'NC', CAST(N'2021-09-13T22:29:15.050' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (48, 1, 2, 550, N'NC', CAST(N'2021-09-13T22:29:15.050' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (97, 3, 2, 503, N'C', CAST(N'2021-09-24T22:35:16.823' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (98, 3, 2, 504, N'C', CAST(N'2021-09-24T22:35:16.877' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (99, 3, 2, 505, N'C', CAST(N'2021-09-24T22:35:16.880' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (100, 3, 2, 506, N'C', CAST(N'2021-09-24T22:35:16.883' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (101, 3, 2, 507, N'C', CAST(N'2021-09-24T22:35:16.883' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (102, 3, 2, 508, N'C', CAST(N'2021-09-24T22:35:16.887' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (103, 3, 2, 509, N'C', CAST(N'2021-09-24T22:35:16.890' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (104, 3, 2, 510, N'C', CAST(N'2021-09-24T22:35:16.890' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (105, 3, 2, 511, N'C', CAST(N'2021-09-24T22:35:16.893' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (106, 3, 2, 512, N'C', CAST(N'2021-09-24T22:35:16.897' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (107, 3, 2, 513, N'C', CAST(N'2021-09-24T22:35:16.900' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (108, 3, 2, 514, N'C', CAST(N'2021-09-24T22:35:16.900' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (109, 3, 2, 515, N'C', CAST(N'2021-09-24T22:35:16.903' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (110, 3, 2, 516, N'C', CAST(N'2021-09-24T22:35:16.903' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (111, 3, 2, 517, N'C', CAST(N'2021-09-24T22:35:16.907' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (112, 3, 2, 518, N'C', CAST(N'2021-09-24T22:35:16.907' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (113, 3, 2, 519, N'C', CAST(N'2021-09-24T22:35:16.910' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (114, 3, 2, 520, N'NC', CAST(N'2021-09-24T22:35:16.910' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (115, 3, 2, 521, N'C', CAST(N'2021-09-24T22:35:16.910' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (116, 3, 2, 522, N'C', CAST(N'2021-09-24T22:35:16.910' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (117, 3, 2, 523, N'C', CAST(N'2021-09-24T22:35:16.913' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (118, 3, 2, 524, N'C', CAST(N'2021-09-24T22:35:16.913' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (119, 3, 2, 525, N'C', CAST(N'2021-09-24T22:35:16.943' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (120, 3, 2, 526, N'C', CAST(N'2021-09-24T22:35:16.943' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (121, 3, 2, 527, N'C', CAST(N'2021-09-24T22:35:16.947' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (122, 3, 2, 528, N'C', CAST(N'2021-09-24T22:35:16.947' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (123, 3, 2, 529, N'C', CAST(N'2021-09-24T22:35:16.953' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (124, 3, 2, 530, N'C', CAST(N'2021-09-24T22:35:16.953' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (125, 3, 2, 531, N'C', CAST(N'2021-09-24T22:35:16.957' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (126, 3, 2, 532, N'NC', CAST(N'2021-09-24T22:35:16.957' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (127, 3, 2, 533, N'NC', CAST(N'2021-09-24T22:35:16.960' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (128, 3, 2, 534, N'C', CAST(N'2021-09-24T22:35:16.960' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (129, 3, 2, 535, N'C', CAST(N'2021-09-24T22:35:16.997' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (130, 3, 2, 536, N'C', CAST(N'2021-09-24T22:35:17.003' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (131, 3, 2, 537, N'C', CAST(N'2021-09-24T22:35:17.007' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (132, 3, 2, 538, N'C', CAST(N'2021-09-24T22:35:17.010' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (133, 3, 2, 539, N'C', CAST(N'2021-09-24T22:35:17.010' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (134, 3, 2, 540, N'C', CAST(N'2021-09-24T22:35:17.013' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (135, 3, 2, 541, N'C', CAST(N'2021-09-24T22:35:17.017' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (136, 3, 2, 542, N'C', CAST(N'2021-09-24T22:35:17.017' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (137, 3, 2, 543, N'C', CAST(N'2021-09-24T22:35:17.020' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (138, 3, 2, 544, N'C', CAST(N'2021-09-24T22:35:17.020' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (139, 3, 2, 545, N'C', CAST(N'2021-09-24T22:35:17.020' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (140, 3, 2, 546, N'C', CAST(N'2021-09-24T22:35:17.023' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (141, 3, 2, 547, N'NC', CAST(N'2021-09-24T22:35:17.027' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (142, 3, 2, 548, N'NC', CAST(N'2021-09-24T22:35:17.027' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (143, 3, 2, 549, N'C', CAST(N'2021-09-24T22:35:17.030' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (144, 3, 2, 550, N'NC', CAST(N'2021-09-24T22:35:17.030' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (145, 4, 2, 503, N'C', CAST(N'2021-09-28T21:13:59.413' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (146, 4, 2, 504, N'C', CAST(N'2021-09-28T21:13:59.443' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (147, 4, 2, 505, N'C', CAST(N'2021-09-28T21:13:59.450' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (148, 4, 2, 506, N'C', CAST(N'2021-09-28T21:13:59.453' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (149, 4, 2, 507, N'C', CAST(N'2021-09-28T21:13:59.457' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (150, 4, 2, 508, N'C', CAST(N'2021-09-28T21:13:59.457' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (151, 4, 2, 509, N'C', CAST(N'2021-09-28T21:13:59.460' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (152, 4, 2, 510, N'C', CAST(N'2021-09-28T21:13:59.463' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (153, 4, 2, 511, N'C', CAST(N'2021-09-28T21:13:59.463' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (154, 4, 2, 512, N'C', CAST(N'2021-09-28T21:13:59.467' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (155, 4, 2, 513, N'C', CAST(N'2021-09-28T21:13:59.467' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (156, 4, 2, 514, N'C', CAST(N'2021-09-28T21:13:59.470' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (157, 4, 2, 515, N'C', CAST(N'2021-09-28T21:13:59.470' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (158, 4, 2, 516, N'C', CAST(N'2021-09-28T21:13:59.470' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (159, 4, 2, 517, N'C', CAST(N'2021-09-28T21:13:59.473' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (160, 4, 2, 518, N'C', CAST(N'2021-09-28T21:13:59.473' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (161, 4, 2, 519, N'C', CAST(N'2021-09-28T21:13:59.477' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (162, 4, 2, 520, N'C', CAST(N'2021-09-28T21:13:59.480' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (163, 4, 2, 521, N'C', CAST(N'2021-09-28T21:13:59.530' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (164, 4, 2, 522, N'C', CAST(N'2021-09-28T21:13:59.530' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (165, 4, 2, 523, N'C', CAST(N'2021-09-28T21:13:59.533' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (166, 4, 2, 524, N'C', CAST(N'2021-09-28T21:13:59.533' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (167, 4, 2, 525, N'C', CAST(N'2021-09-28T21:13:59.537' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (168, 4, 2, 526, N'C', CAST(N'2021-09-28T21:13:59.537' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (169, 4, 2, 527, N'NC', CAST(N'2021-09-28T21:13:59.537' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (170, 4, 2, 528, N'NC', CAST(N'2021-09-28T21:13:59.540' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (171, 4, 2, 529, N'NC', CAST(N'2021-09-28T21:13:59.540' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (172, 4, 2, 530, N'NC', CAST(N'2021-09-28T21:13:59.540' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (173, 4, 2, 531, N'NC', CAST(N'2021-09-28T21:13:59.543' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (174, 4, 2, 532, N'NC', CAST(N'2021-09-28T21:13:59.547' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (175, 4, 2, 533, N'NC', CAST(N'2021-09-28T21:13:59.573' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (176, 4, 2, 534, N'NC', CAST(N'2021-09-28T21:13:59.593' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (177, 4, 2, 535, N'C', CAST(N'2021-09-28T21:13:59.607' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (178, 4, 2, 536, N'C', CAST(N'2021-09-28T21:13:59.610' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (179, 4, 2, 537, N'C', CAST(N'2021-09-28T21:13:59.610' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (180, 4, 2, 538, N'C', CAST(N'2021-09-28T21:13:59.613' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (181, 4, 2, 539, N'C', CAST(N'2021-09-28T21:13:59.617' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (182, 4, 2, 540, N'C', CAST(N'2021-09-28T21:13:59.617' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (183, 4, 2, 541, N'C', CAST(N'2021-09-28T21:13:59.620' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (184, 4, 2, 542, N'C', CAST(N'2021-09-28T21:13:59.620' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (185, 4, 2, 543, N'C', CAST(N'2021-09-28T21:13:59.683' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (186, 4, 2, 544, N'C', CAST(N'2021-09-28T21:13:59.683' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (187, 4, 2, 545, N'C', CAST(N'2021-09-28T21:13:59.687' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (188, 4, 2, 546, N'C', CAST(N'2021-09-28T21:13:59.687' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (189, 4, 2, 547, N'NC', CAST(N'2021-09-28T21:13:59.690' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (190, 4, 2, 548, N'NC', CAST(N'2021-09-28T21:13:59.690' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (191, 4, 2, 549, N'NC', CAST(N'2021-09-28T21:13:59.693' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (192, 4, 2, 550, N'NC', CAST(N'2021-09-28T21:13:59.697' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (193, 5, 2, 503, N'C', CAST(N'2021-09-29T23:27:04.543' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (194, 5, 2, 504, N'C', CAST(N'2021-09-29T23:27:04.560' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (195, 5, 2, 505, N'C', CAST(N'2021-09-29T23:27:04.560' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (196, 5, 2, 506, N'C', CAST(N'2021-09-29T23:27:04.560' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (197, 5, 2, 507, N'C', CAST(N'2021-09-29T23:27:04.563' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (198, 5, 2, 508, N'NC', CAST(N'2021-09-29T23:27:04.563' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (199, 5, 2, 509, N'NC', CAST(N'2021-09-29T23:27:04.567' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (200, 5, 2, 510, N'C', CAST(N'2021-09-29T23:27:04.570' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (201, 5, 2, 511, N'C', CAST(N'2021-09-29T23:27:04.570' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (202, 5, 2, 512, N'C', CAST(N'2021-09-29T23:27:04.570' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (203, 5, 2, 513, N'C', CAST(N'2021-09-29T23:27:04.570' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (204, 5, 2, 514, N'C', CAST(N'2021-09-29T23:27:04.573' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (205, 5, 2, 515, N'C', CAST(N'2021-09-29T23:27:04.573' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (206, 5, 2, 516, N'C', CAST(N'2021-09-29T23:27:04.577' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (207, 5, 2, 517, N'C', CAST(N'2021-09-29T23:27:04.577' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (208, 5, 2, 518, N'C', CAST(N'2021-09-29T23:27:04.580' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (209, 5, 2, 519, N'C', CAST(N'2021-09-29T23:27:04.580' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (210, 5, 2, 520, N'C', CAST(N'2021-09-29T23:27:04.580' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (211, 5, 2, 521, N'C', CAST(N'2021-09-29T23:27:04.580' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (212, 5, 2, 522, N'C', CAST(N'2021-09-29T23:27:04.583' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (213, 5, 2, 523, N'C', CAST(N'2021-09-29T23:27:04.583' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (214, 5, 2, 524, N'C', CAST(N'2021-09-29T23:27:04.583' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (215, 5, 2, 525, N'C', CAST(N'2021-09-29T23:27:04.587' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (216, 5, 2, 526, N'C', CAST(N'2021-09-29T23:27:04.587' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (217, 5, 2, 527, N'C', CAST(N'2021-09-29T23:27:04.587' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (218, 5, 2, 528, N'C', CAST(N'2021-09-29T23:27:04.590' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (219, 5, 2, 529, N'C', CAST(N'2021-09-29T23:27:04.590' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (220, 5, 2, 530, N'C', CAST(N'2021-09-29T23:27:04.590' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (221, 5, 2, 531, N'C', CAST(N'2021-09-29T23:27:04.593' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (222, 5, 2, 532, N'C', CAST(N'2021-09-29T23:27:04.593' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (223, 5, 2, 533, N'C', CAST(N'2021-09-29T23:27:04.593' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (224, 5, 2, 534, N'C', CAST(N'2021-09-29T23:27:04.597' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (225, 5, 2, 535, N'C', CAST(N'2021-09-29T23:27:04.597' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (226, 5, 2, 536, N'C', CAST(N'2021-09-29T23:27:04.600' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (227, 5, 2, 537, N'C', CAST(N'2021-09-29T23:27:04.600' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (228, 5, 2, 538, N'C', CAST(N'2021-09-29T23:27:04.600' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (229, 5, 2, 539, N'C', CAST(N'2021-09-29T23:27:04.603' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (230, 5, 2, 540, N'C', CAST(N'2021-09-29T23:27:04.603' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (231, 5, 2, 541, N'C', CAST(N'2021-09-29T23:27:04.607' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (232, 5, 2, 542, N'C', CAST(N'2021-09-29T23:27:04.607' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (233, 5, 2, 543, N'C', CAST(N'2021-09-29T23:27:04.607' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (234, 5, 2, 544, N'C', CAST(N'2021-09-29T23:27:04.610' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (235, 5, 2, 545, N'C', CAST(N'2021-09-29T23:27:04.610' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (236, 5, 2, 546, N'C', CAST(N'2021-09-29T23:27:04.610' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (237, 5, 2, 547, N'C', CAST(N'2021-09-29T23:27:04.613' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (238, 5, 2, 548, N'C', CAST(N'2021-09-29T23:27:04.613' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (239, 5, 2, 549, N'C', CAST(N'2021-09-29T23:27:04.613' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (240, 5, 2, 550, N'C', CAST(N'2021-09-29T23:27:04.617' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (241, 6, 2, 503, N'C', CAST(N'2021-09-30T22:21:01.303' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (242, 6, 2, 504, N'C', CAST(N'2021-09-30T22:21:01.307' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (243, 6, 2, 505, N'C', CAST(N'2021-09-30T22:21:01.307' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (244, 6, 2, 506, N'C', CAST(N'2021-09-30T22:21:01.310' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (245, 6, 2, 507, N'C', CAST(N'2021-09-30T22:21:01.310' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (246, 6, 2, 508, N'C', CAST(N'2021-09-30T22:21:01.310' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (247, 6, 2, 509, N'C', CAST(N'2021-09-30T22:21:01.330' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (248, 6, 2, 510, N'C', CAST(N'2021-09-30T22:21:01.333' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (249, 6, 2, 511, N'C', CAST(N'2021-09-30T22:21:01.333' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (250, 6, 2, 512, N'NC', CAST(N'2021-09-30T22:21:01.333' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (251, 6, 2, 513, N'C', CAST(N'2021-09-30T22:21:01.337' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (252, 6, 2, 514, N'NC', CAST(N'2021-09-30T22:21:01.337' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (253, 6, 2, 515, N'C', CAST(N'2021-09-30T22:21:01.340' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (254, 6, 2, 516, N'C', CAST(N'2021-09-30T22:21:01.340' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (255, 6, 2, 517, N'C', CAST(N'2021-09-30T22:21:01.340' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (256, 6, 2, 518, N'C', CAST(N'2021-09-30T22:21:01.343' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (257, 6, 2, 519, N'C', CAST(N'2021-09-30T22:21:01.343' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (258, 6, 2, 520, N'C', CAST(N'2021-09-30T22:21:01.347' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (259, 6, 2, 521, N'C', CAST(N'2021-09-30T22:21:01.347' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (260, 6, 2, 522, N'C', CAST(N'2021-09-30T22:21:01.350' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (261, 6, 2, 523, N'C', CAST(N'2021-09-30T22:21:01.350' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (262, 6, 2, 524, N'C', CAST(N'2021-09-30T22:21:01.350' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (263, 6, 2, 525, N'C', CAST(N'2021-09-30T22:21:01.350' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (264, 6, 2, 526, N'C', CAST(N'2021-09-30T22:21:01.353' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (265, 6, 2, 527, N'C', CAST(N'2021-09-30T22:21:01.353' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (266, 6, 2, 528, N'C', CAST(N'2021-09-30T22:21:01.393' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (267, 6, 2, 529, N'C', CAST(N'2021-09-30T22:21:01.397' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (268, 6, 2, 530, N'C', CAST(N'2021-09-30T22:21:01.400' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (269, 6, 2, 531, N'C', CAST(N'2021-09-30T22:21:01.400' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (270, 6, 2, 532, N'C', CAST(N'2021-09-30T22:21:01.403' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (271, 6, 2, 533, N'C', CAST(N'2021-09-30T22:21:01.407' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (272, 6, 2, 534, N'C', CAST(N'2021-09-30T22:21:01.433' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (273, 6, 2, 535, N'C', CAST(N'2021-09-30T22:21:01.437' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (274, 6, 2, 536, N'C', CAST(N'2021-09-30T22:21:01.437' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (275, 6, 2, 537, N'C', CAST(N'2021-09-30T22:21:01.453' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (276, 6, 2, 538, N'C', CAST(N'2021-09-30T22:21:01.457' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (277, 6, 2, 539, N'C', CAST(N'2021-09-30T22:21:01.457' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (278, 6, 2, 540, N'C', CAST(N'2021-09-30T22:21:01.460' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (279, 6, 2, 541, N'C', CAST(N'2021-09-30T22:21:01.473' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (280, 6, 2, 542, N'C', CAST(N'2021-09-30T22:21:01.477' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (281, 6, 2, 543, N'C', CAST(N'2021-09-30T22:21:01.487' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (282, 6, 2, 544, N'C', CAST(N'2021-09-30T22:21:01.490' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (283, 6, 2, 545, N'C', CAST(N'2021-09-30T22:21:01.490' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (284, 6, 2, 546, N'C', CAST(N'2021-09-30T22:21:01.493' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (285, 6, 2, 547, N'C', CAST(N'2021-09-30T22:21:01.497' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (286, 6, 2, 548, N'C', CAST(N'2021-09-30T22:21:01.500' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (287, 6, 2, 549, N'C', CAST(N'2021-09-30T22:21:01.500' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (288, 6, 2, 550, N'C', CAST(N'2021-09-30T22:21:01.500' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (289, 7, 2, 503, N'C', CAST(N'2021-10-06T22:42:14.203' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (290, 7, 2, 504, N'C', CAST(N'2021-10-06T22:42:14.220' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (291, 7, 2, 505, N'C', CAST(N'2021-10-06T22:42:14.223' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (292, 7, 2, 506, N'C', CAST(N'2021-10-06T22:42:14.227' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (293, 7, 2, 507, N'C', CAST(N'2021-10-06T22:42:14.230' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (294, 7, 2, 508, N'C', CAST(N'2021-10-06T22:42:14.230' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (295, 7, 2, 509, N'C', CAST(N'2021-10-06T22:42:14.233' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (296, 7, 2, 510, N'C', CAST(N'2021-10-06T22:42:14.233' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (297, 7, 2, 511, N'C', CAST(N'2021-10-06T22:42:14.237' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (298, 7, 2, 512, N'C', CAST(N'2021-10-06T22:42:14.237' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (299, 7, 2, 513, N'C', CAST(N'2021-10-06T22:42:14.240' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (300, 7, 2, 514, N'C', CAST(N'2021-10-06T22:42:14.240' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (301, 7, 2, 515, N'C', CAST(N'2021-10-06T22:42:14.240' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (302, 7, 2, 516, N'C', CAST(N'2021-10-06T22:42:14.243' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (303, 7, 2, 517, N'C', CAST(N'2021-10-06T22:42:14.243' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (304, 7, 2, 518, N'C', CAST(N'2021-10-06T22:42:14.247' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (305, 7, 2, 519, N'C', CAST(N'2021-10-06T22:42:14.247' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (306, 7, 2, 520, N'C', CAST(N'2021-10-06T22:42:14.250' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (307, 7, 2, 521, N'C', CAST(N'2021-10-06T22:42:14.250' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (308, 7, 2, 522, N'C', CAST(N'2021-10-06T22:42:14.250' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (309, 7, 2, 523, N'C', CAST(N'2021-10-06T22:42:14.253' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (310, 7, 2, 524, N'C', CAST(N'2021-10-06T22:42:14.253' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (311, 7, 2, 525, N'C', CAST(N'2021-10-06T22:42:14.253' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (312, 7, 2, 526, N'C', CAST(N'2021-10-06T22:42:14.257' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (313, 7, 2, 527, N'C', CAST(N'2021-10-06T22:42:14.257' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (314, 7, 2, 528, N'C', CAST(N'2021-10-06T22:42:14.260' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (315, 7, 2, 529, N'C', CAST(N'2021-10-06T22:42:14.260' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (316, 7, 2, 530, N'C', CAST(N'2021-10-06T22:42:14.260' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (317, 7, 2, 531, N'C', CAST(N'2021-10-06T22:42:14.263' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (318, 7, 2, 532, N'C', CAST(N'2021-10-06T22:42:14.263' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (319, 7, 2, 533, N'C', CAST(N'2021-10-06T22:42:14.267' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (320, 7, 2, 534, N'C', CAST(N'2021-10-06T22:42:14.267' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (321, 7, 2, 535, N'C', CAST(N'2021-10-06T22:42:14.270' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (322, 7, 2, 536, N'C', CAST(N'2021-10-06T22:42:14.270' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (323, 7, 2, 537, N'C', CAST(N'2021-10-06T22:42:14.270' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (324, 7, 2, 538, N'C', CAST(N'2021-10-06T22:42:14.330' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (325, 7, 2, 539, N'C', CAST(N'2021-10-06T22:42:14.337' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (326, 7, 2, 540, N'C', CAST(N'2021-10-06T22:42:14.340' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (327, 7, 2, 541, N'C', CAST(N'2021-10-06T22:42:14.340' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (328, 7, 2, 542, N'C', CAST(N'2021-10-06T22:42:14.343' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (329, 7, 2, 543, N'C', CAST(N'2021-10-06T22:42:14.347' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (330, 7, 2, 544, N'C', CAST(N'2021-10-06T22:42:14.350' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (331, 7, 2, 545, N'C', CAST(N'2021-10-06T22:42:14.353' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (332, 7, 2, 546, N'C', CAST(N'2021-10-06T22:42:14.357' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (333, 7, 2, 547, N'C', CAST(N'2021-10-06T22:42:14.360' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (334, 7, 2, 548, N'C', CAST(N'2021-10-06T22:42:14.363' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (335, 7, 2, 549, N'C', CAST(N'2021-10-06T22:42:14.367' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (336, 7, 2, 550, N'NC', CAST(N'2021-10-06T22:42:14.370' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (337, 8, 2, 503, N'C', CAST(N'2021-10-06T22:50:45.980' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (338, 8, 2, 504, N'NC', CAST(N'2021-10-06T22:50:45.980' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (339, 8, 2, 505, N'C', CAST(N'2021-10-06T22:50:45.983' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (340, 8, 2, 506, N'C', CAST(N'2021-10-06T22:50:45.983' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (341, 8, 2, 507, N'C', CAST(N'2021-10-06T22:50:45.987' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (342, 8, 2, 508, N'C', CAST(N'2021-10-06T22:50:45.987' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (343, 8, 2, 509, N'C', CAST(N'2021-10-06T22:50:45.990' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (344, 8, 2, 510, N'NC', CAST(N'2021-10-06T22:50:45.990' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (345, 8, 2, 511, N'C', CAST(N'2021-10-06T22:50:45.990' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (346, 8, 2, 512, N'C', CAST(N'2021-10-06T22:50:45.990' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (347, 8, 2, 513, N'C', CAST(N'2021-10-06T22:50:45.993' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (348, 8, 2, 514, N'C', CAST(N'2021-10-06T22:50:45.993' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (349, 8, 2, 515, N'C', CAST(N'2021-10-06T22:50:45.993' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (350, 8, 2, 516, N'C', CAST(N'2021-10-06T22:50:45.997' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (351, 8, 2, 517, N'C', CAST(N'2021-10-06T22:50:46.030' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (352, 8, 2, 518, N'C', CAST(N'2021-10-06T22:50:46.033' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (353, 8, 2, 519, N'C', CAST(N'2021-10-06T22:50:46.033' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (354, 8, 2, 520, N'C', CAST(N'2021-10-06T22:50:46.037' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (355, 8, 2, 521, N'C', CAST(N'2021-10-06T22:50:46.037' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (356, 8, 2, 522, N'C', CAST(N'2021-10-06T22:50:46.040' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (357, 8, 2, 523, N'C', CAST(N'2021-10-06T22:50:46.040' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (358, 8, 2, 524, N'C', CAST(N'2021-10-06T22:50:46.040' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (359, 8, 2, 525, N'C', CAST(N'2021-10-06T22:50:46.043' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (360, 8, 2, 526, N'C', CAST(N'2021-10-06T22:50:46.043' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (361, 8, 2, 527, N'C', CAST(N'2021-10-06T22:50:46.047' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (362, 8, 2, 528, N'C', CAST(N'2021-10-06T22:50:46.083' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (363, 8, 2, 529, N'C', CAST(N'2021-10-06T22:50:46.087' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (364, 8, 2, 530, N'C', CAST(N'2021-10-06T22:50:46.087' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (365, 8, 2, 531, N'C', CAST(N'2021-10-06T22:50:46.090' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (366, 8, 2, 532, N'C', CAST(N'2021-10-06T22:50:46.093' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (367, 8, 2, 533, N'C', CAST(N'2021-10-06T22:50:46.093' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (368, 8, 2, 534, N'C', CAST(N'2021-10-06T22:50:46.097' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (369, 8, 2, 535, N'C', CAST(N'2021-10-06T22:50:46.097' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (370, 8, 2, 536, N'C', CAST(N'2021-10-06T22:50:46.100' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (371, 8, 2, 537, N'C', CAST(N'2021-10-06T22:50:46.100' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (372, 8, 2, 538, N'C', CAST(N'2021-10-06T22:50:46.100' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (373, 8, 2, 539, N'C', CAST(N'2021-10-06T22:50:46.103' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (374, 8, 2, 540, N'C', CAST(N'2021-10-06T22:50:46.103' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (375, 8, 2, 541, N'C', CAST(N'2021-10-06T22:50:46.107' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (376, 8, 2, 542, N'C', CAST(N'2021-10-06T22:50:46.107' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (377, 8, 2, 543, N'C', CAST(N'2021-10-06T22:50:46.107' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (378, 8, 2, 544, N'C', CAST(N'2021-10-06T22:50:46.110' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (379, 8, 2, 545, N'C', CAST(N'2021-10-06T22:50:46.110' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (380, 8, 2, 546, N'C', CAST(N'2021-10-06T22:50:46.110' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (381, 8, 2, 547, N'C', CAST(N'2021-10-06T22:50:46.113' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (382, 8, 2, 548, N'C', CAST(N'2021-10-06T22:50:46.113' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (383, 8, 2, 549, N'C', CAST(N'2021-10-06T22:50:46.113' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (384, 8, 2, 550, N'C', CAST(N'2021-10-06T22:50:46.117' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (385, 9, 2, 503, N'C', CAST(N'2021-10-09T10:14:48.253' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (386, 9, 2, 504, N'C', CAST(N'2021-10-09T10:14:48.270' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (387, 9, 2, 505, N'C', CAST(N'2021-10-09T10:14:48.270' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (388, 9, 2, 506, N'C', CAST(N'2021-10-09T10:14:48.270' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (389, 9, 2, 507, N'C', CAST(N'2021-10-09T10:14:48.273' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (390, 9, 2, 508, N'C', CAST(N'2021-10-09T10:14:48.273' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (391, 9, 2, 509, N'C', CAST(N'2021-10-09T10:14:48.273' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (392, 9, 2, 510, N'C', CAST(N'2021-10-09T10:14:48.277' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (393, 9, 2, 511, N'C', CAST(N'2021-10-09T10:14:48.277' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (394, 9, 2, 512, N'C', CAST(N'2021-10-09T10:14:48.277' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (395, 9, 2, 513, N'C', CAST(N'2021-10-09T10:14:48.277' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (396, 9, 2, 514, N'C', CAST(N'2021-10-09T10:14:48.280' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (397, 9, 2, 515, N'C', CAST(N'2021-10-09T10:14:48.280' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (398, 9, 2, 516, N'C', CAST(N'2021-10-09T10:14:48.280' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (399, 9, 2, 517, N'C', CAST(N'2021-10-09T10:14:48.280' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (400, 9, 2, 518, N'C', CAST(N'2021-10-09T10:14:48.280' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (401, 9, 2, 519, N'C', CAST(N'2021-10-09T10:14:48.283' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (402, 9, 2, 520, N'C', CAST(N'2021-10-09T10:14:48.283' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (403, 9, 2, 521, N'C', CAST(N'2021-10-09T10:14:48.283' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (404, 9, 2, 522, N'C', CAST(N'2021-10-09T10:14:48.283' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (405, 9, 2, 523, N'C', CAST(N'2021-10-09T10:14:48.287' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (406, 9, 2, 524, N'C', CAST(N'2021-10-09T10:14:48.287' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (407, 9, 2, 525, N'C', CAST(N'2021-10-09T10:14:48.287' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (408, 9, 2, 526, N'C', CAST(N'2021-10-09T10:14:48.287' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (409, 9, 2, 527, N'C', CAST(N'2021-10-09T10:14:48.290' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (410, 9, 2, 528, N'C', CAST(N'2021-10-09T10:14:48.290' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (411, 9, 2, 529, N'C', CAST(N'2021-10-09T10:14:48.290' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (412, 9, 2, 530, N'C', CAST(N'2021-10-09T10:14:48.290' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (413, 9, 2, 531, N'C', CAST(N'2021-10-09T10:14:48.290' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (414, 9, 2, 532, N'C', CAST(N'2021-10-09T10:14:48.293' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (415, 9, 2, 533, N'C', CAST(N'2021-10-09T10:14:48.293' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (416, 9, 2, 534, N'C', CAST(N'2021-10-09T10:14:48.293' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (417, 9, 2, 535, N'C', CAST(N'2021-10-09T10:14:48.293' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (418, 9, 2, 536, N'NC', CAST(N'2021-10-09T10:14:48.297' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (419, 9, 2, 537, N'C', CAST(N'2021-10-09T10:14:48.297' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (420, 9, 2, 538, N'C', CAST(N'2021-10-09T10:14:48.297' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (421, 9, 2, 539, N'C', CAST(N'2021-10-09T10:14:48.297' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (422, 9, 2, 540, N'C', CAST(N'2021-10-09T10:14:48.300' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (423, 9, 2, 541, N'C', CAST(N'2021-10-09T10:14:48.300' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (424, 9, 2, 542, N'C', CAST(N'2021-10-09T10:14:48.300' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (425, 9, 2, 543, N'C', CAST(N'2021-10-09T10:14:48.300' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (426, 9, 2, 544, N'C', CAST(N'2021-10-09T10:14:48.300' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (427, 9, 2, 545, N'C', CAST(N'2021-10-09T10:14:48.300' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (428, 9, 2, 546, N'C', CAST(N'2021-10-09T10:14:48.303' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (429, 9, 2, 547, N'C', CAST(N'2021-10-09T10:14:48.303' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (430, 9, 2, 548, N'C', CAST(N'2021-10-09T10:14:48.303' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (431, 9, 2, 549, N'C', CAST(N'2021-10-09T10:14:48.303' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (432, 9, 2, 550, N'C', CAST(N'2021-10-09T10:14:48.307' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (433, 10, 2, 503, N'C', CAST(N'2021-10-10T10:13:29.557' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (434, 10, 2, 504, N'C', CAST(N'2021-10-10T10:13:29.557' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (435, 10, 2, 505, N'C', CAST(N'2021-10-10T10:13:29.557' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (436, 10, 2, 506, N'C', CAST(N'2021-10-10T10:13:29.560' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (437, 10, 2, 507, N'C', CAST(N'2021-10-10T10:13:29.560' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (438, 10, 2, 508, N'C', CAST(N'2021-10-10T10:13:29.560' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (439, 10, 2, 509, N'NC', CAST(N'2021-10-10T10:13:29.580' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (440, 10, 2, 510, N'NC', CAST(N'2021-10-10T10:13:29.590' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (441, 10, 2, 511, N'NC', CAST(N'2021-10-10T10:13:29.593' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (442, 10, 2, 512, N'NC', CAST(N'2021-10-10T10:13:29.593' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (443, 10, 2, 513, N'NC', CAST(N'2021-10-10T10:13:29.610' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (444, 10, 2, 514, N'NC', CAST(N'2021-10-10T10:13:29.613' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (445, 10, 2, 515, N'C', CAST(N'2021-10-10T10:13:29.617' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (446, 10, 2, 516, N'C', CAST(N'2021-10-10T10:13:29.620' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (447, 10, 2, 517, N'C', CAST(N'2021-10-10T10:13:29.637' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (448, 10, 2, 518, N'C', CAST(N'2021-10-10T10:13:29.637' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (449, 10, 2, 519, N'C', CAST(N'2021-10-10T10:13:29.657' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (450, 10, 2, 520, N'C', CAST(N'2021-10-10T10:13:29.660' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (451, 10, 2, 521, N'NC', CAST(N'2021-10-10T10:13:29.663' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (452, 10, 2, 522, N'NC', CAST(N'2021-10-10T10:13:29.667' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (453, 10, 2, 523, N'NC', CAST(N'2021-10-10T10:13:29.667' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (454, 10, 2, 524, N'NC', CAST(N'2021-10-10T10:13:29.667' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (455, 10, 2, 525, N'NC', CAST(N'2021-10-10T10:13:29.670' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (456, 10, 2, 526, N'NC', CAST(N'2021-10-10T10:13:29.683' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (457, 10, 2, 527, N'NC', CAST(N'2021-10-10T10:13:29.683' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (458, 10, 2, 528, N'NC', CAST(N'2021-10-10T10:13:29.683' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (459, 10, 2, 529, N'NC', CAST(N'2021-10-10T10:13:29.690' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (460, 10, 2, 530, N'NC', CAST(N'2021-10-10T10:13:29.690' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (461, 10, 2, 531, N'NC', CAST(N'2021-10-10T10:13:29.710' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (462, 10, 2, 532, N'NC', CAST(N'2021-10-10T10:13:29.710' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (463, 10, 2, 533, N'NC', CAST(N'2021-10-10T10:13:29.710' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (464, 10, 2, 534, N'NC', CAST(N'2021-10-10T10:13:29.710' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (465, 10, 2, 535, N'C', CAST(N'2021-10-10T10:13:29.713' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (466, 10, 2, 536, N'C', CAST(N'2021-10-10T10:13:29.713' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (467, 10, 2, 537, N'C', CAST(N'2021-10-10T10:13:29.713' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (468, 10, 2, 538, N'C', CAST(N'2021-10-10T10:13:29.733' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (469, 10, 2, 539, N'C', CAST(N'2021-10-10T10:13:29.743' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (470, 10, 2, 540, N'C', CAST(N'2021-10-10T10:13:29.743' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (471, 10, 2, 541, N'C', CAST(N'2021-10-10T10:13:29.743' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (472, 10, 2, 542, N'C', CAST(N'2021-10-10T10:13:29.747' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (473, 10, 2, 543, N'C', CAST(N'2021-10-10T10:13:29.747' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (474, 10, 2, 544, N'C', CAST(N'2021-10-10T10:13:29.747' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (475, 10, 2, 545, N'C', CAST(N'2021-10-10T10:13:29.747' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (476, 10, 2, 546, N'C', CAST(N'2021-10-10T10:13:29.760' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (477, 10, 2, 547, N'C', CAST(N'2021-10-10T10:13:29.763' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (478, 10, 2, 548, N'C', CAST(N'2021-10-10T10:13:29.763' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (479, 10, 2, 549, N'C', CAST(N'2021-10-10T10:13:29.763' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (480, 10, 2, 550, N'C', CAST(N'2021-10-10T10:13:29.777' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (481, 11, 2, 503, N'C', CAST(N'2021-10-10T23:33:27.747' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (482, 11, 2, 504, N'C', CAST(N'2021-10-10T23:33:27.750' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (483, 11, 2, 505, N'C', CAST(N'2021-10-10T23:33:27.750' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (484, 11, 2, 506, N'C', CAST(N'2021-10-10T23:33:27.750' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (485, 11, 2, 507, N'C', CAST(N'2021-10-10T23:33:27.793' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (486, 11, 2, 508, N'C', CAST(N'2021-10-10T23:33:27.793' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (487, 11, 2, 509, N'C', CAST(N'2021-10-10T23:33:27.793' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (488, 11, 2, 510, N'C', CAST(N'2021-10-10T23:33:27.797' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (489, 11, 2, 511, N'C', CAST(N'2021-10-10T23:33:27.797' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (490, 11, 2, 512, N'C', CAST(N'2021-10-10T23:33:27.797' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (491, 11, 2, 513, N'C', CAST(N'2021-10-10T23:33:27.800' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (492, 11, 2, 514, N'C', CAST(N'2021-10-10T23:33:27.800' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (493, 11, 2, 515, N'C', CAST(N'2021-10-10T23:33:27.800' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (494, 11, 2, 516, N'NC', CAST(N'2021-10-10T23:33:27.800' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (495, 11, 2, 517, N'C', CAST(N'2021-10-10T23:33:27.803' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (496, 11, 2, 518, N'C', CAST(N'2021-10-10T23:33:27.803' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (497, 11, 2, 519, N'C', CAST(N'2021-10-10T23:33:27.803' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (498, 11, 2, 520, N'C', CAST(N'2021-10-10T23:33:27.807' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (499, 11, 2, 521, N'C', CAST(N'2021-10-10T23:33:27.810' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (500, 11, 2, 522, N'C', CAST(N'2021-10-10T23:33:27.813' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (501, 11, 2, 523, N'C', CAST(N'2021-10-10T23:33:27.813' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (502, 11, 2, 524, N'C', CAST(N'2021-10-10T23:33:27.817' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (503, 11, 2, 525, N'C', CAST(N'2021-10-10T23:33:27.833' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (504, 11, 2, 526, N'C', CAST(N'2021-10-10T23:33:27.833' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (505, 11, 2, 527, N'C', CAST(N'2021-10-10T23:33:27.837' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (506, 11, 2, 528, N'C', CAST(N'2021-10-10T23:33:27.837' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (507, 11, 2, 529, N'C', CAST(N'2021-10-10T23:33:27.837' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (508, 11, 2, 530, N'C', CAST(N'2021-10-10T23:33:27.840' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (509, 11, 2, 531, N'C', CAST(N'2021-10-10T23:33:27.840' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (510, 11, 2, 532, N'C', CAST(N'2021-10-10T23:33:27.840' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (511, 11, 2, 533, N'C', CAST(N'2021-10-10T23:33:27.840' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (512, 11, 2, 534, N'C', CAST(N'2021-10-10T23:33:27.843' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (513, 11, 2, 535, N'C', CAST(N'2021-10-10T23:33:27.843' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (514, 11, 2, 536, N'C', CAST(N'2021-10-10T23:33:27.847' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (515, 11, 2, 537, N'C', CAST(N'2021-10-10T23:33:27.857' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (516, 11, 2, 538, N'C', CAST(N'2021-10-10T23:33:27.857' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (517, 11, 2, 539, N'C', CAST(N'2021-10-10T23:33:27.860' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (518, 11, 2, 540, N'C', CAST(N'2021-10-10T23:33:27.860' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (519, 11, 2, 541, N'C', CAST(N'2021-10-10T23:33:27.860' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (520, 11, 2, 542, N'C', CAST(N'2021-10-10T23:33:27.860' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (521, 11, 2, 543, N'C', CAST(N'2021-10-10T23:33:27.863' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (522, 11, 2, 544, N'C', CAST(N'2021-10-10T23:33:27.863' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (523, 11, 2, 545, N'C', CAST(N'2021-10-10T23:33:27.863' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (524, 11, 2, 546, N'NC', CAST(N'2021-10-10T23:33:27.863' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (525, 11, 2, 547, N'C', CAST(N'2021-10-10T23:33:27.867' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (526, 11, 2, 548, N'C', CAST(N'2021-10-10T23:33:27.867' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (527, 11, 2, 549, N'C', CAST(N'2021-10-10T23:33:27.867' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (528, 11, 2, 550, N'C', CAST(N'2021-10-10T23:33:27.867' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (529, 12, 2, 503, N'C', CAST(N'2021-11-01T18:40:40.700' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (530, 12, 2, 504, N'C', CAST(N'2021-11-01T18:40:40.713' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (531, 12, 2, 505, N'C', CAST(N'2021-11-01T18:40:40.713' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (532, 12, 2, 506, N'C', CAST(N'2021-11-01T18:40:40.713' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (533, 12, 2, 507, N'C', CAST(N'2021-11-01T18:40:40.717' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (534, 12, 2, 508, N'C', CAST(N'2021-11-01T18:40:40.717' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (535, 12, 2, 509, N'C', CAST(N'2021-11-01T18:40:40.717' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (536, 12, 2, 510, N'C', CAST(N'2021-11-01T18:40:40.720' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (537, 12, 2, 511, N'C', CAST(N'2021-11-01T18:40:40.720' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (538, 12, 2, 512, N'C', CAST(N'2021-11-01T18:40:40.720' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (539, 12, 2, 513, N'C', CAST(N'2021-11-01T18:40:40.720' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (540, 12, 2, 514, N'C', CAST(N'2021-11-01T18:40:40.723' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (541, 12, 2, 515, N'C', CAST(N'2021-11-01T18:40:40.727' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (542, 12, 2, 516, N'C', CAST(N'2021-11-01T18:40:40.727' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (543, 12, 2, 517, N'C', CAST(N'2021-11-01T18:40:40.727' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (544, 12, 2, 518, N'C', CAST(N'2021-11-01T18:40:40.727' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (545, 12, 2, 519, N'C', CAST(N'2021-11-01T18:40:40.730' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (546, 12, 2, 520, N'C', CAST(N'2021-11-01T18:40:40.730' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (547, 12, 2, 521, N'C', CAST(N'2021-11-01T18:40:40.730' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (548, 12, 2, 522, N'C', CAST(N'2021-11-01T18:40:40.730' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (549, 12, 2, 523, N'C', CAST(N'2021-11-01T18:40:40.730' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (550, 12, 2, 524, N'C', CAST(N'2021-11-01T18:40:40.733' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (551, 12, 2, 525, N'C', CAST(N'2021-11-01T18:40:40.737' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (552, 12, 2, 526, N'C', CAST(N'2021-11-01T18:40:40.737' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (553, 12, 2, 527, N'C', CAST(N'2021-11-01T18:40:40.737' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (554, 12, 2, 528, N'C', CAST(N'2021-11-01T18:40:40.737' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (555, 12, 2, 529, N'C', CAST(N'2021-11-01T18:40:40.740' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (556, 12, 2, 530, N'C', CAST(N'2021-11-01T18:40:40.740' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (557, 12, 2, 531, N'C', CAST(N'2021-11-01T18:40:40.747' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (558, 12, 2, 532, N'C', CAST(N'2021-11-01T18:40:40.750' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (559, 12, 2, 533, N'C', CAST(N'2021-11-01T18:40:40.750' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (560, 12, 2, 534, N'C', CAST(N'2021-11-01T18:40:40.753' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (561, 12, 2, 535, N'C', CAST(N'2021-11-01T18:40:40.753' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (562, 12, 2, 536, N'C', CAST(N'2021-11-01T18:40:40.757' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (563, 12, 2, 537, N'C', CAST(N'2021-11-01T18:40:40.760' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (564, 12, 2, 538, N'C', CAST(N'2021-11-01T18:40:40.760' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (565, 12, 2, 539, N'C', CAST(N'2021-11-01T18:40:40.760' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (566, 12, 2, 540, N'C', CAST(N'2021-11-01T18:40:40.763' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (567, 12, 2, 541, N'C', CAST(N'2021-11-01T18:40:40.763' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (568, 12, 2, 542, N'C', CAST(N'2021-11-01T18:40:40.767' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (569, 12, 2, 543, N'C', CAST(N'2021-11-01T18:40:40.767' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (570, 12, 2, 544, N'C', CAST(N'2021-11-01T18:40:40.767' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (571, 12, 2, 545, N'C', CAST(N'2021-11-01T18:40:40.770' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (572, 12, 2, 546, N'NC', CAST(N'2021-11-01T18:40:40.770' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (573, 12, 2, 547, N'C', CAST(N'2021-11-01T18:40:40.770' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (574, 12, 2, 548, N'C', CAST(N'2021-11-01T18:40:40.773' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (575, 12, 2, 549, N'C', CAST(N'2021-11-01T18:40:40.777' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (576, 12, 2, 550, N'C', CAST(N'2021-11-01T18:40:40.780' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (577, 13, 2, 503, N'C', CAST(N'2021-11-01T19:21:34.260' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (578, 13, 2, 504, N'C', CAST(N'2021-11-01T19:21:34.260' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (579, 13, 2, 505, N'C', CAST(N'2021-11-01T19:21:34.260' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (580, 13, 2, 506, N'C', CAST(N'2021-11-01T19:21:34.260' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (581, 13, 2, 507, N'C', CAST(N'2021-11-01T19:21:34.263' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (582, 13, 2, 508, N'C', CAST(N'2021-11-01T19:21:34.263' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (583, 13, 2, 509, N'C', CAST(N'2021-11-01T19:21:34.283' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (584, 13, 2, 510, N'C', CAST(N'2021-11-01T19:21:34.283' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (585, 13, 2, 511, N'C', CAST(N'2021-11-01T19:21:34.283' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (586, 13, 2, 512, N'C', CAST(N'2021-11-01T19:21:34.297' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (587, 13, 2, 513, N'C', CAST(N'2021-11-01T19:21:34.297' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (588, 13, 2, 514, N'NC', CAST(N'2021-11-01T19:21:34.310' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (589, 13, 2, 515, N'C', CAST(N'2021-11-01T19:21:34.313' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (590, 13, 2, 516, N'C', CAST(N'2021-11-01T19:21:34.317' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (591, 13, 2, 517, N'C', CAST(N'2021-11-01T19:21:34.320' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (592, 13, 2, 518, N'C', CAST(N'2021-11-01T19:21:34.320' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (593, 13, 2, 519, N'C', CAST(N'2021-11-01T19:21:34.323' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (594, 13, 2, 520, N'C', CAST(N'2021-11-01T19:21:34.323' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (595, 13, 2, 521, N'C', CAST(N'2021-11-01T19:21:34.323' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (596, 13, 2, 522, N'C', CAST(N'2021-11-01T19:21:34.323' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (597, 13, 2, 523, N'C', CAST(N'2021-11-01T19:21:34.323' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (598, 13, 2, 524, N'C', CAST(N'2021-11-01T19:21:34.327' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (599, 13, 2, 525, N'C', CAST(N'2021-11-01T19:21:34.327' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (600, 13, 2, 526, N'NC', CAST(N'2021-11-01T19:21:34.327' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (601, 13, 2, 527, N'C', CAST(N'2021-11-01T19:21:34.330' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (602, 13, 2, 528, N'C', CAST(N'2021-11-01T19:21:34.330' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (603, 13, 2, 529, N'C', CAST(N'2021-11-01T19:21:34.333' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (604, 13, 2, 530, N'C', CAST(N'2021-11-01T19:21:34.333' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (605, 13, 2, 531, N'C', CAST(N'2021-11-01T19:21:34.333' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (606, 13, 2, 532, N'C', CAST(N'2021-11-01T19:21:34.337' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (607, 13, 2, 533, N'C', CAST(N'2021-11-01T19:21:34.337' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (608, 13, 2, 534, N'C', CAST(N'2021-11-01T19:21:34.337' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (609, 13, 2, 535, N'C', CAST(N'2021-11-01T19:21:34.340' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (610, 13, 2, 536, N'C', CAST(N'2021-11-01T19:21:34.340' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (611, 13, 2, 537, N'C', CAST(N'2021-11-01T19:21:34.340' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (612, 13, 2, 538, N'C', CAST(N'2021-11-01T19:21:34.340' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (613, 13, 2, 539, N'C', CAST(N'2021-11-01T19:21:34.340' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (614, 13, 2, 540, N'C', CAST(N'2021-11-01T19:21:34.343' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (615, 13, 2, 541, N'C', CAST(N'2021-11-01T19:21:34.343' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (616, 13, 2, 542, N'C', CAST(N'2021-11-01T19:21:34.343' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (617, 13, 2, 543, N'C', CAST(N'2021-11-01T19:21:34.343' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (618, 13, 2, 544, N'C', CAST(N'2021-11-01T19:21:34.347' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (619, 13, 2, 545, N'C', CAST(N'2021-11-01T19:21:34.347' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (620, 13, 2, 546, N'C', CAST(N'2021-11-01T19:21:34.347' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (621, 13, 2, 547, N'C', CAST(N'2021-11-01T19:21:34.350' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (622, 13, 2, 548, N'NC', CAST(N'2021-11-01T19:21:34.357' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (623, 13, 2, 549, N'C', CAST(N'2021-11-01T19:21:34.360' AS DateTime))
GO
INSERT [Proceso].[MonitoreoResultado] ([Id], [MonitoreoId], [OpeNivel], [NivelId], [Opc], [FechaRegistro]) VALUES (624, 13, 2, 550, N'C', CAST(N'2021-11-01T19:21:34.363' AS DateTime))
GO
SET IDENTITY_INSERT [Proceso].[MonitoreoResultado] OFF
GO
SET IDENTITY_INSERT [Proceso].[NotasDescriptivas] ON 
GO
INSERT [Proceso].[NotasDescriptivas] ([Id], [BloqueEvaluacionId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (187, 80, N'Aplicación de protocolos', 120, N'5', N'1.5', 1, CAST(N'2021-08-26T20:32:49.563' AS DateTime))
GO
INSERT [Proceso].[NotasDescriptivas] ([Id], [BloqueEvaluacionId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (188, 80, N'Lenguaje adecuado y claridad en la exposición del mensaje', 120, N'15', N'4.5', 1, CAST(N'2021-08-26T20:32:49.563' AS DateTime))
GO
INSERT [Proceso].[NotasDescriptivas] ([Id], [BloqueEvaluacionId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (189, 80, N'Realiza escucha activa', 120, N'20', N'6.0', 1, CAST(N'2021-08-26T20:32:49.563' AS DateTime))
GO
INSERT [Proceso].[NotasDescriptivas] ([Id], [BloqueEvaluacionId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (190, 80, N'Manejo adecuado de la llamada', 120, N'25', N'7.5', 1, CAST(N'2021-08-26T20:32:49.567' AS DateTime))
GO
INSERT [Proceso].[NotasDescriptivas] ([Id], [BloqueEvaluacionId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (191, 80, N'Atención de la llamada ', 119, N'10', N'3.0', 1, CAST(N'2021-08-26T20:32:49.567' AS DateTime))
GO
INSERT [Proceso].[NotasDescriptivas] ([Id], [BloqueEvaluacionId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (192, 80, N'Actitud de servicio y amabilidad ', 119, N'10', N'3.0', 1, CAST(N'2021-08-26T20:32:49.567' AS DateTime))
GO
INSERT [Proceso].[NotasDescriptivas] ([Id], [BloqueEvaluacionId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (193, 80, N'Manejo de tiempos de espera ', 120, N'15', N'4.5', 1, CAST(N'2021-08-26T20:32:49.567' AS DateTime))
GO
INSERT [Proceso].[NotasDescriptivas] ([Id], [BloqueEvaluacionId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (194, 81, N'Identificación del cliente y de la llamada ', 120, N'60', N'24.0', 1, CAST(N'2021-08-26T20:32:49.570' AS DateTime))
GO
INSERT [Proceso].[NotasDescriptivas] ([Id], [BloqueEvaluacionId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (195, 81, N'Información brindada al cliente', 119, N'40', N'16.0', 1, CAST(N'2021-08-26T20:32:49.570' AS DateTime))
GO
INSERT [Proceso].[NotasDescriptivas] ([Id], [BloqueEvaluacionId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (196, 82, N'Aplicación correcta del proceso establecido por negocio', 119, N'25', N'7.5', 1, CAST(N'2021-08-26T20:32:49.570' AS DateTime))
GO
INSERT [Proceso].[NotasDescriptivas] ([Id], [BloqueEvaluacionId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (197, 82, N'Escala el caso al área correspondiente', 120, N'25', N'7.5', 1, CAST(N'2021-08-26T20:32:49.590' AS DateTime))
GO
INSERT [Proceso].[NotasDescriptivas] ([Id], [BloqueEvaluacionId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (198, 82, N'Codificación', 120, N'50', N'15.0', 1, CAST(N'2021-08-26T20:32:49.590' AS DateTime))
GO
INSERT [Proceso].[NotasDescriptivas] ([Id], [BloqueEvaluacionId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10199, 10083, N'Aplicación de protocolos', 120, N'5', N'1.5', 1, CAST(N'2021-11-03T23:02:11.937' AS DateTime))
GO
INSERT [Proceso].[NotasDescriptivas] ([Id], [BloqueEvaluacionId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10200, 10083, N'Lenguaje adecuado y claridad en la exposición del mensaje', 120, N'15', N'4.5', 1, CAST(N'2021-11-03T23:02:11.953' AS DateTime))
GO
INSERT [Proceso].[NotasDescriptivas] ([Id], [BloqueEvaluacionId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10201, 10083, N'Realiza escucha activa', 120, N'20', N'6.0', 1, CAST(N'2021-11-03T23:02:11.957' AS DateTime))
GO
INSERT [Proceso].[NotasDescriptivas] ([Id], [BloqueEvaluacionId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10202, 10083, N'Manejo adecuado de la llamada', 120, N'25', N'7.5', 1, CAST(N'2021-11-03T23:02:11.960' AS DateTime))
GO
INSERT [Proceso].[NotasDescriptivas] ([Id], [BloqueEvaluacionId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10203, 10083, N'Atención de la llamada ', 119, N'10', N'3.0', 1, CAST(N'2021-11-03T23:02:11.960' AS DateTime))
GO
INSERT [Proceso].[NotasDescriptivas] ([Id], [BloqueEvaluacionId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10204, 10083, N'Actitud de servicio y amabilidad ', 119, N'10', N'3.0', 1, CAST(N'2021-11-03T23:02:11.960' AS DateTime))
GO
INSERT [Proceso].[NotasDescriptivas] ([Id], [BloqueEvaluacionId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10205, 10083, N'Manejo de tiempos de espera ', 120, N'15', N'4.5', 1, CAST(N'2021-11-03T23:02:11.963' AS DateTime))
GO
INSERT [Proceso].[NotasDescriptivas] ([Id], [BloqueEvaluacionId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10206, 10084, N'Identificación del cliente y de la llamada ', 120, N'60', N'24.0', 1, CAST(N'2021-11-03T23:02:11.963' AS DateTime))
GO
INSERT [Proceso].[NotasDescriptivas] ([Id], [BloqueEvaluacionId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10207, 10084, N'Información brindada al cliente', 119, N'40', N'16.0', 1, CAST(N'2021-11-03T23:02:11.967' AS DateTime))
GO
INSERT [Proceso].[NotasDescriptivas] ([Id], [BloqueEvaluacionId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10208, 10085, N'Aplicación correcta del proceso establecido por negocio', 119, N'25', N'7.5', 1, CAST(N'2021-11-03T23:02:11.967' AS DateTime))
GO
INSERT [Proceso].[NotasDescriptivas] ([Id], [BloqueEvaluacionId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10209, 10085, N'Escala el caso al área correspondiente', 120, N'25', N'7.5', 1, CAST(N'2021-11-03T23:02:11.967' AS DateTime))
GO
INSERT [Proceso].[NotasDescriptivas] ([Id], [BloqueEvaluacionId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10210, 10085, N'Codificación', 120, N'50', N'15.0', 1, CAST(N'2021-11-03T23:02:11.970' AS DateTime))
GO
SET IDENTITY_INSERT [Proceso].[NotasDescriptivas] OFF
GO
SET IDENTITY_INSERT [Proceso].[Notificaciones] ON 
GO
INSERT [Proceso].[Notificaciones] ([Id], [ModuloId], [UsuarioId], [IndicativoId], [Descripcion], [Flag_Visto], [FechaRegistro]) VALUES (1, 130, 8, 8, N'Se crea el monitoreo N° ', 1, CAST(N'2021-10-06T22:55:35.823' AS DateTime))
GO
INSERT [Proceso].[Notificaciones] ([Id], [ModuloId], [UsuarioId], [IndicativoId], [Descripcion], [Flag_Visto], [FechaRegistro]) VALUES (2, 130, 4, 8, N'Se crea el monitoreo N° ', 0, CAST(N'2021-10-06T22:55:43.140' AS DateTime))
GO
INSERT [Proceso].[Notificaciones] ([Id], [ModuloId], [UsuarioId], [IndicativoId], [Descripcion], [Flag_Visto], [FechaRegistro]) VALUES (3, 130, 8, 9, N'Se crea el monitoreo N° 9, el cual pasa para retroalimentación por parte del coordinador', 1, CAST(N'2021-10-09T10:17:24.380' AS DateTime))
GO
INSERT [Proceso].[Notificaciones] ([Id], [ModuloId], [UsuarioId], [IndicativoId], [Descripcion], [Flag_Visto], [FechaRegistro]) VALUES (4, 130, 5, 9, N'Se crea el monitoreo N° 9, el cual pasa para retroalimentación por parte del coordinador', 1, CAST(N'2021-10-09T10:17:24.383' AS DateTime))
GO
INSERT [Proceso].[Notificaciones] ([Id], [ModuloId], [UsuarioId], [IndicativoId], [Descripcion], [Flag_Visto], [FechaRegistro]) VALUES (5, 130, 1, 9, N'Se realiza la retroalimentación del monitoreo N° 9, el cual pasa a realizar compromisos por parte del agente', 1, CAST(N'2021-10-09T11:08:10.730' AS DateTime))
GO
INSERT [Proceso].[Notificaciones] ([Id], [ModuloId], [UsuarioId], [IndicativoId], [Descripcion], [Flag_Visto], [FechaRegistro]) VALUES (6, 130, 5, 9, N'Se realiza la retroalimentación del monitoreo N° 9, el cual pasa a realizar compromisos por parte del agente', 1, CAST(N'2021-10-09T11:08:10.733' AS DateTime))
GO
INSERT [Proceso].[Notificaciones] ([Id], [ModuloId], [UsuarioId], [IndicativoId], [Descripcion], [Flag_Visto], [FechaRegistro]) VALUES (7, 130, 3, 7, N'Se realiza el rechazo del monitoreo N° 7, el cual pasa a revisión por parte del supervisor monitor ', 1, CAST(N'2021-10-09T22:40:55.510' AS DateTime))
GO
INSERT [Proceso].[Notificaciones] ([Id], [ModuloId], [UsuarioId], [IndicativoId], [Descripcion], [Flag_Visto], [FechaRegistro]) VALUES (8, 130, 1, 9, N'Se realiza los compromisos del monitoreo N° 9 por parte del agente  ', 1, CAST(N'2021-10-10T09:30:32.257' AS DateTime))
GO
INSERT [Proceso].[Notificaciones] ([Id], [ModuloId], [UsuarioId], [IndicativoId], [Descripcion], [Flag_Visto], [FechaRegistro]) VALUES (9, 130, 8, 9, N'Se realiza los compromisos del monitoreo N° 9 por parte del agente  ', 1, CAST(N'2021-10-10T09:30:32.347' AS DateTime))
GO
INSERT [Proceso].[Notificaciones] ([Id], [ModuloId], [UsuarioId], [IndicativoId], [Descripcion], [Flag_Visto], [FechaRegistro]) VALUES (10, 130, 8, 10, N'Se crea el monitoreo N° 10, el cual pasa para retroalimentación por parte del coordinador', 1, CAST(N'2021-10-10T10:13:29.847' AS DateTime))
GO
INSERT [Proceso].[Notificaciones] ([Id], [ModuloId], [UsuarioId], [IndicativoId], [Descripcion], [Flag_Visto], [FechaRegistro]) VALUES (11, 130, 7, 10, N'Se crea el monitoreo N° 10, el cual pasa para retroalimentación por parte del coordinador', 1, CAST(N'2021-10-10T10:13:29.850' AS DateTime))
GO
INSERT [Proceso].[Notificaciones] ([Id], [ModuloId], [UsuarioId], [IndicativoId], [Descripcion], [Flag_Visto], [FechaRegistro]) VALUES (12, 130, 1, 10, N'Se realiza la retroalimentación del monitoreo N° 10, el cual pasa a realizar compromisos por parte del agente ', 1, CAST(N'2021-10-10T10:15:39.320' AS DateTime))
GO
INSERT [Proceso].[Notificaciones] ([Id], [ModuloId], [UsuarioId], [IndicativoId], [Descripcion], [Flag_Visto], [FechaRegistro]) VALUES (13, 130, 7, 10, N'Se realiza la retroalimentación del monitoreo N° 10, el cual pasa a realizar compromisos por parte del agente ', 1, CAST(N'2021-10-10T10:15:39.353' AS DateTime))
GO
INSERT [Proceso].[Notificaciones] ([Id], [ModuloId], [UsuarioId], [IndicativoId], [Descripcion], [Flag_Visto], [FechaRegistro]) VALUES (14, 130, 8, 10, N'Se realiza los compromisos del monitoreo N° 10 por parte del agente  ', 1, CAST(N'2021-10-10T10:17:24.507' AS DateTime))
GO
INSERT [Proceso].[Notificaciones] ([Id], [ModuloId], [UsuarioId], [IndicativoId], [Descripcion], [Flag_Visto], [FechaRegistro]) VALUES (15, 130, 1, 10, N'Se realiza la retroalimentación del monitoreo N° 10, el cual pasa a realizar compromisos por parte del agente ', 1, CAST(N'2021-10-10T10:19:31.723' AS DateTime))
GO
INSERT [Proceso].[Notificaciones] ([Id], [ModuloId], [UsuarioId], [IndicativoId], [Descripcion], [Flag_Visto], [FechaRegistro]) VALUES (16, 130, 7, 10, N'Se realiza la retroalimentación del monitoreo N° 10, el cual pasa a realizar compromisos por parte del agente ', 1, CAST(N'2021-10-10T10:19:31.727' AS DateTime))
GO
INSERT [Proceso].[Notificaciones] ([Id], [ModuloId], [UsuarioId], [IndicativoId], [Descripcion], [Flag_Visto], [FechaRegistro]) VALUES (17, 130, 8, 10, N'Se realiza el rechazo del monitoreo N° 10, el cual pasa a revisión por parte del agente ', 1, CAST(N'2021-10-10T10:27:09.157' AS DateTime))
GO
INSERT [Proceso].[Notificaciones] ([Id], [ModuloId], [UsuarioId], [IndicativoId], [Descripcion], [Flag_Visto], [FechaRegistro]) VALUES (18, 130, 8, 7, N'Se realiza el escalamiento del monitoreo N° 7, para la eliminación por parte del supervisor monitor ', 1, CAST(N'2021-10-10T13:15:18.150' AS DateTime))
GO
INSERT [Proceso].[Notificaciones] ([Id], [ModuloId], [UsuarioId], [IndicativoId], [Descripcion], [Flag_Visto], [FechaRegistro]) VALUES (19, 130, 3, 7, N'Se realiza el escalamiento del monitoreo N° 7, para la eliminación por parte del supervisor monitor ', 1, CAST(N'2021-10-10T13:15:18.440' AS DateTime))
GO
INSERT [Proceso].[Notificaciones] ([Id], [ModuloId], [UsuarioId], [IndicativoId], [Descripcion], [Flag_Visto], [FechaRegistro]) VALUES (20, 130, 1, 4, N'Se realiza la retroalimentación del monitoreo N° 4, el cual pasa a realizar compromisos por parte del agente ', 1, CAST(N'2021-10-10T22:48:15.020' AS DateTime))
GO
INSERT [Proceso].[Notificaciones] ([Id], [ModuloId], [UsuarioId], [IndicativoId], [Descripcion], [Flag_Visto], [FechaRegistro]) VALUES (21, 130, 4, 4, N'Se realiza la retroalimentación del monitoreo N° 4, el cual pasa a realizar compromisos por parte del agente ', 0, CAST(N'2021-10-10T22:48:15.020' AS DateTime))
GO
INSERT [Proceso].[Notificaciones] ([Id], [ModuloId], [UsuarioId], [IndicativoId], [Descripcion], [Flag_Visto], [FechaRegistro]) VALUES (22, 130, 8, 11, N'Se crea el monitoreo N° 11, el cual pasa para retroalimentación por parte del coordinador', 1, CAST(N'2021-10-10T23:33:30.263' AS DateTime))
GO
INSERT [Proceso].[Notificaciones] ([Id], [ModuloId], [UsuarioId], [IndicativoId], [Descripcion], [Flag_Visto], [FechaRegistro]) VALUES (23, 130, 6, 11, N'Se crea el monitoreo N° 11, el cual pasa para retroalimentación por parte del coordinador', 1, CAST(N'2021-10-10T23:33:30.267' AS DateTime))
GO
INSERT [Proceso].[Notificaciones] ([Id], [ModuloId], [UsuarioId], [IndicativoId], [Descripcion], [Flag_Visto], [FechaRegistro]) VALUES (24, 130, 1, 10, N'Se realiza el rechazo del monitoreo N° 10, el cual pasa a revisión por parte del administrador ', 1, CAST(N'2021-10-10T23:36:20.380' AS DateTime))
GO
INSERT [Proceso].[Notificaciones] ([Id], [ModuloId], [UsuarioId], [IndicativoId], [Descripcion], [Flag_Visto], [FechaRegistro]) VALUES (25, 130, 3, 11, N'Se realiza la retroalimentación del monitoreo N° 11, el cual pasa a realizar compromisos por parte del agente ', 1, CAST(N'2021-10-13T21:24:50.387' AS DateTime))
GO
INSERT [Proceso].[Notificaciones] ([Id], [ModuloId], [UsuarioId], [IndicativoId], [Descripcion], [Flag_Visto], [FechaRegistro]) VALUES (26, 130, 6, 11, N'Se realiza la retroalimentación del monitoreo N° 11, el cual pasa a realizar compromisos por parte del agente ', 1, CAST(N'2021-10-13T21:24:50.390' AS DateTime))
GO
INSERT [Proceso].[Notificaciones] ([Id], [ModuloId], [UsuarioId], [IndicativoId], [Descripcion], [Flag_Visto], [FechaRegistro]) VALUES (27, 130, 11, 12, N'Se crea el monitoreo N° 12, el cual pasa para retroalimentación por parte del coordinador', 1, CAST(N'2021-11-01T18:40:40.990' AS DateTime))
GO
INSERT [Proceso].[Notificaciones] ([Id], [ModuloId], [UsuarioId], [IndicativoId], [Descripcion], [Flag_Visto], [FechaRegistro]) VALUES (28, 130, 22, 12, N'Se crea el monitoreo N° 12, el cual pasa para retroalimentación por parte del coordinador', 1, CAST(N'2021-11-01T18:40:41.010' AS DateTime))
GO
INSERT [Proceso].[Notificaciones] ([Id], [ModuloId], [UsuarioId], [IndicativoId], [Descripcion], [Flag_Visto], [FechaRegistro]) VALUES (29, 130, 1, 12, N'Se realiza la retroalimentación del monitoreo N° 12, el cual pasa a realizar compromisos por parte del agente ', 1, CAST(N'2021-11-01T18:49:01.393' AS DateTime))
GO
INSERT [Proceso].[Notificaciones] ([Id], [ModuloId], [UsuarioId], [IndicativoId], [Descripcion], [Flag_Visto], [FechaRegistro]) VALUES (30, 130, 22, 12, N'Se realiza la retroalimentación del monitoreo N° 12, el cual pasa a realizar compromisos por parte del agente ', 1, CAST(N'2021-11-01T18:49:01.397' AS DateTime))
GO
INSERT [Proceso].[Notificaciones] ([Id], [ModuloId], [UsuarioId], [IndicativoId], [Descripcion], [Flag_Visto], [FechaRegistro]) VALUES (31, 130, 11, 12, N'Se realiza el rechazo del monitoreo N° 12, el cual pasa a revisión por parte del agente ', 1, CAST(N'2021-11-01T18:52:48.557' AS DateTime))
GO
INSERT [Proceso].[Notificaciones] ([Id], [ModuloId], [UsuarioId], [IndicativoId], [Descripcion], [Flag_Visto], [FechaRegistro]) VALUES (32, 130, 1, 12, N'Se realiza la retroalimentación del monitoreo N° 12, el cual pasa a realizar compromisos por parte del agente ', 1, CAST(N'2021-11-01T18:56:09.200' AS DateTime))
GO
INSERT [Proceso].[Notificaciones] ([Id], [ModuloId], [UsuarioId], [IndicativoId], [Descripcion], [Flag_Visto], [FechaRegistro]) VALUES (33, 130, 22, 12, N'Se realiza la retroalimentación del monitoreo N° 12, el cual pasa a realizar compromisos por parte del agente ', 1, CAST(N'2021-11-01T18:56:09.203' AS DateTime))
GO
INSERT [Proceso].[Notificaciones] ([Id], [ModuloId], [UsuarioId], [IndicativoId], [Descripcion], [Flag_Visto], [FechaRegistro]) VALUES (34, 130, 1, 12, N'Se realiza los compromisos del monitoreo N° 12 por parte del agente  ', 1, CAST(N'2021-11-01T18:59:03.333' AS DateTime))
GO
INSERT [Proceso].[Notificaciones] ([Id], [ModuloId], [UsuarioId], [IndicativoId], [Descripcion], [Flag_Visto], [FechaRegistro]) VALUES (35, 130, 11, 12, N'Se realiza los compromisos del monitoreo N° 12 por parte del agente  ', 1, CAST(N'2021-11-01T18:59:03.583' AS DateTime))
GO
INSERT [Proceso].[Notificaciones] ([Id], [ModuloId], [UsuarioId], [IndicativoId], [Descripcion], [Flag_Visto], [FechaRegistro]) VALUES (36, 130, 11, 13, N'Se crea el monitoreo N° 13, el cual pasa para retroalimentación por parte del coordinador', 0, CAST(N'2021-11-01T19:21:38.397' AS DateTime))
GO
INSERT [Proceso].[Notificaciones] ([Id], [ModuloId], [UsuarioId], [IndicativoId], [Descripcion], [Flag_Visto], [FechaRegistro]) VALUES (37, 130, 22, 13, N'Se crea el monitoreo N° 13, el cual pasa para retroalimentación por parte del coordinador', 0, CAST(N'2021-11-01T19:21:38.410' AS DateTime))
GO
INSERT [Proceso].[Notificaciones] ([Id], [ModuloId], [UsuarioId], [IndicativoId], [Descripcion], [Flag_Visto], [FechaRegistro]) VALUES (38, 130, 1, 10, N'Se realiza la retroalimentación del monitoreo N° 10, el cual pasa a realizar compromisos por parte del agente ', 1, CAST(N'2021-11-02T22:27:57.880' AS DateTime))
GO
INSERT [Proceso].[Notificaciones] ([Id], [ModuloId], [UsuarioId], [IndicativoId], [Descripcion], [Flag_Visto], [FechaRegistro]) VALUES (39, 130, 7, 10, N'Se realiza la retroalimentación del monitoreo N° 10, el cual pasa a realizar compromisos por parte del agente ', 1, CAST(N'2021-11-02T22:27:57.970' AS DateTime))
GO
INSERT [Proceso].[Notificaciones] ([Id], [ModuloId], [UsuarioId], [IndicativoId], [Descripcion], [Flag_Visto], [FechaRegistro]) VALUES (40, 130, 1, 10, N'Se realiza la retroalimentación del monitoreo N° 10, el cual pasa a realizar compromisos por parte del agente ', 1, CAST(N'2021-11-02T22:48:05.173' AS DateTime))
GO
INSERT [Proceso].[Notificaciones] ([Id], [ModuloId], [UsuarioId], [IndicativoId], [Descripcion], [Flag_Visto], [FechaRegistro]) VALUES (41, 130, 7, 10, N'Se realiza la retroalimentación del monitoreo N° 10, el cual pasa a realizar compromisos por parte del agente ', 1, CAST(N'2021-11-02T22:48:05.177' AS DateTime))
GO
SET IDENTITY_INSERT [Proceso].[Notificaciones] OFF
GO
SET IDENTITY_INSERT [Proceso].[PuntosEntrenamiento] ON 
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (503, 187, N'El asesor no hace uso apropiado de los guiones establecidos.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.603' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (504, 187, N'El asesor no personaliza o lo hace de manera errada.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.603' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (505, 188, N'El asesor muestra inseguridad al brindar la información.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.603' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (506, 188, N'Utiliza muletillas, frases coloquiales y/o tutea.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.607' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (507, 188, N'Utiliza tecnicismos.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.607' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (508, 188, N'Utiliza expresiones gramaticales incorrectas.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.607' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (509, 188, N'El tono de la voz no es el adecuado.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.610' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (510, 188, N'El ritmo de voz no es adecuado.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.610' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (511, 188, N'No maneja adecuadamente la dicción.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.610' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (512, 188, N'No expone sus ideas de manera organizada. No es coherente en su comunicación.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.610' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (513, 189, N'En los silencios prolongados el asesor no acompaña al cliente a través de expresiones de retroalimentación.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.610' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (514, 189, N'Vuelve a preguntar información ya suministrada  por el cliente.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.613' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (515, 190, N'El asesor interrumpe al cliente.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.613' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (516, 190, N'Culpa la gestión de un contacto anterior cuando en éste se ha realizado un procedimiento errado.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.613' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (517, 190, N'No maneja adecuadamente al cliente que propicia alargue innecesario de la llamada.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.617' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (518, 191, N'El asesor no contesta la llamada induciendo a que el cliente cuelgue. ', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.677' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (519, 191, N'El asesor no retoma la conversación en los tiempos de espera acordados, ocasionando que el cliente abandone la llamada.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.677' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (520, 191, N'El asesor cuelga la llamada.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.677' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (521, 192, N'No realiza manejo adecuado de un cliente difícil.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.680' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (522, 192, N'Solicita información al cliente y no utiliza frases de cortesía.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.680' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (523, 192, N'Demuestra desinterés al atender los requerimientos del cliente.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.680' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (524, 192, N'El asesor se comporta imperativo, manifestando imposición con el cliente.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.680' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (525, 192, N'El asesor utiliza expresiones ofensivas hacia el cliente. ', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.680' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (526, 192, N'Se muestra intolerante e impaciente con el cliente.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.680' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (527, 193, N'El asesor recibe la llamada utilizando inmediatamente el hold.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.683' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (528, 193, N'El asesor no contesta inmediatamente ingresa la llamada.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.683' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (529, 193, N'No le informa al cliente el tiempo de espera en minutos.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.683' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (530, 193, N'No retoma la llamada dentro del tiempo solicitado.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.683' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (531, 193, N'El asesor no maneja la espera con el cliente por medio de hold. ', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.687' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (532, 193, N'Se presentan tiempos muertos o silencios durante la llamada superiores a 10 seg.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.687' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (533, 193, N'La duración de los tiempos de espera son inadecuados con relación al motivo de consulta.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.690' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (534, 193, N'No agradece el tiempo de espera al retomar la llamada.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.690' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (535, 194, N'No solicita la información necesaria ni utiliza las opciones de búsqueda disponibles para ubicar al cliente en el sistema.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.690' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (536, 194, N'No confirma la información del cliente en el sistema para validar que se está haciendo la gestión en el servicio correspondiente.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.693' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (537, 194, N'No suministra el número de consulta y/o lo indica de manera errada.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.693' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (538, 195, N'No suministra información correcta y/o completa, de acuerdo al caso planteado, teniendo en cuenta lo establecido en los procedimientos y/o en los aplicativos de consulta.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.697' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (539, 195, N'No resuelve todos los requerimientos del cliente antes de transferir la llamada.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.697' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (540, 196, N'Realiza incorrectamente las validaciones establecidas en los procedimientos.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.697' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (541, 196, N'No agota todas las validaciones posibles con el cliente antes de crear un aviso de ayuda.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.697' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (542, 196, N'Realiza incorrectamente las actuaciones establecidas en los procedimientos, incluyendo utilización de aplicativos.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.700' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (543, 196, N'En el caso de existir una persona posiblemente afectada en la red, el asesor crea el aviso pero no registra correctamente el caso en SINAC.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.700' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (544, 196, N'La transferencia realizada por el asesor no es acorde con los lineamientos establecidos.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.700' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (545, 197, N'No escala el caso cuando lo amerita o lo realiza de manera incorrecta.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.700' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (546, 197, N'Escala el caso innecesariamente pudiendo solucionar en primer contacto.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.700' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (547, 198, N'El asesor no codifica la llamada o lo realiza de manera errada.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.703' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (548, 198, N'Registra las observaciones de forma incompleta e incorrecta, en el aplicativo correspondiente, según lo establecido.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.703' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (549, 198, N'La ortografía de la información digitada en los aplicativos es incorrecta.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.703' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (550, 198, N'La redacción de la información digitada en los aplicativos es incorrecta.', 120, N'0', N'0', 1, CAST(N'2021-08-26T20:32:49.703' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10551, 10199, N'El asesor no hace uso apropiado de los guiones establecidos.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:11.993' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10552, 10199, N'El asesor no personaliza o lo hace de manera errada.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.007' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10553, 10200, N'El asesor muestra inseguridad al brindar la información.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.010' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10554, 10200, N'Utiliza muletillas, frases coloquiales y/o tutea.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.020' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10555, 10200, N'Utiliza tecnicismos.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.020' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10556, 10200, N'Utiliza expresiones gramaticales incorrectas.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.020' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10557, 10200, N'El tono de la voz no es el adecuado.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.033' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10558, 10200, N'El ritmo de voz no es adecuado.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.037' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10559, 10200, N'No maneja adecuadamente la dicción.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.037' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10560, 10200, N'No expone sus ideas de manera organizada. No es coherente en su comunicación.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.037' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10561, 10201, N'En los silencios prolongados el asesor no acompaña al cliente a través de expresiones de retroalimentación.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.040' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10562, 10201, N'Vuelve a preguntar información ya suministrada  por el cliente.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.040' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10563, 10202, N'El asesor interrumpe al cliente.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.040' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10564, 10202, N'Culpa la gestión de un contacto anterior cuando en éste se ha realizado un procedimiento errado.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.040' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10565, 10202, N'No maneja adecuadamente al cliente que propicia alargue innecesario de la llamada.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.043' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10566, 10203, N'El asesor no contesta la llamada induciendo a que el cliente cuelgue. ', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.043' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10567, 10203, N'El asesor no retoma la conversación en los tiempos de espera acordados, ocasionando que el cliente abandone la llamada.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.043' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10568, 10203, N'El asesor cuelga la llamada.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.057' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10569, 10204, N'No realiza manejo adecuado de un cliente difícil.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.057' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10570, 10204, N'Solicita información al cliente y no utiliza frases de cortesía.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.060' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10571, 10204, N'Demuestra desinterés al atender los requerimientos del cliente.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.060' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10572, 10204, N'El asesor se comporta imperativo, manifestando imposición con el cliente.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.060' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10573, 10204, N'El asesor utiliza expresiones ofensivas hacia el cliente. ', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.060' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10574, 10204, N'Se muestra intolerante e impaciente con el cliente.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.063' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10575, 10205, N'El asesor recibe la llamada utilizando inmediatamente el hold.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.063' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10576, 10205, N'El asesor no contesta inmediatamente ingresa la llamada.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.083' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10577, 10205, N'No le informa al cliente el tiempo de espera en minutos.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.083' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10578, 10205, N'No retoma la llamada dentro del tiempo solicitado.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.083' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10579, 10205, N'El asesor no maneja la espera con el cliente por medio de hold. ', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.087' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10580, 10205, N'Se presentan tiempos muertos o silencios durante la llamada superiores a 10 seg.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.087' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10581, 10205, N'La duración de los tiempos de espera son inadecuados con relación al motivo de consulta.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.090' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10582, 10205, N'No agradece el tiempo de espera al retomar la llamada.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.090' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10583, 10206, N'No solicita la información necesaria ni utiliza las opciones de búsqueda disponibles para ubicar al cliente en el sistema.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.090' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10584, 10206, N'No confirma la información del cliente en el sistema para validar que se está haciendo la gestión en el servicio correspondiente.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.090' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10585, 10206, N'No suministra el número de consulta y/o lo indica de manera errada.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.093' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10586, 10207, N'No suministra información correcta y/o completa, de acuerdo al caso planteado, teniendo en cuenta lo establecido en los procedimientos y/o en los aplicativos de consulta.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.093' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10587, 10207, N'No resuelve todos los requerimientos del cliente antes de transferir la llamada.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.097' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10588, 10208, N'Realiza incorrectamente las validaciones establecidas en los procedimientos.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.110' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10589, 10208, N'No agota todas las validaciones posibles con el cliente antes de crear un aviso de ayuda.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.110' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10590, 10208, N'Realiza incorrectamente las actuaciones establecidas en los procedimientos, incluyendo utilización de aplicativos.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.113' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10591, 10208, N'En el caso de existir una persona posiblemente afectada en la red, el asesor crea el aviso pero no registra correctamente el caso en SINAC.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.113' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10592, 10208, N'La transferencia realizada por el asesor no es acorde con los lineamientos establecidos.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.113' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10593, 10209, N'No escala el caso cuando lo amerita o lo realiza de manera incorrecta.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.117' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10594, 10209, N'Escala el caso innecesariamente pudiendo solucionar en primer contacto.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.117' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10595, 10210, N'El asesor no codifica la llamada o lo realiza de manera errada.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.117' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10596, 10210, N'Registra las observaciones de forma incompleta e incorrecta, en el aplicativo correspondiente, según lo establecido.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.117' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10597, 10210, N'La ortografía de la información digitada en los aplicativos es incorrecta.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.120' AS DateTime))
GO
INSERT [Proceso].[PuntosEntrenamiento] ([Id], [NotasDescriptivasId], [Descripcion], [EstadoProcesoId], [Peso], [PesoPonderado], [Estado], [FechaRegistro]) VALUES (10598, 10210, N'La redacción de la información digitada en los aplicativos es incorrecta.', 120, N'0', N'0', 1, CAST(N'2021-11-03T23:02:12.120' AS DateTime))
GO
SET IDENTITY_INSERT [Proceso].[PuntosEntrenamiento] OFF
GO
SET IDENTITY_INSERT [Proceso].[UsuarioCampana] ON 
GO
INSERT [Proceso].[UsuarioCampana] ([Id], [CampanaId], [UsuarioId], [ValueRolId], [Estado]) VALUES (1, 1, 1, 1, 1)
GO
INSERT [Proceso].[UsuarioCampana] ([Id], [CampanaId], [UsuarioId], [ValueRolId], [Estado]) VALUES (2, 1, 2, 1, 1)
GO
INSERT [Proceso].[UsuarioCampana] ([Id], [CampanaId], [UsuarioId], [ValueRolId], [Estado]) VALUES (3, 1, 3, 2, 1)
GO
INSERT [Proceso].[UsuarioCampana] ([Id], [CampanaId], [UsuarioId], [ValueRolId], [Estado]) VALUES (4, 3, 1, 3, 0)
GO
INSERT [Proceso].[UsuarioCampana] ([Id], [CampanaId], [UsuarioId], [ValueRolId], [Estado]) VALUES (5, 1, 4, 5, 1)
GO
INSERT [Proceso].[UsuarioCampana] ([Id], [CampanaId], [UsuarioId], [ValueRolId], [Estado]) VALUES (6, 1, 5, 5, 1)
GO
INSERT [Proceso].[UsuarioCampana] ([Id], [CampanaId], [UsuarioId], [ValueRolId], [Estado]) VALUES (7, 1, 6, 3, 1)
GO
INSERT [Proceso].[UsuarioCampana] ([Id], [CampanaId], [UsuarioId], [ValueRolId], [Estado]) VALUES (8, 1, 7, 5, 1)
GO
INSERT [Proceso].[UsuarioCampana] ([Id], [CampanaId], [UsuarioId], [ValueRolId], [Estado]) VALUES (9, 1, 8, 4, 1)
GO
INSERT [Proceso].[UsuarioCampana] ([Id], [CampanaId], [UsuarioId], [ValueRolId], [Estado]) VALUES (10, 1, 9, 6, 1)
GO
INSERT [Proceso].[UsuarioCampana] ([Id], [CampanaId], [UsuarioId], [ValueRolId], [Estado]) VALUES (11, 1, 10, 5, 1)
GO
INSERT [Proceso].[UsuarioCampana] ([Id], [CampanaId], [UsuarioId], [ValueRolId], [Estado]) VALUES (12, 1, 11, 4, 1)
GO
INSERT [Proceso].[UsuarioCampana] ([Id], [CampanaId], [UsuarioId], [ValueRolId], [Estado]) VALUES (13, 1, 12, 5, 1)
GO
INSERT [Proceso].[UsuarioCampana] ([Id], [CampanaId], [UsuarioId], [ValueRolId], [Estado]) VALUES (14, 2, 12, 5, 0)
GO
INSERT [Proceso].[UsuarioCampana] ([Id], [CampanaId], [UsuarioId], [ValueRolId], [Estado]) VALUES (15, 2, 13, 5, 1)
GO
INSERT [Proceso].[UsuarioCampana] ([Id], [CampanaId], [UsuarioId], [ValueRolId], [Estado]) VALUES (16, 2, 14, 5, 1)
GO
INSERT [Proceso].[UsuarioCampana] ([Id], [CampanaId], [UsuarioId], [ValueRolId], [Estado]) VALUES (17, 2, 15, 5, 1)
GO
INSERT [Proceso].[UsuarioCampana] ([Id], [CampanaId], [UsuarioId], [ValueRolId], [Estado]) VALUES (18, 2, 16, 5, 1)
GO
INSERT [Proceso].[UsuarioCampana] ([Id], [CampanaId], [UsuarioId], [ValueRolId], [Estado]) VALUES (19, 2, 17, 5, 1)
GO
INSERT [Proceso].[UsuarioCampana] ([Id], [CampanaId], [UsuarioId], [ValueRolId], [Estado]) VALUES (20, 2, 18, 4, 1)
GO
INSERT [Proceso].[UsuarioCampana] ([Id], [CampanaId], [UsuarioId], [ValueRolId], [Estado]) VALUES (21, 2, 19, 5, 1)
GO
INSERT [Proceso].[UsuarioCampana] ([Id], [CampanaId], [UsuarioId], [ValueRolId], [Estado]) VALUES (22, 2, 20, 5, 1)
GO
INSERT [Proceso].[UsuarioCampana] ([Id], [CampanaId], [UsuarioId], [ValueRolId], [Estado]) VALUES (23, 2, 21, 5, 1)
GO
INSERT [Proceso].[UsuarioCampana] ([Id], [CampanaId], [UsuarioId], [ValueRolId], [Estado]) VALUES (24, 3, 3, 5, 0)
GO
INSERT [Proceso].[UsuarioCampana] ([Id], [CampanaId], [UsuarioId], [ValueRolId], [Estado]) VALUES (25, 2, 3, 5, 1)
GO
INSERT [Proceso].[UsuarioCampana] ([Id], [CampanaId], [UsuarioId], [ValueRolId], [Estado]) VALUES (26, 1, 22, 5, 1)
GO
INSERT [Proceso].[UsuarioCampana] ([Id], [CampanaId], [UsuarioId], [ValueRolId], [Estado]) VALUES (27, 1, 23, 3, 1)
GO
SET IDENTITY_INSERT [Proceso].[UsuarioCampana] OFF
GO
SET IDENTITY_INSERT [Seguridad].[HistoricoPassword] ON 
GO
INSERT [Seguridad].[HistoricoPassword] ([Id], [UsuarioId], [IP], [OpcionPasswordId], [FechaRegistro]) VALUES (1, 4, N'192.168.20.20', 73, CAST(N'2021-09-16T22:37:58.333' AS DateTime))
GO
INSERT [Seguridad].[HistoricoPassword] ([Id], [UsuarioId], [IP], [OpcionPasswordId], [FechaRegistro]) VALUES (2, 4, N'192.168.20.20', 73, CAST(N'2021-09-16T22:39:25.343' AS DateTime))
GO
INSERT [Seguridad].[HistoricoPassword] ([Id], [UsuarioId], [IP], [OpcionPasswordId], [FechaRegistro]) VALUES (3, 5, N'192.168.20.20', 73, CAST(N'2021-09-16T23:15:57.010' AS DateTime))
GO
SET IDENTITY_INSERT [Seguridad].[HistoricoPassword] OFF
GO
SET IDENTITY_INSERT [Seguridad].[Pagina] ON 
GO
INSERT [Seguridad].[Pagina] ([Id], [PadreId], [Nombre], [Descripcion], [Orden], [Color], [Url], [Imagen], [TipoMenuId], [FechaCreacion]) VALUES (1, NULL, N'FORMULARIOS', N'PANEL DE ADMINISTRACION DE FORMULARIOS PARA UN MONITOREO DE CALIDAD', 1, 3, N'/View/Process/Formularios.aspx', N'list-alt', 112, CAST(N'2021-07-02T09:59:50.120' AS DateTime))
GO
INSERT [Seguridad].[Pagina] ([Id], [PadreId], [Nombre], [Descripcion], [Orden], [Color], [Url], [Imagen], [TipoMenuId], [FechaCreacion]) VALUES (2, NULL, N'MONITOREO', N'PANEL DE ADMINISTRACION DE MONITOREOS', 2, 2, N'/View/Process/Monitoreo.aspx', N'search-plus', 112, CAST(N'2021-07-16T17:39:10.827' AS DateTime))
GO
SET IDENTITY_INSERT [Seguridad].[Pagina] OFF
GO
SET IDENTITY_INSERT [Seguridad].[PermisoPagina] ON 
GO
INSERT [Seguridad].[PermisoPagina] ([Id], [RolId], [ValueRol], [CampanaId], [PaginaId], [Visible], [FechaCreacion]) VALUES (1, 1, 1, 1, 1, 1, CAST(N'2021-07-02T13:17:40.550' AS DateTime))
GO
INSERT [Seguridad].[PermisoPagina] ([Id], [RolId], [ValueRol], [CampanaId], [PaginaId], [Visible], [FechaCreacion]) VALUES (2, 1, 1, 1, 2, 1, CAST(N'2021-07-16T17:40:50.120' AS DateTime))
GO
INSERT [Seguridad].[PermisoPagina] ([Id], [RolId], [ValueRol], [CampanaId], [PaginaId], [Visible], [FechaCreacion]) VALUES (3, 1, 1, 2, 1, 1, CAST(N'2021-07-16T20:35:53.747' AS DateTime))
GO
INSERT [Seguridad].[PermisoPagina] ([Id], [RolId], [ValueRol], [CampanaId], [PaginaId], [Visible], [FechaCreacion]) VALUES (4, 1, 1, 2, 2, 1, CAST(N'2021-07-16T20:36:06.030' AS DateTime))
GO
INSERT [Seguridad].[PermisoPagina] ([Id], [RolId], [ValueRol], [CampanaId], [PaginaId], [Visible], [FechaCreacion]) VALUES (5, 5, 5, 1, 2, 1, CAST(N'2021-09-16T22:41:12.627' AS DateTime))
GO
INSERT [Seguridad].[PermisoPagina] ([Id], [RolId], [ValueRol], [CampanaId], [PaginaId], [Visible], [FechaCreacion]) VALUES (6, 2, 2, 1, 2, 1, CAST(N'2021-09-19T17:40:59.057' AS DateTime))
GO
INSERT [Seguridad].[PermisoPagina] ([Id], [RolId], [ValueRol], [CampanaId], [PaginaId], [Visible], [FechaCreacion]) VALUES (7, 3, 3, 1, 2, 1, CAST(N'2021-09-19T17:41:16.037' AS DateTime))
GO
INSERT [Seguridad].[PermisoPagina] ([Id], [RolId], [ValueRol], [CampanaId], [PaginaId], [Visible], [FechaCreacion]) VALUES (8, 4, 4, 1, 2, 1, CAST(N'2021-09-19T17:41:34.190' AS DateTime))
GO
INSERT [Seguridad].[PermisoPagina] ([Id], [RolId], [ValueRol], [CampanaId], [PaginaId], [Visible], [FechaCreacion]) VALUES (9, 6, 6, 1, 2, 1, CAST(N'2021-10-03T16:09:36.360' AS DateTime))
GO
INSERT [Seguridad].[PermisoPagina] ([Id], [RolId], [ValueRol], [CampanaId], [PaginaId], [Visible], [FechaCreacion]) VALUES (10, 5, 5, 2, 2, 1, CAST(N'2021-10-20T23:18:39.170' AS DateTime))
GO
INSERT [Seguridad].[PermisoPagina] ([Id], [RolId], [ValueRol], [CampanaId], [PaginaId], [Visible], [FechaCreacion]) VALUES (11, 2, 2, 1, 1, 1, CAST(N'2021-10-24T17:05:08.313' AS DateTime))
GO
INSERT [Seguridad].[PermisoPagina] ([Id], [RolId], [ValueRol], [CampanaId], [PaginaId], [Visible], [FechaCreacion]) VALUES (12, 3, 3, 1, 1, 0, CAST(N'2021-10-24T17:05:17.933' AS DateTime))
GO
INSERT [Seguridad].[PermisoPagina] ([Id], [RolId], [ValueRol], [CampanaId], [PaginaId], [Visible], [FechaCreacion]) VALUES (13, 1, 1, 3, 1, 1, CAST(N'2021-10-24T18:44:12.527' AS DateTime))
GO
INSERT [Seguridad].[PermisoPagina] ([Id], [RolId], [ValueRol], [CampanaId], [PaginaId], [Visible], [FechaCreacion]) VALUES (14, 2, 2, 3, 1, 1, CAST(N'2021-10-24T18:44:12.530' AS DateTime))
GO
INSERT [Seguridad].[PermisoPagina] ([Id], [RolId], [ValueRol], [CampanaId], [PaginaId], [Visible], [FechaCreacion]) VALUES (15, 3, 3, 3, 1, 0, CAST(N'2021-10-24T18:44:12.530' AS DateTime))
GO
INSERT [Seguridad].[PermisoPagina] ([Id], [RolId], [ValueRol], [CampanaId], [PaginaId], [Visible], [FechaCreacion]) VALUES (16, 1, 1, 3, 2, 1, CAST(N'2021-10-24T18:44:12.530' AS DateTime))
GO
INSERT [Seguridad].[PermisoPagina] ([Id], [RolId], [ValueRol], [CampanaId], [PaginaId], [Visible], [FechaCreacion]) VALUES (17, 2, 2, 3, 2, 1, CAST(N'2021-10-24T18:44:12.530' AS DateTime))
GO
INSERT [Seguridad].[PermisoPagina] ([Id], [RolId], [ValueRol], [CampanaId], [PaginaId], [Visible], [FechaCreacion]) VALUES (18, 3, 3, 3, 2, 1, CAST(N'2021-10-24T18:44:12.530' AS DateTime))
GO
INSERT [Seguridad].[PermisoPagina] ([Id], [RolId], [ValueRol], [CampanaId], [PaginaId], [Visible], [FechaCreacion]) VALUES (19, 4, 4, 3, 2, 1, CAST(N'2021-10-24T18:44:12.530' AS DateTime))
GO
INSERT [Seguridad].[PermisoPagina] ([Id], [RolId], [ValueRol], [CampanaId], [PaginaId], [Visible], [FechaCreacion]) VALUES (20, 5, 5, 3, 2, 1, CAST(N'2021-10-24T18:44:12.530' AS DateTime))
GO
INSERT [Seguridad].[PermisoPagina] ([Id], [RolId], [ValueRol], [CampanaId], [PaginaId], [Visible], [FechaCreacion]) VALUES (21, 6, 6, 3, 2, 1, CAST(N'2021-10-24T18:44:12.530' AS DateTime))
GO
INSERT [Seguridad].[PermisoPagina] ([Id], [RolId], [ValueRol], [CampanaId], [PaginaId], [Visible], [FechaCreacion]) VALUES (22, 1, 1, 4, 1, 1, CAST(N'2021-10-24T21:55:11.400' AS DateTime))
GO
INSERT [Seguridad].[PermisoPagina] ([Id], [RolId], [ValueRol], [CampanaId], [PaginaId], [Visible], [FechaCreacion]) VALUES (23, 2, 2, 4, 1, 1, CAST(N'2021-10-24T21:55:11.490' AS DateTime))
GO
INSERT [Seguridad].[PermisoPagina] ([Id], [RolId], [ValueRol], [CampanaId], [PaginaId], [Visible], [FechaCreacion]) VALUES (24, 3, 3, 4, 1, 0, CAST(N'2021-10-24T21:55:11.490' AS DateTime))
GO
INSERT [Seguridad].[PermisoPagina] ([Id], [RolId], [ValueRol], [CampanaId], [PaginaId], [Visible], [FechaCreacion]) VALUES (25, 1, 1, 4, 2, 1, CAST(N'2021-10-24T21:55:11.490' AS DateTime))
GO
INSERT [Seguridad].[PermisoPagina] ([Id], [RolId], [ValueRol], [CampanaId], [PaginaId], [Visible], [FechaCreacion]) VALUES (26, 2, 2, 4, 2, 1, CAST(N'2021-10-24T21:55:11.490' AS DateTime))
GO
INSERT [Seguridad].[PermisoPagina] ([Id], [RolId], [ValueRol], [CampanaId], [PaginaId], [Visible], [FechaCreacion]) VALUES (27, 3, 3, 4, 2, 1, CAST(N'2021-10-24T21:55:11.493' AS DateTime))
GO
INSERT [Seguridad].[PermisoPagina] ([Id], [RolId], [ValueRol], [CampanaId], [PaginaId], [Visible], [FechaCreacion]) VALUES (28, 4, 4, 4, 2, 1, CAST(N'2021-10-24T21:55:11.493' AS DateTime))
GO
INSERT [Seguridad].[PermisoPagina] ([Id], [RolId], [ValueRol], [CampanaId], [PaginaId], [Visible], [FechaCreacion]) VALUES (29, 5, 5, 4, 2, 1, CAST(N'2021-10-24T21:55:11.493' AS DateTime))
GO
INSERT [Seguridad].[PermisoPagina] ([Id], [RolId], [ValueRol], [CampanaId], [PaginaId], [Visible], [FechaCreacion]) VALUES (30, 6, 6, 4, 2, 1, CAST(N'2021-10-24T21:55:11.493' AS DateTime))
GO
SET IDENTITY_INSERT [Seguridad].[PermisoPagina] OFF
GO
SET IDENTITY_INSERT [Seguridad].[Rol] ON 
GO
INSERT [Seguridad].[Rol] ([Id], [CampanaId], [ValueRolId], [Nombre], [Estado], [FechaRegistro]) VALUES (1, 1, 1, N'ADMINISTRADOR', 1, CAST(N'2021-05-25T23:00:50.457' AS DateTime))
GO
INSERT [Seguridad].[Rol] ([Id], [CampanaId], [ValueRolId], [Nombre], [Estado], [FechaRegistro]) VALUES (2, 1, 2, N'SUPERVISOR MONITOR', 1, CAST(N'2021-05-25T23:01:11.580' AS DateTime))
GO
INSERT [Seguridad].[Rol] ([Id], [CampanaId], [ValueRolId], [Nombre], [Estado], [FechaRegistro]) VALUES (3, 1, 3, N'MONITOR', 1, CAST(N'2021-05-25T23:01:26.007' AS DateTime))
GO
INSERT [Seguridad].[Rol] ([Id], [CampanaId], [ValueRolId], [Nombre], [Estado], [FechaRegistro]) VALUES (4, 1, 4, N'COORDINADOR', 1, CAST(N'2021-05-25T23:02:09.553' AS DateTime))
GO
INSERT [Seguridad].[Rol] ([Id], [CampanaId], [ValueRolId], [Nombre], [Estado], [FechaRegistro]) VALUES (5, 1, 5, N'AGENTE', 1, CAST(N'2021-05-25T23:02:20.237' AS DateTime))
GO
INSERT [Seguridad].[Rol] ([Id], [CampanaId], [ValueRolId], [Nombre], [Estado], [FechaRegistro]) VALUES (6, 1, 6, N'CLIENTE', 1, CAST(N'2021-05-25T23:02:34.760' AS DateTime))
GO
INSERT [Seguridad].[Rol] ([Id], [CampanaId], [ValueRolId], [Nombre], [Estado], [FechaRegistro]) VALUES (7, 2, 1, N'ADMINISTRADORES', 1, CAST(N'2021-05-26T12:50:05.053' AS DateTime))
GO
INSERT [Seguridad].[Rol] ([Id], [CampanaId], [ValueRolId], [Nombre], [Estado], [FechaRegistro]) VALUES (8, 2, 2, N'CORDINADOR EVALUADOR', 1, CAST(N'2021-05-26T12:50:07.783' AS DateTime))
GO
INSERT [Seguridad].[Rol] ([Id], [CampanaId], [ValueRolId], [Nombre], [Estado], [FechaRegistro]) VALUES (9, 2, 3, N'EVALUADOR', 1, CAST(N'2021-05-26T12:50:22.827' AS DateTime))
GO
INSERT [Seguridad].[Rol] ([Id], [CampanaId], [ValueRolId], [Nombre], [Estado], [FechaRegistro]) VALUES (10, 2, 4, N'JEFE OPERACION', 1, CAST(N'2021-05-26T12:50:27.457' AS DateTime))
GO
INSERT [Seguridad].[Rol] ([Id], [CampanaId], [ValueRolId], [Nombre], [Estado], [FechaRegistro]) VALUES (11, 2, 5, N'ANALISTAS', 1, CAST(N'2021-05-26T12:51:37.240' AS DateTime))
GO
INSERT [Seguridad].[Rol] ([Id], [CampanaId], [ValueRolId], [Nombre], [Estado], [FechaRegistro]) VALUES (12, 2, 6, N'DUEÑO', 1, CAST(N'2021-05-26T12:51:38.340' AS DateTime))
GO
INSERT [Seguridad].[Rol] ([Id], [CampanaId], [ValueRolId], [Nombre], [Estado], [FechaRegistro]) VALUES (13, 3, 1, N'ADMINISTRADORSITO', 1, CAST(N'2021-07-16T21:36:03.037' AS DateTime))
GO
INSERT [Seguridad].[Rol] ([Id], [CampanaId], [ValueRolId], [Nombre], [Estado], [FechaRegistro]) VALUES (14, 3, 2, N'MONITOR', 1, CAST(N'2021-07-16T21:36:03.040' AS DateTime))
GO
INSERT [Seguridad].[Rol] ([Id], [CampanaId], [ValueRolId], [Nombre], [Estado], [FechaRegistro]) VALUES (15, 3, 3, N'FORMADOR', 1, CAST(N'2021-07-16T21:36:03.053' AS DateTime))
GO
INSERT [Seguridad].[Rol] ([Id], [CampanaId], [ValueRolId], [Nombre], [Estado], [FechaRegistro]) VALUES (16, 3, 4, N'COORDINADORSITO', 1, CAST(N'2021-07-16T21:36:03.053' AS DateTime))
GO
INSERT [Seguridad].[Rol] ([Id], [CampanaId], [ValueRolId], [Nombre], [Estado], [FechaRegistro]) VALUES (17, 3, 5, N'AGENTESITO', 1, CAST(N'2021-07-16T21:36:03.057' AS DateTime))
GO
INSERT [Seguridad].[Rol] ([Id], [CampanaId], [ValueRolId], [Nombre], [Estado], [FechaRegistro]) VALUES (18, 3, 6, N'CLIENTESITO', 1, CAST(N'2021-07-16T21:36:03.057' AS DateTime))
GO
INSERT [Seguridad].[Rol] ([Id], [CampanaId], [ValueRolId], [Nombre], [Estado], [FechaRegistro]) VALUES (19, 4, 1, N'ADMINISTRADOR GT', 1, CAST(N'2021-10-24T21:55:11.260' AS DateTime))
GO
INSERT [Seguridad].[Rol] ([Id], [CampanaId], [ValueRolId], [Nombre], [Estado], [FechaRegistro]) VALUES (20, 4, 2, N'SUPERVISOR MONITOR GT', 1, CAST(N'2021-10-24T21:55:11.317' AS DateTime))
GO
INSERT [Seguridad].[Rol] ([Id], [CampanaId], [ValueRolId], [Nombre], [Estado], [FechaRegistro]) VALUES (21, 4, 3, N'MONITOR GT', 1, CAST(N'2021-10-24T21:55:11.320' AS DateTime))
GO
INSERT [Seguridad].[Rol] ([Id], [CampanaId], [ValueRolId], [Nombre], [Estado], [FechaRegistro]) VALUES (22, 4, 4, N'COORDINADOR GT', 1, CAST(N'2021-10-24T21:55:11.320' AS DateTime))
GO
INSERT [Seguridad].[Rol] ([Id], [CampanaId], [ValueRolId], [Nombre], [Estado], [FechaRegistro]) VALUES (23, 4, 5, N'AGENTE GT', 1, CAST(N'2021-10-24T21:55:11.320' AS DateTime))
GO
INSERT [Seguridad].[Rol] ([Id], [CampanaId], [ValueRolId], [Nombre], [Estado], [FechaRegistro]) VALUES (24, 4, 6, N'CLIENTE GT', 1, CAST(N'2021-10-24T21:55:11.320' AS DateTime))
GO
SET IDENTITY_INSERT [Seguridad].[Rol] OFF
GO
SET IDENTITY_INSERT [Seguridad].[Usuario] ON 
GO
INSERT [Seguridad].[Usuario] ([Id], [Documento], [Nombres], [Apellidos], [Password], [Correo], [Gestionable], [CambioPassword], [FechaPassword], [Estado], [FechaRegistro], [RolId], [ColorId]) VALUES (1, N'79884249', N'GERMAN ALEJANDRO', N'RODRIGUEZ RODRIGUEZ', N'9ed78e8cc84935411532ec77cd5112239dc058b5b58e4d800acba3b974e2f0a7', N'NEOGERMAX@GMAIL.COM', 1, 0, CAST(N'2021-06-15T20:48:03.220' AS DateTime), 1, CAST(N'2021-05-16T23:29:42.800' AS DateTime), 1, NULL)
GO
INSERT [Seguridad].[Usuario] ([Id], [Documento], [Nombres], [Apellidos], [Password], [Correo], [Gestionable], [CambioPassword], [FechaPassword], [Estado], [FechaRegistro], [RolId], [ColorId]) VALUES (2, N'80159214', N'JOHAN JAVIER', N'ARDILA MUÑOZ', N'41056c34f9647c264798c1b41a3d8b9d65ad5da2d5082edb3f8eda288108582a', N'JOHAN.ARDILA@QAVISION.COM.CO', 0, 0, CAST(N'2021-06-15T20:24:47.547' AS DateTime), 1, CAST(N'2021-05-20T20:45:20.700' AS DateTime), 1, NULL)
GO
INSERT [Seguridad].[Usuario] ([Id], [Documento], [Nombres], [Apellidos], [Password], [Correo], [Gestionable], [CambioPassword], [FechaPassword], [Estado], [FechaRegistro], [RolId], [ColorId]) VALUES (3, N'1016002778', N'TATIANA FERNANDA', N'QUINTERO', N'41056c34f9647c264798c1b41a3d8b9d65ad5da2d5082edb3f8eda288108582a', N'TAFEQUI87@LIVE.COM', 0, 0, CAST(N'2021-07-01T11:37:09.920' AS DateTime), 1, CAST(N'2021-07-01T11:36:00.883' AS DateTime), 0, 98)
GO
INSERT [Seguridad].[Usuario] ([Id], [Documento], [Nombres], [Apellidos], [Password], [Correo], [Gestionable], [CambioPassword], [FechaPassword], [Estado], [FechaRegistro], [RolId], [ColorId]) VALUES (4, N'1019991259', N'OMAR ANDRES', N'RODRIGUEZ QUINTERO', N'41056c34f9647c264798c1b41a3d8b9d65ad5da2d5082edb3f8eda288108582a', N'NEOGERMAX@GMAIL.COM', 0, 0, CAST(N'2021-09-16T22:39:25.060' AS DateTime), 1, CAST(N'2021-07-17T13:30:23.310' AS DateTime), 5, 94)
GO
INSERT [Seguridad].[Usuario] ([Id], [Documento], [Nombres], [Apellidos], [Password], [Correo], [Gestionable], [CambioPassword], [FechaPassword], [Estado], [FechaRegistro], [RolId], [ColorId]) VALUES (5, N'1016090569', N'BRIANA GISSEL', N'RODRIGUEZ QUINTERO', N'41056c34f9647c264798c1b41a3d8b9d65ad5da2d5082edb3f8eda288108582a', N'NEOGERMAX@GMAIL.COM', 0, 0, CAST(N'2021-09-16T23:15:56.950' AS DateTime), 1, CAST(N'2021-07-17T13:30:23.417' AS DateTime), 5, 94)
GO
INSERT [Seguridad].[Usuario] ([Id], [Documento], [Nombres], [Apellidos], [Password], [Correo], [Gestionable], [CambioPassword], [FechaPassword], [Estado], [FechaRegistro], [RolId], [ColorId]) VALUES (6, N'1234567892', N'KATALINA ANDREA', N'MORALES DIAZ', N'41056c34f9647c264798c1b41a3d8b9d65ad5da2d5082edb3f8eda288108582a', N'NOAPLICA@CORREO.COM', 0, 0, NULL, 1, CAST(N'2021-07-17T13:30:23.420' AS DateTime), 0, 94)
GO
INSERT [Seguridad].[Usuario] ([Id], [Documento], [Nombres], [Apellidos], [Password], [Correo], [Gestionable], [CambioPassword], [FechaPassword], [Estado], [FechaRegistro], [RolId], [ColorId]) VALUES (7, N'1234567891', N'BRAYAN ANDRES', N'GONZALEZ PRIETO', N'41056c34f9647c264798c1b41a3d8b9d65ad5da2d5082edb3f8eda288108582a', N'NOAPLICA@CORREO.COM', 0, 0, NULL, 1, CAST(N'2021-07-17T13:30:23.423' AS DateTime), 0, 94)
GO
INSERT [Seguridad].[Usuario] ([Id], [Documento], [Nombres], [Apellidos], [Password], [Correo], [Gestionable], [CambioPassword], [FechaPassword], [Estado], [FechaRegistro], [RolId], [ColorId]) VALUES (8, N'1234567893', N'MARIO ANDRES', N'SABATTO GOMEZ', N'41056c34f9647c264798c1b41a3d8b9d65ad5da2d5082edb3f8eda288108582a', N'NEOGERMAX@GMAIL.COM', 0, 0, NULL, 1, CAST(N'2021-07-17T13:42:36.453' AS DateTime), 0, 94)
GO
INSERT [Seguridad].[Usuario] ([Id], [Documento], [Nombres], [Apellidos], [Password], [Correo], [Gestionable], [CambioPassword], [FechaPassword], [Estado], [FechaRegistro], [RolId], [ColorId]) VALUES (9, N'1234567894', N'ADRIANA MILENA', N'ARBOLEDA JIMENEZ', N'41056c34f9647c264798c1b41a3d8b9d65ad5da2d5082edb3f8eda288108582a', N'NEOGERMAX@GMAIL.COM', 0, 0, NULL, 1, CAST(N'2021-10-03T08:26:29.480' AS DateTime), 6, 94)
GO
INSERT [Seguridad].[Usuario] ([Id], [Documento], [Nombres], [Apellidos], [Password], [Correo], [Gestionable], [CambioPassword], [FechaPassword], [Estado], [FechaRegistro], [RolId], [ColorId]) VALUES (10, N'1234567895', N'ISABEL CRISTINA', N'QUIROGA ZUAREZ', N'51c40ff4655aa1d9180c9796db44e4d1d91a2d17d09cec981df8f896d01e6ba4', N'NOAPLICA@CORREO.COM', 1, 1, NULL, 1, CAST(N'2021-10-16T19:34:32.567' AS DateTime), 5, 94)
GO
INSERT [Seguridad].[Usuario] ([Id], [Documento], [Nombres], [Apellidos], [Password], [Correo], [Gestionable], [CambioPassword], [FechaPassword], [Estado], [FechaRegistro], [RolId], [ColorId]) VALUES (11, N'1234567896', N'KAROL LIZETH', N'VELOZA PAEZ', N'41056c34f9647c264798c1b41a3d8b9d65ad5da2d5082edb3f8eda288108582a', N'NEOGERMAX@GMAIL.COM', 0, 0, NULL, 1, CAST(N'2021-10-18T13:21:52.200' AS DateTime), 4, 94)
GO
INSERT [Seguridad].[Usuario] ([Id], [Documento], [Nombres], [Apellidos], [Password], [Correo], [Gestionable], [CambioPassword], [FechaPassword], [Estado], [FechaRegistro], [RolId], [ColorId]) VALUES (12, N'1234567897', N'DARIO ANDRES', N'VELANDIA QUINTERO', N'6e1f18a430c96cbc5ff5ba61e404b6667fe4e2f44315339aa24e8d20898cfbdb', N'NOAPLICA@CORREO.COM', 0, 1, NULL, 1, CAST(N'2021-10-18T19:34:42.747' AS DateTime), 0, 94)
GO
INSERT [Seguridad].[Usuario] ([Id], [Documento], [Nombres], [Apellidos], [Password], [Correo], [Gestionable], [CambioPassword], [FechaPassword], [Estado], [FechaRegistro], [RolId], [ColorId]) VALUES (13, N'1234567898', N'MARIA ANGELA', N'DIAZ', N'06b8b332055e839c0c45b8bd2b37cebb792309491f58b76377ca0fcb592005a9', N'NOAPLICA@CORREO.COM', 0, 1, NULL, 1, CAST(N'2021-10-20T21:07:09.463' AS DateTime), 5, 94)
GO
INSERT [Seguridad].[Usuario] ([Id], [Documento], [Nombres], [Apellidos], [Password], [Correo], [Gestionable], [CambioPassword], [FechaPassword], [Estado], [FechaRegistro], [RolId], [ColorId]) VALUES (14, N'1234567899', N'MARCOS ALONZO', N'RIVERA PRIETO', N'95234f027b5da5a09928bde5fc432a8a1e525559cab08b830e8bdff74a9db93a', N'NOAPLICA@CORREO.COM', 0, 1, NULL, 1, CAST(N'2021-10-20T21:07:09.940' AS DateTime), 5, 94)
GO
INSERT [Seguridad].[Usuario] ([Id], [Documento], [Nombres], [Apellidos], [Password], [Correo], [Gestionable], [CambioPassword], [FechaPassword], [Estado], [FechaRegistro], [RolId], [ColorId]) VALUES (15, N'12345678910', N'SOFIA DAYANNA', N'MERCEDES SOSA', N'63640264849a87c90356129d99ea165e37aa5fabc1fea46906df1a7ca50db492', N'NOAPLICA@CORREO.COM', 0, 1, NULL, 1, CAST(N'2021-10-20T21:07:10.240' AS DateTime), 5, 94)
GO
INSERT [Seguridad].[Usuario] ([Id], [Documento], [Nombres], [Apellidos], [Password], [Correo], [Gestionable], [CambioPassword], [FechaPassword], [Estado], [FechaRegistro], [RolId], [ColorId]) VALUES (16, N'12345678911', N'ANGELA MARIA', N'PEREZ FUENTES', N'129c7e02f36fed1166aada5b0797068b90f027609ed1dd16222ba5ca7dd9e809', N'NOAPLICA@CORREO.COM', 0, 1, NULL, 1, CAST(N'2021-10-20T21:07:10.647' AS DateTime), 5, 94)
GO
INSERT [Seguridad].[Usuario] ([Id], [Documento], [Nombres], [Apellidos], [Password], [Correo], [Gestionable], [CambioPassword], [FechaPassword], [Estado], [FechaRegistro], [RolId], [ColorId]) VALUES (17, N'12345678912', N'CARLOS ANDRES', N'MANRRIQUE SOLER', N'2f7e2ea57f3dbf40f00a3d92b149778831cd23f399b1dcdede5c495421b698c0', N'NOAPLICA@CORREO.COM', 0, 1, NULL, 1, CAST(N'2021-10-20T21:07:10.903' AS DateTime), 5, 94)
GO
INSERT [Seguridad].[Usuario] ([Id], [Documento], [Nombres], [Apellidos], [Password], [Correo], [Gestionable], [CambioPassword], [FechaPassword], [Estado], [FechaRegistro], [RolId], [ColorId]) VALUES (18, N'12345678913', N'XIOMARA ANDREA', N'CASTILLO VENABIDES', N'9a1d2f0b230e51bf41d7edc810179c2529d93511722025e2ed132f5f67c2d0b6', N'NEOGERMAX@GMAIL.COM', 0, 1, NULL, 1, CAST(N'2021-10-20T21:07:11.030' AS DateTime), 0, 94)
GO
INSERT [Seguridad].[Usuario] ([Id], [Documento], [Nombres], [Apellidos], [Password], [Correo], [Gestionable], [CambioPassword], [FechaPassword], [Estado], [FechaRegistro], [RolId], [ColorId]) VALUES (19, N'12345678914', N'ARMANDO', N'RODRIGUEZ DUARTE', N'e90cd7c94359352b1c8ad4129d56710b213e270f3b0a4bc5db24c85f0759439c', N'NEOGERMAX@GMAIL.COM', 0, 1, NULL, 1, CAST(N'2021-10-20T21:18:58.013' AS DateTime), 5, 94)
GO
INSERT [Seguridad].[Usuario] ([Id], [Documento], [Nombres], [Apellidos], [Password], [Correo], [Gestionable], [CambioPassword], [FechaPassword], [Estado], [FechaRegistro], [RolId], [ColorId]) VALUES (20, N'12345678915', N'JULIANA ANDREA', N'CASTILLO RIVERA', N'ab9585b79bc116b882d5d840d19b6f5d4874a98f198686cd53c680764d37a8a4', N'NEOGERMAX@GMAIL.COM', 0, 1, NULL, 1, CAST(N'2021-10-20T21:20:36.310' AS DateTime), 5, 94)
GO
INSERT [Seguridad].[Usuario] ([Id], [Documento], [Nombres], [Apellidos], [Password], [Correo], [Gestionable], [CambioPassword], [FechaPassword], [Estado], [FechaRegistro], [RolId], [ColorId]) VALUES (21, N'12345678916', N'MARTHA KARIN', N'DONOSO YEPES', N'd24d224e0b70d82b8dcf51963f5db0b14e15ac5aecdfd6d8dd179f305e4772d0', N'NEOGERMAX@GMAIL.COM', 0, 1, NULL, 1, CAST(N'2021-10-20T21:35:47.403' AS DateTime), 5, 94)
GO
INSERT [Seguridad].[Usuario] ([Id], [Documento], [Nombres], [Apellidos], [Password], [Correo], [Gestionable], [CambioPassword], [FechaPassword], [Estado], [FechaRegistro], [RolId], [ColorId]) VALUES (22, N'1234567881', N'DIANA GISSEL', N'PINTO JIMENEZ', N'41056c34f9647c264798c1b41a3d8b9d65ad5da2d5082edb3f8eda288108582a', N'NEOGERMAX@GMAIL.COM', 1, 0, NULL, 1, CAST(N'2021-11-01T18:19:55.757' AS DateTime), 5, 94)
GO
INSERT [Seguridad].[Usuario] ([Id], [Documento], [Nombres], [Apellidos], [Password], [Correo], [Gestionable], [CambioPassword], [FechaPassword], [Estado], [FechaRegistro], [RolId], [ColorId]) VALUES (23, N'12345678917', N'CARLOS MARIO', N'VENAVIDES GARCIA', N'3deaa79c4c959d3d50dd446f6f09db5a655ec62af30939b14517fa73ed1a02f6', N'NOAPLICA@CORREO.COM', 0, 0, NULL, 1, CAST(N'2022-01-16T20:50:59.557' AS DateTime), 0, 94)
GO
SET IDENTITY_INSERT [Seguridad].[Usuario] OFF
GO
/****** Object:  Index [PK_Componentes_Id]    Script Date: 25/01/2022 9:32:43 p. m. ******/
ALTER TABLE [Seguridad].[Pagina] ADD  CONSTRAINT [PK_Componentes_Id] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Permiso_Id]    Script Date: 25/01/2022 9:32:43 p. m. ******/
ALTER TABLE [Seguridad].[PermisoPagina] ADD  CONSTRAINT [PK_Permiso_Id] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Rol_Id]    Script Date: 25/01/2022 9:32:43 p. m. ******/
ALTER TABLE [Seguridad].[Rol] ADD  CONSTRAINT [PK_Rol_Id] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Usuario_Id]    Script Date: 25/01/2022 9:32:43 p. m. ******/
ALTER TABLE [Seguridad].[Usuario] ADD  CONSTRAINT [PK_Usuario_Id] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Backup].[BloqueEvaluacion] ADD  CONSTRAINT [DF_BloqueEvaluacion_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [Backup].[Cargos] ADD  CONSTRAINT [DF_Cargos_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [Backup].[FocoMejoras] ADD  CONSTRAINT [DF_FocoMejoras_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [Backup].[Formulacion_Config_Monitoreo] ADD  CONSTRAINT [DF_Formulacion_Config_Monitoreo_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [Backup].[Formulario] ADD  CONSTRAINT [DF_Formulario_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [Backup].[NotasDescriptivas] ADD  CONSTRAINT [DF_NotasDescriptivas_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [Backup].[PuntosEntrenamiento] ADD  CONSTRAINT [DF_PuntosEntrenamiento_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [Configuracion].[CorreoCampana] ADD  CONSTRAINT [DF_CorreoCampana_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [Configuracion].[Dato] ADD  CONSTRAINT [DF_Dato_PadreId1]  DEFAULT (NULL) FOR [PadreId]
GO
ALTER TABLE [Configuracion].[Dato] ADD  CONSTRAINT [DF__Dato__Codigo__37A5467C]  DEFAULT (NULL) FOR [Codigo]
GO
ALTER TABLE [Configuracion].[Dato] ADD  CONSTRAINT [DF__Dato__Valor__38996AB5]  DEFAULT (NULL) FOR [Valor]
GO
ALTER TABLE [Configuracion].[Dato] ADD  CONSTRAINT [DF__Dato__FechaRegis__398D8EEE]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [Configuracion].[Dato] ADD  CONSTRAINT [DF__Dato__PadreId__3A81B327]  DEFAULT (NULL) FOR [Campo_Add_1]
GO
ALTER TABLE [Configuracion].[Dato] ADD  CONSTRAINT [DF__Dato__Equivalent__3B75D760]  DEFAULT (NULL) FOR [Campo_Add_2]
GO
ALTER TABLE [Configuracion].[Dato] ADD  CONSTRAINT [DF__Dato__Herencia__3C69FB99]  DEFAULT (NULL) FOR [Campo_Add_3]
GO
ALTER TABLE [Configuracion].[EstiloCampana] ADD  CONSTRAINT [DF_EstiloCampana_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [Configuracion].[EstructuraFormularioCampana] ADD  CONSTRAINT [DF_EstructuraFormularioCampana_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [Configuracion].[Mensajes] ADD  CONSTRAINT [DF_Mensajes_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [Configuracion].[Tabla] ADD  CONSTRAINT [DF__Tabla__FechaRegi__300424B4]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [Proceso].[BloqueEvaluacion] ADD  CONSTRAINT [DF_BloqueEvaluacion_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [Proceso].[Campana] ADD  CONSTRAINT [DF__Campana__FechaRe__30F848ED]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [Proceso].[Cargos] ADD  CONSTRAINT [DF_Cargos_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [Proceso].[Cliente] ADD  CONSTRAINT [DF_Cliente_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [Proceso].[ControlCargue] ADD  CONSTRAINT [DF_ControlCargue_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [Proceso].[FocoMejoras] ADD  CONSTRAINT [DF_FocoMejoras_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [Proceso].[Formulacion_Config_Monitoreo] ADD  CONSTRAINT [DF_Formulacion_Config_Monitoreo_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [Proceso].[Formulario] ADD  CONSTRAINT [DF_Formulario_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [Proceso].[Monitoreo] ADD  CONSTRAINT [DF_Monitoreo_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [Proceso].[MonitoreoObservacion] ADD  CONSTRAINT [DF_MonitoreoObservacion_FechaRegistro]  DEFAULT (getdate()) FOR [FechaObservacion]
GO
ALTER TABLE [Proceso].[MonitoreoResultado] ADD  CONSTRAINT [DF_MonitoreoResultado_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [Proceso].[NotasDescriptivas] ADD  CONSTRAINT [DF_NotasDescriptivas_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [Proceso].[Notificaciones] ADD  CONSTRAINT [DF_Notificaciones_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [Proceso].[PuntosEntrenamiento] ADD  CONSTRAINT [DF_PuntosEntrenamiento_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [Seguridad].[Acceso] ADD  CONSTRAINT [DF_Acceso_Fecha_Acceso]  DEFAULT (getdate()) FOR [Fecha_Acceso]
GO
ALTER TABLE [Seguridad].[HistoricoPassword] ADD  CONSTRAINT [DF_HistoricoPassword_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [Seguridad].[Pagina] ADD  CONSTRAINT [DF_Pagina_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [Seguridad].[PermisoPagina] ADD  CONSTRAINT [DF_PermisoPagina_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [Seguridad].[Rol] ADD  CONSTRAINT [DF_Rol_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [Seguridad].[Usuario] ADD  CONSTRAINT [DF_Usuario_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [Backup].[BloqueEvaluacion]  WITH CHECK ADD  CONSTRAINT [FK_BloqueEvaluacion_Formulario] FOREIGN KEY([FormularioId])
REFERENCES [Backup].[Formulario] ([Id])
GO
ALTER TABLE [Backup].[BloqueEvaluacion] CHECK CONSTRAINT [FK_BloqueEvaluacion_Formulario]
GO
ALTER TABLE [Backup].[Cargos]  WITH CHECK ADD  CONSTRAINT [FK_Cargos_Campana] FOREIGN KEY([CampanaId])
REFERENCES [Proceso].[Campana] ([Id])
GO
ALTER TABLE [Backup].[Cargos] CHECK CONSTRAINT [FK_Cargos_Campana]
GO
ALTER TABLE [Backup].[Cargos]  WITH CHECK ADD  CONSTRAINT [FK_Cargos_Formulario] FOREIGN KEY([FormularioId])
REFERENCES [Backup].[Formulario] ([Id])
GO
ALTER TABLE [Backup].[Cargos] CHECK CONSTRAINT [FK_Cargos_Formulario]
GO
ALTER TABLE [Backup].[FocoMejoras]  WITH CHECK ADD  CONSTRAINT [FK_FocoMejoras_PuntosEntrenamiento] FOREIGN KEY([PuntosEntrenamientoId])
REFERENCES [Backup].[PuntosEntrenamiento] ([Id])
GO
ALTER TABLE [Backup].[FocoMejoras] CHECK CONSTRAINT [FK_FocoMejoras_PuntosEntrenamiento]
GO
ALTER TABLE [Backup].[Formulacion_Config_Monitoreo]  WITH CHECK ADD  CONSTRAINT [FK_Formulacion_Config_Monitoreo_Formulario] FOREIGN KEY([FormularioId])
REFERENCES [Backup].[Formulario] ([Id])
GO
ALTER TABLE [Backup].[Formulacion_Config_Monitoreo] CHECK CONSTRAINT [FK_Formulacion_Config_Monitoreo_Formulario]
GO
ALTER TABLE [Backup].[Formulario]  WITH CHECK ADD  CONSTRAINT [FK_Formulario_Campana] FOREIGN KEY([CampanaId])
REFERENCES [Proceso].[Campana] ([Id])
GO
ALTER TABLE [Backup].[Formulario] CHECK CONSTRAINT [FK_Formulario_Campana]
GO
ALTER TABLE [Backup].[NotasDescriptivas]  WITH CHECK ADD  CONSTRAINT [FK_NotasDescriptivas_BloqueEvaluacion] FOREIGN KEY([BloqueEvaluacionId])
REFERENCES [Backup].[BloqueEvaluacion] ([Id])
GO
ALTER TABLE [Backup].[NotasDescriptivas] CHECK CONSTRAINT [FK_NotasDescriptivas_BloqueEvaluacion]
GO
ALTER TABLE [Backup].[PuntosEntrenamiento]  WITH CHECK ADD  CONSTRAINT [FK_PuntosEntrenamiento_NotasDescriptivas] FOREIGN KEY([NotasDescriptivasId])
REFERENCES [Backup].[NotasDescriptivas] ([Id])
GO
ALTER TABLE [Backup].[PuntosEntrenamiento] CHECK CONSTRAINT [FK_PuntosEntrenamiento_NotasDescriptivas]
GO
ALTER TABLE [Configuracion].[CorreoCampana]  WITH CHECK ADD  CONSTRAINT [FK_CorreoCampana_Campana] FOREIGN KEY([CampanaId])
REFERENCES [Proceso].[Campana] ([Id])
GO
ALTER TABLE [Configuracion].[CorreoCampana] CHECK CONSTRAINT [FK_CorreoCampana_Campana]
GO
ALTER TABLE [Configuracion].[Dato]  WITH CHECK ADD  CONSTRAINT [FK_Dato_Tabla] FOREIGN KEY([TablaId])
REFERENCES [Configuracion].[Tabla] ([Id])
GO
ALTER TABLE [Configuracion].[Dato] CHECK CONSTRAINT [FK_Dato_Tabla]
GO
ALTER TABLE [Configuracion].[EstiloCampana]  WITH CHECK ADD  CONSTRAINT [FK_EstiloCampana_Campana] FOREIGN KEY([CampanaId])
REFERENCES [Proceso].[Campana] ([Id])
GO
ALTER TABLE [Configuracion].[EstiloCampana] CHECK CONSTRAINT [FK_EstiloCampana_Campana]
GO
ALTER TABLE [Configuracion].[EstructuraFormularioCampana]  WITH CHECK ADD  CONSTRAINT [FK_EstructuraFormularioCampana_Campana] FOREIGN KEY([CampanaId])
REFERENCES [Proceso].[Campana] ([Id])
GO
ALTER TABLE [Configuracion].[EstructuraFormularioCampana] CHECK CONSTRAINT [FK_EstructuraFormularioCampana_Campana]
GO
ALTER TABLE [Configuracion].[Mensajes]  WITH CHECK ADD  CONSTRAINT [FK_Mensajes_Dato] FOREIGN KEY([TipoMensajeId])
REFERENCES [Configuracion].[Dato] ([Id])
GO
ALTER TABLE [Configuracion].[Mensajes] CHECK CONSTRAINT [FK_Mensajes_Dato]
GO
ALTER TABLE [Proceso].[BloqueEvaluacion]  WITH CHECK ADD  CONSTRAINT [FK_BloqueEvaluacion_Formulario] FOREIGN KEY([FormularioId])
REFERENCES [Proceso].[Formulario] ([Id])
GO
ALTER TABLE [Proceso].[BloqueEvaluacion] CHECK CONSTRAINT [FK_BloqueEvaluacion_Formulario]
GO
ALTER TABLE [Proceso].[Campana]  WITH CHECK ADD  CONSTRAINT [FK_Campana_Cliente] FOREIGN KEY([ClienteId])
REFERENCES [Proceso].[Cliente] ([Id])
GO
ALTER TABLE [Proceso].[Campana] CHECK CONSTRAINT [FK_Campana_Cliente]
GO
ALTER TABLE [Proceso].[Campana]  WITH CHECK ADD  CONSTRAINT [FK_Campana_FrecuenciaMonitoreo] FOREIGN KEY([FrecuenciaMonitoreoId])
REFERENCES [Configuracion].[Dato] ([Id])
GO
ALTER TABLE [Proceso].[Campana] CHECK CONSTRAINT [FK_Campana_FrecuenciaMonitoreo]
GO
ALTER TABLE [Proceso].[Cargos]  WITH CHECK ADD  CONSTRAINT [FK_Cargos_Campana] FOREIGN KEY([CampanaId])
REFERENCES [Proceso].[Campana] ([Id])
GO
ALTER TABLE [Proceso].[Cargos] CHECK CONSTRAINT [FK_Cargos_Campana]
GO
ALTER TABLE [Proceso].[Cargos]  WITH CHECK ADD  CONSTRAINT [FK_Cargos_Formulario] FOREIGN KEY([FormularioId])
REFERENCES [Proceso].[Formulario] ([Id])
GO
ALTER TABLE [Proceso].[Cargos] CHECK CONSTRAINT [FK_Cargos_Formulario]
GO
ALTER TABLE [Proceso].[ControlCargue]  WITH CHECK ADD  CONSTRAINT [FK_ControlCargue_Campana] FOREIGN KEY([CampanaId])
REFERENCES [Proceso].[Campana] ([Id])
GO
ALTER TABLE [Proceso].[ControlCargue] CHECK CONSTRAINT [FK_ControlCargue_Campana]
GO
ALTER TABLE [Proceso].[ControlCargue]  WITH CHECK ADD  CONSTRAINT [FK_ControlCargue_Dato] FOREIGN KEY([TipoCargueId])
REFERENCES [Configuracion].[Dato] ([Id])
GO
ALTER TABLE [Proceso].[ControlCargue] CHECK CONSTRAINT [FK_ControlCargue_Dato]
GO
ALTER TABLE [Proceso].[ControlCargue]  WITH CHECK ADD  CONSTRAINT [FK_ControlCargue_Usuario] FOREIGN KEY([UsuarioId])
REFERENCES [Seguridad].[Usuario] ([Id])
GO
ALTER TABLE [Proceso].[ControlCargue] CHECK CONSTRAINT [FK_ControlCargue_Usuario]
GO
ALTER TABLE [Proceso].[FocoMejoras]  WITH CHECK ADD  CONSTRAINT [FK_FocoMejoras_PuntosEntrenamiento] FOREIGN KEY([PuntosEntrenamientoId])
REFERENCES [Proceso].[PuntosEntrenamiento] ([Id])
GO
ALTER TABLE [Proceso].[FocoMejoras] CHECK CONSTRAINT [FK_FocoMejoras_PuntosEntrenamiento]
GO
ALTER TABLE [Proceso].[Formulacion_Config_Monitoreo]  WITH CHECK ADD  CONSTRAINT [FK_Formulacion_Config_Monitoreo_Formulario] FOREIGN KEY([FormularioId])
REFERENCES [Proceso].[Formulario] ([Id])
GO
ALTER TABLE [Proceso].[Formulacion_Config_Monitoreo] CHECK CONSTRAINT [FK_Formulacion_Config_Monitoreo_Formulario]
GO
ALTER TABLE [Proceso].[Formulario]  WITH CHECK ADD  CONSTRAINT [FK_Formulario_Campana] FOREIGN KEY([CampanaId])
REFERENCES [Proceso].[Campana] ([Id])
GO
ALTER TABLE [Proceso].[Formulario] CHECK CONSTRAINT [FK_Formulario_Campana]
GO
ALTER TABLE [Proceso].[GrupoTrabajo]  WITH CHECK ADD  CONSTRAINT [FK_GrupoTrabajo_Campana] FOREIGN KEY([CampanaId])
REFERENCES [Proceso].[Campana] ([Id])
GO
ALTER TABLE [Proceso].[GrupoTrabajo] CHECK CONSTRAINT [FK_GrupoTrabajo_Campana]
GO
ALTER TABLE [Proceso].[GrupoTrabajo]  WITH CHECK ADD  CONSTRAINT [FK_GrupoTrabajo_Usuario] FOREIGN KEY([UsuarioId])
REFERENCES [Seguridad].[Usuario] ([Id])
GO
ALTER TABLE [Proceso].[GrupoTrabajo] CHECK CONSTRAINT [FK_GrupoTrabajo_Usuario]
GO
ALTER TABLE [Proceso].[GrupoTrabajo]  WITH CHECK ADD  CONSTRAINT [FK_GrupoTrabajo_Usuario1] FOREIGN KEY([CoordinadorId])
REFERENCES [Seguridad].[Usuario] ([Id])
GO
ALTER TABLE [Proceso].[GrupoTrabajo] CHECK CONSTRAINT [FK_GrupoTrabajo_Usuario1]
GO
ALTER TABLE [Proceso].[Monitoreo]  WITH CHECK ADD  CONSTRAINT [FK_Monitoreo_Estado] FOREIGN KEY([EstadoId])
REFERENCES [Configuracion].[Dato] ([Id])
GO
ALTER TABLE [Proceso].[Monitoreo] CHECK CONSTRAINT [FK_Monitoreo_Estado]
GO
ALTER TABLE [Proceso].[Monitoreo]  WITH CHECK ADD  CONSTRAINT [FK_Monitoreo_Formulario] FOREIGN KEY([FormularioId])
REFERENCES [Proceso].[Formulario] ([Id])
GO
ALTER TABLE [Proceso].[Monitoreo] CHECK CONSTRAINT [FK_Monitoreo_Formulario]
GO
ALTER TABLE [Proceso].[Monitoreo]  WITH CHECK ADD  CONSTRAINT [FK_Monitoreo_Usuario] FOREIGN KEY([AgenteId])
REFERENCES [Seguridad].[Usuario] ([Id])
GO
ALTER TABLE [Proceso].[Monitoreo] CHECK CONSTRAINT [FK_Monitoreo_Usuario]
GO
ALTER TABLE [Proceso].[Monitoreo]  WITH CHECK ADD  CONSTRAINT [FK_Monitoreo_Usuario1] FOREIGN KEY([CoordinadorId])
REFERENCES [Seguridad].[Usuario] ([Id])
GO
ALTER TABLE [Proceso].[Monitoreo] CHECK CONSTRAINT [FK_Monitoreo_Usuario1]
GO
ALTER TABLE [Proceso].[Monitoreo]  WITH CHECK ADD  CONSTRAINT [FK_Monitoreo_Usuario2] FOREIGN KEY([MonitorId])
REFERENCES [Seguridad].[Usuario] ([Id])
GO
ALTER TABLE [Proceso].[Monitoreo] CHECK CONSTRAINT [FK_Monitoreo_Usuario2]
GO
ALTER TABLE [Proceso].[MonitoreoObservacion]  WITH CHECK ADD  CONSTRAINT [FK_MonitoreoObservacion_Dato] FOREIGN KEY([EstadoId])
REFERENCES [Configuracion].[Dato] ([Id])
GO
ALTER TABLE [Proceso].[MonitoreoObservacion] CHECK CONSTRAINT [FK_MonitoreoObservacion_Dato]
GO
ALTER TABLE [Proceso].[MonitoreoObservacion]  WITH CHECK ADD  CONSTRAINT [FK_MonitoreoObservacion_EstadoMonitreo] FOREIGN KEY([EstadoId])
REFERENCES [Configuracion].[Dato] ([Id])
GO
ALTER TABLE [Proceso].[MonitoreoObservacion] CHECK CONSTRAINT [FK_MonitoreoObservacion_EstadoMonitreo]
GO
ALTER TABLE [Proceso].[MonitoreoObservacion]  WITH CHECK ADD  CONSTRAINT [FK_MonitoreoObservacion_Monitoreo] FOREIGN KEY([MonitoreoId])
REFERENCES [Proceso].[Monitoreo] ([Id])
GO
ALTER TABLE [Proceso].[MonitoreoObservacion] CHECK CONSTRAINT [FK_MonitoreoObservacion_Monitoreo]
GO
ALTER TABLE [Proceso].[MonitoreoObservacion]  WITH CHECK ADD  CONSTRAINT [FK_MonitoreoObservacion_Usuario] FOREIGN KEY([UsuarioId])
REFERENCES [Seguridad].[Usuario] ([Id])
GO
ALTER TABLE [Proceso].[MonitoreoObservacion] CHECK CONSTRAINT [FK_MonitoreoObservacion_Usuario]
GO
ALTER TABLE [Proceso].[MonitoreoResultado]  WITH CHECK ADD  CONSTRAINT [FK_MonitoreoResultado_Monitoreo] FOREIGN KEY([MonitoreoId])
REFERENCES [Proceso].[Monitoreo] ([Id])
GO
ALTER TABLE [Proceso].[MonitoreoResultado] CHECK CONSTRAINT [FK_MonitoreoResultado_Monitoreo]
GO
ALTER TABLE [Proceso].[NotasDescriptivas]  WITH CHECK ADD  CONSTRAINT [FK_NotasDescriptivas_BloqueEvaluacion] FOREIGN KEY([BloqueEvaluacionId])
REFERENCES [Proceso].[BloqueEvaluacion] ([Id])
GO
ALTER TABLE [Proceso].[NotasDescriptivas] CHECK CONSTRAINT [FK_NotasDescriptivas_BloqueEvaluacion]
GO
ALTER TABLE [Proceso].[Notificaciones]  WITH CHECK ADD  CONSTRAINT [FK_Notificaciones_Modulo] FOREIGN KEY([ModuloId])
REFERENCES [Configuracion].[Dato] ([Id])
GO
ALTER TABLE [Proceso].[Notificaciones] CHECK CONSTRAINT [FK_Notificaciones_Modulo]
GO
ALTER TABLE [Proceso].[Notificaciones]  WITH CHECK ADD  CONSTRAINT [FK_Notificaciones_Usuario] FOREIGN KEY([UsuarioId])
REFERENCES [Seguridad].[Usuario] ([Id])
GO
ALTER TABLE [Proceso].[Notificaciones] CHECK CONSTRAINT [FK_Notificaciones_Usuario]
GO
ALTER TABLE [Proceso].[PuntosEntrenamiento]  WITH CHECK ADD  CONSTRAINT [FK_PuntosEntrenamiento_NotasDescriptivas] FOREIGN KEY([NotasDescriptivasId])
REFERENCES [Proceso].[NotasDescriptivas] ([Id])
GO
ALTER TABLE [Proceso].[PuntosEntrenamiento] CHECK CONSTRAINT [FK_PuntosEntrenamiento_NotasDescriptivas]
GO
ALTER TABLE [Proceso].[PuntosEntrenamiento]  WITH CHECK ADD  CONSTRAINT [FK_PuntosEntrenamiento_PE_EstadoProceso] FOREIGN KEY([EstadoProcesoId])
REFERENCES [Configuracion].[Dato] ([Id])
GO
ALTER TABLE [Proceso].[PuntosEntrenamiento] CHECK CONSTRAINT [FK_PuntosEntrenamiento_PE_EstadoProceso]
GO
ALTER TABLE [Proceso].[UsuarioCampana]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioCampana_Campana] FOREIGN KEY([CampanaId])
REFERENCES [Proceso].[Campana] ([Id])
GO
ALTER TABLE [Proceso].[UsuarioCampana] CHECK CONSTRAINT [FK_UsuarioCampana_Campana]
GO
ALTER TABLE [Proceso].[UsuarioCampana]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioCampana_Dato] FOREIGN KEY([ValueRolId])
REFERENCES [Configuracion].[Dato] ([Id])
GO
ALTER TABLE [Proceso].[UsuarioCampana] CHECK CONSTRAINT [FK_UsuarioCampana_Dato]
GO
ALTER TABLE [Proceso].[UsuarioCampana]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioCampana_Usuario] FOREIGN KEY([UsuarioId])
REFERENCES [Seguridad].[Usuario] ([Id])
GO
ALTER TABLE [Proceso].[UsuarioCampana] CHECK CONSTRAINT [FK_UsuarioCampana_Usuario]
GO
ALTER TABLE [Seguridad].[Acceso]  WITH CHECK ADD  CONSTRAINT [FK_Acceso_Usuario] FOREIGN KEY([Usuario_Id])
REFERENCES [Seguridad].[Usuario] ([Id])
GO
ALTER TABLE [Seguridad].[Acceso] CHECK CONSTRAINT [FK_Acceso_Usuario]
GO
ALTER TABLE [Seguridad].[HistoricoPassword]  WITH CHECK ADD  CONSTRAINT [FK_HistoricoPassword_Dato] FOREIGN KEY([OpcionPasswordId])
REFERENCES [Configuracion].[Dato] ([Id])
GO
ALTER TABLE [Seguridad].[HistoricoPassword] CHECK CONSTRAINT [FK_HistoricoPassword_Dato]
GO
ALTER TABLE [Seguridad].[HistoricoPassword]  WITH CHECK ADD  CONSTRAINT [FK_HistoricoPassword_Usuario] FOREIGN KEY([UsuarioId])
REFERENCES [Seguridad].[Usuario] ([Id])
GO
ALTER TABLE [Seguridad].[HistoricoPassword] CHECK CONSTRAINT [FK_HistoricoPassword_Usuario]
GO
ALTER TABLE [Seguridad].[LogError]  WITH CHECK ADD  CONSTRAINT [FK_LogError_Usuario] FOREIGN KEY([UsuarioId])
REFERENCES [Seguridad].[Usuario] ([Id])
GO
ALTER TABLE [Seguridad].[LogError] CHECK CONSTRAINT [FK_LogError_Usuario]
GO
ALTER TABLE [Seguridad].[Pagina]  WITH NOCHECK ADD  CONSTRAINT [FK_Componente_PadreId] FOREIGN KEY([PadreId])
REFERENCES [Seguridad].[Pagina] ([Id])
GO
ALTER TABLE [Seguridad].[Pagina] CHECK CONSTRAINT [FK_Componente_PadreId]
GO
ALTER TABLE [Seguridad].[PermisoPagina]  WITH NOCHECK ADD  CONSTRAINT [FK_Accion_Permiso_ComponenteId] FOREIGN KEY([PaginaId])
REFERENCES [Seguridad].[Pagina] ([Id])
GO
ALTER TABLE [Seguridad].[PermisoPagina] CHECK CONSTRAINT [FK_Accion_Permiso_ComponenteId]
GO
ALTER TABLE [Seguridad].[PermisoPagina]  WITH CHECK ADD  CONSTRAINT [FK_PermisoPagina_Campana] FOREIGN KEY([CampanaId])
REFERENCES [Proceso].[Campana] ([Id])
GO
ALTER TABLE [Seguridad].[PermisoPagina] CHECK CONSTRAINT [FK_PermisoPagina_Campana]
GO
ALTER TABLE [Seguridad].[PermisoPagina]  WITH CHECK ADD  CONSTRAINT [FK_PermisoPagina_Rol] FOREIGN KEY([RolId])
REFERENCES [Seguridad].[Rol] ([Id])
GO
ALTER TABLE [Seguridad].[PermisoPagina] CHECK CONSTRAINT [FK_PermisoPagina_Rol]
GO
ALTER TABLE [Seguridad].[Rol]  WITH CHECK ADD  CONSTRAINT [FK_Rol_Campana] FOREIGN KEY([CampanaId])
REFERENCES [Proceso].[Campana] ([Id])
GO
ALTER TABLE [Seguridad].[Rol] CHECK CONSTRAINT [FK_Rol_Campana]
GO
ALTER TABLE [Seguridad].[Rol]  WITH CHECK ADD  CONSTRAINT [FK_Rol_Dato] FOREIGN KEY([ValueRolId])
REFERENCES [Configuracion].[Dato] ([Id])
GO
ALTER TABLE [Seguridad].[Rol] CHECK CONSTRAINT [FK_Rol_Dato]
GO
/****** Object:  StoredProcedure [Configuracion].[SP_CARGA_MASIVA]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================================================================
 Uso			:	PROCEDIMIENTO ENCARGADO DE CREAR LA SESION TEMPORAL
 Fecha			:	2020-03-24.
 Autor			:	GERMAN RODRIGUEZ
 Entradas		:	@Opcion     NVARCHAR(50),
					@CampanaId   BIGINT = NULL,
					@Parametro_1 NVARCHAR(100) = NULL,
					@Parametro_2 NVARCHAR(100) = NULL

==========================================================================================*/
CREATE PROCEDURE [Configuracion].[SP_CARGA_MASIVA]
	@Opcion      NVARCHAR(50),
	@CampanaId   BIGINT = NULL,
    @Parametro_1 NVARCHAR(100) = NULL,
	@Parametro_2 NVARCHAR(100) = NULL
 AS
BEGIN
	SET NOCOUNT ON;
	SET DATEFORMAT ymd
	---------------------------------------------------------------------------------------------------------------------
	--ELIMINA LA DATA DE CARGUE MASIVO
	---------------------------------------------------------------------------------------------------------------------
    IF @Opcion ='DELETE_CARGUE_USERS'
	BEGIN
		DELETE [Configuracion].[Temp_CargaMasivaUsers]
		SELECT COUNT(1) FROM [Configuracion].[Temp_CargaMasivaUsers]
	END
    ---------------------------------------------------------------------------------------------------------------------
	--ELIMINA LA DATA NULL DE CARGUE MASIVO
	---------------------------------------------------------------------------------------------------------------------
    IF @Opcion ='DELETE_NULL_USERS'
	BEGIN
		  DELETE [Configuracion].[Temp_CargaMasivaUsers]
			WHERE [Nombre] IS NULL
			 AND [Apellido] IS NULL
			 AND [Documento] IS NULL
			 AND [Correo] IS NULL
			 AND [Gestionable] IS NULL
	END
	-------------------------------------------------------------------------------------------------------------------
	--TRAE LA DATA DE CARGUE MASIVO
	---------------------------------------------------------------------------------------------------------------------
    IF @Opcion ='SELECT_CARGUE_TEMP_USER'
	BEGIN
		SELECT [Nombre]
			  ,[Apellido]
			  ,[Documento]
			  ,[Correo]
			  ,[Gestionable]
		  FROM [Configuracion].[Temp_CargaMasivaUsers]
	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE LA CANTIDAD DE LA DATA DE CARGUE MASIVO
	---------------------------------------------------------------------------------------------------------------------
    IF @Opcion ='COUNT_CARGUE_TEMP_USERS'
	BEGIN
	  SELECT COUNT (1) AS CANT
	  FROM [Configuracion].[Temp_CargaMasivaUsers]
	END
	---------------------------------------------------------------------------------------------------------------------
	--ELIMINA LA DATA DE CARGUE MASIVO
	---------------------------------------------------------------------------------------------------------------------
    IF @Opcion ='DELETE_CARGUE_FORM'
	BEGIN
		DELETE [Configuracion].[Temp_CargaForm]
		SELECT COUNT(1) FROM [Configuracion].[Temp_CargaForm]
	END
	---------------------------------------------------------------------------------------------------------------------
	--ELIMINA LA DATA NULL DE CARGUE MASIVO
	---------------------------------------------------------------------------------------------------------------------
   IF @Opcion ='DELETE_NULL_FORM'
	BEGIN
		  DELETE [Configuracion].[Temp_CargaForm]
			WHERE [Nivel_0] IS NULL
			 AND [Nivel_1] IS NULL
			 AND [Nivel_2] IS NULL
			 AND [Nivel_3] IS NULL
			 AND [Nivel_4] IS NULL
	END
	-------------------------------------------------------------------------------------------------------------------
	--TRAE LA DATA DE CARGUE MASIVO
	---------------------------------------------------------------------------------------------------------------------
    IF @Opcion ='SELECT_CARGUE_TEMP_FORM'
	BEGIN
		SELECT [Nivel_0]
			  ,[Nivel_1]
		      ,[Nivel_2]
			  ,[Nivel_3]
			  ,[Nivel_4]
		  FROM [Configuracion].[Temp_CargaForm]
	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE LA CANTIDAD DE LA DATA DE CARGUE MASIVO
	---------------------------------------------------------------------------------------------------------------------
    IF @Opcion ='COUNT_CARGUE_TEMP_FORM'
	BEGIN
	  SELECT COUNT (1) AS CANT
	  FROM [Configuracion].[Temp_CargaForm]
	END
	
END

	----------------------------------------------------------------------------------------------------
	--PRUEBAS
	----------------------------------------------------------------------------------------------------
/*
   
   /*DELETE_CARGUE_USERS*/		SET DATEFORMAT ymd EXEC [Configuracion].[SP_CARGA_MASIVA] 'DELETE_CARGUE_USERS'
   /*DELETE_NULL_USERS*/		SET DATEFORMAT ymd EXEC [Configuracion].[SP_CARGA_MASIVA] 'DELETE_NULL_USERS'
   /*COUNT_CARGUE_TEMP_USERS*/	SET DATEFORMAT ymd EXEC [Configuracion].[SP_CARGA_MASIVA] 'COUNT_CARGUE_TEMP_USERS'
   /*SELECT_CARGUE_TEMP_USER*/	SET DATEFORMAT ymd EXEC [Configuracion].[SP_CARGA_MASIVA] 'SELECT_CARGUE_TEMP_USER'
  
*/
GO
/****** Object:  StoredProcedure [Configuracion].[SP_CRUD_CORREO_CAMPANA]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* =============================================
-- Author:		German Alejandro Rodriguez
-- Create date: 2020-04-01
-- Description:	Procedimiento encargado de administrar la tabla [Configuracion].[CampanaAplicaciones]
-- Parameters:  @Opcion				VARCHAR(50),
				@Id					   BIGINT,
				@CampanaId             BIGINT = NULL,
				@EMAIL_FROM			   VARCHAR(250) = NULL,
				@SMTP				   VARCHAR(250) = NULL,
				@EMAIL_CONFIG		   VARCHAR(250) = NULL,
				@EMAIL_PASS			   VARCHAR(250) = NULL
-- =============================================*/
CREATE PROCEDURE [Configuracion].[SP_CRUD_CORREO_CAMPANA]
    @Opcion				   VARCHAR(50),
	@Id					   BIGINT,
	@CampanaId             BIGINT = NULL,
    @EMAIL_FROM			   VARCHAR(250) = NULL,
    @SMTP				   VARCHAR(250) = NULL,
    @EMAIL_CONFIG		   VARCHAR(250) = NULL,
    @EMAIL_PASS			   VARCHAR(250) = NULL
AS
BEGIN
	SET NOCOUNT ON;
	SET DATEFORMAT ymd
	
	-----------------------------------------------------------------------------------------------------------------
	--INSERTA EN LA TABLA [Configuracion].[CorreoCampana] (INSERT)
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'INSERT'
	BEGIN
		INSERT INTO [Configuracion].[CorreoCampana]
				   ([CampanaId]
				   ,[EMAIL_FROM]
				   ,[SMTP]
				   ,[EMAIL_CONFIG]
				   ,[EMAIL_PASS]
				   )
			 VALUES
				   (@CampanaId
				   ,@EMAIL_FROM
				   ,@SMTP
				   ,@EMAIL_CONFIG
				   ,@EMAIL_PASS
				   )
			SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY];  --Sirve para mostrar el ID del registro nuevo--
	END
	---------------------------------------------------------------------------------------------------------------------
	--ACTUALIZA DATA A LA TABLA [Configuracion].[CorreoCampana] (UPDATE)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'UPDATE'
	BEGIN
		UPDATE [Configuracion].[CorreoCampana]
		   SET [EMAIL_FROM] = @EMAIL_FROM
			  ,[SMTP] = @SMTP
			  ,[EMAIL_CONFIG] = @EMAIL_CONFIG
			  ,[EMAIL_PASS] = @EMAIL_PASS
		 WHERE [CampanaId] = @CampanaId
		SELECT @CampanaId
	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE LA DATA A LA TABLA [Configuracion].[CorreoCampana] (READ)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ_CAMPANA'
	BEGIN
		SELECT [EMAIL_FROM]
			  ,[SMTP]
			  ,[EMAIL_CONFIG]
			  ,[EMAIL_PASS]
		  FROM [Configuracion].[CorreoCampana]
 		 WHERE [CampanaId] = @CampanaId
	END
END
----------------------------------------------------------------------------------------------------
--PRUEBAS
----------------------------------------------------------------------------------------------------
/*
    SET DATEFORMAT ymd EXEC [Configuracion].[SP_CRUD_CORREO_CAMPANA] 'INSERT','0','1','1','4','1'
    SET DATEFORMAT ymd EXEC [Configuracion].[SP_CRUD_CORREO_CAMPANA] 'READ_CAMPANA','0','1'
*/


GO
/****** Object:  StoredProcedure [Configuracion].[SP_CRUD_DATO]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* =============================================
-- Author:		German Alejandro Rodriguez
-- Create date: 2020-04-01
-- Description:	Procedimiento encargado de administrar la tabla [Configuracion].[Tabla]
-- Parameters:  @Opcion			VARCHAR(50),
				@Id				BIGINT,
				@PadreId		  BIGINT = NULL,
				@TablaId		  BIGINT = NULL,
				@Codigo			  VARCHAR(30) = NULL,
				@Nombre			  VARCHAR(500) = NULL,
				@Valor			  BIGINT = NULL,
				@Activo			  INT = NULL,
				@Campo_Add_1	  VARCHAR(max) = NULL,
				@Campo_Add_2	  VARCHAR(max) = NULL,
				@Campo_Add_3	  VARCHAR(max) = NULL,
				@Campo_Add_4	  VARCHAR(max) = NULL,
				@Campo_Add_5	  VARCHAR(max) = NULL
-- =============================================*/
CREATE PROCEDURE [Configuracion].[SP_CRUD_DATO]
    @Opcion			  VARCHAR(50),
	@Id				  BIGINT,
	@PadreId		  BIGINT = NULL,
    @TablaId		  BIGINT = NULL,
    @Codigo			  VARCHAR(30) = NULL,
    @Nombre			  VARCHAR(500) = NULL,
    @Valor			  BIGINT = NULL,
    @Activo			  INT = NULL,
    @Campo_Add_1	  VARCHAR(max) = NULL,
    @Campo_Add_2	  VARCHAR(max) = NULL,
    @Campo_Add_3	  VARCHAR(max) = NULL,
    @Campo_Add_4	  VARCHAR(max) = NULL,
    @Campo_Add_5	  VARCHAR(max) = NULL
AS
BEGIN
	SET NOCOUNT ON;
	SET DATEFORMAT ymd
	
	-----------------------------------------------------------------------------------------------------------------
	/*TRAE LOS DATOS PARA CARGAR COMBOS*/
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion='TRAER_LIST_PADRE'
	BEGIN 
		SELECT [Id], 
		       [Nombre],
			   [Codigo],
			   [Campo_Add_1],
			   [Activo],
			   PadreId
	    FROM [Configuracion].[Dato] 
		WHERE [PadreId] = @PadreId 
		  AND [Activo] = 1
	      ORDER BY Nombre ASC
	END
	-----------------------------------------------------------------------------------------------------------------
	/*TRAE LOS DATOS PARA CARGAR COMBOS*/
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion='TRAER_LIST_TABLA'
	BEGIN 
		SELECT [Id], 
		       [Nombre],
			   [Codigo],
			   [Campo_Add_1],
			   [Activo],
			   PadreId 
		FROM [Configuracion].[Dato] 
		WHERE TablaId = @TablaId
		AND [Activo] = 1
		ORDER BY Nombre ASC
	END
	-----------------------------------------------------------------------------------------------------------------
	/*TRAE LOS DATOS PARA CARGAR COMBOS*/
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion='TRAER_LIST_TABLA_FILTRO'
	BEGIN 
		SELECT [Id], 
		       [Nombre],
			   [Codigo],
			   [Campo_Add_1],
			   [Activo],
			   PadreId 
		FROM [Configuracion].[Dato] 
		WHERE TablaId = @TablaId
		AND [Campo_Add_1] = @PadreId
		AND [Activo] = 1
		ORDER BY Nombre ASC
	END
	-----------------------------------------------------------------------------------------------------------------
	--INSERTA EN LA TABLA [Configuracion].[Dato] (INSERT)
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'INSERT'
	BEGIN
		INSERT INTO [Configuracion].[Dato]
			   ([PadreId]
			   ,[TablaId]
			   ,[Codigo]
			   ,[Nombre]
			   ,[Valor]
			   ,[Activo]
			   ,[Campo_Add_1]
			   ,[Campo_Add_2]
			   ,[Campo_Add_3]
			   ,[Campo_Add_4]
			   ,[Campo_Add_5])
		 VALUES
			   (@PadreId
			   ,@TablaId
			   ,UPPER(@Codigo)
			   ,UPPER(@Nombre)
			   ,@Valor
			   ,@Activo
			   ,UPPER(@Campo_Add_1)
			   ,UPPER(@Campo_Add_2)
			   ,UPPER(@Campo_Add_3)
			   ,UPPER(@Campo_Add_4)
			   ,UPPER(@Campo_Add_5))
		 SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY];  --Sirve para mostrar el ID del registro nuevo--
	END
	-----------------------------------------------------------------------------------------------------------------
	--INSERTA EN LA TABLA [Configuracion].[Dato] (INSERT)
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'UPDATE'
	BEGIN
		UPDATE  [Configuracion].[Dato]
		   SET	[Nombre] = @Nombre,
			    [Activo] = @Activo
		WHERE Id = @Id
		SELECT @Id;  
	END
	-----------------------------------------------------------------------------------------------------------------
	--TRAE LA DATA SEGUN LA CUENTA Y TABLASELECCIONADA
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'SELECT_DATO_CUENTA'
	BEGIN
		SELECT [Id], 
		       [Nombre],
			   [Codigo],
			   [Campo_Add_1],
			   [Activo],
			   PadreId 
		FROM [Configuracion].[Dato] 
		WHERE TablaId = @TablaId
		AND [Campo_Add_1] = @Id
		ORDER BY Nombre ASC  
	END
	-----------------------------------------------------------------------------------------------------------------
	--TRAE LA DATA SEGUN LA CUENTA Y TABLASELECCIONADA
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'EXIST_DATO_CUENTA'
	BEGIN
		SELECT COUNT(1)
		FROM [Configuracion].[Dato] 
		WHERE TablaId = @TablaId
		AND [Nombre] = @Nombre
	END
	-----------------------------------------------------------------------------------------------------------------
	/*TRAE LOS DATOS PARA CARGAR COMBOS*/
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion='TRAER_LIST_TABLA_ALL'
	BEGIN 
		SELECT [Id], 
		       [Nombre],
			   [Codigo],
			   [Campo_Add_1],
			   [Activo],
			   PadreId 
		FROM [Configuracion].[Dato] 
		WHERE TablaId = @TablaId
		ORDER BY Nombre ASC
	END
	---------------------------------------------------------------------------------------------------------------------
	--DESACTIVAR O ACTIVAR USUARIO EN LA TABLA USUARIO (DELETE)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'INACTIVE_ACTIVE'
	BEGIN
	    
		IF @PadreId = 0
		BEGIN
		   SET @Activo = 1
		END
		ELSE
		BEGIN
		   SET @Activo = 0
		END	
		
		UPDATE [Configuracion].[Dato] 
		   SET [Activo] = @Activo
		 WHERE Id = @Id
		 SELECT @Activo
	END	
	
END
----------------------------------------------------------------------------------------------------
--PRUEBAS
----------------------------------------------------------------------------------------------------
/*
    SET DATEFORMAT ymd EXEC [Configuracion].[SP_CRUD_DATO] 'INSERT','0','0','1','8','8 HORAS','1','1'
    SET DATEFORMAT ymd EXEC [Configuracion].[SP_CRUD_DATO] 'TRAER_LIST_TABLA','0','0','9'
	SET DATEFORMAT ymd EXEC [Configuracion].[SP_CRUD_DATO] 'TRAER_LIST_TABLA','0','9'
	SET DATEFORMAT ymd EXEC [Configuracion].[SP_CRUD_DATO] 'SELECT_DATO_CUENTA','6','0','8'
	SET DATEFORMAT ymd EXEC [Configuracion].[SP_CRUD_DATO] 'EXIST_DATO_CUENTA','6','0','8'
	SET DATEFORMAT ymd EXEC [Configuracion].[SP_CRUD_DATO] 'INACTIVE_ACTIVE','6','0'
	SET DATEFORMAT ymd EXEC [Configuracion].[SP_CRUD_DATO] 'TRAER_LIST_TABLA_FILTRO','0','3','8'
	
*/





GO
/****** Object:  StoredProcedure [Configuracion].[SP_CRUD_ESTILOCUENTA]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================================================================
 Uso			:	PROCEDIMIENTO ENCARGADO DE GESTIONAR LA TABLA ESTILOCUENTA
 Fecha			:	2020-03-22.
 Autor			:	GERMAN RODRIGUEZ
 Entradas		:	@Option_Crud      NVARCHAR(50),
					@Id				  INT,
					@CampanaId        BIGINT = NULL,
					@Logo             VARCHAR(500) = NULL,
					@ColorBack		  VARCHAR(50) = NULL,
					@ColorHeaderTitle VARCHAR(50) = NULL,
					@ColorLabel		  VARCHAR(50) = NULL
-- ==========================================================================================*/
CREATE PROCEDURE [Configuracion].[SP_CRUD_ESTILOCUENTA]
	@Option_Crud      NVARCHAR(50),
	@Id				  INT,
	@CampanaId        BIGINT = NULL,
	@Logo             VARCHAR(500) = NULL,
	@ColorBack		  VARCHAR(50) = NULL,
    @ColorHeaderTitle VARCHAR(50) = NULL,
	@ColorLabel		  VARCHAR(50) = NULL,
    @ColorAlerta      VARCHAR(50) = NULL
	
 AS
BEGIN
	SET NOCOUNT ON;
	SET DATEFORMAT ymd
	
	---------------------------------------------------------------------------------------------------------------------
	--INSERTA DATA A LA TABLA ESTILOCUENTA (INSERT)
	---------------------------------------------------------------------------------------------------------------------
	IF @Option_Crud = 'INSERT'
	BEGIN
		INSERT INTO [Configuracion].[EstiloCampana]
			   ([CampanaId]
			   ,[Logo]
			   ,[ColorBack]
			   ,[ColorHeaderTitle]
			   ,[ColorLabel]
			   ,ColorAlerta
			   )
		 VALUES
			   (@CampanaId, 
				@Logo,
				@ColorBack,
				@ColorHeaderTitle,
				@ColorLabel,
				@ColorAlerta
			   )
			SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY];  --Sirve para mostrar el ID del registro nuevo--
	END
	---------------------------------------------------------------------------------------------------------------------
	--ACTUALIZA EL ESTILO DE LA CUENTA (UPDATE)
	---------------------------------------------------------------------------------------------------------------------
	IF @Option_Crud = 'UPDATE'
	BEGIN
		UPDATE [Configuracion].[EstiloCampana]
		SET [Logo] = @Logo,
		    ColorBack = @ColorBack,
			ColorHeaderTitle = @ColorHeaderTitle,
			ColorAlerta = @ColorAlerta,
			ColorLabel = @ColorLabel
		WHERE CampanaId = @CampanaId
		SELECT @CampanaId
	END
	
	---------------------------------------------------------------------------------------------------------------------
	--SELECCIONA EL ESTILO POR CUENTA
	---------------------------------------------------------------------------------------------------------------------
	IF @Option_Crud = 'SELECT_ESTILO_CUENTA'
	BEGIN
		SELECT [Logo] 
		      ,[ColorBack]
			  ,[ColorHeaderTitle]
			  ,[ColorLabel]
			  ,ColorAlerta
		FROM [Configuracion].[EstiloCampana]
		WHERE CampanaId = @CampanaId
	END
	---------------------------------------------------------------------------------------------------------------------
	--SELECCIONA EL ESTILO DE TODAS LAS CUENTAS DEL CLIENTE
	---------------------------------------------------------------------------------------------------------------------
	IF @Option_Crud = 'SELECT_ESTILO_CLIENTE'
	BEGIN
		SELECT CampanaId
		      ,[Logo] 
		      ,[ColorBack]
			  ,[ColorHeaderTitle]
			  ,[ColorLabel]
			  ,ColorAlerta
		FROM [Configuracion].[EstiloCampana] EE
		INNER JOIN [Proceso].[Campana] E (NOLOCK) ON E.Id = EE.CampanaId
		WHERE CampanaId = @CampanaId
	END
END

	----------------------------------------------------------------------------------------------------
	--PRUEBAS
	----------------------------------------------------------------------------------------------------

/*
	 /*INSERT*/	                SET DATEFORMAT ymd EXEC [Configuracion].[SP_CRUD_ESTILOCUENTA] 'INSERT','0','2','../XXX/X.PNG','#Bc088c','#FFFFFF','#Bc088c','#Bc088c'
	 /*SELECT_ESTILO_CUENTA*/	SET DATEFORMAT ymd EXEC [Configuracion].[SP_CRUD_ESTILOCUENTA] 'SELECT_ESTILO_CUENTA','0','1'
	 /*SELECT_ESTILO_CLIENTE*/	SET DATEFORMAT ymd EXEC [Configuracion].[SP_CRUD_ESTILOCUENTA] 'SELECT_ESTILO_CLIENTE','0','3'
	 SET DATEFORMAT ymd EXEC [Configuracion].[SP_CRUD_ESTILOCUENTA] 'SELECT_ESTILO_CLIENTE','0','3'
*/
GO
/****** Object:  StoredProcedure [Configuracion].[SP_CRUD_ESTRUCTURA_FORM]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================================================================
 Uso			:	PROCEDIMIENTO ENCARGADO DE GESTIONAR LA TABLA [Configuracion].[EstructuraFormularioCampana]
 Fecha			:	2020-03-22.
 Autor			:	GERMAN RODRIGUEZ
 Entradas		:	@Option_Crud      NVARCHAR(50),
					@Id				  INT,
					@CampanaId        BIGINT = NULL,
					@Title_Nivel0     VARCHAR(250) = NULL,
					@Title_Nivel1	  VARCHAR(250) = NULL,
					@Title_Nivel2     VARCHAR(250) = NULL,
					@Title_Nivel3	  VARCHAR(250) = NULL,
					@Title_Nivel4     VARCHAR(50) = NULL
-- ==========================================================================================*/
CREATE PROCEDURE [Configuracion].[SP_CRUD_ESTRUCTURA_FORM]
	@Option_Crud      NVARCHAR(50),
	@Id				  INT,
	@CampanaId        BIGINT = NULL,
	@Title_Nivel0     VARCHAR(250) = NULL,
	@Title_Nivel1	  VARCHAR(250) = NULL,
    @Title_Nivel2     VARCHAR(250) = NULL,
	@Title_Nivel3	  VARCHAR(250) = NULL,
    @Title_Nivel4     VARCHAR(50) = NULL
	
 AS
BEGIN
	SET NOCOUNT ON;
	SET DATEFORMAT ymd
	
	---------------------------------------------------------------------------------------------------------------------
	--INSERTA DATA A LA TABLA [Configuracion].[EstructuraFormularioCampana] (INSERT)
	---------------------------------------------------------------------------------------------------------------------
	IF @Option_Crud = 'INSERT'
	BEGIN
		INSERT INTO [Configuracion].[EstructuraFormularioCampana]
			   ([CampanaId]
			   ,[Title_Nivel0]
			   ,[Title_Nivel1]
			   ,[Title_Nivel2]
			   ,[Title_Nivel3]
			   ,[Title_Nivel4]
			   )
		 VALUES
			   (@CampanaId, 
				@Title_Nivel0,
				@Title_Nivel1,
				@Title_Nivel2,
				@Title_Nivel3,
				@Title_Nivel4
			   )
			SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY];  --Sirve para mostrar el ID del registro nuevo--
	END
	---------------------------------------------------------------------------------------------------------------------
	--ACTUALIZA EL [Configuracion].[EstructuraFormularioCampana] (UPDATE)
	---------------------------------------------------------------------------------------------------------------------
	IF @Option_Crud = 'UPDATE'
	BEGIN
	    DECLARE @Exist INT =(SELECT COUNT(1) FROM [Configuracion].[EstructuraFormularioCampana]
		                        WHERE CampanaId = @CampanaId)

        IF @Exist = 0
		BEGIN
			INSERT INTO [Configuracion].[EstructuraFormularioCampana]
				   ([CampanaId]
				   ,[Title_Nivel0]
				   ,[Title_Nivel1]
				   ,[Title_Nivel2]
				   ,[Title_Nivel3]
				   ,[Title_Nivel4]
				   )
			 VALUES
				   (@CampanaId, 
					@Title_Nivel0,
					@Title_Nivel1,
					@Title_Nivel2,
					@Title_Nivel3,
					@Title_Nivel4
				   )
				SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY];  --Sirve para mostrar el ID del registro nuevo--
		END
		ELSE
		BEGIN
			UPDATE [Configuracion].[EstructuraFormularioCampana]
			SET [Title_Nivel0] = @Title_Nivel0,
				[Title_Nivel1] = @Title_Nivel1,
				[Title_Nivel2] = @Title_Nivel2,
				[Title_Nivel3] = @Title_Nivel3,
				[Title_Nivel4] = @Title_Nivel4
			WHERE CampanaId = @CampanaId
			SELECT @CampanaId
		END
	END
	
	---------------------------------------------------------------------------------------------------------------------
	--SELECCIONA EL [Configuracion].[EstructuraFormularioCampana] POR CUENTA
	---------------------------------------------------------------------------------------------------------------------
	IF @Option_Crud = 'SELECT_ESTRUCTURA'
	BEGIN
		SELECT [Title_Nivel0] 
		      ,[Title_Nivel1]
			  ,[Title_Nivel2]
			  ,[Title_Nivel3]
			  ,[Title_Nivel4]
		FROM [Configuracion].[EstructuraFormularioCampana]
		WHERE CampanaId = @CampanaId
	END
	
END

	----------------------------------------------------------------------------------------------------
	--PRUEBAS
	----------------------------------------------------------------------------------------------------

/*
	 /*INSERT*/	                SET DATEFORMAT ymd EXEC [Configuracion].[SP_CRUD_ESTRUCTURA_FORM] 'INSERT','0','2','../XXX/X.PNG','#Bc088c','#FFFFFF','#Bc088c','#Bc088c'
	 /*SELECT_ESTILO_CUENTA*/	SET DATEFORMAT ymd EXEC [Configuracion].[SP_CRUD_ESTRUCTURA_FORM] 'SELECT_ESTILO_CUENTA','0','1'
	 /*SELECT_ESTILO_CLIENTE*/	SET DATEFORMAT ymd EXEC [Configuracion].[SP_CRUD_ESTRUCTURA_FORM] 'SELECT_ESTILO_CLIENTE','0','3'
*/
GO
/****** Object:  StoredProcedure [Configuracion].[SP_CRUD_MENSAJES]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================================================================
 Uso			:	PROCEDIMIENTO ENCARGADO DE GESTIONAR LA TABLA ESTILOCUENTA
 Fecha			:	2020-03-22.
 Autor			:	GERMAN RODRIGUEZ
 Entradas		:	@Option_Crud           NVARCHAR(50),
					@Id					   INT,
					@TipoMensajeId		   BIGINT = NULL,
					@CuerpoMensaje 		   VARCHAR(4000) = NULL,
					@CuerpoMensaje_Interno VARCHAR(4000) = NULL,
					@Url
-- ==========================================================================================*/
CREATE PROCEDURE [Configuracion].[SP_CRUD_MENSAJES]
	@Option_Crud		   NVARCHAR(50),
	@Id					   INT,
	@TipoMensajeId		   BIGINT = NULL,
    @CuerpoMensaje		   VARCHAR(4000) = NULL,
    @CuerpoMensaje_Interno VARCHAR(4000) = NULL,
    @Url				   VARCHAR(4000) = NULL,
    @MaquetaMensaje_Head   VARCHAR(4000) = NULL,
    @MaquetaMensaje_Fotter VARCHAR(4000) = NULL
  AS
BEGIN
	SET NOCOUNT ON;
	SET DATEFORMAT ymd
	
	---------------------------------------------------------------------------------------------------------------------
	--INSERTA DATA A LA TABLA [Configuracion].[Mensajes] (INSERT)
	---------------------------------------------------------------------------------------------------------------------
	IF @Option_Crud = 'INSERT'
	BEGIN
		INSERT INTO [Configuracion].[Mensajes]
				   ([TipoMensajeId]
				   ,[CuerpoMensaje]
				   ,[CuerpoMensaje_Interno]
				   ,[Url]
				   ,[MaquetaMensaje_Head]
				   ,[MaquetaMensaje_Fotter]
				   )
			 VALUES
				   (@TipoMensajeId
				   ,@CuerpoMensaje
				   ,@CuerpoMensaje_Interno
				   ,@Url
				   ,@MaquetaMensaje_Head
				   ,@MaquetaMensaje_Fotter
				   )
			SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY];  --Sirve para mostrar el ID del registro nuevo--
	END
	---------------------------------------------------------------------------------------------------------------------
	--ACTUALIZA EL DATO [Configuracion].[Mensajes] (UPDATE)
	---------------------------------------------------------------------------------------------------------------------
	IF @Option_Crud = 'UPDATE'
	BEGIN
		UPDATE [Configuracion].[Mensajes]
		   SET [CuerpoMensaje] = @CuerpoMensaje
			  ,[CuerpoMensaje_Interno] = @CuerpoMensaje_Interno
			  ,[Url] = @Url
		 WHERE [Id] = @Id
		 SELECT @Id
	END
	
	---------------------------------------------------------------------------------------------------------------------
	--SELECCIONA EL POR TIPO DE MENSAJE
	---------------------------------------------------------------------------------------------------------------------
	IF @Option_Crud = 'SELECT_MENSAJE'
	BEGIN
		SELECT [CuerpoMensaje]
			  ,[CuerpoMensaje_Interno]
			  ,[Url]
			  ,[MaquetaMensaje_Head]
			  ,[MaquetaMensaje_Fotter]
		   FROM [Configuracion].[Mensajes]
		   WHERE [TipoMensajeId] = @TipoMensajeId
	END
	---------------------------------------------------------------------------------------------------------------------
	--SELECCIONA EL POR TIPO DE MENSAJE
	---------------------------------------------------------------------------------------------------------------------
	IF @Option_Crud = 'SELECT_ALL'
	BEGIN
		SELECT M.Id 
		      ,[TipoMensajeId]
			  ,TP.Nombre AS 'TipoMensaje'
		      ,[CuerpoMensaje]
			  ,[CuerpoMensaje_Interno]
			  ,[Url]
		      ,[MaquetaMensaje_Head]
			  ,[MaquetaMensaje_Fotter]
		   FROM [Configuracion].[Mensajes] M
		   INNER JOIN [Configuracion].[Dato] TP ON TP.Id = M.TipoMensajeId  
	END

END

	----------------------------------------------------------------------------------------------------
	--PRUEBAS
	----------------------------------------------------------------------------------------------------

/*
	 /*SELECT*/	                SET DATEFORMAT ymd EXEC [Configuracion].[SP_CRUD_MENSAJES] 'SELECT_MENSAJE','0','11'
	
*/
GO
/****** Object:  StoredProcedure [Configuracion].[SP_CRUD_TABLA]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* =============================================
-- Author:		German Alejandro Rodriguez
-- Create date: 2020-04-01
-- Description:	Procedimiento encargado de administrar la tabla [Configuracion].[Tabla]
-- Parameters:  @Opcion			VARCHAR(50),
				@Id				BIGINT,
				@Nombre    	    VARCHAR(100) = NULL,
				@Activo			INT = NULL 
-- =============================================*/
CREATE PROCEDURE [Configuracion].[SP_CRUD_TABLA]
    @Opcion			VARCHAR(50),
	@Id				BIGINT,
	@Nombre    	    VARCHAR(100) = NULL,
    @Activo			INT = NULL
AS
BEGIN
	SET NOCOUNT ON;
	SET DATEFORMAT ymd
	
	-----------------------------------------------------------------------------------------------------------------
	--INSERTA EN LA TABLA [Configuracion].[Tabla] (INSERT)
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'INSERT'
	BEGIN
		INSERT INTO [Configuracion].[Tabla]
				   ([Nombre]
				   ,[Activo]
				   )
			 VALUES
				   (UPPER(@Nombre)
				   ,@Activo
				   )
		 SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY];  --Sirve para mostrar el ID del registro nuevo--
	END
	-----------------------------------------------------------------------------------------------------------------
	--SELECCIONA LOS OBJETOS PARA ADMINISTRACION DE LOS ITEMS
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'SELECT_DROP'
	BEGIN
		SELECT  [Id]
			  ,[Nombre]
		  FROM [Configuracion].[Tabla]
		  WHERE Activo = 2
	END
END
----------------------------------------------------------------------------------------------------
--PRUEBAS
----------------------------------------------------------------------------------------------------
/*
    SET DATEFORMAT ymd EXEC [Configuracion].[SP_CRUD_TABLA] 'INSERT','0','CONTROL POP UP','1'
    SET DATEFORMAT ymd EXEC [Configuracion].[SP_CRUD_TABLA] 'SELECT_DROP','0'
*/




GO
/****** Object:  StoredProcedure [Proceso].[SP_CRUD_BLOQUE_EVALUACION]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================================================================
 Uso			:	PROCEDIMIENTO ENCARGADO DE GESTIONAR LA TABLA BloqueEvaluacion
 Fecha			:	2020-03-24.
 Autor			:	GERMAN RODRIGUEZ
 Entradas		:	@Opcion      NVARCHAR(50),
					@Id				  BIGINT,
					@FormularioId	  BIGINT = NULL,
					@CargoId          BIGINT = NULL,
					@Descripcion	  VARCHAR(MAX) = NULL,
					@Peso	          BIGINT = NULL,
					@PesoCargo        BIGINT = NULL,
					@Estado	          BIGINT = NULL
-- ==========================================================================================*/
CREATE PROCEDURE [Proceso].[SP_CRUD_BLOQUE_EVALUACION]
	@Opcion           NVARCHAR(50),
	@Id				  BIGINT,
	@FormularioId	  BIGINT = NULL,
	@CargoId          BIGINT = NULL,
	@Descripcion	  VARCHAR(MAX) = NULL,
	@Peso	          VARCHAR(5) = NULL,
	@PesoCargo        VARCHAR(5) = NULL,
	@Estado	          BIGINT = NULL
 AS
BEGIN
	SET NOCOUNT ON;
	SET DATEFORMAT ymd
	
	---------------------------------------------------------------------------------------------------------------------
	--INSERTA DATA A LA TABLA BloqueEvaluacion (INSERT)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'INSERT'
	BEGIN
		INSERT INTO [Proceso].[BloqueEvaluacion]
           ([FormularioId]
		   ,[CargoId]
		   ,[Descripcion]
		   ,[Peso]
		   ,[PesoCargo]
		   ,[Estado]
           )
        VALUES
           (@FormularioId,
		    @CargoId,
		    @Descripcion,
			@Peso,
			@PesoCargo,
			1
           )
			SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY];  --Sirve para mostrar el ID del registro nuevo--
	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE DATA A LA TABLA BloqueEvaluacion (READ)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ_FORMULARIO'
	BEGIN
		SELECT B.[Id]
			  ,B.[FormularioId]
			  ,[CargoId]
			  ,B.[Descripcion]
			  ,B.[Peso]
			  ,B.[PesoCargo]
			  ,B.[Estado]
			  ,C.Descripcion AS Cargo
		  FROM [Proceso].[BloqueEvaluacion] B
		  LEFT OUTER JOIN [Proceso].[Cargos] C ON C.Id = B.CargoId
		  WHERE B.[FormularioId] = @Id 
	END
	---------------------------------------------------------------------------------------------------------------------
	--ACTUALIZA DATA A LA TABLA BloqueEvaluacion (UPDATE)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'UPDATE'
	BEGIN
		UPDATE [Proceso].[BloqueEvaluacion]
		SET [Descripcion] = @Descripcion,
		    [Peso] = @Peso,
			[PesoCargo] = @PesoCargo
		where Id = @Id
		SELECT @Id
	END
     ---------------------------------------------------------------------------------------------------------------------
	--ELIMINAR ID EN LA TABLA NotasDescriptivas (DELETE)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'DELETE'
	BEGIN
	   DELETE FROM [Proceso].[FocoMejoras]
	   WHERE [Id] IN (SELECT FM.Id FROM [Proceso].[FocoMejoras] FM
						INNER JOIN [Proceso].[PuntosEntrenamiento] P ON P.Id = FM.PuntosEntrenamientoId
						INNER JOIN [Proceso].[NotasDescriptivas] N ON N.Id = P.NotasDescriptivasId
						INNER JOIN [Proceso].[BloqueEvaluacion] B ON B.Id = N.BloqueEvaluacionId
						WHERE B.Id = @Id)

       DELETE FROM [Proceso].[PuntosEntrenamiento]
	   WHERE [Id] IN (SELECT P.Id FROM [Proceso].[PuntosEntrenamiento] P
						INNER JOIN [Proceso].[NotasDescriptivas] N ON N.Id = P.NotasDescriptivasId
						INNER JOIN [Proceso].[BloqueEvaluacion] B ON B.Id = N.BloqueEvaluacionId
						WHERE B.Id = @Id)

	   DELETE FROM [Proceso].[NotasDescriptivas]
	   WHERE [Id] IN (SELECT N.Id FROM [Proceso].[NotasDescriptivas] N
						INNER JOIN [Proceso].[BloqueEvaluacion] B ON B.Id = N.BloqueEvaluacionId
						WHERE B.Id = @Id)

	   DELETE FROM [Proceso].[BloqueEvaluacion]
	   WHERE [Id] = @Id


	   SELECT COUNT(1) FROM [Proceso].[BloqueEvaluacion]
	   WHERE [Id] = @Id
	END
END

	----------------------------------------------------------------------------------------------------
	--PRUEBAS
	----------------------------------------------------------------------------------------------------

/*
   /*INSERT*/			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_BLOQUE_EVALUACION] 'INSERT','0','PRUEBA','1'
   /*READ*/ 			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_BLOQUE_EVALUACION] 'READ_FORMULARIO','1'
 */

GO
/****** Object:  StoredProcedure [Proceso].[SP_CRUD_CAMPANA]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* =============================================
-- Author:		German Alejandro Rodriguez
-- Create date: 2020-04-01
-- Description:	Procedimiento encargado de administrar la tabla [Configuracion].[CampanaAplicaciones]
-- Parameters:  @Opcion				VARCHAR(50),
				@Id					   BIGINT,
				@ClienteId             BIGINT = NULL,
				@Nombre				   VARCHAR(200) = NULL,
				@Estado				   INT = NULL,
				@CantidadMonitoreos	   INT = NULL,
				@FrecuenciaMonitoreoId BIGINT = NULL
-- =============================================*/
CREATE PROCEDURE [Proceso].[SP_CRUD_CAMPANA]
    @Opcion				   VARCHAR(50),
	@Id					   BIGINT,
	@ClienteId             BIGINT = NULL,
    @Nombre				   VARCHAR(200) = NULL,
    @Estado				   INT = NULL,
    @CantidadMonitoreos	   INT = NULL,
	@FrecuenciaMonitoreoId BIGINT = NULL,
	@CoordinadorMonitorea  INT = NULL
AS
BEGIN
	SET NOCOUNT ON;
	SET DATEFORMAT ymd
	
	-----------------------------------------------------------------------------------------------------------------
	--TRAE LA DATA DE LA [Proceso].[Campana] (READ)
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ'
	BEGIN
	    SELECT C.[Id]
			  ,[ClienteId] 
			  ,CL.Nombre AS Cliente
			  ,C.[Nombre] AS Campana
			  ,C.CantidadMonitoreos
			  ,C.FrecuenciaMonitoreoId
			  ,FM.Nombre AS FrecuenciaMonitoreo
			  ,C.[Estado]
			  ,[CoordinadorMonitorea]
		   FROM [Proceso].[Campana] C
		   INNER JOIN [Proceso].[Cliente] CL ON CL.Id = C.ClienteId
		   INNER JOIN [Configuracion].[Dato] FM ON FM.Id = C.FrecuenciaMonitoreoId
	END
    -----------------------------------------------------------------------------------------------------------------
	--TRAE LA DATA DE LA [Proceso].[Campana] (READ)
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ_ALL'
	BEGIN
	    SELECT C.[Id]
			  ,[ClienteId] 
			  ,CL.Nombre AS Cliente
			  ,C.[Nombre] AS Campana
			  ,C.[Estado]
			  ,C.CantidadMonitoreos
			  ,C.FrecuenciaMonitoreoId
			  ,FM.Nombre AS FrecuenciaMonitoreo
			  ,[Logo] 
		      ,[ColorBack]
			  ,[ColorHeaderTitle]
			  ,[ColorLabel]
			  ,ColorAlerta
			  ,[CoordinadorMonitorea]
			  ,[EMAIL_FROM]
			  ,[SMTP]
			  ,[EMAIL_CONFIG]
			  ,[EMAIL_PASS]
		   FROM [Proceso].[Campana] C
		   INNER JOIN [Proceso].[Cliente] CL ON CL.Id = C.ClienteId
		   INNER JOIN [Configuracion].[Dato] FM ON FM.Id = C.FrecuenciaMonitoreoId
		   LEFT OUTER JOIN [Configuracion].[EstiloCampana] ES ON ES.CampanaId = C.Id
		   LEFT OUTER JOIN [Configuracion].[CorreoCampana] CC ON CC.CampanaId = C.Id
	END
    -----------------------------------------------------------------------------------------------------------------
	--INSERTA EN LA TABLA [Proceso].[Campana] (INSERT)
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'INSERT'
	BEGIN
		INSERT INTO [Proceso].[Campana]
			   ([ClienteId]
			   ,[Nombre]
			   ,[Estado]
			   ,CantidadMonitoreos
			   ,FrecuenciaMonitoreoId
			   ,[CoordinadorMonitorea]
			   )
			 VALUES
			   (@ClienteId,
				@Nombre,
				@Estado,
				@CantidadMonitoreos,
				@FrecuenciaMonitoreoId,
				@CoordinadorMonitorea
			   )
			SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY];  --Sirve para mostrar el ID del registro nuevo--
	END
	---------------------------------------------------------------------------------------------------------------------
	--ACTUALIZA DATA A LA TABLA [Proceso].[Campana] (UPDATE)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'UPDATE'
	BEGIN
		UPDATE [Proceso].[Campana]
			SET [Nombre] = @Nombre,
			    CantidadMonitoreos = @CantidadMonitoreos,
				FrecuenciaMonitoreoId = @FrecuenciaMonitoreoId,
				[CoordinadorMonitorea] =@CoordinadorMonitorea
		where Id = @Id
		SELECT @Id
	END

	-----------------------------------------------------------------------------------------------------------------
	--VALIDA EL CAMPAÑA SI EXISTE EN EL SISTEMA
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'EXISTE_CAMPANA'
	BEGIN
		SELECT COUNT(1) AS CANTIDAD FROM [Proceso].[Campana]
									WHERE Nombre = @Nombre
									AND ClienteId = @ClienteId
	END
	-----------------------------------------------------------------------------------------------------------------
	--TRAE LA DATA DE LA [Proceso].[Campana] (READ)
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ_ALL_CAMPANAS'
	BEGIN
	    SELECT C.[Id]
			  ,CL.Nombre + ' - ' + C.[Nombre] AS Nombre
		   FROM [Proceso].[Campana] C
		   INNER JOIN [Proceso].[Cliente] CL ON CL.Id =C.ClienteId  
		   WHERE C.Estado = 1
		  ORDER BY CL.Nombre, c.Nombre ASC
	END
	-----------------------------------------------------------------------------------------------------------------
	--TRAE si el coordinador monitoera (READ)
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ_COORDI_MONITO'
	BEGIN
	  SELECT [CoordinadorMonitorea] FROM [Proceso].[Campana] 
		where Id = @Id
	END
	
END
----------------------------------------------------------------------------------------------------
--PRUEBAS
----------------------------------------------------------------------------------------------------
/*
    SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_CAMPANA] 'INSERT','0','U','1','4','1'
    SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_CAMPANA] 'READ','0'
    SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_CAMPANA] 'READ_ALL','0'
	SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_CAMPANA] 'SELECT_ACCESO_USER','0','U','6'
    SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_CAMPANA] 'READ_ALL_CAMPANAS','0'
	SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_CAMPANA] 'READ_COORDI_MONITO','1'
*/


GO
/****** Object:  StoredProcedure [Proceso].[SP_CRUD_CARGOS]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================================================================
 Uso			:	PROCEDIMIENTO ENCARGADO DE GESTIONAR LA TABLA CARGOS
 Fecha			:	2020-03-24.
 Autor			:	GERMAN RODRIGUEZ
 Entradas		:	@Opcion      NVARCHAR(50),
					@Id				  BIGINT,
					@CampanaId        BIGINT = NULL,
					@FormularioId     BIGINT = NULL,
					@Descripcion      VARCHAR(500) = NULL,
					@Estado	          BIGINT = NULL
-- ==========================================================================================*/
CREATE PROCEDURE [Proceso].[SP_CRUD_CARGOS]
	@Opcion      NVARCHAR(50),
	@Id				  BIGINT,
	@CampanaId        BIGINT = NULL,
	@FormularioId     BIGINT = NULL,
	@Descripcion      VARCHAR(500) = NULL,
	@Peso	          VARCHAR(5) = NULL,
	@Estado	          BIGINT = NULL
 AS
BEGIN
	SET NOCOUNT ON;
	SET DATEFORMAT ymd
	
	---------------------------------------------------------------------------------------------------------------------
	--INSERTA DATA A LA TABLA CARGOS (INSERT)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'INSERT'
	BEGIN
		INSERT INTO [Proceso].[CARGOS]
           ([CampanaId]
		   ,[FormularioId]
		   ,[Descripcion]
		   ,[Peso]
		   ,[Estado]
           )
        VALUES
           (@CampanaId,
		    @FormularioId,
			@Descripcion,
			@Peso,
		    1
           )
		SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY];  --Sirve para mostrar el ID del registro nuevo--
	END
	---------------------------------------------------------------------------------------------------------------------
	--INSERTA DATA A LA TABLA CARGOS (INSERT)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'UPDATE'
	BEGIN
		UPDATE [Proceso].[CARGOS]
           SET [Descripcion] = @Descripcion,
		       [Peso] = @Peso
			WHERE Id = @Id		
			SELECT @Id;  --Sirve para mostrar el ID del registro nuevo--
	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE DATA A LA TABLA CARGOS (READ)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ_CAMPANA'
	BEGIN
		SELECT  [Id]
			  ,[FormularioId]
			  ,[Descripcion]
			  ,[Estado]
			  ,[Peso]
		  FROM [Proceso].[Cargos]
		  WHERE [CampanaId] = @Id

	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE DATA A LA TABLA CARGOS (READ)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ_FORMULARIO'
	BEGIN
		SELECT [Id]
			  ,[CampanaId]
			  ,[Descripcion]
			  ,[Peso]
			  ,[Estado]
		  FROM [Proceso].[Cargos]
		WHERE [FormularioId] = @Id 
	END
	---------------------------------------------------------------------------------------------------------------------
	--ELIMINAR ID EN LA TABLA CARGOS (DELETE)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'DELETE'
	BEGIN
	   DELETE FROM [Proceso].[FocoMejoras]
       WHERE [Id] IN (SELECT FM.Id FROM [Proceso].[FocoMejoras] FM
						INNER JOIN [Proceso].[PuntosEntrenamiento] P ON P.Id = FM.PuntosEntrenamientoId
						INNER JOIN [Proceso].[NotasDescriptivas] N ON N.Id = P.NotasDescriptivasId
						INNER JOIN [Proceso].[BloqueEvaluacion] B ON B.Id = N.BloqueEvaluacionId
						INNER JOIN [Proceso].[Cargos] C ON C.Id = B.CargoId
						WHERE C.Id = @Id)

       DELETE FROM [Proceso].[PuntosEntrenamiento]
	   WHERE [Id] IN (SELECT P.Id FROM [Proceso].[PuntosEntrenamiento] P
						INNER JOIN [Proceso].[NotasDescriptivas] N ON N.Id = P.NotasDescriptivasId
						INNER JOIN [Proceso].[BloqueEvaluacion] B ON B.Id = N.BloqueEvaluacionId
						INNER JOIN [Proceso].[Cargos] C ON C.Id = B.CargoId
						WHERE C.Id = @Id)

	   DELETE FROM [Proceso].[NotasDescriptivas]
	   WHERE [Id] IN (SELECT N.Id FROM [Proceso].[NotasDescriptivas] N
						INNER JOIN [Proceso].[BloqueEvaluacion] B ON B.Id = N.BloqueEvaluacionId
						INNER JOIN [Proceso].[Cargos] C ON C.Id = B.CargoId
						WHERE C.Id = @Id)

	   DELETE FROM [Proceso].[BloqueEvaluacion]
	   WHERE [Id] IN (SELECT B.Id FROM [Proceso].[BloqueEvaluacion] B
						INNER JOIN [Proceso].[Cargos] C ON C.Id = B.CargoId
						WHERE C.Id = @Id)

	   DELETE FROM [Proceso].[Cargos]
	   WHERE Id = @Id

	   SELECT COUNT(1) FROM [Proceso].[Cargos]
	   WHERE [Id] = @Id
	END

END

	----------------------------------------------------------------------------------------------------
	--PRUEBAS
	----------------------------------------------------------------------------------------------------

/*
   /*INSERT*/			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_CARGOS] 'INSERT','0','PRUEBA','1'
   /*READ*/ 			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_CARGOS] 'READ_CAMPANA','1'
   /*READ*/ 			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_CARGOS] 'READ_FORMULARIO','1'
   /*INSERT*/			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_CARGOS] 'UPDATE','1','0','0','prueba'
*/

GO
/****** Object:  StoredProcedure [Proceso].[SP_CRUD_CLIENTE]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================================================================
 Uso			:	PROCEDIMIENTO ENCARGADO DE GESTIONAR LA TABLA CLIENTE
 Fecha			:	2020-03-24.
 Autor			:	GERMAN RODRIGUEZ
 Entradas		:	@Opcion      NVARCHAR(50),
					@Id				  BIGINT,
					@Nombre			  VARCHAR(500) = NULL,
					@Estado	          BIGINT = NULL
-- ==========================================================================================*/
CREATE PROCEDURE [Proceso].[SP_CRUD_CLIENTE]
	@Opcion      NVARCHAR(50),
	@Id				  BIGINT,
	@Nombre			  VARCHAR(500) = NULL,
	@Nit			  VARCHAR(50) = NULL,
	@Estado	          BIGINT = NULL
 AS
BEGIN
	SET NOCOUNT ON;
	SET DATEFORMAT ymd
	
	---------------------------------------------------------------------------------------------------------------------
	--INSERTA DATA A LA TABLA CLIENTE (INSERT)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'INSERT'
	BEGIN
		INSERT INTO [Proceso].[Cliente]
           ([Nombre]
		   ,[Nit]
		   ,[Estado]
           )
        VALUES
           (@Nombre,
		    @Nit,
			1
           )
			SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY];  --Sirve para mostrar el ID del registro nuevo--
	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE DATA A LA TABLA CLIENTE (READ)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ'
	BEGIN
		SELECT [Id]
			  ,[Nombre]
			  ,[Nit]
			  ,[Estado]
		  FROM [Proceso].[Cliente]
	END
	---------------------------------------------------------------------------------------------------------------------
	--ACTUALIZA DATA A LA TABLA CLIENTE (UPDATE)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'UPDATE'
	BEGIN
		UPDATE [Proceso].[Cliente]
		SET [Nombre] = @Nombre,
		    [Nit] = @Nit
		where Id = @Id
		SELECT @Id
	END
-----------------------------------------------------------------------------------------------------------------
	--VALIDA EL CLIENTE SI EXISTE EN EL SISTEMA
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'EXISTE_CLIENTE'
	BEGIN
		SELECT COUNT(1) AS CANTIDAD FROM [Proceso].[Cliente]
									WHERE Nombre = @Nombre
	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE LOS CLIENTES ACTIVOS 
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'LIST_CLIENTES'
	BEGIN
		SELECT Id, 
		       Nombre 
	    FROM [Proceso].[Cliente] 
		WHERE Estado = 1
	END
END

	----------------------------------------------------------------------------------------------------
	--PRUEBAS
	----------------------------------------------------------------------------------------------------

/*
   /*INSERT*/			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_CLIENTE] 'INSERT','0','PRUEBA','1'
   /*READ*/ 			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_CLIENTE] 'READ','0'
   /*READ*/ 			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_CLIENTE] 'EXISTE_CLIENTE' ,'0','PRUEBA EDICION'
   /*LIST_CLIENTES*/ 	SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_CLIENTE] 'LIST_CLIENTES' ,'0'
*/

GO
/****** Object:  StoredProcedure [Proceso].[SP_CRUD_CONFIG_MONITOREO]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================================================================
 Uso			:	PROCEDIMIENTO ENCARGADO DE GESTIONAR LA TABLA CLIENTE
 Fecha			:	2020-03-24.
 Autor			:	GERMAN RODRIGUEZ
 Entradas		:	@Opcion      NVARCHAR(50),
					@Id				  BIGINT,
					@Nombre			  VARCHAR(500) = NULL,
					@Estado	          BIGINT = NULL
-- ==========================================================================================*/
CREATE PROCEDURE [Proceso].[SP_CRUD_CONFIG_MONITOREO]
	@Opcion      NVARCHAR(50),
	@Id				    BIGINT,
	@FormularioId	    BIGINT = NULL,
	@Ope_Nivel_0	    INT = NULL,
	@Ope_Nivel_1	    INT = NULL,
	@Ope_Nivel_2	    INT = NULL,
	@VariosOperadores   INT = NULL,
	@Ope_Nivel_3	    INT = NULL,
	@Ope_Nivel_4	    INT = NULL,
	@OpcCumple		    INT = NULL,
	@OpcNoCumple	    INT = NULL,
	@OpcNoAplica	    INT = NULL,
	@NoAplicaPeso	    INT = NULL,
	@AplicaErrorCritico INT = NULL,
	@MonitoreoXDefecto  VARCHAR(2) = NULL
 AS
BEGIN
	SET NOCOUNT ON;
	SET DATEFORMAT ymd
	
	---------------------------------------------------------------------------------------------------------------------
	--INSERTA DATA A LA TABLA CLIENTE (INSERT)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'INSERT'
	BEGIN
		INSERT INTO [Proceso].[Formulacion_Config_Monitoreo]
           ([FormularioId]
           ,[Ope_Nivel_0]
           ,[Ope_Nivel_1]
           ,[VariosOperadores]
           ,[Ope_Nivel_2]
           ,[Ope_Nivel_3]
           ,[Ope_Nivel_4]
           ,[OpcCumple]
           ,[OpcNoCumple]
           ,[OpcNoAplica]
           ,[NoAplicaPeso]
		   ,[AplicaErrorCritico]
           ,[MonitoreoXDefecto]
           )
     VALUES
           (@FormularioId
           ,@Ope_Nivel_0
           ,@Ope_Nivel_1
           ,@VariosOperadores
           ,@Ope_Nivel_2
           ,@Ope_Nivel_3
           ,@Ope_Nivel_4
           ,@OpcCumple
           ,@OpcNoCumple
           ,@OpcNoAplica
           ,@NoAplicaPeso
		   ,@AplicaErrorCritico
           ,@MonitoreoXDefecto
           )
			SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY];  --Sirve para mostrar el ID del registro nuevo--
	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE DATA A LA TABLA CLIENTE (READ)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ_FORMULARIOID'
	BEGIN
		SELECT  [Id]
			  ,[Ope_Nivel_0]
			  ,[Ope_Nivel_1]
			  ,[VariosOperadores]
			  ,[Ope_Nivel_2]
			  ,[Ope_Nivel_3]
			  ,[Ope_Nivel_4]
			  ,[OpcCumple]
			  ,[OpcNoCumple]
			  ,[OpcNoAplica]
			  ,[NoAplicaPeso]
			  ,[AplicaErrorCritico]
			  ,[MonitoreoXDefecto]
		  FROM [Proceso].[Formulacion_Config_Monitoreo]
		  WHERE [FormularioId] = @FormularioId
	END
	---------------------------------------------------------------------------------------------------------------------
	--ACTUALIZA DATA A LA TABLA CLIENTE (UPDATE)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'UPDATE'
	BEGIN
		UPDATE [Proceso].[Formulacion_Config_Monitoreo]
		   SET [Ope_Nivel_0] = @Ope_Nivel_0
			  ,[Ope_Nivel_1] = @Ope_Nivel_1
			  ,[VariosOperadores] = @VariosOperadores
			  ,[Ope_Nivel_2] = @Ope_Nivel_2
			  ,[Ope_Nivel_3] = @Ope_Nivel_3
			  ,[Ope_Nivel_4] = @Ope_Nivel_4
			  ,[OpcCumple] = @OpcCumple
			  ,[OpcNoCumple] = @OpcNoCumple
			  ,[OpcNoAplica] = @OpcNoAplica
			  ,[NoAplicaPeso] = @NoAplicaPeso
			  ,[MonitoreoXDefecto] = @MonitoreoXDefecto
			  ,[AplicaErrorCritico] =@AplicaErrorCritico
		 WHERE [FormularioId] = @FormularioId
		SELECT @FormularioId
	END

	
END

	----------------------------------------------------------------------------------------------------
	--PRUEBAS
	----------------------------------------------------------------------------------------------------

/*
   /*INSERT*/			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_CONFIG_MONITOREO] 'INSERT','0','PRUEBA','1'
   /*READ*/ 			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_CONFIG_MONITOREO] 'READ_FORMULARIOID','0','2'
*/

GO
/****** Object:  StoredProcedure [Proceso].[SP_CRUD_CONTROLCARGUE]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================================================================
 Uso			:	PROCEDIMIENTO ENCARGADO DE administrar la tabla [Proceso].[ControlCargue]
 Fecha			:	2020-03-24.
 Autor			:	GERMAN RODRIGUEZ
 Entradas		:	@Opcion							NVARCHAR(50),
					@Id   							BIGINT,
					@CampanaId						BIGINT = NULL,
					@UsuarioId						BIGINT = NULL,
					@CantidadRegistros				BIGINT = NULL,
					@CantidadRegistrosCreados	    BIGINT = NULL,
					@CantidadRegistrosActualizados	BIGINT = NULL

==========================================================================================*/
create PROCEDURE [Proceso].[SP_CRUD_CONTROLCARGUE]
	@Opcion							NVARCHAR(50),
	@Id   							BIGINT,
	@CampanaId						BIGINT = NULL,
	@UsuarioId						BIGINT = NULL,
	@CantidadRegistros				BIGINT = NULL,
	@CantidadRegistrosCreados	    BIGINT = NULL,
	@CantidadRegistrosActualizados	BIGINT = NULL,
	@CantidadRegistros_NoInsertados BIGINT = NULL,
	@TipoCargueId                   BIGINT = NULL,
	@CantidadError_1                BIGINT = NULL,
	@CantidadError_2                BIGINT = NULL,
	@CantidadError_3                BIGINT = NULL,
	@CantidadError_4                BIGINT = NULL,
	@CantidadError_5                BIGINT = NULL
 AS
BEGIN
	SET NOCOUNT ON;
	SET DATEFORMAT ymd
	
	---------------------------------------------------------------------------------------------------------------------
	--PROCESO SE CREACION DE TABLA SESION
	---------------------------------------------------------------------------------------------------------------------
    IF @Opcion ='INSERT'
	BEGIN
		INSERT INTO [Proceso].[ControlCargue]
			   ([CampanaId]
			   ,[UsuarioId]
			   ,[CantidadRegistros]
			   ,[CantidadRegistrosCreados]
			   ,[CantidadRegistrosActualizados]
			   ,CantidadRegistros_NoInsertados
			   ,[TipoCargueId]
			   )
		 VALUES
			   (@CampanaId
			   ,@UsuarioId
			   ,@CantidadRegistros
			   ,@CantidadRegistrosCreados
			   ,@CantidadRegistrosActualizados
			   ,@CantidadRegistros_NoInsertados
			   ,@TipoCargueId
			   )
		 SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY];  --Sirve para mostrar el ID del registro nuevo--
	END
	---------------------------------------------------------------------------------------------------------------------
	--PROCESO DE ACTUALIZACION DE TABLA SESION
	---------------------------------------------------------------------------------------------------------------------
    IF @Opcion ='UPDATE'
	BEGIN
		UPDATE [Proceso].[ControlCargue]
			SET [CantidadRegistros] = @CantidadRegistros,
			    [CantidadRegistrosCreados] = @CantidadRegistrosCreados,
				[CantidadRegistrosActualizados] = @CantidadRegistrosActualizados,
				CantidadRegistros_NoInsertados = @CantidadRegistros_NoInsertados
		WHERE Id = @Id

		SELECT [Id]
			  ,[CantidadRegistros]
			  ,[CantidadRegistrosCreados]
			  ,[CantidadRegistrosActualizados]
			  ,CantidadRegistros_NoInsertados
		  FROM [Proceso].[ControlCargue]
	    WHERE Id = @Id

	END
	---------------------------------------------------------------------------------------------------------------------
	--PROCESO DE ACTUALIZACION DE TABLA SESION
	---------------------------------------------------------------------------------------------------------------------
    IF @Opcion ='UPDATE_2'
	BEGIN
		UPDATE [Proceso].[ControlCargue]
			SET [CantidadRegistros] = @CantidadRegistros,
			    [CantidadRegistrosCreados] = @CantidadRegistrosCreados,
				[CantidadRegistrosActualizados] = @CantidadRegistrosActualizados,
				CantidadRegistros_NoInsertados = @CantidadRegistros_NoInsertados
		WHERE Id = @Id

		SELECT [Id]
			  ,[CantidadRegistros]
			  ,[CantidadRegistrosCreados]
			  ,[CantidadRegistrosActualizados]
			  ,CantidadRegistros_NoInsertados
			  ,@CantidadError_1 AS CantidadError_1 
			  ,@CantidadError_2 AS CantidadError_2
			  ,@CantidadError_3 AS CantidadError_3
		  FROM [Proceso].[ControlCargue]
	    WHERE Id = @Id

	END
END

	----------------------------------------------------------------------------------------------------
	--PRUEBAS
	----------------------------------------------------------------------------------------------------

/*
   /*insert*/   SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_CONTROLCARGUE] 'INSERT','0','1','6','0','0','0'
   /*insert*/   SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_CONTROLCARGUE] 'UPDATE','0','1','6','0','0','0'
   /*UPDATE_2*/ SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_CONTROLCARGUE] 'UPDATE_2','40','0','0','7','0','4','3','115','1','1','1'
*/
GO
/****** Object:  StoredProcedure [Proceso].[SP_CRUD_FOCO_MEJORA]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================================================================
 Uso			:	PROCEDIMIENTO ENCARGADO DE GESTIONAR LA TABLA FocoMejoras
 Fecha			:	2020-03-24.
 Autor			:	GERMAN RODRIGUEZ
 Entradas		:	@Opcion                 NVARCHAR(50),
					@Id				        BIGINT,
					@PuntosEntrenamientoId  BIGINT = NULL,
					@Descripcion            VARCHAR(500) = NULL,
					@Peso	                BIGINT = NULL,
					@Estado	                BIGINT = NULL
-- ==========================================================================================*/
CREATE PROCEDURE [Proceso].[SP_CRUD_FOCO_MEJORA]
	@Opcion                 NVARCHAR(50),
	@Id				        BIGINT,
	@PuntosEntrenamientoId  BIGINT = NULL,
	@Descripcion            VARCHAR(500) = NULL,
	@Peso	                VARCHAR(5) = NULL,
	@Estado	                BIGINT = NULL
 AS
BEGIN
	SET NOCOUNT ON;
	SET DATEFORMAT ymd
	
	---------------------------------------------------------------------------------------------------------------------
	--INSERTA DATA A LA TABLA FocoMejoras (INSERT)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'INSERT'
	BEGIN
		INSERT INTO [Proceso].[FocoMejoras]
           ([PuntosEntrenamientoId]
		   ,[Descripcion]
		   ,[Peso]
		   ,[Estado]
           )
        VALUES
           (@PuntosEntrenamientoId,
			@Descripcion,
			@Peso,
		    1
           )
		SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY];  --Sirve para mostrar el ID del registro nuevo--
	END
	---------------------------------------------------------------------------------------------------------------------
	--INSERTA DATA A LA TABLA FocoMejoras (INSERT)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'UPDATE'
	BEGIN
		UPDATE [Proceso].[FocoMejoras]
           SET [Descripcion] = @Descripcion,
		       [Peso] = @Peso
			WHERE Id = @Id		
			SELECT @Id;  --Sirve para mostrar el ID del registro nuevo--
	END
	
	---------------------------------------------------------------------------------------------------------------------
	--TRAE DATA A LA TABLA FocoMejoras (READ)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ_FORMULARIO'
	BEGIN
		SELECT FM.[Id]
			  ,[PuntosEntrenamientoId]
			  ,FM.[Descripcion]
			  ,FM.[Peso]
			  ,FM.[Estado]
			  ,P.Descripcion AS PuntosEntrenamiento
		  FROM [Proceso].[FocoMejoras] FM
		  INNER JOIN [Proceso].[PuntosEntrenamiento] P ON P.Id = FM.PuntosEntrenamientoId
		  INNER JOIN [Proceso].[NotasDescriptivas] N ON N.Id = P.NotasDescriptivasId
		  INNER JOIN [Proceso].[BloqueEvaluacion] B ON B.Id = N.BloqueEvaluacionId
		  INNER JOIN [Proceso].[Formulario] F ON F.Id = B.FormularioId
		  INNER JOIN [Configuracion].[Dato] E ON E.Id = P.EstadoProcesoId
		WHERE [FormularioId] = @Id 
	END
	 ---------------------------------------------------------------------------------------------------------------------
	--ELIMINAR ID EN LA TABLA FocoMejoras (DELETE)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'DELETE'
	BEGIN
	   DELETE FROM [Proceso].[FocoMejoras]
	   WHERE [Id] = @Id

	   SELECT COUNT(1) FROM [Proceso].[FocoMejoras]
	   WHERE [Id] = @Id
	END

END

	----------------------------------------------------------------------------------------------------
	--PRUEBAS
	----------------------------------------------------------------------------------------------------

/*
   /*INSERT*/			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_FOCO_MEJORA] 'INSERT','0','PRUEBA','1'
   /*READ*/ 			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_FOCO_MEJORA] 'READ_CAMPANA','1'
   /*READ*/ 			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_FOCO_MEJORA] 'READ_FORMULARIO','1'
   /*INSERT*/			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_FOCO_MEJORA] 'UPDATE','1','0','0','prueba'
*/

GO
/****** Object:  StoredProcedure [Proceso].[SP_CRUD_FORMULARIO]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================================================================
 Uso			:	PROCEDIMIENTO ENCARGADO DE GESTIONAR LA TABLA FORMULARIO
 Fecha			:	2020-03-24.
 Autor			:	GERMAN RODRIGUEZ
 Entradas		:	@Opcion      NVARCHAR(50),
					@Id				  BIGINT,
					@CampanaId        BIGINT = NULL,
					@Estado	          BIGINT = NULL
-- ==========================================================================================*/
CREATE PROCEDURE [Proceso].[SP_CRUD_FORMULARIO]
	@Opcion				NVARCHAR(50),
	@Id					BIGINT,
	@CampanaId			BIGINT = NULL,
	@Descripcion		VARCHAR(500) = NULL,
	@ValorMaximoEvaluar	INT = NULL,
	@Estado				BIGINT = NULL
 AS
BEGIN
	SET NOCOUNT ON;
	SET DATEFORMAT ymd
	
	---------------------------------------------------------------------------------------------------------------------
	--INSERTA DATA A LA TABLA FORMULARIO (INSERT)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'INSERT'
	BEGIN
		INSERT INTO [Proceso].[Formulario]
           ([CampanaId]
		   ,[Descripcion]
		   ,[ValorMaximoEvaluar]
		   ,[Estado]
		   ,[Nivel_0]
		   ,[Nivel_1]
		   ,[Nivel_2]
		   ,[Nivel_3]
		   ,[Nivel_4]
		   ,[ErrorCriticoNivel]
		   ,[PesoPonderadoNivel]
           )
        VALUES
           (@CampanaId,
		    UPPER(@Descripcion),
			@ValorMaximoEvaluar,
		    1,
			0,
			0,
			0,
			0,
			0,
			2,
			2
           )
		SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY];  --Sirve para mostrar el ID del registro nuevo--
	END
	---------------------------------------------------------------------------------------------------------------------
	--ACTUALIZA DATA A LA TABLA FORMULARIO (UPDATE)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'UPDATE'
	BEGIN
		UPDATE [Proceso].[Formulario]
           SET [Descripcion] = @Descripcion,
		       [ValorMaximoEvaluar] = @ValorMaximoEvaluar
		   WHERE Id = @Id
		SELECT @Id
	END
	---------------------------------------------------------------------------------------------------------------------
	--ACTUALIZA DATA A LA TABLA FORMULARIO (UPDATE)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'UPDATE_NIVELES'
	BEGIN
		UPDATE [Proceso].[Formulario]
           SET [PesoPonderadoNivel] = @Descripcion,
		       [ErrorCriticoNivel] = @ValorMaximoEvaluar
		   WHERE Id = @Id
		SELECT @Id
	END
	---------------------------------------------------------------------------------------------------------------------
	--ACTUALIZA CONTADOR A LA TABLA FORMULARIO (UPDATE)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'UPDATE_CONTADOR'
	BEGIN
	    DECLARE @CONTADOR INT

		IF @Descripcion = 'CantCargo'
		BEGIN
		     SET @CONTADOR =(SELECT COUNT(1) FROM [Proceso].[Cargos] C 
			                 INNER JOIN [Proceso].[Formulario] F ON F.Id = C.FormularioId 
							  WHERE F.Id = @Id)

			UPDATE [Proceso].[Formulario]
			   SET Nivel_0 = @CONTADOR
			   WHERE Id = @Id
		END
		IF @Descripcion = 'CantBloque'
		BEGIN
			  SET @CONTADOR =(SELECT COUNT(1) FROM [Proceso].[BloqueEvaluacion] B 
			                 INNER JOIN [Proceso].[Formulario] F ON F.Id = B.FormularioId 
							  WHERE F.Id = @Id)

			UPDATE [Proceso].[Formulario]
			   SET Nivel_1 = @CONTADOR
			   WHERE Id = @Id
		END
		IF @Descripcion = 'CantNotas'
		BEGIN
			SET @CONTADOR =(SELECT COUNT(1) FROM [Proceso].[NotasDescriptivas] N
			                 INNER JOIN [Proceso].[BloqueEvaluacion] B ON B.Id = N.BloqueEvaluacionId
			                 INNER JOIN [Proceso].[Formulario] F ON F.Id = B.FormularioId 
							  WHERE F.Id = @Id)

			UPDATE [Proceso].[Formulario]
			   SET Nivel_2 = @CONTADOR
			   WHERE Id = @Id
		END
		IF @Descripcion = 'CantPunto'
		BEGIN
		    SET @CONTADOR =(SELECT COUNT(1) FROM [Proceso].[PuntosEntrenamiento] P
			                 INNER JOIN [Proceso].[NotasDescriptivas] N ON N.Id = P.NotasDescriptivasId
			                 INNER JOIN [Proceso].[BloqueEvaluacion] B ON B.Id = N.BloqueEvaluacionId
			                 INNER JOIN [Proceso].[Formulario] F ON F.Id = B.FormularioId 
							  WHERE F.Id = @Id)

			UPDATE [Proceso].[Formulario]
			   SET Nivel_3 = @CONTADOR
			   WHERE Id = @Id
		END
		IF @Descripcion = 'CantFoco'
		BEGIN
		    SET @CONTADOR =(SELECT COUNT(1) FROM [Proceso].[FocoMejoras] FM
			                 INNER JOIN [Proceso].[PuntosEntrenamiento] P ON P.Id = FM.PuntosEntrenamientoId
			                 INNER JOIN [Proceso].[NotasDescriptivas] N ON N.Id = P.NotasDescriptivasId
			                 INNER JOIN [Proceso].[BloqueEvaluacion] B ON B.Id = N.BloqueEvaluacionId
			                 INNER JOIN [Proceso].[Formulario] F ON F.Id = B.FormularioId 
							  WHERE F.Id = @Id)

			UPDATE [Proceso].[Formulario]
			   SET Nivel_4 = @CONTADOR
			   WHERE Id = @Id
		END
		SELECT @Id
	END	
	---------------------------------------------------------------------------------------------------------------------
	--TRAE DATA A LA TABLA FORMULARIO (READ)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ_CAMPANA'
	BEGIN
		SELECT  F.[Id]
		       ,F.[Descripcion]
			   ,F.[ValorMaximoEvaluar]
			   ,F.[Estado]
			   ,F.[Nivel_0]
			   ,F.[Nivel_1]
			   ,F.[Nivel_2]
			   ,F.[Nivel_3]
			   ,F.[Nivel_4]
			   ,F.[PesoPonderadoNivel]
			   ,F.[ErrorCriticoNivel]
				  FROM [Proceso].[Formulario] F
				WHERE F.[CampanaId] = @CampanaId 
	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE DATA A LA TABLA FORMULARIO (READ)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ_FORM_LIST'
	BEGIN
		SELECT  F.[Id]
		       ,F.[Descripcion]
			   ,F.[ValorMaximoEvaluar]
			   ,F.[Estado]
			   ,F.[Nivel_0]
			   ,F.[Nivel_1]
			   ,F.[Nivel_2]
			   ,F.[Nivel_3]
			   ,F.[Nivel_4]
			   ,F.[PesoPonderadoNivel]
			   ,F.[ErrorCriticoNivel]
				  FROM [Proceso].[Formulario] F
				WHERE F.[CampanaId] = @CampanaId 
				AND Estado In(2,3) 
	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE DATA A LA TABLA FORMULARIO (READ)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ_ID'
	BEGIN
		SELECT [CampanaId]
		      ,[Descripcion]
			  ,[Estado]
		  FROM [Proceso].[Formulario]
		WHERE [Id] = @Id 
	END
	---------------------------------------------------------------------------------------------------------------------
	--ACTUALIZA EL ESTADO A LA TABLA FORMULARIO (UPDATE)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'UPDATE_ESTADO'
	BEGIN
		UPDATE [Proceso].[Formulario]
           SET [Estado] = @CampanaId
		   WHERE Id = @Id
		SELECT @Id
	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE DATA A LA TABLA FORMULARIO (READ)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ_DATA_FORMULARIO'
	BEGIN
		SELECT CampanaId,
			   Descripcion,
			   [ValorMaximoEvaluar],
			   1 AS Estado,
			   Nivel_0,
			   Nivel_1,
			   Nivel_2,
			   Nivel_3,
			   Nivel_4,
			   PesoPonderadoNivel,
			   [ErrorCriticoNivel]
		FROM [Proceso].[Formulario]
		WHERE Id = @Id 
	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE DATA A LA TABLA FORMULARIO (READ)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ_DATA_N0'
	BEGIN
		SELECT Id,
			   CampanaId,
			   FormularioId,
			   Descripcion,
			   Peso,
			   Estado
		FROM [Proceso].[Cargos]
		WHERE FormularioId = @Id 
	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE DATA A LA TABLA FORMULARIO (READ)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ_DATA_N1'
	BEGIN
		SELECT [Id]
		      ,[FormularioId]
			  ,[CargoId]
			  ,[Descripcion]
			  ,[Peso]
			  ,[PesoCargo]
			  ,[Estado]
		   FROM [Proceso].[BloqueEvaluacion]
		   WHERE FormularioId = @Id 
	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE DATA A LA TABLA FORMULARIO (READ)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ_DATA_N2'
	BEGIN
		SELECT N.[Id],
			   N.[BloqueEvaluacionId],
			   N.[Descripcion],
			   N.[EstadoProcesoId],
			   N.[Peso],
			   N.[PesoPonderado],
			   N.[Estado]
		   FROM [Proceso].[NotasDescriptivas] N
		   INNER JOIN [Proceso].[BloqueEvaluacion] B ON B.Id = N.BloqueEvaluacionId
			WHERE FormularioId = @Id 
	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE DATA A LA TABLA FORMULARIO (READ)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ_DATA_N3'
	BEGIN
		SELECT P.[Id]
			  ,[NotasDescriptivasId]
			  ,P.[Descripcion]
			  ,P.[EstadoProcesoId]
			  ,P.[Peso]
			  ,P.[PesoPonderado]
			  ,P.[Estado]
			FROM [Proceso].[PuntosEntrenamiento] P
			INNER JOIN [Proceso].[NotasDescriptivas] N ON N.Id = P.NotasDescriptivasId
			INNER JOIN [Proceso].[BloqueEvaluacion] B ON B.Id = N.BloqueEvaluacionId
			WHERE [FormularioId] = @Id 
	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE DATA A LA TABLA FORMULARIO (READ)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ_DATA_N4'
	BEGIN
		SELECT FM.[Id]
			  ,[PuntosEntrenamientoId]
			  ,FM.[Descripcion]
			  ,FM.[Peso]
			  ,FM.[Estado]
		  FROM [Proceso].[FocoMejoras] FM
		  INNER JOIN [Proceso].[PuntosEntrenamiento] P ON P.Id = FM.PuntosEntrenamientoId
		  INNER JOIN [Proceso].[NotasDescriptivas] N ON N.Id = P.NotasDescriptivasId
		  INNER JOIN [Proceso].[BloqueEvaluacion] B ON B.Id = N.BloqueEvaluacionId
		WHERE [FormularioId] = @Id 
	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE DATA A LA TABLA FORMULARIO (READ)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'DELETE_FORM'
	BEGIN
			DELETE [Proceso].[FocoMejoras] 
				WHERE Id IN( SELECT FM.[Id]
							  FROM [Proceso].[FocoMejoras] FM
								INNER JOIN [Proceso].[PuntosEntrenamiento] P ON P.Id = FM.PuntosEntrenamientoId
								INNER JOIN [Proceso].[NotasDescriptivas] N ON N.Id = P.NotasDescriptivasId
								INNER JOIN [Proceso].[BloqueEvaluacion] B ON B.Id = N.BloqueEvaluacionId
								WHERE [FormularioId] = @Id) 

			DELETE [Proceso].[PuntosEntrenamiento]
			   WHERE Id IN (SELECT P.[Id]
							 FROM [Proceso].[PuntosEntrenamiento] P
								INNER JOIN [Proceso].[NotasDescriptivas] N ON N.Id = P.NotasDescriptivasId
								INNER JOIN [Proceso].[BloqueEvaluacion] B ON B.Id = N.BloqueEvaluacionId
								WHERE [FormularioId] = @Id)

			DELETE [Proceso].[NotasDescriptivas]
			   WHERE Id IN (SELECT N.[Id]
							 FROM [Proceso].[NotasDescriptivas] N
								INNER JOIN [Proceso].[BloqueEvaluacion] B ON B.Id = N.BloqueEvaluacionId
								WHERE FormularioId = @Id)

			DELETE [Proceso].[BloqueEvaluacion]
			   WHERE Id IN (SELECT [Id]
	    					 FROM [Proceso].[BloqueEvaluacion]
								WHERE FormularioId = @Id)

			DELETE [Proceso].[Cargos]
			  WHERE Id IN (SELECT [Id] 
	    					FROM [Proceso].[Cargos]
								WHERE FormularioId = @Id)

			DELETE [Proceso].[Formulacion_Config_Monitoreo]
			  WHERE FormularioId = @Id

			DELETE [Proceso].[Formulario]
			   WHERE Id = @Id

			SELECT COUNT(1) FROM [Proceso].[Formulario]
			 WHERE Id = @Id
	END
END

	----------------------------------------------------------------------------------------------------
	--PRUEBAS
	----------------------------------------------------------------------------------------------------

/*
   /*INSERT*/			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_FORMULARIO] 'INSERT','0','PRUEBA','1'
   /*READ*/ 			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_FORMULARIO] 'READ_CAMPANA','0','1'
   /*READ*/ 			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_FORMULARIO] 'READ_ID','1'
   /*READ*/ 			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_FORMULARIO] 'READ_DATA_FORMULARIO','1'
   /*READ*/ 			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_FORMULARIO] 'READ_DATA_N0','1'
   /*READ*/ 			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_FORMULARIO] 'READ_DATA_N1','1'
   /*READ*/ 			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_FORMULARIO] 'READ_DATA_N2','1'
   /*READ*/ 			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_FORMULARIO] 'READ_DATA_N3','1'
   /*READ*/ 			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_FORMULARIO] 'READ_DATA_N4','1'
   /*READ*/ 			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_FORMULARIO] 'READ_FORM_LIST','0','1'
  
*/

GO
/****** Object:  StoredProcedure [Proceso].[SP_CRUD_GRUPOSTRABAJO]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* =============================================
-- Author:		German Alejandro Rodriguez
-- Create date: 2020-04-01
-- Description:	Procedimiento encargado de administrar la tabla [Proceso].[GrupoTrabajo]
-- Parameters:  @Opcion			VARCHAR(50),
				@Id				BIGINT,
				@CampanaId      BIGINT = NULL,
				@Nombre    	    VARCHAR(100) = NULL,
				@Descripcion    VARCHAR(250) = NULL,
				@RutaBusqueda   VARCHAR(500) = NULL,
				@Estado			INT = NULL 
-- =============================================*/
CREATE PROCEDURE [Proceso].[SP_CRUD_GRUPOSTRABAJO]
    @Opcion			VARCHAR(50),
	@Id				BIGINT,
	@CampanaId      BIGINT = NULL,
	@CoordinadorId  BIGINT = NULL,
	@UsuarioId      BIGINT = NULL,
	@ValueRolId		BIGINT = NULL
	
AS
BEGIN
	SET NOCOUNT ON;
	SET DATEFORMAT ymd
	
	
    -----------------------------------------------------------------------------------------------------------------
	--INSERTA EN LA TABLA [Proceso].[GrupoTrabajo] (INSERT)
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'INSERT'
	BEGIN
		INSERT INTO [Proceso].[GrupoTrabajo]
			   ([CampanaId]
			   ,[UsuarioId]
			   ,[ValueRolId]
			   ,[CoordinadorId]
			   )
		 VALUES
			   (@CampanaId
			   ,@UsuarioId
			   ,@ValueRolId
			   ,@CoordinadorId)
		 SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY];  --Sirve para mostrar el ID del registro nuevo--
	END
	-----------------------------------------------------------------------------------------------------------------
	--TRAE NOMBRE Y APELLIDO AL USUARIO DIGITADO 
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ_PERSONAL_CAMPANA'
	BEGIN
		SELECT U.Id,
		       Nombres + ' ' + Apellidos  AS Nombre,
			   R.ValueRolId AS RolId,
		       R.Nombre AS Perfil 
	 		FROM [Seguridad].[Usuario] U
			INNER JOIN [Proceso].[GrupoTrabajo] G ON G.UsuarioId = U.Id 
			INNER JOIN [Seguridad].[Rol] R ON G.ValueRolId = R.ValueRolId AND R.CampanaId = @Id
			WHERE G.ValueRolId in(2,3,4,6)
			AND G.CampanaId = @Id
	END
	-----------------------------------------------------------------------------------------------------------------
	--TRAE NOMBRE Y APELLIDO AL USUARIO DIGITADO 
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READALL_AGENTES_CAMPANA'
	BEGIN
		SELECT G.[CoordinadorId],
		       UC.Nombres + ' ' + UC.Apellidos  AS Coordinador,
		       U.Id,
		       u.Nombres + ' ' + u.Apellidos  AS Agente,
			   R.ValueRolId AS RolId,
		       R.Nombre AS Perfil 
	 		FROM [Seguridad].[Usuario] U
			INNER JOIN [Proceso].[GrupoTrabajo] G ON G.UsuarioId = U.Id 
			INNER JOIN [Seguridad].[Usuario] UC on UC.Id = G.[CoordinadorId]
			INNER JOIN [Seguridad].[Rol] R ON G.ValueRolId = R.ValueRolId AND R.CampanaId = @Id
			WHERE G.ValueRolId in(5)
			AND G.CampanaId = @Id
	END
   -----------------------------------------------------------------------------------------------------------------
	--TRAE NOMBRE Y APELLIDO AL USUARIO DIGITADO 
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ_AGENTES_CAMPANA'
	BEGIN
		SELECT U.Id,
		       Nombres + ' ' + Apellidos  AS Nombre,
			   R.ValueRolId AS RolId,
		       R.Nombre AS Perfil 
	 		FROM [Seguridad].[Usuario] U
            INNER JOIN [Proceso].[GrupoTrabajo] G ON G.UsuarioId = U.Id 
			INNER JOIN [Seguridad].[Rol] R ON G.ValueRolId = R.ValueRolId AND R.CampanaId = @Id
			WHERE G.ValueRolId in(5)
			AND G.CampanaId = @Id
	END
	-----------------------------------------------------------------------------------------------------------------
	--TRAE NOMBRE Y APELLIDO AL USUARIO DIGITADO 
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ_AGENTES_SIN_CAMPANA'
	BEGIN
		SELECT U.Id,
		       Nombres + ' ' + Apellidos  AS Nombre,
			   R.ValueRolId AS RolId,
		       R.Nombre AS Perfil 
	 		FROM [Seguridad].[Usuario] U
            INNER JOIN [Proceso].[GrupoTrabajo] G ON G.UsuarioId = U.Id 
			INNER JOIN [Seguridad].[Rol] R ON G.ValueRolId = R.ValueRolId AND R.CampanaId = @Id
			WHERE G.ValueRolId in(5)
			AND G.CoordinadorId = G.UsuarioId
			AND G.CampanaId = @Id
	END
	-----------------------------------------------------------------------------------------------------------------
	--TRAE NOMBRE Y APELLIDO AL USUARIO DIGITADO 
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ_AGENTES_COORDINADOR'
	BEGIN
		SELECT U.Id,
		       Nombres + ' ' + Apellidos  AS Nombre,
			   R.ValueRolId AS RolId,
		       R.Nombre AS Perfil 
	 		FROM [Seguridad].[Usuario] U
            INNER JOIN [Proceso].[GrupoTrabajo] G ON G.UsuarioId = U.Id 
			INNER JOIN [Seguridad].[Rol] R ON G.ValueRolId = R.ValueRolId AND R.CampanaId = @Id
			WHERE G.ValueRolId in(5)
			AND G.CoordinadorId = @CampanaId
			AND G.CampanaId = @Id
	END
	----------------------------------------------------------------------------------------------------------------
	--ACTUALIZA EL REGISTRO SELECCIONADO 
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'UPDATE_COORDINADOR'
	BEGIN
		UPDATE [Proceso].[GrupoTrabajo] 
			SET [CoordinadorId] = @CampanaId
			WHERE Id = @Id
		SELECT @Id
	END
	---------------------------------------------------------------------------------------------------------------------
	--CONSULTA EL COORDINADOR ASIGNADO AL AGENTE 
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'SELECT_COORDINADOR'
	BEGIN
		SELECT G.CoordinadorId,
		       U.Nombres + ' ' + U.Apellidos AS Coordinador
		FROM [Proceso].[GrupoTrabajo] G
		INNER JOIN [Seguridad].[Usuario] U ON U.Id = G.CoordinadorId
	    WHERE G.[UsuarioId] = @Id
		AND G.CampanaId = @CampanaId
   END
END
----------------------------------------------------------------------------------------------------
--PRUEBAS
----------------------------------------------------------------------------------------------------
/*
   
	
	SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_GRUPOSTRABAJO] 'INSERT','0','U','1','4','1'
    SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_GRUPOSTRABAJO] 'READ_PERSONAL_CAMPANA','1'
	SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_GRUPOSTRABAJO] 'READALL_AGENTES_CAMPANA','1'
	SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_GRUPOSTRABAJO] 'READ_AGENTES_CAMPANA','1'
	SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_GRUPOSTRABAJO] 'READ_AGENTES_SIN_CAMPANA','1'
	SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_GRUPOSTRABAJO] 'READ_AGENTES_COORDINADOR','1','8'
	SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_GRUPOSTRABAJO] 'SELECT_COORDINADOR','10','1'
*/

GO
/****** Object:  StoredProcedure [Proceso].[SP_CRUD_MONITOREO]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================================================================
 Uso			:	PROCEDIMIENTO ENCARGADO DE GESTIONAR LA TABLA CLIENTE
 Fecha			:	2020-03-24.
 Autor			:	GERMAN RODRIGUEZ
 Entradas		:	@Opcion				 NVARCHAR(50),
					@Id					 BIGINT,
					@FormularioId		 BIGINT = NULL,
					@AgenteId			 BIGINT = NULL,
					@CoordinadorId		 BIGINT = NULL,
					@TipoProcesoId		 BIGINT = NULL,
					@TipoMonitoreoId	 BIGINT = NULL,
					@FechaTransaccion	 DATETIME = NULL,
					@NotaFinal			 VARCHAR(5) = NULL,
					@NotaPEC			 INT = NULL,
					@NotaPECUF			 INT = NULL,
					@NotaPECN			 INT = NULL,
					@NotaPECC			 INT = NULL,
					@EstadoId			 BIGINT = NULL,
					@ObservacionMonitor  VARCHAR(MAX) = NULL
-- ==========================================================================================*/
CREATE PROCEDURE [Proceso].[SP_CRUD_MONITOREO]
	@Opcion				 NVARCHAR(50),
	@Id					 BIGINT,
	@FormularioId		 BIGINT = NULL,
	@MonitorId           BIGINT = NULL,
    @AgenteId			 BIGINT = NULL,
    @CoordinadorId		 BIGINT = NULL,
    @TipoProcesoId		 BIGINT = NULL,
    @TipoMonitoreoId	 BIGINT = NULL,
    @FechaTransaccion	 DATE = NULL,
    @NotaFinal			 VARCHAR(5) = NULL,
    @NotaPEC			 INT = NULL,
    @NotaPECUF			 INT = NULL,
    @NotaPECN			 INT = NULL,
    @NotaPECC			 INT = NULL,
    @EstadoId			 BIGINT = NULL,
 	@IdTransaccion       VARCHAR(25) = NULL
 AS
BEGIN
	SET NOCOUNT ON;
	SET DATEFORMAT ymd
	
	---------------------------------------------------------------------------------------------------------------------
	--INSERTA DATA A LA TABLA CLIENTE (INSERT)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'INSERT'
	BEGIN
		INSERT INTO [Proceso].[Monitoreo]
				   ([FormularioId]
				   ,[MonitorId]
				   ,[AgenteId]
				   ,[CoordinadorId]
				   ,[TipoProcesoId]
				   ,[TipoMonitoreoId]
				   ,[FechaTransaccion]
				   ,[NotaFinal]
				   ,[NotaPEC]
				   ,[NotaPECUF]
				   ,[NotaPECN]
				   ,[NotaPECC]
				   ,[EstadoId]
				   ,[IdTransaccion]
				   ,[EscaladoId]
				   )
			 VALUES
				   (@FormularioId
				   ,@MonitorId
				   ,@AgenteId
				   ,@CoordinadorId
				   ,@TipoProcesoId
				   ,@TipoMonitoreoId
				   ,@FechaTransaccion
				   ,@NotaFinal
				   ,@NotaPEC
				   ,@NotaPECUF
				   ,@NotaPECN
				   ,@NotaPECC
				   ,@EstadoId
				   ,@IdTransaccion
				   ,0
				   )
			SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY];  --Sirve para mostrar el ID del registro nuevo--
	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE DATA A LA TABLA MONITOREO (READ)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ'
	BEGIN
		SELECT M.[Id]
			  ,[FormularioId]
			  ,UPPER (F.[Descripcion]) AS Formulario
			  ,[MonitorId]
			  ,MO.Nombres + ' ' + MO.Apellidos AS Monitor
			  ,[AgenteId]
			  ,A.Nombres + ' ' + A.Apellidos AS Agente
			  ,[CoordinadorId]
			  ,C.Nombres + ' ' + C.Apellidos AS Coordinador
			  ,[TipoProcesoId]
			  ,TP.Nombre AS TipoProceso
			  ,[TipoMonitoreoId]
			  ,TM.Nombre AS TipoMonitoreo 
			  ,[FechaTransaccion]
			  ,[NotaFinal]
			  ,[NotaPEC]
			  ,[NotaPECUF]
		      ,[NotaPECN]
			  ,[NotaPECC]
			  ,[EstadoId]
			  ,[EscaladoId]
			  ,EM.Nombre AS Estado
			  ,[IdTransaccion]
		  FROM [Proceso].[Monitoreo] M
		  INNER JOIN [Proceso].[Formulario] F (NOLOCK) ON F.Id = M.FormularioId
		  INNER JOIN [Seguridad].[Usuario] A (NOLOCK) ON A.Id = M.AgenteId
		  INNER JOIN [Seguridad].[Usuario] MO (NOLOCK) ON MO.Id = M.MonitorId
		  INNER JOIN [Seguridad].[Usuario] C (NOLOCK) ON C.Id = M.CoordinadorId
		  INNER JOIN [Configuracion].[Dato] TP (NOLOCK) ON TP.Id = M.TipoProcesoId
		  INNER JOIN [Configuracion].[Dato] TM (NOLOCK) ON TM.Id = M.TipoMonitoreoId
		  INNER JOIN [Configuracion].[Dato] EM (NOLOCK) ON EM.Id = M.EstadoId
		
		WHERE F.CampanaId = @Id
	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE DATA A LA TABLA MONITOREO (READ)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ_USER'
	BEGIN
	    IF @FormularioId = 6 --CLIENTE
        BEGIN
			SELECT M.[Id]
				  ,[FormularioId]
				  ,UPPER (F.[Descripcion]) AS Formulario
				  ,[MonitorId]
				  ,MO.Nombres + ' ' + MO.Apellidos AS Monitor
				  ,[AgenteId]
				  ,A.Nombres + ' ' + A.Apellidos AS Agente
				  ,[CoordinadorId]
				  ,C.Nombres + ' ' + C.Apellidos AS Coordinador
				  ,[TipoProcesoId]
				  ,TP.Nombre AS TipoProceso
				  ,[TipoMonitoreoId]
				  ,TM.Nombre AS TipoMonitoreo 
				  ,[FechaTransaccion]
				  ,[NotaFinal]
				  ,[NotaPEC]
				  ,[NotaPECUF]
				  ,[NotaPECN]
				  ,[NotaPECC]
				  ,[EstadoId]
				  ,[EscaladoId]
				  ,EM.Nombre AS Estado
				  ,[IdTransaccion]
			  FROM [Proceso].[Monitoreo] M
			  INNER JOIN [Proceso].[Formulario] F (NOLOCK) ON F.Id = M.FormularioId
			  INNER JOIN [Seguridad].[Usuario] A (NOLOCK) ON A.Id = M.AgenteId
			  INNER JOIN [Seguridad].[Usuario] MO (NOLOCK) ON MO.Id = M.MonitorId
			  INNER JOIN [Seguridad].[Usuario] C (NOLOCK) ON C.Id = M.CoordinadorId
			  INNER JOIN [Configuracion].[Dato] TP (NOLOCK) ON TP.Id = M.TipoProcesoId
			  INNER JOIN [Configuracion].[Dato] TM (NOLOCK) ON TM.Id = M.TipoMonitoreoId
			  INNER JOIN [Configuracion].[Dato] EM (NOLOCK) ON EM.Id = M.EstadoId
			WHERE F.CampanaId = @Id
		END
		IF @FormularioId = 5 --AGENTE
		BEGIN
			SELECT M.[Id]
				  ,[FormularioId]
				  ,UPPER (F.[Descripcion]) AS Formulario
				  ,[MonitorId]
				  ,MO.Nombres + ' ' + MO.Apellidos AS Monitor
				  ,[AgenteId]
				  ,A.Nombres + ' ' + A.Apellidos AS Agente
				  ,[CoordinadorId]
				  ,C.Nombres + ' ' + C.Apellidos AS Coordinador
				  ,[TipoProcesoId]
				  ,TP.Nombre AS TipoProceso
				  ,[TipoMonitoreoId]
				  ,TM.Nombre AS TipoMonitoreo 
				  ,[FechaTransaccion]
				  ,[NotaFinal]
				  ,[NotaPEC]
				  ,[NotaPECUF]
				  ,[NotaPECN]
				  ,[NotaPECC]
				  ,[EstadoId]
				  ,[EscaladoId]
				  ,EM.Nombre AS Estado
				  ,[IdTransaccion]
			  FROM [Proceso].[Monitoreo] M
			  INNER JOIN [Proceso].[Formulario] F (NOLOCK) ON F.Id = M.FormularioId
			  INNER JOIN [Seguridad].[Usuario] A (NOLOCK) ON A.Id = M.AgenteId
			  INNER JOIN [Seguridad].[Usuario] MO (NOLOCK) ON MO.Id = M.MonitorId
			  INNER JOIN [Seguridad].[Usuario] C (NOLOCK) ON C.Id = M.CoordinadorId
			  INNER JOIN [Configuracion].[Dato] TP (NOLOCK) ON TP.Id = M.TipoProcesoId
			  INNER JOIN [Configuracion].[Dato] TM (NOLOCK) ON TM.Id = M.TipoMonitoreoId
			  INNER JOIN [Configuracion].[Dato] EM (NOLOCK) ON EM.Id = M.EstadoId
			WHERE F.CampanaId = @Id
			AND AgenteId = @MonitorId
		END
		IF @FormularioId = 4 --COORDINADOR
		BEGIN
			SELECT M.[Id]
				  ,[FormularioId]
				  ,UPPER (F.[Descripcion]) AS Formulario
				  ,[MonitorId]
				  ,MO.Nombres + ' ' + MO.Apellidos AS Monitor
				  ,[AgenteId]
				  ,A.Nombres + ' ' + A.Apellidos AS Agente
				  ,[CoordinadorId]
				  ,C.Nombres + ' ' + C.Apellidos AS Coordinador
				  ,[TipoProcesoId]
				  ,TP.Nombre AS TipoProceso
				  ,[TipoMonitoreoId]
				  ,TM.Nombre AS TipoMonitoreo 
				  ,[FechaTransaccion]
				  ,[NotaFinal]
				  ,[NotaPEC]
				  ,[NotaPECUF]
				  ,[NotaPECN]
				  ,[NotaPECC]
				  ,[EstadoId]
				  ,[EscaladoId]
				  ,EM.Nombre AS Estado
				  ,[IdTransaccion]
			  FROM [Proceso].[Monitoreo] M
			  INNER JOIN [Proceso].[Formulario] F (NOLOCK) ON F.Id = M.FormularioId
			  INNER JOIN [Seguridad].[Usuario] A (NOLOCK) ON A.Id = M.AgenteId
			  INNER JOIN [Seguridad].[Usuario] MO (NOLOCK) ON MO.Id = M.MonitorId
			  INNER JOIN [Seguridad].[Usuario] C (NOLOCK) ON C.Id = M.CoordinadorId
			  INNER JOIN [Configuracion].[Dato] TP (NOLOCK) ON TP.Id = M.TipoProcesoId
			  INNER JOIN [Configuracion].[Dato] TM (NOLOCK) ON TM.Id = M.TipoMonitoreoId
			  INNER JOIN [Configuracion].[Dato] EM (NOLOCK) ON EM.Id = M.EstadoId
			WHERE F.CampanaId = @Id
			AND CoordinadorId = @MonitorId
		END
		IF @FormularioId = 3 --MONITOR
		BEGIN
			SELECT M.[Id]
				  ,[FormularioId]
				  ,UPPER (F.[Descripcion]) AS Formulario
				  ,[MonitorId]
				  ,MO.Nombres + ' ' + MO.Apellidos AS Monitor
				  ,[AgenteId]
				  ,A.Nombres + ' ' + A.Apellidos AS Agente
				  ,[CoordinadorId]
				  ,C.Nombres + ' ' + C.Apellidos AS Coordinador
				  ,[TipoProcesoId]
				  ,TP.Nombre AS TipoProceso
				  ,[TipoMonitoreoId]
				  ,TM.Nombre AS TipoMonitoreo 
				  ,[FechaTransaccion]
				  ,[NotaFinal]
				  ,[NotaPEC]
				  ,[NotaPECUF]
				  ,[NotaPECN]
				  ,[NotaPECC]
				  ,[EstadoId]
				  ,[EscaladoId]
				  ,EM.Nombre AS Estado
				  ,[IdTransaccion]
			  FROM [Proceso].[Monitoreo] M
			  INNER JOIN [Proceso].[Formulario] F (NOLOCK) ON F.Id = M.FormularioId
			  INNER JOIN [Seguridad].[Usuario] A (NOLOCK) ON A.Id = M.AgenteId
			  INNER JOIN [Seguridad].[Usuario] MO (NOLOCK) ON MO.Id = M.MonitorId
			  INNER JOIN [Seguridad].[Usuario] C (NOLOCK) ON C.Id = M.CoordinadorId
			  INNER JOIN [Configuracion].[Dato] TP (NOLOCK) ON TP.Id = M.TipoProcesoId
			  INNER JOIN [Configuracion].[Dato] TM (NOLOCK) ON TM.Id = M.TipoMonitoreoId
			  INNER JOIN [Configuracion].[Dato] EM (NOLOCK) ON EM.Id = M.EstadoId
			WHERE F.CampanaId = @Id
			AND MonitorId = @MonitorId
		END
		IF @FormularioId = 2 --SUPERMONITOR
		BEGIN
			SELECT M.[Id]
				  ,[FormularioId]
				  ,UPPER (F.[Descripcion]) AS Formulario
				  ,[MonitorId]
				  ,MO.Nombres + ' ' + MO.Apellidos AS Monitor
				  ,[AgenteId]
				  ,A.Nombres + ' ' + A.Apellidos AS Agente
				  ,[CoordinadorId]
				  ,C.Nombres + ' ' + C.Apellidos AS Coordinador
				  ,[TipoProcesoId]
				  ,TP.Nombre AS TipoProceso
				  ,[TipoMonitoreoId]
				  ,TM.Nombre AS TipoMonitoreo 
				  ,[FechaTransaccion]
				  ,[NotaFinal]
				  ,[NotaPEC]
				  ,[NotaPECUF]
				  ,[NotaPECN]
				  ,[NotaPECC]
				  ,[EstadoId]
				  ,[EscaladoId]
				  ,EM.Nombre AS Estado
				  ,[IdTransaccion]
			  FROM [Proceso].[Monitoreo] M
			  INNER JOIN [Proceso].[Formulario] F (NOLOCK) ON F.Id = M.FormularioId
			  INNER JOIN [Seguridad].[Usuario] A (NOLOCK) ON A.Id = M.AgenteId
			  INNER JOIN [Seguridad].[Usuario] MO (NOLOCK) ON MO.Id = M.MonitorId
			  INNER JOIN [Seguridad].[Usuario] C (NOLOCK) ON C.Id = M.CoordinadorId
			  INNER JOIN [Configuracion].[Dato] TP (NOLOCK) ON TP.Id = M.TipoProcesoId
			  INNER JOIN [Configuracion].[Dato] TM (NOLOCK) ON TM.Id = M.TipoMonitoreoId
			  INNER JOIN [Configuracion].[Dato] EM (NOLOCK) ON EM.Id = M.EstadoId
			WHERE F.CampanaId = @Id
			AND MonitorId = @MonitorId
		END
	END
	---------------------------------------------------------------------------------------------------------------------
	--ACTUALIZA ESTADO DEL MONITOREO (UPDATE)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'UPDATE_ESTADO'
	BEGIN
		UPDATE [Proceso].[Monitoreo]
		SET [EstadoId] = @FormularioId
			where Id = @Id
		SELECT @Id
	END
	---------------------------------------------------------------------------------------------------------------------
	--ACTUALIZA ESTADO DEL MONITOREO (UPDATE)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'UPDATE_MONITOREO'
	BEGIN
		UPDATE [Proceso].[Monitoreo]
		SET [EstadoId] = @FormularioId
				where Id = @Id
		SELECT @Id
	END
	---------------------------------------------------------------------------------------------------------------------
	--ACTUALIZA AGREGANDO LA PERSONA QUE DEBE ELIMINA EL MONITOREO (UPDATE)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'UPDATE_ESCALADO'
	BEGIN
		UPDATE [Proceso].[Monitoreo]
		SET [EscaladoId] = @FormularioId
				where Id = @Id
		SELECT @Id
	END
	---------------------------------------------------------------------------------------------------------------------
	--ELIMINAR MONITOREO SELECCIONADO (DELETE)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'DELETE_MONITOREO'
	BEGIN
	    --COPIAMOS PRIMERO
		INSERT [Backup].[MonitoreoObservacion]
		SELECT * FROM [Proceso].[MonitoreoObservacion]
		WHERE MonitoreoId = @Id

		INSERT [Backup].[MonitoreoResultado]
		SELECT * FROM [Proceso].[MonitoreoResultado]
		WHERE MonitoreoId = @Id

		INSERT [Backup].[Monitoreo]
		SELECT * FROM [Proceso].[Monitoreo]
		WHERE Id = @Id


		DELETE [Proceso].[MonitoreoObservacion]
		WHERE MonitoreoId = @Id
		DELETE [Proceso].[MonitoreoResultado]
		WHERE MonitoreoId = @Id
		DELETE [Proceso].[Monitoreo]
		WHERE Id = @Id

		SELECT COUNT(1)FROM [Proceso].[Monitoreo]
		WHERE Id = @Id
	END
END

	----------------------------------------------------------------------------------------------------
	--PRUEBAS
	----------------------------------------------------------------------------------------------------

/*
   /*INSERT*/			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_MONITOREO] 'INSERT','0','PRUEBA','1'
   /*READ*/ 			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_MONITOREO] 'READ','1'
   /*READ*/ 			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_MONITOREO] 'EXISTE_MONITOREO' ,'0','PRUEBA EDICION'
   /*LIST_MONITOREOS*/ 	SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_MONITOREO] 'LIST_MONITOREOS' ,'0'
                        SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_MONITOREO] 'UPDATE_MONITOREO','2','1','','','','','','','','','','','','125','se incentivara con capacitación de la herramienta además de apoyo del líder de escuadra'
*/
GO
/****** Object:  StoredProcedure [Proceso].[SP_CRUD_MONITOREO_OBSERVACION]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================================================================
 Uso			:	PROCEDIMIENTO ENCARGADO DE GESTIONAR LA TABLA MonitoreoObservacion
 Fecha			:	2020-03-24.
 Autor			:	GERMAN RODRIGUEZ
 Entradas		:	@Opcion           NVARCHAR(50),
					@Id				  BIGINT,
					@MonitoreoId	  BIGINT = NULL,
					@EstadoId	      BIGINT = NULL,
					@Observacion	  VARCHAR(MAX) = NULL
-- ==========================================================================================*/
CREATE PROCEDURE [Proceso].[SP_CRUD_MONITOREO_OBSERVACION]
	@Opcion           NVARCHAR(50),
	@Id				  BIGINT,
	@MonitoreoId	  BIGINT = NULL,
	@UsuarioId		  BIGINT = NULL,
	@EstadoId	      BIGINT = NULL,
	@Observacion	  VARCHAR(MAX) = NULL
	
 AS
BEGIN
	SET NOCOUNT ON;
	SET DATEFORMAT ymd
	
	---------------------------------------------------------------------------------------------------------------------
	--INSERTA DATA A LA TABLA MonitoreoObservacion (INSERT)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'INSERT'
	BEGIN
		INSERT INTO [Proceso].[MonitoreoObservacion]
           ([MonitoreoId]
		   ,[UsuarioId]
		   ,[EstadoId]
		   ,[Observacion]
		   ,[FechaObservacion]
           )
        VALUES
           (@MonitoreoId,
		    @UsuarioId,
		    @EstadoId,
			@Observacion,
			GETDATE()
           )
			SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY];  --Sirve para mostrar el ID del registro nuevo--
	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE DATA A LA TABLA MonitoreoObservacion (READ)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ'
	BEGIN
		SELECT MO.[Id]
			  ,[EstadoId]
			  ,R.Nombre AS Perfil
			  ,E.Nombre AS EstadoMonitoreo
			  ,MO.[UsuarioId]
			  ,P.Nombres + ' ' + P.Apellidos AS Personaje
			  ,[Observacion]
			  ,[FechaObservacion]
		  FROM [Proceso].[MonitoreoObservacion] MO
		  INNER JOIN [Seguridad].[Usuario] P ON P.Id = MO.UsuarioId
		  LEFT JOIN [Proceso].[UsuarioCampana] UC ON UC.UsuarioId = MO.UsuarioId AND UC.CampanaId = @Id
		  LEFT JOIN [Seguridad].[Rol] R ON R.ValueRolId = UC.ValueRolId
		  INNER JOIN [Configuracion].[Dato] E ON E.Id = MO.EstadoId
		  WHERE [MonitoreoId] = @MonitoreoId
		    AND R.CampanaId = @Id
			ORDER BY [FechaObservacion] ASC
	END
END

	----------------------------------------------------------------------------------------------------
	--PRUEBAS
	----------------------------------------------------------------------------------------------------

/*
   /*INSERT*/			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_MONITOREO_OBSERVACION] 'INSERT','0','PRUEBA','1'
   /*READ*/ 			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_MONITOREO_OBSERVACION] 'READ','1','5'
 */

GO
/****** Object:  StoredProcedure [Proceso].[SP_CRUD_NOTAS_DESCRIPTIVAS]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================================================================
 Uso			:	PROCEDIMIENTO ENCARGADO DE GESTIONAR LA TABLA NotasDescriptivas
 Fecha			:	2020-03-24.
 Autor			:	GERMAN RODRIGUEZ
 Entradas		:	@Opcion      NVARCHAR(50),
					@Id				  BIGINT,
					@CampanaId        BIGINT = NULL,
					@FormularioId     BIGINT = NULL,
					@Descripcion      VARCHAR(500) = NULL,
					@Estado	          BIGINT = NULL
-- ==========================================================================================*/
CREATE PROCEDURE [Proceso].[SP_CRUD_NOTAS_DESCRIPTIVAS]
	@Opcion      NVARCHAR(50),
	@Id				      BIGINT,
	@BloqueEvaluacionId   BIGINT = NULL,
	@Descripcion          VARCHAR(500) = NULL,
	@Peso	              VARCHAR(5) = NULL,
	@PesoPonderado        VARCHAR(5) = NULL,
	@EstadoProcesoId      BIGINT = NULL,
	@Estado	              BIGINT = NULL
 AS
BEGIN
	SET NOCOUNT ON;
	SET DATEFORMAT ymd
	
	---------------------------------------------------------------------------------------------------------------------
	--INSERTA DATA A LA TABLA NotasDescriptivas (INSERT)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'INSERT'
	BEGIN
		INSERT INTO [Proceso].[NotasDescriptivas]
           ([BloqueEvaluacionId]
		   ,[Descripcion]
		   ,[Peso]
		   ,[PesoPonderado]
		   ,[EstadoProcesoId]
		   ,[Estado]
           )
        VALUES
           (@BloqueEvaluacionId,
			@Descripcion,
			@Peso,
			@PesoPonderado,
			@EstadoProcesoId,
		    1
           )
		SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY];  --Sirve para mostrar el ID del registro nuevo--
	END
	---------------------------------------------------------------------------------------------------------------------
	--INSERTA DATA A LA TABLA NotasDescriptivas (INSERT)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'UPDATE'
	BEGIN
		UPDATE [Proceso].[NotasDescriptivas]
           SET [Descripcion] = @Descripcion,
		              [Peso] = @Peso,
					  [PesoPonderado] = @PesoPonderado,
					  [EstadoProcesoId] = @EstadoProcesoId
			WHERE Id = @Id		
			SELECT @Id;  --Sirve para mostrar el ID del registro nuevo--
	END
	
	---------------------------------------------------------------------------------------------------------------------
	--TRAE DATA A LA TABLA NotasDescriptivas (READ)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ_FORMULARIO'
	BEGIN
		SELECT N.[Id]
			  ,[BloqueEvaluacionId]
			  ,N.[Descripcion]
			  ,N.[Peso]
			  ,N.[PesoPonderado]
			  ,N.[EstadoProcesoId]
			  ,N.[Estado]
			  ,B.Descripcion AS BloqueEvaluacion
			  ,E.Nombre AS EstadoProceso
		  FROM [Proceso].[NotasDescriptivas] N
		  INNER JOIN [Proceso].[BloqueEvaluacion] B ON B.Id = N.BloqueEvaluacionId
		  INNER JOIN [Proceso].[Formulario] F ON F.Id = B.FormularioId
		  LEFT OUTER JOIN [Configuracion].[Dato] E ON E.Id = N.EstadoProcesoId
		WHERE [FormularioId] = @Id 
	END
	 ---------------------------------------------------------------------------------------------------------------------
	--ELIMINAR ID EN LA TABLA NotasDescriptivas (DELETE)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'DELETE'
	BEGIN
	   DELETE FROM [Proceso].[FocoMejoras]
	   WHERE [Id] IN (SELECT FM.Id FROM [Proceso].[FocoMejoras] FM
						INNER JOIN [Proceso].[PuntosEntrenamiento] P ON P.Id = FM.PuntosEntrenamientoId
						INNER JOIN [Proceso].[NotasDescriptivas] N ON N.Id = P.NotasDescriptivasId
						WHERE N.Id = @Id)

       DELETE FROM [Proceso].[PuntosEntrenamiento]
	   WHERE [Id] IN (SELECT P.Id FROM [Proceso].[PuntosEntrenamiento] P
					INNER JOIN [Proceso].[NotasDescriptivas] N ON N.Id = P.NotasDescriptivasId
					WHERE N.Id = @Id)

	   DELETE FROM [Proceso].[NotasDescriptivas]
	   WHERE [Id] = @Id

	   SELECT COUNT(1) FROM [Proceso].[NotasDescriptivas]
	   WHERE [Id] = @Id
	END

END

	----------------------------------------------------------------------------------------------------
	--PRUEBAS
	----------------------------------------------------------------------------------------------------

/*
   /*INSERT*/			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_NOTAS_DESCRIPTIVAS] 'INSERT','0','PRUEBA','1'
   /*READ*/ 			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_NOTAS_DESCRIPTIVAS] 'DELETE','3'
   /*READ*/ 			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_NOTAS_DESCRIPTIVAS] 'READ_FORMULARIO','1'
   /*INSERT*/			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_NOTAS_DESCRIPTIVAS] 'UPDATE','1','0','0','prueba'
*/

GO
/****** Object:  StoredProcedure [Proceso].[SP_CRUD_NOTIFICACIONES]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================================================================
 Uso			:	PROCEDIMIENTO ENCARGADO DE GESTIONAR LA TABLA CARGOS
 Fecha			:	2020-03-24.
 Autor			:	GERMAN RODRIGUEZ
 Entradas		:	@Opcion      NVARCHAR(50),
					@Id				  BIGINT,
					@ModuloId         BIGINT = NULL,
					@UsuarioId        BIGINT = NULL,
					@IndicativoId     BIGINT = NULL,
					@Descripcion      VARCHAR(MAX) = NULL
-- ==========================================================================================*/
CREATE PROCEDURE [Proceso].[SP_CRUD_NOTIFICACIONES]
	@Opcion      NVARCHAR(50),
	@Id				  BIGINT,
	@ModuloId         BIGINT = NULL,
	@UsuarioId        BIGINT = NULL,
	@IndicativoId     BIGINT = NULL,
	@Descripcion      VARCHAR(MAX) = NULL
 AS
BEGIN
	SET NOCOUNT ON;
	SET DATEFORMAT ymd
	
	---------------------------------------------------------------------------------------------------------------------
	--INSERTA DATA A LA TABLA [Notificaciones] (INSERT)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'INSERT'
	BEGIN
		INSERT INTO [Proceso].[Notificaciones]
           ([ModuloId]
           ,[UsuarioId]
           ,[IndicativoId]
           ,[Descripcion]
		   ,[Flag_Visto]
           )
     VALUES
           (@ModuloId
           ,@UsuarioId
           ,@IndicativoId
           ,@Descripcion
		   ,0
           )
		SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY];  --Sirve para mostrar el ID del registro nuevo--
	END

	--------------------------------------------------------------------------------------------------
	--TRAE DATA A LA TABLA [Notificaciones] (READ)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ_USER'
	BEGIN
		SELECT N.[Id]
			  ,[ModuloId]
			  ,M.Nombre AS Modulo
			  ,[UsuarioId]
			  ,U.Nombres + ' ' + U.Apellidos AS Personaje
			  ,[IndicativoId]
			  ,[Descripcion]
			  ,[Flag_Visto]
		  FROM [Proceso].[Notificaciones] N
		   INNER JOIN [Configuracion].[Dato] M ON M.Id = N.[ModuloId]
		   INNER JOIN [Seguridad].[Usuario] U on U.Id = N.[UsuarioId]
		WHERE [UsuarioId] = @Id 
		AND [Flag_Visto] = 0
	END
	--------------------------------------------------------------------------------------------------
	--TRAE ACTUALIZA LA BANDERA DE LA TABLA [Notificaciones] (UPDATE)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'UPDATE_FLAG'
	BEGIN
		UPDATE [Proceso].[Notificaciones]
			SET [Flag_Visto] = 1
			WHERE [Id] = @Id 
			SELECT @Id
	END
	--------------------------------------------------------------------------------------------------
	--TRAE CANTIDAD DE REGISTROS DE LA TABLA [Notificaciones] POR USUARIO (READ)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'COUNT_USER'
	BEGIN
		SELECT COUNT(1)
		  FROM [Proceso].[Notificaciones] 
		  WHERE [UsuarioId] = @Id 
	END
END

	----------------------------------------------------------------------------------------------------
	--PRUEBAS
	----------------------------------------------------------------------------------------------------

/*
   /*INSERT*/			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_NOTIFICACIONES] 'INSERT','0','PRUEBA','1'
   /*READ*/ 			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_NOTIFICACIONES] 'READ_CAMPANA','1'
   /*READ*/ 			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_NOTIFICACIONES] 'READ_FORMULARIO','1'
   /*INSERT*/			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_NOTIFICACIONES] 'UPDATE','1','0','0','prueba'
*/

GO
/****** Object:  StoredProcedure [Proceso].[SP_CRUD_PUNTOS_ENTR]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================================================================
 Uso			:	PROCEDIMIENTO ENCARGADO DE GESTIONAR LA TABLA PuntosEntrenamiento
 Fecha			:	2020-03-24.
 Autor			:	GERMAN RODRIGUEZ
 Entradas		:	@Opcion      NVARCHAR(50),
					@Id				      BIGINT,
					@NotasDescriptivasId  BIGINT = NULL,
					@Descripcion          VARCHAR(500) = NULL,
					@EstadoProcesoId      BIGINT = NULL,
					@Peso	              BIGINT = NULL,
					@Estado	              BIGINT = NULL
-- ==========================================================================================*/
CREATE PROCEDURE [Proceso].[SP_CRUD_PUNTOS_ENTR]
	@Opcion      NVARCHAR(50),
	@Id				      BIGINT,
	@NotasDescriptivasId  BIGINT = NULL,
	@Descripcion          VARCHAR(500) = NULL,
	@EstadoProcesoId      BIGINT = NULL,
	@Peso	              VARCHAR(5) = NULL,
	@PesoPonderado        VARCHAR(5) = NULL,
	@Estado	              BIGINT = NULL
 AS
BEGIN
	SET NOCOUNT ON;
	SET DATEFORMAT ymd
	
	---------------------------------------------------------------------------------------------------------------------
	--INSERTA DATA A LA TABLA PuntosEntrenamiento (INSERT)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'INSERT'
	BEGIN
		INSERT INTO [Proceso].[PuntosEntrenamiento]
           ([NotasDescriptivasId]
		   ,[Descripcion]
		   ,[Peso]
		   ,[PesoPonderado]
		   ,[EstadoProcesoId]
		   ,[Estado]
           )
        VALUES
           (@NotasDescriptivasId,
			@Descripcion,
			@Peso,
			@PesoPonderado,
			@EstadoProcesoId,
		    1
           )
		SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY];  --Sirve para mostrar el ID del registro nuevo--
	END
	---------------------------------------------------------------------------------------------------------------------
	--INSERTA DATA A LA TABLA PuntosEntrenamiento (INSERT)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'UPDATE'
	BEGIN
		UPDATE [Proceso].[PuntosEntrenamiento]
           SET [Descripcion] = @Descripcion,
		       [Peso] = @Peso,
			   [PesoPonderado] = @PesoPonderado,
			   [EstadoProcesoId] = @EstadoProcesoId
			WHERE Id = @Id		
			SELECT @Id;  --Sirve para mostrar el ID del registro nuevo--
	END
	
	---------------------------------------------------------------------------------------------------------------------
	--TRAE DATA A LA TABLA PuntosEntrenamiento (READ)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ_FORMULARIO'
	BEGIN
		SELECT P.[Id]
			  ,[NotasDescriptivasId]
			  ,P.[Descripcion]
			  ,P.[EstadoProcesoId]
			  ,P.[Peso]
			  ,P.[PesoPonderado]
			  ,P.[Estado]
			  ,N.Descripcion AS NotasDescriptivas
			  ,E.Nombre AS EstadoProceso
		  FROM [Proceso].[PuntosEntrenamiento] P
		  INNER JOIN [Proceso].[NotasDescriptivas] N ON N.Id = P.NotasDescriptivasId
		  INNER JOIN [Proceso].[BloqueEvaluacion] B ON B.Id = N.BloqueEvaluacionId
		  INNER JOIN [Proceso].[Formulario] F ON F.Id = B.FormularioId
		  LEFT OUTER JOIN [Configuracion].[Dato] E ON E.Id = P.EstadoProcesoId
		WHERE [FormularioId] = @Id 
	END
	 ---------------------------------------------------------------------------------------------------------------------
	--ELIMINAR ID EN LA TABLA PuntosEntrenamiento (DELETE)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'DELETE'
	BEGIN
	   DELETE FROM [Proceso].[FocoMejoras]
	   WHERE [Id] IN (SELECT FM.Id FROM [Proceso].[FocoMejoras] FM
						INNER JOIN [Proceso].[PuntosEntrenamiento] P ON P.Id = FM.PuntosEntrenamientoId
						WHERE P.Id = @Id)

       DELETE FROM [Proceso].[PuntosEntrenamiento]
	   WHERE [Id] =@Id

	   SELECT COUNT(1) FROM [Proceso].[PuntosEntrenamiento]
	   WHERE [Id] = @Id
	END

END

	----------------------------------------------------------------------------------------------------
	--PRUEBAS
	----------------------------------------------------------------------------------------------------

/*
   /*INSERT*/			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_PUNTOS_ENTR] 'INSERT','0','PRUEBA','1'
   /*READ*/ 			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_PUNTOS_ENTR] 'READ_CAMPANA','1'
   /*READ*/ 			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_PUNTOS_ENTR] 'READ_FORMULARIO','13'
   /*INSERT*/			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_PUNTOS_ENTR] 'UPDATE','1','0','0','prueba'
*/

GO
/****** Object:  StoredProcedure [Proceso].[SP_CRUD_REPORTES]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================================================================
 Uso			:	PROCEDIMIENTO ENCARGADO DE GESTIONAR LA TABLA CLIENTE
 Fecha			:	2020-03-24.
 Autor			:	GERMAN RODRIGUEZ
 Entradas		:	@Opcion      NVARCHAR(50),
					@CAMPANA_ID	  BIGINT,
					@PARAMETRO_1  VARCHAR(MAX) = NULL,
 					@PARAMETRO_2  VARCHAR(MAX) = NULL,
					@PARAMETRO_3  VARCHAR(MAX) = NULL,
					@PARAMETRO_4  VARCHAR(MAX) = NULL,
					@PARAMETRO_5  VARCHAR(MAX) = NULL,
					@PARAMETRO_6  VARCHAR(MAX) = NULL,
					@PARAMETRO_7  VARCHAR(MAX) = NULL,
					@PARAMETRO_8  VARCHAR(MAX) = NULL,
					@PARAMETRO_9  VARCHAR(MAX) = NULL,
					@PARAMETRO_10 VARCHAR(MAX) = NULL
-- ==========================================================================================*/
CREATE PROCEDURE [Proceso].[SP_CRUD_REPORTES]
	@Opcion      NVARCHAR(50),
	@CAMPANA_ID	  BIGINT,
	@PARAMETRO_1  VARCHAR(MAX) = NULL,
 	@PARAMETRO_2  VARCHAR(MAX) = NULL,
	@PARAMETRO_3  VARCHAR(MAX) = NULL,
	@PARAMETRO_4  VARCHAR(MAX) = NULL,
	@PARAMETRO_5  VARCHAR(MAX) = NULL,
	@PARAMETRO_6  VARCHAR(MAX) = NULL,
	@PARAMETRO_7  VARCHAR(MAX) = NULL,
	@PARAMETRO_8  VARCHAR(MAX) = NULL,
	@PARAMETRO_9  VARCHAR(MAX) = NULL,
	@PARAMETRO_10 VARCHAR(MAX) = NULL

AS
BEGIN
	SET NOCOUNT ON;
	SET DATEFORMAT ymd

	DECLARE @TOTAL_SUM INT
	DECLARE @TOTAL_SUMD DECIMAL(10,1)
	DECLARE @CANT INT
	DECLARE @RESULT_OP INT
	DECLARE @RESULT_OPD DECIMAL(10,1)
	---------------------------------------------------------------------------------------------------------------------
	--TRAE LA CANTIDAD DE MONITOREOS ASOCIADOS A LA CAMPAÑA
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'CANT_MONITOREOS'
	BEGIN
		SELECT COUNT(1) FROM [Proceso].[Monitoreo] M
		INNER JOIN [Proceso].[Formulario] F ON F.Id = M.FormularioId 
		WHERE F.CampanaId = @CAMPANA_ID
	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE LA CANTIDAD DE FORMUARIOS ASOCIADOS A LA CAMPAÑA
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'CANT_FORMULARIOS'
	BEGIN
		SELECT COUNT(1) FROM [Proceso].[Formulario]
		WHERE CampanaId = @CAMPANA_ID
	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE EL % DE ERRORES PEC SOBRE LA CAMPAÑA SELECCIONADA
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'PORCENTAJE_PEC'
	BEGIN
		
		SET @TOTAL_SUM = (SELECT SUM(NotaPEC) FROM [Proceso].[Monitoreo] M
							INNER JOIN [Proceso].[Formulario] F ON F.Id = M.FormularioId 
							WHERE F.CampanaId = @CAMPANA_ID)

			 SET @CANT = (SELECT COUNT(1) FROM [Proceso].[Monitoreo] M
							INNER JOIN [Proceso].[Formulario] F ON F.Id = M.FormularioId 
							WHERE F.CampanaId = @CAMPANA_ID) 

	   SET @RESULT_OP = @TOTAL_SUM / @CANT
	   SELECT @RESULT_OP       
	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE EL % DE ERRORES PECC SOBRE LA CAMPAÑA SELECCIONADA
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'PORCENTAJE_PECC'
	BEGIN
		
		SET @TOTAL_SUM = (SELECT SUM(NotaPECC) FROM [Proceso].[Monitoreo] M
							INNER JOIN [Proceso].[Formulario] F ON F.Id = M.FormularioId 
							WHERE F.CampanaId = @CAMPANA_ID)

			 SET @CANT = (SELECT COUNT(1) FROM [Proceso].[Monitoreo] M
							INNER JOIN [Proceso].[Formulario] F ON F.Id = M.FormularioId 
							WHERE F.CampanaId = @CAMPANA_ID) 

	   SET @RESULT_OP = @TOTAL_SUM / @CANT
	   SELECT @RESULT_OP      
	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE EL % DE ERRORES PECN SOBRE LA CAMPAÑA SELECCIONADA
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'PORCENTAJE_PECN'
	BEGIN
		
		SET @TOTAL_SUM = (SELECT SUM(NotaPECN) FROM [Proceso].[Monitoreo] M
							INNER JOIN [Proceso].[Formulario] F ON F.Id = M.FormularioId 
							WHERE F.CampanaId = @CAMPANA_ID)

			 SET @CANT = (SELECT COUNT(1) FROM [Proceso].[Monitoreo] M
							INNER JOIN [Proceso].[Formulario] F ON F.Id = M.FormularioId 
							WHERE F.CampanaId = @CAMPANA_ID) 

	   SET @RESULT_OP = @TOTAL_SUM / @CANT
	   SELECT @RESULT_OP      
	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE EL % DE ERRORES PECUF SOBRE LA CAMPAÑA SELECCIONADA
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'PORCENTAJE_PECUF'
	BEGIN
		
		SET @TOTAL_SUM = (SELECT SUM(NotaPECUF) FROM [Proceso].[Monitoreo] M
							INNER JOIN [Proceso].[Formulario] F ON F.Id = M.FormularioId 
							WHERE F.CampanaId = @CAMPANA_ID)

			 SET @CANT = (SELECT COUNT(1) FROM [Proceso].[Monitoreo] M
							INNER JOIN [Proceso].[Formulario] F ON F.Id = M.FormularioId 
							WHERE F.CampanaId = @CAMPANA_ID) 

	   SET @RESULT_OP = @TOTAL_SUM / @CANT
	   SELECT @RESULT_OP      
	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE EL PROMEDIO DE LA NOTA FINAL DE LA CAMPAÑA SELECCIONADA
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'PROMEDIO_NOTALFINAL'
	BEGIN
		SET @TOTAL_SUMD = (SELECT SUM(CONVERT(DECIMAL(18,1), NotaFinal)) FROM [Proceso].[Monitoreo] M
							INNER JOIN [Proceso].[Formulario] F ON F.Id = M.FormularioId 
							WHERE F.CampanaId = @CAMPANA_ID)

		SET @CANT = (SELECT COUNT(1) FROM [Proceso].[Monitoreo] M
							INNER JOIN [Proceso].[Formulario] F ON F.Id = M.FormularioId 
							WHERE F.CampanaId = @CAMPANA_ID) 

	   SET @RESULT_OPD = @TOTAL_SUMD / @CANT
	   SELECT @RESULT_OPD      
 	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE LA DATA GENERAL PARA EL INFORME EN LA VISTA
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'DATA_FORMULARIO_GENERAL'
	BEGIN
		 SELECT CAST(AgenteId AS VARCHAR(10)) + ' - ' + A.Nombres + ' ' + A.Apellidos AS Agente,
				CAST(TipoProcesoId AS VARCHAR(10)) + ' - ' + TP.Nombre AS TipoProceso,
				CAST(TipoMonitoreoId AS VARCHAR(10)) + ' - ' + TM.Nombre AS TipoMonitoreo,  
				NotaFinal,
				NotaPEC,
				NotaPECC,
				NotaPECN,
				NotaPECUF,
				EstadoId
		FROM [Proceso].[Monitoreo] M
			INNER JOIN Configuracion.Dato TP ON TP.Id = M.TipoProcesoId
			INNER JOIN Configuracion.Dato TM ON TM.Id = M.TipoMonitoreoId
			INNER JOIN Seguridad.Usuario A ON A.ID = M.AgenteId
		WHERE FormularioId = @CAMPANA_ID
	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE LA CANTIDAD DE MONITOREOS EN GENERAL POR FECHA DIARIA
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'CANTMONITOREO_DIARIO_G'
	BEGIN
		SELECT COUNT(FechaTransaccion) AS 'CantMonitoreo',
               MonitorId,
               CONVERT(VARCHAR(10), MonitorId)  + ' - ' + U.Nombres + ' ' + U.Apellidos AS 'Monitor', 
			   FechaTransaccion AS 'ItemDato'
		FROM [Proceso].[Monitoreo] M
		INNER JOIN [Seguridad].[Usuario] U ON U.Id = M.MonitorId 
			GROUP BY FechaTransaccion,
			         MonitorId,
					 Nombres,
					 Apellidos
 	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE LA CANTIDAD DE MONITOREOS DEL MONITOR POR FECHA DIARIA
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'CANTMONITOREO_DIARIO'
	BEGIN
		SELECT COUNT(FechaTransaccion) AS 'CantMonitoreo',
			   FechaTransaccion AS 'ItemDato'
		FROM [Proceso].[Monitoreo]
			WHERE MonitorId = @CAMPANA_ID
			GROUP BY FechaTransaccion
 	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE LA CANTIDAD DE MONITOREOS EN GENERAL POR SEMANA
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'CANTMONITOREO_SEMANAL_G'
	BEGIN
		SELECT COUNT(DATEPART(ISO_WEEK, FechaTransaccion)) AS 'CantMonitoreo',
               MonitorId,
               CONVERT(VARCHAR(10), MonitorId)  + ' - ' + U.Nombres + ' ' + U.Apellidos AS 'Monitor', 
			   DATEPART(ISO_WEEK, FechaTransaccion) AS 'ItemDato'
		FROM [Proceso].[Monitoreo] M
		INNER JOIN [Seguridad].[Usuario] U ON U.Id = M.MonitorId 
			GROUP BY DATEPART(ISO_WEEK, FechaTransaccion),
			         MonitorId,
					 Nombres,
					 Apellidos
 	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE LA CANTIDAD DE MONITOREOS DEL MONITOR POR SEMANA
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'CANTMONITOREO_SEMANAL'
	BEGIN
		SELECT COUNT(DATEPART(ISO_WEEK, FechaTransaccion)) AS 'CantMonitoreo',
			   DATEPART(ISO_WEEK, FechaTransaccion) AS 'ItemDato'
		FROM [Proceso].[Monitoreo]
			WHERE MonitorId = @CAMPANA_ID
			GROUP BY DATEPART(ISO_WEEK, FechaTransaccion)
 	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE LA CANTIDAD DE MONITOREOS EN GENERAL POR MES
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'CANTMONITOREO_MENSUAL_G'
	BEGIN
	    SELECT COUNT(DATENAME(month, FechaTransaccion)) AS 'CantMonitoreo',
               MonitorId,
               CONVERT(VARCHAR(10), MonitorId)  + ' - ' + U.Nombres + ' ' + U.Apellidos AS 'Monitor', 
			   DATENAME(month, FechaTransaccion) AS 'ItemDato'
		FROM [Proceso].[Monitoreo] M
		INNER JOIN [Seguridad].[Usuario] U ON U.Id = M.MonitorId 
			GROUP BY DATENAME(month, FechaTransaccion),
			         MonitorId,
					 Nombres,
					 Apellidos
 	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE LA CANTIDAD DE MONITOREOS DEL MONITOR POR MES
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'CANTMONITOREO_MENSUAL'
	BEGIN
	    SET LANGUAGE Spanish
		SELECT COUNT(DATENAME(month, FechaTransaccion)) AS 'CantMonitoreo',
				 DATENAME(month, FechaTransaccion) AS 'ItemDato'
		FROM [Proceso].[Monitoreo]
			WHERE MonitorId = @CAMPANA_ID
			GROUP BY DATENAME(month, FechaTransaccion)
 	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE LA CANTIDAD DE MONITOREOS EN GENERAL POR FECHA DIARIA CON FILTRO FECHA
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'CANTMONITOREO_DIARIO_GF'
	BEGIN
		SELECT COUNT(FechaTransaccion) AS 'CantMonitoreo',
               MonitorId,
               CONVERT(VARCHAR(10), MonitorId)  + ' - ' + U.Nombres + ' ' + U.Apellidos AS 'Monitor', 
			   FechaTransaccion AS 'ItemDato'
		FROM [Proceso].[Monitoreo] M
		INNER JOIN [Seguridad].[Usuario] U ON U.Id = M.MonitorId 
		WHERE FechaTransaccion BETWEEN @PARAMETRO_1 AND @PARAMETRO_2
			GROUP BY FechaTransaccion,
			         MonitorId,
					 Nombres,
					 Apellidos
 	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE LA CANTIDAD DE MONITOREOS DEL MONITOR POR FECHA DIARIA CON FILTRO FECHA
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'CANTMONITOREO_DIARIO_F'
	BEGIN
		SELECT COUNT(FechaTransaccion) AS 'CantMonitoreo',
			   FechaTransaccion AS 'ItemDato'
		FROM [Proceso].[Monitoreo]
			WHERE MonitorId = @CAMPANA_ID
			  AND FechaTransaccion BETWEEN @PARAMETRO_1 AND @PARAMETRO_2
			  GROUP BY FechaTransaccion
 	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE LA CANTIDAD DE MONITOREOS EN GENERAL POR SEMANA CON FILTRO FECHA
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'CANTMONITOREO_SEMANAL_GF'
	BEGIN
		SELECT COUNT(DATEPART(ISO_WEEK, FechaTransaccion)) AS 'CantMonitoreo',
               MonitorId,
               CONVERT(VARCHAR(10), MonitorId)  + ' - ' + U.Nombres + ' ' + U.Apellidos AS 'Monitor', 
			   DATEPART(ISO_WEEK, FechaTransaccion) AS 'ItemDato'
		FROM [Proceso].[Monitoreo] M
		INNER JOIN [Seguridad].[Usuario] U ON U.Id = M.MonitorId 
		WHERE FechaTransaccion BETWEEN @PARAMETRO_1 AND @PARAMETRO_2
			GROUP BY DATEPART(ISO_WEEK, FechaTransaccion),
			         MonitorId,
					 Nombres,
					 Apellidos
 	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE LA CANTIDAD DE MONITOREOS DEL MONITOR POR SEMANA CON FILTRO FECHA
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'CANTMONITOREO_SEMANAL_F'
	BEGIN
		SELECT COUNT(DATEPART(ISO_WEEK, FechaTransaccion)) AS 'CantMonitoreo',
			   DATEPART(ISO_WEEK, FechaTransaccion) AS 'ItemDato'
		FROM [Proceso].[Monitoreo]
		    WHERE MonitorId = @CAMPANA_ID
		      AND FechaTransaccion BETWEEN @PARAMETRO_1 AND @PARAMETRO_2
   	          GROUP BY DATEPART(ISO_WEEK, FechaTransaccion)
 	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE LA CANTIDAD DE MONITOREOS DEL MONITOR POR MES CON FILTRO FECHA
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'CANTMONITOREO_MENSUAL_GF'
	BEGIN
	    SET LANGUAGE Spanish
		SELECT COUNT(DATENAME(month, FechaTransaccion)) AS 'CantMonitoreo',
               MonitorId,
               CONVERT(VARCHAR(10), MonitorId)  + ' - ' + U.Nombres + ' ' + U.Apellidos AS 'Monitor', 
			   DATENAME(month, FechaTransaccion) AS 'ItemDato'
		FROM [Proceso].[Monitoreo] M
		INNER JOIN [Seguridad].[Usuario] U ON U.Id = M.MonitorId 
		WHERE FechaTransaccion BETWEEN @PARAMETRO_1 AND @PARAMETRO_2
			GROUP BY  DATENAME(month, FechaTransaccion),
			         MonitorId,
					 Nombres,
					 Apellidos
 	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE LA CANTIDAD DE MONITOREOS DEL MONITOR POR MES CON FILTRO FECHA
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'CANTMONITOREO_MENSUAL_F'
	BEGIN
	    SET LANGUAGE Spanish
		SELECT COUNT(DATENAME(month, FechaTransaccion)) AS 'CantMonitoreo',
				 DATENAME(month, FechaTransaccion) AS 'ItemDato'
		FROM [Proceso].[Monitoreo]
			WHERE MonitorId = @CAMPANA_ID
			  AND FechaTransaccion BETWEEN @PARAMETRO_1 AND @PARAMETRO_2
   			  GROUP BY DATENAME(month, FechaTransaccion)
 	END
END

	----------------------------------------------------------------------------------------------------
	--PRUEBAS
	----------------------------------------------------------------------------------------------------

/*
   /*CANT_MONITOREOS*/	     SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_REPORTES] 'CANT_MONITOREOS','1'
   /*CANT_FORMULARIOS*/      SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_REPORTES] 'CANT_FORMULARIOS','1'
   /*PORCENTAJE_PEC*/ 	     SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_REPORTES] 'PORCENTAJE_PEC' ,'1'
   /*PORCENTAJE_PECC*/ 	     SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_REPORTES] 'PORCENTAJE_PECC' ,'1'
   /*PORCENTAJE_PECN*/ 	     SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_REPORTES] 'PORCENTAJE_PECN' ,'1'
   /*PORCENTAJE_PECUF*/      SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_REPORTES] 'PORCENTAJE_PECUF' ,'1'
   /*FORMULARIO_GENERAL*/    SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_REPORTES] 'DATA_FORMULARIO_GENERAL' ,'18'
   /*PROMEDIO_NOTALFINAL*/   SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_REPORTES] 'PROMEDIO_NOTALFINAL' ,'1'
   /*CANTMONITOREO_DIARIO*/  SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_REPORTES] 'CANTMONITOREO_DIARIO' ,'6'
   /*CANTMONITOREO_SEMANAL*/ SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_REPORTES] 'CANTMONITOREO_SEMANAL' ,'6'
   /*CANTMONITOREO_MENSUAL*/ SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_REPORTES] 'CANTMONITOREO_MENSUAL' ,'6'
   /*CANTMONITOREO_DIARIO*/  SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_REPORTES] 'CANTMONITOREO_DIARIO_F' ,'6','2021-09-16','2021-10-07'
   /*CANTMONITOREO_SEMANAL*/ SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_REPORTES] 'CANTMONITOREO_SEMANAL_F','6','2021-09-16','2021-10-07'
   /*CANTMONITOREO_MENSUAL*/ SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_REPORTES] 'CANTMONITOREO_MENSUAL_F' ,'6','2021-09-16','2021-10-07'
   /*CANTMONITOREO_DIARIO*/  SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_REPORTES] 'CANTMONITOREO_DIARIO_G' ,'6'
   /*CANTMONITOREO_SEMANAL*/ SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_REPORTES] 'CANTMONITOREO_SEMANAL_G' ,'6'
   /*CANTMONITOREO_MENSUAL*/ SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_REPORTES] 'CANTMONITOREO_MENSUAL_G' ,'6'
   /*CANTMONITOREO_DIARIO*/  SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_REPORTES] 'CANTMONITOREO_DIARIO_GF' ,'6','2021-09-16','2021-10-07'
   /*CANTMONITOREO_SEMANAL*/ SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_REPORTES] 'CANTMONITOREO_SEMANAL_GF','6','2021-09-16','2021-10-07'
   /*CANTMONITOREO_MENSUAL*/ SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_REPORTES] 'CANTMONITOREO_MENSUAL_GF' ,'6','2021-09-16','2021-10-07'
  
*/

GO
/****** Object:  StoredProcedure [Proceso].[SP_CRUD_RESULTADO_MONITOREO]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================================================================
 Uso			:	PROCEDIMIENTO ENCARGADO DE GESTIONAR LA TABLA CLIENTE
 Fecha			:	2020-03-24.
 Autor			:	GERMAN RODRIGUEZ
 Entradas		:	@Opcion				 NVARCHAR(50),
					@Id					 BIGINT,
					@MonitoreoId         BIGINT = NULL,
					@OpeNivel			 INT = NULL,
					@NivelId			 BIGINT = NULL,
					@Opc        		 VARCHAR(3) = NULL
-- ==========================================================================================*/
CREATE PROCEDURE [Proceso].[SP_CRUD_RESULTADO_MONITOREO]
	@Opcion			NVARCHAR(50),
	@Id				BIGINT,
	@MonitoreoId    BIGINT = NULL,
    @OpeNivel		INT = NULL,
    @NivelId		BIGINT = NULL,
    @Opc        	VARCHAR(3) = NULL
 AS
BEGIN
	SET NOCOUNT ON;
	SET DATEFORMAT ymd
	
	---------------------------------------------------------------------------------------------------------------------
	--INSERTA DATA A LA TABLA CLIENTE (INSERT)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'INSERT'
	BEGIN
		INSERT INTO [Proceso].[MonitoreoResultado]
				   ([MonitoreoId]
				   ,[OpeNivel]
				   ,[NivelId]
				   ,[Opc]
				   )
			 VALUES
				   (@MonitoreoId
				   ,@OpeNivel
				   ,@NivelId
				   ,@Opc
				   )
			SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY];  --Sirve para mostrar el ID del registro nuevo--
	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE DATA A LA TABLA MONITOREO (READ)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ'
	BEGIN
		SELECT [Id]
			  ,[OpeNivel]
			  ,[NivelId]
			  ,[Opc]
        FROM [Proceso].[MonitoreoResultado]
		WHERE [MonitoreoId] = @Id 
	END
	
	
END

	----------------------------------------------------------------------------------------------------
	--PRUEBAS
	----------------------------------------------------------------------------------------------------

/*
   /*INSERT*/			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_RESULTADO_MONITOREO] 'INSERT','0','PRUEBA','1'
   /*READ*/ 			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_RESULTADO_MONITOREO] 'READ','1'
   /*READ*/ 			SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_RESULTADO_MONITOREO] 'EXISTE_MONITOREO' ,'0','PRUEBA EDICION'
   /*LIST_MONITOREOS*/ 	SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_RESULTADO_MONITOREO] 'LIST_MONITOREOS' ,'0'
*/

GO
/****** Object:  StoredProcedure [Proceso].[SP_CRUD_USUARIO_CAMPANA]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* =============================================
-- Author:		German Alejandro Rodriguez
-- Create date: 2020-04-01
-- Description:	Procedimiento encargado de administrar la tabla [Configuracion].[CampanaAplicaciones]
-- Parameters:  @Opcion			VARCHAR(50),
				@Id				BIGINT,
				@CampanaId      BIGINT = NULL,
				@Nombre    	    VARCHAR(100) = NULL,
				@Descripcion    VARCHAR(250) = NULL,
				@RutaBusqueda   VARCHAR(500) = NULL,
				@Estado			INT = NULL 
-- =============================================*/
CREATE PROCEDURE [Proceso].[SP_CRUD_USUARIO_CAMPANA]
    @Opcion			VARCHAR(50),
	@Id				BIGINT,
	@Documento		VARCHAR(25) = NULL,
	@CampanaId      BIGINT = NULL,
	@UsuarioId      BIGINT = NULL,
	@Estado         INT = NULL,
	@ValueRolId		BIGINT = NULL
AS
BEGIN
	SET NOCOUNT ON;
	SET DATEFORMAT ymd
	
	-----------------------------------------------------------------------------------------------------------------
	--TRAE LA DATA CORRESPONDIENTE A LAS APLICACIONES ASIGNADAS A LA CAMPAÑA
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ_USERCAMPANAS'
	BEGIN
	    
		SET @UsuarioId = (SELECT Id FROM [Seguridad].[Usuario] WHERE Documento = @Documento)
		
		SELECT UsuarioId,
		       UC.[CampanaId],
			   CL.Nombre + ' - ' + C.[Nombre] AS Nombre,
			   [ColorBack],
			   [ColorHeaderTitle],
               [ColorLabel]
			FROM [Proceso].[UsuarioCampana] UC (NOLOCK)
			INNER JOIN [Proceso].[Campana] C (NOLOCK) ON C.Id = UC.CampanaId
	    	INNER JOIN [Proceso].[Cliente] CL ON CL.Id =C.ClienteId  
			INNER JOIN [Configuracion].[EstiloCampana] EC (NOLOCK) ON EC.[CampanaId] = UC.CampanaId
			WHERE UsuarioId = @UsuarioId
			AND UC.Estado = 1
			ORDER BY CL.Nombre, C.Nombre ASC
	END
    -----------------------------------------------------------------------------------------------------------------
	--INSERTA EN LA TABLA [Configuracion].[CampanaAplicaciones] (INSERT)
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'INSERT'
	BEGIN
		INSERT INTO [Proceso].[UsuarioCampana]
			   ([CampanaId]
			   ,[UsuarioId]
			   ,[ValueRolId]
			   ,[Estado])
		 VALUES
			   (@CampanaId
			   ,@UsuarioId
			   ,@ValueRolId
			   ,@Estado)
		 SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY];  --Sirve para mostrar el ID del registro nuevo--
	END
	---------------------------------------------------------------------------------------------------------------------
	--CONSULTA DE ACCESO POR USUARIO A LAS EMPRESAS 
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'SELECT_ACCESO_USER'
	BEGIN
		SELECT UA.CampanaId AS Id,
		       E.Nombre,
			   R.ValueRolId,
			   R.Nombre AS Perfil
		FROM [Proceso].[UsuarioCampana] UA
		INNER JOIN [Proceso].[Campana] E (NOLOCK) ON E.Id = UA.CampanaId
		INNER JOIN [Seguridad].[Rol] R (NOLOCK) ON R.ValueRolId = UA.ValueRolId AND R.CampanaId = UA.CampanaId
	    WHERE [UsuarioId] = @UsuarioId
		  AND UA.Estado = 1
	END
   ---------------------------------------------------------------------------------------------------------------------
	--CONSULTA DE ACCESO POR USUARIO A LAS EMPRESAS 
   ---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'SELECT_ACCESO_USER_ALL'
	BEGIN
		SELECT UA.Id,
		       UA.CampanaId,
		       CL.Nombre + ' - ' + E.[Nombre] AS Nombre,
			   UA.Estado,
			   R.Nombre AS Perfil
		FROM [Proceso].[UsuarioCampana] UA
		INNER JOIN [Proceso].[Campana] E (NOLOCK) ON E.Id = UA.CampanaId
		INNER JOIN [Proceso].[Cliente] CL ON CL.Id =E.ClienteId  
		INNER JOIN [Configuracion].[Dato] R ON R.Id = UA.ValueRolId  
	    WHERE UA.[UsuarioId] = @UsuarioId
		ORDER BY CL.Nombre, E.Nombre ASC
	END
	 ---------------------------------------------------------------------------------------------------------------------
	--DESACTIVAR O ACTIVAR USUARIO EN LA TABLA USUARIO (DELETE)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'INACTIVE_ACTIVE'
	BEGIN
	    
		IF @Documento = 0
		BEGIN
		   SET @Estado = 1
		END
		ELSE
		BEGIN
		   SET @Estado = 0
		END	
		
		UPDATE [Proceso].[UsuarioCampana]
		   SET [Estado] = @Estado
		 WHERE Id = @Id
		 SELECT @Estado
	END	
	---------------------------------------------------------------------------------------------------------------------
	--DESACTIVAR O ACTIVAR USUARIO EN LA TABLA USUARIO (DELETE)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'SELECT_EXIST_CAMPANA'
	BEGIN
		SELECT COUNT(1)
		FROM [Proceso].[UsuarioCampana] UA
	    WHERE [UsuarioId] = @UsuarioId
		  AND CampanaId = @CampanaId
	END
	---------------------------------------------------------------------------------------------------------------------
	--CONSULTA EL PRIMER CLIENTE ASIGNADO 
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'SELECT_CLIENTE'
	BEGIN
		SELECT TOP(1) C.Id AS Id,
		       C.Nombre
		FROM [Proceso].[UsuarioCampana] UA
		INNER JOIN [Proceso].[Campana] E (NOLOCK) ON E.Id = UA.CampanaId
		INNER JOIN [Proceso].[Cliente] C (NOLOCK) ON C.Id = UA.CampanaId
		INNER JOIN [Seguridad].[Usuario] U (NOLOCK) ON  U.Id = UA.UsuarioId	
	    WHERE U.Documento = @Documento
		  AND UA.Estado = 1
	END
	
END
----------------------------------------------------------------------------------------------------
--PRUEBAS
----------------------------------------------------------------------------------------------------
/*
    SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_USUARIO_CAMPANA] 'SELECT_EXIST_CAMPANA','0','0','1','1'
    SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_USUARIO_CAMPANA] 'READ_USERCAMPANAS','0','79884249'
	SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_USUARIO_CAMPANA] 'SELECT_ACCESO_USER','0','79884249','0','1'
	SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_USUARIO_CAMPANA] 'SELECT_CLIENTE','0','79884249'
	
	
	SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_USUARIO_CAMPANA] 'INSERT','0','U','1','4','1'
    SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_USUARIO_CAMPANA] 'SELECT_ACCESO_USER_ALL','0','U','1','1'
	SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_USUARIO_CAMPANA] 'SELECT_COORDINADOR','1','1'
	SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_USUARIO_CAMPANA] 'SELECT_ACCESO_USER','0','U','0','3'
*/

GO
/****** Object:  StoredProcedure [Proceso].[SP_SESION]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================================================================
 Uso			:	PROCEDIMIENTO ENCARGADO DE CREAR LA SESION TEMPORAL
 Fecha			:	2020-03-24.
 Autor			:	GERMAN RODRIGUEZ
 Entradas		:	@Option_Crud    NVARCHAR(50),
					@User   	    NVARCHAR(25) = NULL,
					@parametro1		VARCHAR(250) = NULL,
					@parametro2		VARCHAR(250) = NULL,
					@parametro3		VARCHAR(250) = NULL,
					@parametro4		VARCHAR(250) = NULL,
					@parametro5		VARCHAR(250) = NULL

==========================================================================================*/
CREATE PROCEDURE [Proceso].[SP_SESION]
	@Option_Crud    NVARCHAR(50),
	@Documento 	    NVARCHAR(25) = NULL,
	@parametro1		VARCHAR(250) = NULL,
	@parametro2		VARCHAR(250) = NULL,
	@parametro3		VARCHAR(250) = NULL,
	@parametro4		VARCHAR(250) = NULL,
	@parametro5		VARCHAR(250) = NULL
 AS
BEGIN
	SET NOCOUNT ON;
	SET DATEFORMAT ymd
	
	---------------------------------------------------------------------------------------------------------------------
	--PROCESO SE CREACION DE TABLA SESION
	---------------------------------------------------------------------------------------------------------------------
    IF @Option_Crud ='T_SESION'
	BEGIN
		---------------------------------------------------------------------------------------------------------------------
		--DEFINICION DE TABLA TEMPORAL Y VARIABLES
		---------------------------------------------------------------------------------------------------------------------
        DECLARE @TempSesion TABLE
		(  
			 [IdUser]				BIGINT
			,[Document] 			VARCHAR(25)
			,[IdRol]				BIGINT
			,[IdCliente]			BIGINT
			,[QCampanasAsignadas]	BIGINT
			,[IdCampana]			BIGINT
			,[NombreUser]			VARCHAR(500)
			,[PerfilUser]			VARCHAR(50)
		)

		DECLARE @IdUser BIGINT
		DECLARE @IdRol BIGINT
		DECLARE @IdCliente BIGINT
		DECLARE @QCampanasAsignadas BIGINT
		DECLARE @IdCampana BIGINT
		DECLARE @NombreUser VARCHAR(500)
		DECLARE @PerfilUser VARCHAR(50)
		
		---------------------------------------------------------------------------------------------------------------------
		--ASIGNACION DE VALORES A LA VARIBLES DEFINIDAS
		---------------------------------------------------------------------------------------------------------------------
        SET @IdUser = (SELECT Id FROM [Seguridad].[Usuario] WHERE Documento = @Documento)
		SET @IdRol = (SELECT [RolId] FROM [Seguridad].[Usuario] WHERE Documento = @Documento)
		SET @PerfilUser = (SELECT Nombre FROM [Seguridad].[Rol] WHERE Id = @IdRol)
		SET @NombreUser = (SELECT [Nombres] + ' ' + [Apellidos] AS NombreCompleto FROM [Seguridad].[Usuario] WHERE Documento = @Documento)
		SET @QCampanasAsignadas =(SELECT COUNT(1) AS CANT FROM [Proceso].[Campana] C
									INNER JOIN [Proceso].[UsuarioCampana] UC ON UC.CampanaId = C.Id
									WHERE [UsuarioId] = @IdUser 
									AND UC.Estado = 1)

		
		IF @QCampanasAsignadas = 1
		BEGIN
		    SET @IdRol = (SELECT [ValueRolId] FROM [Proceso].[UsuarioCampana]
			              WHERE [UsuarioId] = @IdUser
							   AND Estado = 1)
		
		    SET @IdCliente = (SELECT [ClienteId] FROM [Proceso].[Campana] C
		                      INNER JOIN [Proceso].[UsuarioCampana] UC ON UC.CampanaId = C.Id
							   WHERE [UsuarioId] = @IdUser
							   AND UC.Estado = 1)
		
		   SET @IdCampana = (SELECT CampanaId FROM [Proceso].[UsuarioCampana]  WHERE [UsuarioId] = @IdUser	AND Estado = 1) 
		
		   SET @PerfilUser = (SELECT Nombre FROM [Proceso].[UsuarioCampana] UC
							   INNER JOIN [Seguridad].[Rol] R ON UC.[ValueRolId] = R.[ValueRolId]
			                   WHERE UC.[ValueRolId] = @IdRol
							   AND [UsuarioId] = @IdUser
							   AND R.CampanaId = @IdCampana)
		END
		ELSE
		BEGIN
		   SET @IdCliente = 0
		   SET @IdCampana = 0
		END
		---------------------------------------------------------------------------------------------------------------------
		--INSERCION EN LA TABLA TEMPORAL
		---------------------------------------------------------------------------------------------------------------------
        INSERT INTO @TempSesion([IdUser]
		                       ,[Document]
							   ,[IdRol]
							   ,[IdCliente]
							   ,[QCampanasAsignadas]
							   ,[IdCampana]
							   ,[NombreUser]
							   ,[PerfilUser]
		                       )
		                SELECT @IdUser,
						       @Documento,
							   @IdRol,
							   @IdCliente,
							   @QCampanasAsignadas,
							   @IdCampana,
							   @NombreUser,
							   @PerfilUser
		
		---------------------------------------------------------------------------------------------------------------------
		--SELECCION DE LA TABLA TEMPORAL
		---------------------------------------------------------------------------------------------------------------------
    	SELECT [IdUser]
		      ,[Document]
			  ,[IdRol]
			  ,[IdCliente]
			  ,[QCampanasAsignadas]
			  ,[IdCampana]
			  ,[NombreUser]
			  ,[PerfilUser]
		FROM @TempSesion
	END
END

	----------------------------------------------------------------------------------------------------
	--PRUEBAS
	----------------------------------------------------------------------------------------------------

/*
   /*SESION*/	SET DATEFORMAT ymd EXEC [Proceso].[SP_SESION] 'T_SESION','79884249'
   SET DATEFORMAT ymd EXEC [Proceso].[SP_SESION] 'T_SESION','111111'

   SELECT [ValueRolId] FROM [Proceso].[UsuarioCampana]
			              WHERE [UsuarioId] = 3
							   AND Estado = 1

							   SELECT Nombre FROM [Proceso].[UsuarioCampana] UC
							   INNER JOIN [Seguridad].[Rol] R ON UC.[ValueRolId] = R.[ValueRolId]
			                   WHERE UC.[ValueRolId] = 3
							   AND [UsuarioId] = 3
							   AND R.CampanaId = 2
*/
GO
/****** Object:  StoredProcedure [Seguridad].[SP_CRUD_ACCESO]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* =============================================
-- Author:		German Alejandro Rodriguez
-- Create date: 2020-04-01
-- Description:	Procedimiento encargado de insertar en la tabla acceso
-- Parameters:  @Opcion				VARCHAR(50),
				@Id					BIGINT,
				@IP_Acceso   		VARCHAR(20) = NULL,
				@Usuario			VARCHAR(20) = NULL,
				@Usuario_Id	BIGINT = NULL 
-- =============================================*/
create PROCEDURE [Seguridad].[SP_CRUD_ACCESO]
    @Opcion				VARCHAR(50),
	@Id					BIGINT,
	@IP_Acceso   		VARCHAR(20) = NULL,
	@Documento			VARCHAR(30) = NULL,
    @Usuario_Id	        BIGINT = NULL
AS
BEGIN
	SET NOCOUNT ON;
	SET DATEFORMAT ymd
	
	-----------------------------------------------------------------------------------------------------------------
	--INSERTA EL ACCESO DEL COLABORADOR (INSERT) 
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'INSERT'
	BEGIN
 
       SET @Usuario_Id =(SELECT Id FROM [Seguridad].[Usuario] WHERE Documento = @Documento);
      
	   IF (@Usuario_Id <> 0)
	   BEGIN
             INSERT INTO [Seguridad].[Acceso]
					   ([IP_Acceso]
					   ,[Usuario_Id]
						)
				    VALUES(
					    @IP_Acceso,
						@Usuario_Id
						)
		     SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY];  --Sirve para mostrar el ID del registro nuevo--
	   END
	   ELSE
	   BEGIN
			SET @Usuario_Id = 0
			SELECT @Usuario_Id
	   END
 	END
	-----------------------------------------------------------------------------------------------------------------
	--ACTUALIZA EL CIERRE DE LA SESION DEL COLABORADOR 
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'LOAD_INGRESO'
	BEGIN
		SELECT [IP_Acceso]
			  ,CONVERT(DATE,[Fecha_Acceso]) AS FechaIngreso
			  ,RIGHT(CONVERT(DATETIME, [Fecha_Acceso], 108),8) AS  HoraIngreso
		  FROM [Seguridad].[Acceso]
		WHERE [Usuario_Id] = @Id
		AND CONVERT(DATE,[Fecha_Acceso]) = CONVERT(DATE,GETDATE())
	END
END

----------------------------------------------------------------------------------------------------
--PRUEBAS
----------------------------------------------------------------------------------------------------
/*
    SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_ACCESO] 'INSERT','0','192.168.0.11','GARODRIGUEZ'
    SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_ACCESO] 'END_SESION','20108','','','','xxxxx'
    SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_ACCESO] 'LOAD_INGRESO','6'
*/


GO
/****** Object:  StoredProcedure [Seguridad].[SP_CRUD_HISTORICO_PASSWORD]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================================================================
 Uso			:	PROCEDIMIENTO ENCARGADO DE GESTIONAR LA TABLA HistoricoPassword
 Fecha			:	2020-03-24.
 Autor			:	GERMAN RODRIGUEZ
 Entradas		:	@Id				  BIGINT,
					@UsuarioId		  BIGINT = NULL,
					@IP				  VARCHAR(100) = NULL,
					@OpcionPasswordId BIGINT = NULL
-- ==========================================================================================*/
CREATE PROCEDURE [Seguridad].[SP_CRUD_HISTORICO_PASSWORD]
	@Opcion           NVARCHAR(50),
	@Id				  BIGINT,
	@UsuarioId		  BIGINT = NULL,
	@IP				  VARCHAR(100) = NULL,
	@OpcionPasswordId BIGINT = NULL
 AS
BEGIN
	SET NOCOUNT ON;
	SET DATEFORMAT ymd
	
	---------------------------------------------------------------------------------------------------------------------
	--INSERTA DATA A LA TABLA HistoricoPassword (INSERT)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'INSERT'
	BEGIN
		INSERT INTO [Seguridad].[HistoricoPassword]
			   ([UsuarioId]
			   ,[IP]
			   ,[OpcionPasswordId]
			   )
		 VALUES
			   (@UsuarioId
			   ,@IP
			   ,@OpcionPasswordId
			   )
			SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY];  --Sirve para mostrar el ID del registro nuevo--
	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE DATA A LA TABLA HistoricoPassword (READ)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ_USER'
	BEGIN
		SELECT [IP]
			  ,[OpcionPasswordId]
			  ,OP.Nombre AS OpcionPassword
			  ,HP.[FechaRegistro]
		  FROM [Seguridad].[HistoricoPassword] HP
		  INNER JOIN [Configuracion].[Dato] OP ON OP.Id = HP.[OpcionPasswordId]
		  WHERE [UsuarioId] = @UsuarioId
	END
END

	----------------------------------------------------------------------------------------------------
	--PRUEBAS
	----------------------------------------------------------------------------------------------------

/*
   /*INSERT*/			SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_HISTORICO_PASSWORD] 'INSERT','0','1','192.168.1.1','5'
   /*READ*/ 			SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_HISTORICO_PASSWORD] 'READ_USER','0','3'
*/

GO
/****** Object:  StoredProcedure [Seguridad].[SP_CRUD_PAGINA]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================================================================
 Uso			:	PROCEDIMIENTO ENCARGADO DE GESTIONAR LA TABLA PAGINA
 Fecha			:	2020-03-22.
 Autor			:	GERMAN RODRIGUEZ
 Entradas		:	@Option_Crud    NVARCHAR(50),
					@Id				INT,
					@PadreId		BIGINT = NULL,
					@Nombre			VARCHAR(200) = NULL,
					@Descripcion	VARCHAR(500) = NULL,
					@Orden			INT = NULL,
					@Url			VARCHAR(500) = NULL,
					@Imagen			VARCHAR(200) = NULL
-- ==========================================================================================*/
create PROCEDURE [Seguridad].[SP_CRUD_PAGINA]
	@Option_Crud    NVARCHAR(50),
	@Id				INT,
	@PadreId		BIGINT = NULL,
    @Nombre			VARCHAR(200) = NULL,
    @Descripcion	VARCHAR(500) = NULL,
    @Orden			INT = NULL,
    @Url			VARCHAR(500) = NULL,
    @Imagen			VARCHAR(200) = NULL,
	@Color			INT = NULL,
    @TipoMenuId		INT = NULL
AS
BEGIN
	SET NOCOUNT ON;
	SET DATEFORMAT ymd
	---------------------------------------------------------------------------------------------------------------------
	--INSERTA DATA A LA TABLA PAGINA (INSERT)
	---------------------------------------------------------------------------------------------------------------------
	IF @Option_Crud = 'SELECT_PAGINAS_CAMPANA'
	BEGIN
		SELECT P.[Id]
			  ,[PadreId]
			  ,[Nombre]
			  ,[Descripcion]
			  ,[Orden]
			  ,[Url]
			  ,[Imagen]
		  	  ,Color
			  ,TipoMenuId
		  FROM [Seguridad].[Pagina] P (NOLOCK)
		  INNER JOIN [Seguridad].[PermisoPagina] PP (NOLOCK) ON PP.PaginaId = P.Id
		  WHERE PP.CampanaId = @Id
	END
	---------------------------------------------------------------------------------------------------------------------
	--INSERTA DATA A LA TABLA PAGINA (INSERT)
	---------------------------------------------------------------------------------------------------------------------
	IF @Option_Crud = 'INSERT'
	BEGIN
		
		IF @PadreId = ''
		BEGIN
			SET @PadreId = NULL
		END

		INSERT INTO [Seguridad].[Pagina]
			   ([PadreId]
			   ,[Nombre]
			   ,[Descripcion]
			   ,[Orden]
			   ,[Url]
			   ,[Imagen]
			   ,Color
			   ,TipoMenuId
			   )
		 VALUES
			   (@PadreId,
				@Nombre,
				@Descripcion,
				@Orden,
				@Url,
				@Imagen,
			    @Color,
			    @TipoMenuId
			   )
		SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY];  --Sirve para mostrar el ID del registro nuevo--
	END
END

	----------------------------------------------------------------------------------------------------
	--PRUEBAS
	----------------------------------------------------------------------------------------------------

/*
	 /*INSERT*/	SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_PAGINA] 'INSERT','0','1','CARGAR INVENTARIO','MODULO PARA LA ADMINISTRACION DEL INVENTARIO DE PRODUCTOS DE LA EMPRESA','2','Menu/Inventario.aspx','fa-icon','1','1411'
*/
GO
/****** Object:  StoredProcedure [Seguridad].[SP_CRUD_PERMISOS_PAGINA]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================================================================
 Uso			:	PROCEDIMIENTO ENCARGADO DE GESTIONAR LA TABLA PERMISOPAGINA
 Fecha			:	2020-03-22.
 Autor			:	GERMAN RODRIGUEZ
 Entradas		:	@Option_Crud    NVARCHAR(50),
					@Id				INT,
					@RolId			BIGINT = NULL,
					@CampanaId		BIGINT = NULL,
					@PaginaId		BIGINT = NULL,
					@Visible		INT = NULL
-- ==========================================================================================*/
CREATE PROCEDURE [Seguridad].[SP_CRUD_PERMISOS_PAGINA]
	@Option_Crud    NVARCHAR(50),
	@Id				INT,
    @RolId			BIGINT = NULL,
    @CampanaId		BIGINT = NULL,
    @PaginaId		BIGINT = NULL,
    @Visible		INT = NULL,
	@ValueRol       BIGINT = NULL 
 AS
BEGIN
	SET NOCOUNT ON;
	SET DATEFORMAT ymd
	
	---------------------------------------------------------------------------------------------------------------------
	--INSERTA DATA A LA TABLA PERMISOPAGINA (INSERT)
	---------------------------------------------------------------------------------------------------------------------
	IF @Option_Crud = 'INSERT'
	BEGIN
		INSERT INTO [Seguridad].[PermisoPagina]
				   ([RolId]
				   ,[ValueRol]
				   ,[CampanaId]
				   ,[PaginaId]
				   ,[Visible]
				   )
			 VALUES
				   (@RolId
				   ,@ValueRol
				   ,@CampanaId 
				   ,@PaginaId 
				   ,@Visible 
				   )
		SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY];  --Sirve para mostrar el ID del registro nuevo--
	END
	---------------------------------------------------------------------------------------------------------------------
	--TRA EL MENU DE NAVEGACION DE LA EMPRESA Y ROL SELECCIONADA
	---------------------------------------------------------------------------------------------------------------------
	IF @Option_Crud = 'SELECT_DASH'
	BEGIN
		SELECT P.[Id]
			  ,[PadreId]
			  ,[Nombre]
			  ,[Descripcion]
			  ,[Orden]
			  ,[Url]
			  ,[Imagen]
			  ,Color
			  ,TipoMenuId
		  FROM [Seguridad].[Pagina] P (NOLOCK)
		  INNER JOIN [Seguridad].[PermisoPagina] PP (NOLOCK) ON PP.PaginaId = P.Id
		  WHERE PP.CampanaId = @CampanaId
		    AND PP.ValueRol = @RolId
			AND PP.Visible = 1
		  ORDER BY P.PadreId, P.Orden ASC
	END
	---------------------------------------------------------------------------------------------------------------------
	--INSERTA LOS ROLES Y PAGINAS INICIALES DEL FLUJO DE MONITOREOS
	---------------------------------------------------------------------------------------------------------------------
	IF @Option_Crud = 'PAGINAS_INICIALES'
	BEGIN
		/*ADMINISTRADOR F*/ INSERT INTO [Seguridad].[PermisoPagina]([RolId],[ValueRol],[CampanaId],[PaginaId],[Visible]) VALUES (1,1,@Id,1,1)
		/*SUPERVISOR    F*/ INSERT INTO [Seguridad].[PermisoPagina]([RolId],[ValueRol],[CampanaId],[PaginaId],[Visible]) VALUES (2,2,@Id,1,1)
		/*MONITOR       F*/ INSERT INTO [Seguridad].[PermisoPagina]([RolId],[ValueRol],[CampanaId],[PaginaId],[Visible]) VALUES (3,3,@Id,1,0)

		/*ADMINISTRADOR M*/ INSERT INTO [Seguridad].[PermisoPagina]([RolId],[ValueRol],[CampanaId],[PaginaId],[Visible]) VALUES (1,1,@Id,2,1)
		/*SUPERVISOR    M*/ INSERT INTO [Seguridad].[PermisoPagina]([RolId],[ValueRol],[CampanaId],[PaginaId],[Visible]) VALUES (2,2,@Id,2,1)
		/*MONITOR       M*/ INSERT INTO [Seguridad].[PermisoPagina]([RolId],[ValueRol],[CampanaId],[PaginaId],[Visible]) VALUES (3,3,@Id,2,1)
		/*COORDINADOR   M*/ INSERT INTO [Seguridad].[PermisoPagina]([RolId],[ValueRol],[CampanaId],[PaginaId],[Visible]) VALUES (4,4,@Id,2,1)
		/*AGENTE        M*/ INSERT INTO [Seguridad].[PermisoPagina]([RolId],[ValueRol],[CampanaId],[PaginaId],[Visible]) VALUES (5,5,@Id,2,1)
		/*CLIENTE       M*/ INSERT INTO [Seguridad].[PermisoPagina]([RolId],[ValueRol],[CampanaId],[PaginaId],[Visible]) VALUES (6,6,@Id,2,1)
	END
	---------------------------------------------------------------------------------------------------------------------
	-- TRAE LOS CONFIGURACIONES DE PANESLES DEL FLUJO DEL MODULO MONITOREO
	---------------------------------------------------------------------------------------------------------------------
	IF @Option_Crud = 'PAGINAS_ESTABLECIDAS'
	BEGIN
		SELECT [Id]
			  ,[ValueRol]
			  ,[PaginaId]
			  ,[Visible]
		  FROM [Seguridad].[PermisoPagina]
		  WHERE CampanaId = @Id
			AND [ValueRol] >= 3
		  ORDER BY PaginaId, [ValueRol] ASC
	END
	---------------------------------------------------------------------------------------------------------------------
	--ACTULIZA INFORMACION DE VISIVILIDAD A LA TABLA PERMISOPAGINA (UPDATE)
	---------------------------------------------------------------------------------------------------------------------
	IF @Option_Crud = 'UPDATE_PERMISOS'
	BEGIN
		UPDATE [Seguridad].[PermisoPagina]
		   SET [Visible] = @RolId
		    WHERE Id = @Id
        
		SELECT @RolId
	END

END

	----------------------------------------------------------------------------------------------------
	--PRUEBAS
	----------------------------------------------------------------------------------------------------

/*
	 /*INSERT*/			SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_PERMISOS_PAGINA] 'INSERT','0','2','1','4','1'
	 /*SELECT_DASH*/	SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_PERMISOS_PAGINA] 'SELECT_DASH','0','5','2'
	 /*CONFIGURACION*/	SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_PERMISOS_PAGINA] 'PAGINAS_INICIALES','3'
	 /*SELECT_DASH*/	SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_PERMISOS_PAGINA] 'PAGINAS_ESTABLECIDAS','4'
	 /*UPDATE*/			SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_PERMISOS_PAGINA] 'UPDATE_PERMISOS','24','0'
*/
GO
/****** Object:  StoredProcedure [Seguridad].[SP_CRUD_ROL]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================================================================
 Uso			:	PROCEDIMIENTO ENCARGADO DE GESTIONAR LA TABLA ROL
 Fecha			:	2020-03-22.
 Autor			:	GERMAN RODRIGUEZ
 Entradas		:	@Option_Crud    NVARCHAR(50),
					@Id				BIGINT,
					@CampanaId      BIGINT = NULL, 
					@ValueRolId     BIGINT = NULL,
					@Nombre			VARCHAR(200) = NULL,
					@Estado         INT = NULL 
-- ==========================================================================================*/
CREATE PROCEDURE [Seguridad].[SP_CRUD_ROL]
	@Option_Crud    NVARCHAR(50),
	@Id				BIGINT,
	@CampanaId      BIGINT = NULL, 
	@ValueRolId     BIGINT = NULL,
    @Nombre			VARCHAR(200) = NULL,
    @Estado         INT = NULL 
 AS
BEGIN
	SET NOCOUNT ON;
	SET DATEFORMAT ymd
	
	---------------------------------------------------------------------------------------------------------------------
	--INSERTA DATA A LA TABLA ROL (INSERT)
	---------------------------------------------------------------------------------------------------------------------
	IF @Option_Crud = 'INSERT'
	BEGIN
		INSERT INTO [Seguridad].[Rol]
           ([CampanaId]
           ,[ValueRolId]
		   ,[Nombre]
           ,Estado
		   )
		VALUES
           (@CampanaId,
            @ValueRolId,
			@Nombre,
            1
			)
			SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY];  --Sirve para mostrar el ID del registro nuevo--
	END
	---------------------------------------------------------------------------------------------------------------------
	--ACTUALIZA LOS DATOS DEL ROL
	---------------------------------------------------------------------------------------------------------------------
	IF @Option_Crud = 'UPDATE'
	BEGIN
		UPDATE [Seguridad].[Rol]
		   SET [Nombre] = @Nombre
		 WHERE [Id] = @Id

		SELECT @Id
	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE LOS ROLES POR CAMPAÑA 
	---------------------------------------------------------------------------------------------------------------------
	IF @Option_Crud = 'READ'
	BEGIN
		SELECT Id,
		       ValueRolId, 
		       Nombre 
	    FROM [Seguridad].[Rol] 
		WHERE [CampanaId] = @CampanaId
	END
	---------------------------------------------------------------------------------------------------------------------
	--TRAE LOS ROLES ACTIVOS 
	---------------------------------------------------------------------------------------------------------------------
	IF @Option_Crud = 'LIST_ROLES'
	BEGIN
		SELECT ValueRolId AS Id, 
		       Nombre 
	    FROM [Seguridad].[Rol] 
		WHERE Estado = 1
		AND [CampanaId] = @CampanaId
	END
	---------------------------------------------------------------------------------------------------------------------
	--CONSULTA ESTADO DEL ROL 
	---------------------------------------------------------------------------------------------------------------------
	IF @Option_Crud = 'REVIEW_ACTIVE'
	BEGIN
		SELECT Estado FROM [Seguridad].[Rol] 
		WHERE Id = @Id
	END
END
	----------------------------------------------------------------------------------------------------
	--PRUEBAS
	----------------------------------------------------------------------------------------------------

/*
	 /*LIST*/	SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_ROL] 'READ','0','1' 
	 /*LIST*/	SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_ROL] 'LIST_ROLES','0','1' 


	 /*INSERT*/	SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_ROL] 'INSERT','0','ADMIN','ADMINISTRADOR DE UN CLIENTE Y SUS EMPRESAS'
	 /*ESTADO*/	SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_ROL] 'REVIEW_ACTIVE','1'
*/
GO
/****** Object:  StoredProcedure [Seguridad].[SP_CRUD_USUARIO]    Script Date: 25/01/2022 9:32:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* =============================================
-- Author:		German Alejandro Rodriguez
-- Create date: 2020-04-01
-- Description:	Procedimiento encargado de insertar en la tabla acceso
-- Parameters:  @Opcion			VARCHAR(50),
				@Id				BIGINT,
				@NombreUsuario	VARCHAR(100) = NULL,
				@Password		NVARCHAR(200) = NULL,
				@Documento		NVARCHAR(20) = NULL,
				@CambioPassword INT = NULL,
				@Estado			INT = NULL,
				@RolId			BIGINT = NULL 
-- =============================================*/
CREATE PROCEDURE [Seguridad].[SP_CRUD_USUARIO]
    @Opcion			VARCHAR(50),
	@Id				BIGINT,
	@Documento		VARCHAR(25) = NULL,
	@Password		NVARCHAR(200) = NULL,
    @Nombres		VARCHAR(150) = NULL,
    @Apellidos		VARCHAR(150) = NULL,
    @Estado			INT = NULL,
    @RolId			BIGINT = NULL,
	@CambioPassword INT = NULL,
    @Correo         VARCHAR(250) = NULL,
	@Gestionable    INT = NULL
   AS
BEGIN
	SET NOCOUNT ON;
	SET DATEFORMAT ymd
	
	-----------------------------------------------------------------------------------------------------------------
	--INSERTA EL USUARIO EN LA TABLA USUARIO
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'INSERT'
	BEGIN
		INSERT INTO [Seguridad].[Usuario]
			   ([Nombres]
			   ,[Apellidos]
			   ,[Password]
			   ,[Estado]
			   ,[RolId]
			   ,CambioPassword
			   ,Documento
			   ,Correo
			   ,[Gestionable]
			   ,ColorId)
		 VALUES
			   (@Nombres
			   ,@Apellidos
			   ,@Password
			   ,@Estado
			   ,@RolId
			   ,1
			   ,@Documento
			   ,@Correo
			   ,@Gestionable
			   ,94)
		SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY];  --Sirve para mostrar el ID del registro nuevo--
	END
	---------------------------------------------------------------------------------------------------------------------
	--ACTUALIZA DATA A LA TABLA USUARIO (UPDATE)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'UPDATE_WEB'
	BEGIN
	    IF @RolId = '1'
		BEGIN
			UPDATE [Seguridad].[Usuario]
			   SET [Nombres] = @Nombres
				  ,[Apellidos] = @Apellidos
				  ,[Documento] = @Documento
				  ,[RolId] = @RolId
				  ,[Correo] = @Correo
				  ,[Gestionable] = @Gestionable
			 WHERE Id = @Id
		END
		ELSE
		BEGIN
		    UPDATE [Proceso].[UsuarioCampana]
			   SET [ValueRolId] = @RolId
			   WHERE CampanaId = @CambioPassword
			    AND UsuarioId = @Id

			UPDATE [Seguridad].[Usuario]
				   SET [Nombres] = @Nombres
					  ,[Apellidos] = @Apellidos
					  ,[Documento] = @Documento
					  ,[RolId] = 0
					  ,[Correo] = @Correo
					  ,[Gestionable] = @Gestionable
				 WHERE Id = @Id
		END
   	    SELECT @Id
	END
	 ---------------------------------------------------------------------------------------------------------------------
	--DESACTIVAR O ACTIVAR USUARIO EN LA TABLA USUARIO (DELETE)
	---------------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'INACTIVE_ACTIVE'
	BEGIN
	    
		IF @Documento = 0
		BEGIN
		   SET @Estado = 1
		END
		ELSE
		BEGIN
		   SET @Estado = 0
		END	
		
		UPDATE [Seguridad].[Usuario]
		   SET [Estado] = @Estado
		 WHERE Id = @Id
		 SELECT @Estado
	END	
	-----------------------------------------------------------------------------------------------------------------
	--TRAE LA DATA CORRESPONDIENTE AL USUARIO DIGITADA 
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ_COLABORADOR'
	BEGIN
	   DECLARE @Estatus INT = 0; 
  	   
	   DECLARE @ExisteUser INT =(SELECT COUNT(1) AS CANTIDAD FROM [Seguridad].[Usuario]
									WHERE Documento = @Documento)

	   DECLARE @Pass_Ok INT =(SELECT COUNT(1) AS CANTIDAD FROM [Seguridad].[Usuario]
									WHERE Documento = @Documento
									AND Password = @Password)
       DECLARE @Active INT =(SELECT Estado FROM [Seguridad].[Usuario]
									WHERE Documento = @Documento)
	
	   SET @Id = (SELECT id FROM [Seguridad].[Usuario]
					WHERE Documento = @Documento)
	   
	   DECLARE @Num_Campana INT =(SELECT COUNT(1) AS CANTIDAD FROM [Proceso].[UsuarioCampana]
									WHERE UsuarioId = @Id)
	   IF @ExisteUser = 0
	   BEGIN 
			SET @Estatus = 1
	   END
	   ELSE IF @Pass_Ok = 0
	   BEGIN
			SET @Estatus = 2
	   END
       ELSE IF @Active <> 1
	   BEGIN
			SET @Estatus = 3
	   END
       ELSE IF @Num_Campana = 0
	   BEGIN
			SET @Estatus = 4
	   END

	   SELECT @Estatus
	END
	-----------------------------------------------------------------------------------------------------------------
	--VALIDA EL USUARIO SI EXISTE EN EL SISTEMA
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'EXISTE_COLABORADOR'
	BEGIN
		SELECT COUNT(1) AS CANTIDAD FROM [Seguridad].[Usuario]
									WHERE Documento = @Documento
	END
	-----------------------------------------------------------------------------------------------------------------
	--VALIDA EL USUARIO SI EXISTE EN EL SISTEMA
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'USER_EXISTE'
	BEGIN
		SELECT Id FROM [Seguridad].[Usuario]
		    WHERE Documento = @Documento
	END
	-----------------------------------------------------------------------------------------------------------------
	--ACTUALIZA EL PASSWORD ENVIADO DESDE EL LDAP
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'ACTIVAR_CHANGEPASS'
	BEGIN
		UPDATE [Seguridad].[Usuario]
			SET [CambioPassword] =1 
        WHERE Documento = @Documento
		SELECT 1
	END
	-----------------------------------------------------------------------------------------------------------------
	--ACTUALIZA EL PASSWORD ENVIADO DESDE EL LDAP
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'UPDATE_PASS'
	BEGIN
		UPDATE [Seguridad].[Usuario]
			SET [Password] = @Password,
			    [CambioPassword] = 0,
				[FechaPassword] =GETDATE()
        WHERE Documento = @Documento
		SELECT 1
	END
	-----------------------------------------------------------------------------------------------------------------
	--ASIGNA EL COLOR PARA VALIDACIONES
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'ASIGN_COLOR'
	BEGIN
		UPDATE [Seguridad].[Usuario]
			SET ColorId = @Id
        WHERE Documento = @Documento
		SELECT @Id
	END
	-----------------------------------------------------------------------------------------------------------------
	--VALIDA EL COLOR PRESENTADO
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'VALIDA_COLOR'
	BEGIN
        DECLARE @ColorId BIGINT =(SELECT ColorId  FROM [Seguridad].[Usuario]  WHERE Documento = @Documento)

		IF @ColorId = @Id
		BEGIN
		    SELECT 1
		END
		ELSE
		BEGIN
			SELECT 0
		END
	END
	
	-----------------------------------------------------------------------------------------------------------------
	--ACTUALIZA LA GESTION PARA QUITAR EL AUTOGESTIONABLE
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'BLOQUEO_GESTION'
	BEGIN
		UPDATE [Seguridad].[Usuario]
			SET Gestionable = 0
        WHERE Documento = @Documento
		SELECT 1
	END
	
	-----------------------------------------------------------------------------------------------------------------
	--TRAE NOMBRE Y APELLIDO AL USUARIO DIGITADO 
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ_NAME_COLABORADOR'
	BEGIN
		SELECT Nombres,
		       Apellidos,
			   Correo
		FROM [Seguridad].[Usuario]
		WHERE Documento = @Documento
	END
	-----------------------------------------------------------------------------------------------------------------
	--TRAE NOMBRE Y APELLIDO AL USUARIO DIGITADO 
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ_NAME_COLABORADOR_ID'
	BEGIN
		SELECT Nombres,
		       Apellidos,
			   Correo,
			   R.Nombre AS Perfil
		FROM [Seguridad].[Usuario] U
		INNER JOIN [Proceso].[UsuarioCampana] UC ON UC.UsuarioId = U.Id
		INNER JOIN [Seguridad].[Rol] R ON UC.ValueRolId = R.ValueRolId AND R.CampanaId = @Documento
		WHERE U.Id = @Id
		  AND R.CampanaId = @Documento
	END
	-----------------------------------------------------------------------------------------------------------------
	--TRAE NOMBRE Y APELLIDO AL USUARIO DIGITADO 
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ_PERSONAL_CAMPANA'
	BEGIN
		SELECT U.Id,
		       Nombres + ' ' + Apellidos  AS Nombre,
			   R.ValueRolId AS RolId,
		       R.Nombre AS Perfil 
	 		FROM [Seguridad].[Usuario] U
			INNER JOIN [Proceso].[UsuarioCampana] UC ON UC.UsuarioId = U.Id 
			INNER JOIN [Seguridad].[Rol] R ON UC.ValueRolId = R.ValueRolId AND R.CampanaId = @Id
			WHERE UC.ValueRolId in(2,3,4,6)
			AND UC.CampanaId = @Id
	END
	-----------------------------------------------------------------------------------------------------------------
	-----------------------------------------------------------------------------------------------------------------
	--aplicacion WEB
	-----------------------------------------------------------------------------------------------------------------
	--TRAE LA DATA CORRESPONDIENTE AL USUARIO DIGITADA 
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ_USER'
	BEGIN
  		SELECT [Password]
			  ,[Estado]
		      ,[RolId]
			  ,[CambioPassword]
		FROM [Seguridad].[Usuario]
	    WHERE Documento = @Documento
	END
	-----------------------------------------------------------------------------------------------------------------
	--TRAE NOMBRE Y APELLIDO AL USUARIO DIGITADO 
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ_USER_ID'
	BEGIN
		SELECT Nombres + ' ' + Apellidos AS Nombre,
			  [Documento],
			  UC.ValueRolId AS RolId
		FROM [Seguridad].[Usuario] U
		INNER JOIN [Proceso].[UsuarioCampana] UC ON UC.UsuarioId = U.Id
		WHERE U.Id = @Id
	END
	-----------------------------------------------------------------------------------------------------------------
	--TRAE LA DATA CORRESPONDIENTE AL USUARIO DIGITADA 
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ_USERS_CAMPANA'
	BEGIN
  		SELECT U.[Id]
			  ,[Documento]
			  ,[Nombres]
			  ,[Apellidos]
			  ,U.[Estado]
			  ,ValueRolId
			  ,[Gestionable]
			  ,Correo
			  ,R.Nombre AS Perfil
		 FROM [Seguridad].[Usuario] U
		  INNER JOIN [Proceso].[UsuarioCampana] UA (NOLOCK) ON  UA.UsuarioId= U.Id
		  INNER JOIN [Configuracion].[Dato] R ON R.Id = UA.ValueRolId  
	      WHERE  UA.CampanaId = @Id
	END
	-----------------------------------------------------------------------------------------------------------------
	--TRAE LA DATA TODO LOS USUARIOS DEL UNUIVERSO DEL NEGOCIO
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ_USERS_ALL'
	BEGIN
  		SELECT U.[Id]
			  ,[Documento] + ' - ' +  [Nombres] + ' ' + [Apellidos] AS Nombre
		  FROM [Seguridad].[Usuario] U
		  WHERE Estado = 1
		  ORDER BY [Nombres],[Apellidos] ASC
	END
	-----------------------------------------------------------------------------------------------------------------
	--TRAE LA DATA TODO LOS USUARIOS DEL UNUIVERSO DEL NEGOCIO
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion ='EXIST_SUPERM'
	BEGIN
		SELECT COUNT(1) AS Cant
		 FROM [Seguridad].[Usuario] U
		  INNER JOIN [Proceso].[UsuarioCampana] UA (NOLOCK) ON  UA.UsuarioId= U.Id
		 WHERE  UA.CampanaId =  @Id
		 AND UA.ValueRolId = 2
	END
	-----------------------------------------------------------------------------------------------------------------
	--TRAE LA DATA TODO LOS USUARIOS DEL UNUIVERSO DEL NEGOCIO
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ_USERS_CUENTA'
	BEGIN
  		SELECT U.[Id]
			  ,[Nombres] + ' ' + [Apellidos] AS Nombre
		  FROM [Seguridad].[Usuario] U
		  INNER JOIN [Proceso].[UsuarioCampana] UA (NOLOCK) ON UA.[UsuarioId] = U.Id
		  WHERE U.Estado = 1 AND [CampanaId]= @Id
		  ORDER BY [Nombres],[Apellidos] ASC
	END
	-----------------------------------------------------------------------------------------------------------------
	--TRAE LA DATA TODO LOS USUARIOS DEL UNUIVERSO DEL NEGOCIO
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ_USER_PERFIL'
	BEGIN
  		SELECT U.[Id]
			  ,[Nombres] + ' ' + [Apellidos] AS Nombre
		  FROM [Seguridad].[Usuario] U
		  INNER JOIN [Proceso].[UsuarioCampana] UA (NOLOCK) ON UA.[UsuarioId] = U.Id
		  WHERE U.Estado = 1 
		    AND [CampanaId] = @Id
			AND UA.ValueRolId = @Documento
		  ORDER BY [Nombres],[Apellidos] ASC
	END
	-----------------------------------------------------------------------------------------------------------------
	--TRAE LA DATA TODOS LOS USUARIOS DE LA CAMPAÑA PARA ESCALAR
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ_USER_ESCALADORES'
	BEGIN
  		SELECT U.Id,
		   Nombres + ' ' + Apellidos + '   [' + R.Nombre +']' AS Nombre
	 		FROM [Seguridad].[Usuario] U
			INNER JOIN [Proceso].[UsuarioCampana] UC ON UC.UsuarioId = U.Id 
			INNER JOIN [Seguridad].[Rol] R ON UC.ValueRolId = R.ValueRolId AND R.CampanaId = @Id
			WHERE UC.ValueRolId in(1,2,6)
			AND R.CampanaId = @Id
	END
	-----------------------------------------------------------------------------------------------------------------
	--TRAE NOMBRE Y APELLIDO DE LOS USUARIOS DE LA CAMPAÑA SELECCIONADA 
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'READ_USERS_CAMPANA_WEB'
	BEGIN
		SELECT U.Id,
		       Nombres + ' ' + Apellidos AS Nombre,
			   r.Nombre AS Rol
		FROM [Seguridad].[Usuario] U
		INNER JOIN [Proceso].[UsuarioCampana] UC ON UC.UsuarioId = U.Id 
		INNER JOIN [Seguridad].[Rol] R ON R.Id = u.RolId
		WHERE R.CampanaId = @Id
	END
    -----------------------------------------------------------------------------------------------------------------
	--RETORNAR ID DE USUARIO PARA CARGUE
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'RETURN_ID'
	BEGIN
		SELECT Id FROM [Seguridad].[Usuario]
		WHERE Documento = @Documento
	END
	-----------------------------------------------------------------------------------------------------------------
	--RETORNAR SI EL USUARIO TIENE PERMISO DE CAMBIO DE CONTRASEÑA
	-----------------------------------------------------------------------------------------------------------------
	IF @Opcion = 'RETURN_GESTIONABLE'
	BEGIN
		SELECT [Gestionable] FROM [Seguridad].[Usuario]
		WHERE Documento = @Documento
	END
	
END

----------------------------------------------------------------------------------------------------
--PRUEBAS
----------------------------------------------------------------------------------------------------
/*

    SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_USUARIO] 'INSERT','0','TFQUINTERO','3609510b5e784ebf9a38cb5d56a1813dc14ae84db362326d95dd137828807a4e','TATIANA FERNANDA','QUINTERO','1','4'
    SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_USUARIO] 'READ_USERS_CUENTA','1'
    SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_USUARIO] 'READ_USER','0','79884249'
	SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_USUARIO] 'RETURN_GESTIONABLE','0','1016002778'

	SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_USUARIO] 'READ_USERS_CAMPANA','4'
	SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_USUARIO] 'READ_USER_PERFIL','1','1'
	SET DATEFORMAT ymd EXEC [Seguridad].[SP_CRUD_USUARIO] 'READ_USER_ESCALADORES','1'
*/









GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla encargada de almacenar la los errores presentados en el aplicativo con toda la informaciónnecesaria para recrearlos.' , @level0type=N'SCHEMA',@level0name=N'Seguridad', @level1type=N'TABLE',@level1name=N'LogError'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla encargada de almacenar las páginas del sistema o el menú' , @level0type=N'SCHEMA',@level0name=N'Seguridad', @level1type=N'TABLE',@level1name=N'Pagina'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla encargada de almacenar los permisos de acceso a una página por parte de un rol en particular.' , @level0type=N'SCHEMA',@level0name=N'Seguridad', @level1type=N'TABLE',@level1name=N'PermisoPagina'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla encargada de almacenar los roles del sistema' , @level0type=N'SCHEMA',@level0name=N'Seguridad', @level1type=N'TABLE',@level1name=N'Rol'
GO
