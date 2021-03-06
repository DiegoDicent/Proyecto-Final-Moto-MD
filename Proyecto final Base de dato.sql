USE [master]
GO
/****** Object:  Database [MotosMD]    Script Date: 8/13/2021 5:50:44 PM ******/
CREATE DATABASE [MotosMD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MotosPedrito', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MotosPedrito.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MotosPedrito_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MotosPedrito_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MotosMD] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MotosMD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MotosMD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MotosMD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MotosMD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MotosMD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MotosMD] SET ARITHABORT OFF 
GO
ALTER DATABASE [MotosMD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MotosMD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MotosMD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MotosMD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MotosMD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MotosMD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MotosMD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MotosMD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MotosMD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MotosMD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MotosMD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MotosMD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MotosMD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MotosMD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MotosMD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MotosMD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MotosMD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MotosMD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MotosMD] SET  MULTI_USER 
GO
ALTER DATABASE [MotosMD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MotosMD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MotosMD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MotosMD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MotosMD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MotosMD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MotosMD] SET QUERY_STORE = OFF
GO
USE [MotosMD]
GO
/****** Object:  User [GLOBAL\dicentd]    Script Date: 8/13/2021 5:50:44 PM ******/
CREATE USER [GLOBAL\dicentd] FOR LOGIN [GLOBAL\dicentd] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 8/13/2021 5:50:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[ID] [int] NOT NULL,
	[Empresa] [varchar](50) NULL,
	[RNC] [varchar](50) NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Cedula] [varchar](50) NULL,
	[Celular] [varchar](50) NULL,
	[Direccion] [varchar](100) NULL,
	[Correo] [varchar](50) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Condicion]    Script Date: 8/13/2021 5:50:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Condicion](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_Condicion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cotizacion]    Script Date: 8/13/2021 5:50:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cotizacion](
	[iD] [int] NOT NULL,
	[FechaInicio] [datetime] NULL,
	[FechaEdicion] [datetime] NULL,
	[FechaCotizacion] [datetime] NULL,
	[UsuarioId] [int] NULL,
	[ContactoId] [int] NULL,
	[EsOrden] [bit] NULL,
	[FacturaId] [int] NULL,
	[FacturaVencimiento] [datetime] NULL,
	[VendedorId] [int] NULL,
	[SubTotalLineas] [decimal](18, 0) NULL,
	[SubTotalTax] [decimal](18, 0) NULL,
	[Total] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Cotizacion] PRIMARY KEY CLUSTERED 
(
	[iD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleCotizacion]    Script Date: 8/13/2021 5:50:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleCotizacion](
	[Id] [int] NOT NULL,
	[CotizacionId] [int] NULL,
	[ProductoId] [int] NULL,
	[Cantidad] [int] NULL,
	[Precio] [decimal](18, 0) NULL,
	[Impuesto] [decimal](18, 0) NULL,
	[ImpuestoText] [varchar](50) NULL,
	[SubTotal] [decimal](18, 0) NULL,
 CONSTRAINT [PK_DetalleCotizacion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleFactura]    Script Date: 8/13/2021 5:50:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleFactura](
	[Id] [int] NOT NULL,
	[FacturaId] [int] NULL,
	[ProductoId] [int] NULL,
	[Cantidad] [int] NULL,
	[Precio] [decimal](18, 0) NULL,
	[Impuesto] [int] NULL,
	[ImpuestoText] [varchar](50) NULL,
	[Subtotal] [decimal](18, 0) NULL,
 CONSTRAINT [PK_DetalleFactura] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 8/13/2021 5:50:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[ID] [int] NOT NULL,
	[FechaInicio] [datetime] NULL,
	[FechaEdicion] [datetime] NULL,
	[FechaFactura] [datetime] NULL,
	[UsuarioId] [int] NULL,
	[ContactoId] [int] NULL,
	[OrdenId] [int] NULL,
	[FechaVencimiento] [datetime] NULL,
	[IdentificadorFactura] [int] NULL,
	[NCF] [varchar](50) NULL,
	[SubTotalLineas] [decimal](18, 0) NULL,
	[SubTotalTax] [decimal](18, 0) NULL,
	[Total] [decimal](18, 0) NULL,
	[Credito] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Impuesto]    Script Date: 8/13/2021 5:50:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Impuesto](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Monto] [decimal](18, 0) NULL,
	[LabelFactura] [varchar](50) NULL,
	[IncluirEnPrecio] [bit] NULL,
	[ImpuestoTipoId] [int] NULL,
 CONSTRAINT [PK_Impuesto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marca]    Script Date: 8/13/2021 5:50:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marca](
	[Id] [int] NOT NULL,
	[Marca] [varchar](50) NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_Marca] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modelo]    Script Date: 8/13/2021 5:50:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modelo](
	[Id] [int] NOT NULL,
	[Modelo] [varchar](50) NULL,
	[IdMarca] [int] NULL,
	[Version] [varchar](50) NULL,
 CONSTRAINT [PK_Modelo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pagos]    Script Date: 8/13/2021 5:50:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pagos](
	[FechaInicio] [datetime] NOT NULL,
	[FechaEdicion] [datetime] NULL,
	[FechaPago] [datetime] NULL,
	[UsuarioId] [int] NULL,
	[ContactoId] [int] NULL,
	[FacturaId] [int] NULL,
	[IdentificadorRecibo] [int] NULL,
	[SubTotalLineas] [decimal](18, 0) NULL,
	[Total] [decimal](18, 0) NULL,
	[NumeroDePago] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Pagos] PRIMARY KEY CLUSTERED 
(
	[FechaInicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 8/13/2021 5:50:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[Id] [int] NULL,
	[Empresa] [varchar](50) NULL,
	[RNC] [varchar](50) NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Cedula] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
	[Correo] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoImpuestos]    Script Date: 8/13/2021 5:50:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoImpuestos](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_TipoImpuestos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoPagos]    Script Date: 8/13/2021 5:50:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoPagos](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_TipoPagos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 8/13/2021 5:50:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Usuario] [varchar](50) NULL,
	[Contrasena] [varchar](50) NULL,
	[Correo] [varchar](50) NULL,
	[Activo] [varchar](50) NULL,
	[Pais] [varchar](50) NULL,
	[Ciudad] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
	[Celular] [varchar](50) NULL,
	[Cedula] [varchar](50) NULL,
	[EsVendedor] [bit] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehiculo]    Script Date: 8/13/2021 5:50:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehiculo](
	[Id] [int] NOT NULL,
	[MarcaId] [int] NULL,
	[Modelo] [int] NULL,
	[Ano] [int] NULL,
	[Precio] [int] NULL,
	[Ubicacion] [varchar](50) NULL,
	[Tipo] [varchar](50) NULL,
	[Financiable] [bit] NULL,
	[Condicion] [int] NULL,
	[Color] [int] NULL,
 CONSTRAINT [PK_Vehiculo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cotizacion]  WITH CHECK ADD  CONSTRAINT [FK_Cotizacion_Factura] FOREIGN KEY([FacturaId])
REFERENCES [dbo].[Factura] ([ID])
GO
ALTER TABLE [dbo].[Cotizacion] CHECK CONSTRAINT [FK_Cotizacion_Factura]
GO
ALTER TABLE [dbo].[DetalleCotizacion]  WITH CHECK ADD  CONSTRAINT [FK_DetalleCotizacion_Cotizacion] FOREIGN KEY([CotizacionId])
REFERENCES [dbo].[Cotizacion] ([iD])
GO
ALTER TABLE [dbo].[DetalleCotizacion] CHECK CONSTRAINT [FK_DetalleCotizacion_Cotizacion]
GO
ALTER TABLE [dbo].[DetalleFactura]  WITH CHECK ADD  CONSTRAINT [FK_DetalleFactura_Factura] FOREIGN KEY([FacturaId])
REFERENCES [dbo].[Factura] ([ID])
GO
ALTER TABLE [dbo].[DetalleFactura] CHECK CONSTRAINT [FK_DetalleFactura_Factura]
GO
ALTER TABLE [dbo].[DetalleFactura]  WITH CHECK ADD  CONSTRAINT [FK_DetalleFactura_Impuesto] FOREIGN KEY([Impuesto])
REFERENCES [dbo].[Impuesto] ([Id])
GO
ALTER TABLE [dbo].[DetalleFactura] CHECK CONSTRAINT [FK_DetalleFactura_Impuesto]
GO
ALTER TABLE [dbo].[DetalleFactura]  WITH CHECK ADD  CONSTRAINT [FK_DetalleFactura_Vehiculo] FOREIGN KEY([ProductoId])
REFERENCES [dbo].[Vehiculo] ([Id])
GO
ALTER TABLE [dbo].[DetalleFactura] CHECK CONSTRAINT [FK_DetalleFactura_Vehiculo]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Cliente] FOREIGN KEY([ContactoId])
REFERENCES [dbo].[Cliente] ([ID])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Cliente]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Usuario] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuario] ([ID])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Usuario]
GO
ALTER TABLE [dbo].[Impuesto]  WITH CHECK ADD  CONSTRAINT [FK_Impuesto_TipoImpuestos] FOREIGN KEY([ImpuestoTipoId])
REFERENCES [dbo].[TipoImpuestos] ([Id])
GO
ALTER TABLE [dbo].[Impuesto] CHECK CONSTRAINT [FK_Impuesto_TipoImpuestos]
GO
ALTER TABLE [dbo].[Modelo]  WITH CHECK ADD  CONSTRAINT [FK_Modelo_Marca] FOREIGN KEY([IdMarca])
REFERENCES [dbo].[Marca] ([Id])
GO
ALTER TABLE [dbo].[Modelo] CHECK CONSTRAINT [FK_Modelo_Marca]
GO
ALTER TABLE [dbo].[Pagos]  WITH CHECK ADD  CONSTRAINT [FK_Pagos_Factura] FOREIGN KEY([FacturaId])
REFERENCES [dbo].[Factura] ([ID])
GO
ALTER TABLE [dbo].[Pagos] CHECK CONSTRAINT [FK_Pagos_Factura]
GO
ALTER TABLE [dbo].[Pagos]  WITH CHECK ADD  CONSTRAINT [FK_Pagos_Usuario] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuario] ([ID])
GO
ALTER TABLE [dbo].[Pagos] CHECK CONSTRAINT [FK_Pagos_Usuario]
GO
ALTER TABLE [dbo].[Vehiculo]  WITH CHECK ADD  CONSTRAINT [FK_Vehiculo_Condicion] FOREIGN KEY([Condicion])
REFERENCES [dbo].[Condicion] ([Id])
GO
ALTER TABLE [dbo].[Vehiculo] CHECK CONSTRAINT [FK_Vehiculo_Condicion]
GO
ALTER TABLE [dbo].[Vehiculo]  WITH CHECK ADD  CONSTRAINT [FK_Vehiculo_Marca] FOREIGN KEY([MarcaId])
REFERENCES [dbo].[Marca] ([Id])
GO
ALTER TABLE [dbo].[Vehiculo] CHECK CONSTRAINT [FK_Vehiculo_Marca]
GO
ALTER TABLE [dbo].[Vehiculo]  WITH CHECK ADD  CONSTRAINT [FK_Vehiculo_Modelo] FOREIGN KEY([Modelo])
REFERENCES [dbo].[Modelo] ([Id])
GO
ALTER TABLE [dbo].[Vehiculo] CHECK CONSTRAINT [FK_Vehiculo_Modelo]
GO
USE [master]
GO
ALTER DATABASE [MotosMD] SET  READ_WRITE 
GO
