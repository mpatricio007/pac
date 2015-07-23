
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 04/27/2011 12:57:26
-- Generated from EDMX file: C:\svn\Medusa_atual\DAL\Medusa.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
use master;
drop database Medusa;

USE [Medusa];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_BolsaVigencias_Bolsas]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BolsaVigencia] DROP CONSTRAINT [FK_BolsaVigencias_Bolsas];
GO
IF OBJECT_ID(N'[dbo].[FK_PAC_CotacaoPAC]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PAC_Cotacao] DROP CONSTRAINT [FK_PAC_CotacaoPAC];
GO
IF OBJECT_ID(N'[dbo].[FK_PAC_PACStatusPAC]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PAC_PACStatus] DROP CONSTRAINT [FK_PAC_PACStatusPAC];
GO
IF OBJECT_ID(N'[dbo].[FK_PACBem_inherits_PACItem]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PACItem_PACBem] DROP CONSTRAINT [FK_PACBem_inherits_PACItem];
GO
IF OBJECT_ID(N'[dbo].[FK_PACLocacao_inherits_PACItem]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PACItem_PACLocacao] DROP CONSTRAINT [FK_PACLocacao_inherits_PACItem];
GO
IF OBJECT_ID(N'[dbo].[FK_PACLocacaoBem_inherits_PACLocacao]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PACItem_PACLocacaoBem] DROP CONSTRAINT [FK_PACLocacaoBem_inherits_PACLocacao];
GO
IF OBJECT_ID(N'[dbo].[FK_PACLocacaoVeiculo_inherits_PACLocacao]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PACItem_PACLocacaoVeiculo] DROP CONSTRAINT [FK_PACLocacaoVeiculo_inherits_PACLocacao];
GO
IF OBJECT_ID(N'[dbo].[FK_PACModalidadeCompraPAC]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PAC] DROP CONSTRAINT [FK_PACModalidadeCompraPAC];
GO
IF OBJECT_ID(N'[dbo].[FK_PACPACItem]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PACItem] DROP CONSTRAINT [FK_PACPACItem];
GO
IF OBJECT_ID(N'[dbo].[FK_PACPassagem_inherits_PACItem]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PACItem_PACPassagem] DROP CONSTRAINT [FK_PACPassagem_inherits_PACItem];
GO
IF OBJECT_ID(N'[dbo].[FK_PACPassagemPACPassageiro]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PACPassageiro] DROP CONSTRAINT [FK_PACPassagemPACPassageiro];
GO
IF OBJECT_ID(N'[dbo].[FK_PACProjeto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PAC] DROP CONSTRAINT [FK_PACProjeto];
GO
IF OBJECT_ID(N'[dbo].[FK_PACServicosPJ_inherits_PACItem]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PACItem_PACServicosPJ] DROP CONSTRAINT [FK_PACServicosPJ_inherits_PACItem];
GO
IF OBJECT_ID(N'[dbo].[FK_PACTipo_AquisicaoPAC]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PAC] DROP CONSTRAINT [FK_PACTipo_AquisicaoPAC];
GO
IF OBJECT_ID(N'[dbo].[FK_PACVeiculos_CondutoresPACLocacaoVeiculo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PACVeiculos_Condutores] DROP CONSTRAINT [FK_PACVeiculos_CondutoresPACLocacaoVeiculo];
GO
IF OBJECT_ID(N'[dbo].[FK_TbCoord_TbDepartamento]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Coordenador] DROP CONSTRAINT [FK_TbCoord_TbDepartamento];
GO
IF OBJECT_ID(N'[dbo].[FK_TbCoord_TbLaboratorio]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Coordenador] DROP CONSTRAINT [FK_TbCoord_TbLaboratorio];
GO
IF OBJECT_ID(N'[dbo].[FK_TbCoord_TbUnidade]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Coordenador] DROP CONSTRAINT [FK_TbCoord_TbUnidade];
GO
IF OBJECT_ID(N'[dbo].[FK_TbCoordProj_TbCoord]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TbCoordProjs] DROP CONSTRAINT [FK_TbCoordProj_TbCoord];
GO
IF OBJECT_ID(N'[dbo].[FK_TbCoordProj_TbProjeto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TbCoordProjs] DROP CONSTRAINT [FK_TbCoordProj_TbProjeto];
GO
IF OBJECT_ID(N'[dbo].[FK_TbDepartamento_TbUnidade]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TbDepartamentoes] DROP CONSTRAINT [FK_TbDepartamento_TbUnidade];
GO
IF OBJECT_ID(N'[dbo].[FK_TbFinProjeto_TbFinanciador]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TbFinProjetoes] DROP CONSTRAINT [FK_TbFinProjeto_TbFinanciador];
GO
IF OBJECT_ID(N'[dbo].[FK_TbFinProjeto_TbProjeto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TbFinProjetoes] DROP CONSTRAINT [FK_TbFinProjeto_TbProjeto];
GO
IF OBJECT_ID(N'[dbo].[FK_TbGrupoInterface_Grupo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TbGrupoInterface] DROP CONSTRAINT [FK_TbGrupoInterface_Grupo];
GO
IF OBJECT_ID(N'[dbo].[FK_TbGrupoInterface_Interface]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TbGrupoInterface] DROP CONSTRAINT [FK_TbGrupoInterface_Interface];
GO
IF OBJECT_ID(N'[dbo].[FK_TbGrupoUsuario_TbGrupo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TbGrupoUsuario] DROP CONSTRAINT [FK_TbGrupoUsuario_TbGrupo];
GO
IF OBJECT_ID(N'[dbo].[FK_TbGrupoUsuario_TbUsuario]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TbGrupoUsuario] DROP CONSTRAINT [FK_TbGrupoUsuario_TbUsuario];
GO
IF OBJECT_ID(N'[dbo].[FK_TbInterface_TbMenu]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Interface] DROP CONSTRAINT [FK_TbInterface_TbMenu];
GO
IF OBJECT_ID(N'[dbo].[FK_TbLaboratorio_TbDepartamento]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Laboratorio] DROP CONSTRAINT [FK_TbLaboratorio_TbDepartamento];
GO
IF OBJECT_ID(N'[dbo].[FK_TbMaquinaEstados_TbPACStatus_final]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MaquinaEstados] DROP CONSTRAINT [FK_TbMaquinaEstados_TbPACStatus_final];
GO
IF OBJECT_ID(N'[dbo].[FK_TbMaquinaEstados_TbPACStatus_inicial]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MaquinaEstados] DROP CONSTRAINT [FK_TbMaquinaEstados_TbPACStatus_inicial];
GO
IF OBJECT_ID(N'[dbo].[FK_TbPAC_PACStatus_TbPACStatus]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PAC_PACStatus] DROP CONSTRAINT [FK_TbPAC_PACStatus_TbPACStatus];
GO
IF OBJECT_ID(N'[dbo].[FK_TbProjeto_TbDepartamento]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Projeto] DROP CONSTRAINT [FK_TbProjeto_TbDepartamento];
GO
IF OBJECT_ID(N'[dbo].[FK_TbProjeto_TbLaboratorio]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Projeto] DROP CONSTRAINT [FK_TbProjeto_TbLaboratorio];
GO
IF OBJECT_ID(N'[dbo].[FK_TbProjeto_TbMoeda]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Projeto] DROP CONSTRAINT [FK_TbProjeto_TbMoeda];
GO
IF OBJECT_ID(N'[dbo].[FK_TbProjeto_TbUnidade]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Projeto] DROP CONSTRAINT [FK_TbProjeto_TbUnidade];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Banco]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Banco];
GO
IF OBJECT_ID(N'[dbo].[Bolsa]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Bolsa];
GO
IF OBJECT_ID(N'[dbo].[BolsaVigencia]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BolsaVigencia];
GO
IF OBJECT_ID(N'[dbo].[Cep]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Cep];
GO
IF OBJECT_ID(N'[dbo].[Coordenador]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Coordenador];
GO
IF OBJECT_ID(N'[dbo].[Grupo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Grupo];
GO
IF OBJECT_ID(N'[dbo].[Interface]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Interface];
GO
IF OBJECT_ID(N'[dbo].[Laboratorio]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Laboratorio];
GO
IF OBJECT_ID(N'[dbo].[MaquinaEstados]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MaquinaEstados];
GO
IF OBJECT_ID(N'[dbo].[Menu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Menu];
GO
IF OBJECT_ID(N'[dbo].[Moeda]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Moeda];
GO
IF OBJECT_ID(N'[dbo].[PAC]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PAC];
GO
IF OBJECT_ID(N'[dbo].[PAC_Cotacao]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PAC_Cotacao];
GO
IF OBJECT_ID(N'[dbo].[PAC_PACStatus]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PAC_PACStatus];
GO
IF OBJECT_ID(N'[dbo].[PACItem]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PACItem];
GO
IF OBJECT_ID(N'[dbo].[PACItem_PACBem]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PACItem_PACBem];
GO
IF OBJECT_ID(N'[dbo].[PACItem_PACLocacao]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PACItem_PACLocacao];
GO
IF OBJECT_ID(N'[dbo].[PACItem_PACLocacaoBem]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PACItem_PACLocacaoBem];
GO
IF OBJECT_ID(N'[dbo].[PACItem_PACLocacaoVeiculo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PACItem_PACLocacaoVeiculo];
GO
IF OBJECT_ID(N'[dbo].[PACItem_PACPassagem]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PACItem_PACPassagem];
GO
IF OBJECT_ID(N'[dbo].[PACItem_PACServicosPJ]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PACItem_PACServicosPJ];
GO
IF OBJECT_ID(N'[dbo].[PACModalidadeCompra]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PACModalidadeCompra];
GO
IF OBJECT_ID(N'[dbo].[PACPassageiro]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PACPassageiro];
GO
IF OBJECT_ID(N'[dbo].[PACStatus]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PACStatus];
GO
IF OBJECT_ID(N'[dbo].[PACTipo_Aquisicao]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PACTipo_Aquisicao];
GO
IF OBJECT_ID(N'[dbo].[PACVeiculos_Condutores]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PACVeiculos_Condutores];
GO
IF OBJECT_ID(N'[dbo].[Projeto]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Projeto];
GO
IF OBJECT_ID(N'[dbo].[TbCoordProjs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TbCoordProjs];
GO
IF OBJECT_ID(N'[dbo].[TbDepartamentoes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TbDepartamentoes];
GO
IF OBJECT_ID(N'[dbo].[TbFinanciadors]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TbFinanciadors];
GO
IF OBJECT_ID(N'[dbo].[TbFinProjetoes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TbFinProjetoes];
GO
IF OBJECT_ID(N'[dbo].[TbGrupoInterface]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TbGrupoInterface];
GO
IF OBJECT_ID(N'[dbo].[TbGrupoUsuario]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TbGrupoUsuario];
GO
IF OBJECT_ID(N'[dbo].[Unidade]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Unidade];
GO
IF OBJECT_ID(N'[dbo].[Usuario]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Usuario];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Bolsa'
CREATE TABLE [dbo].[Bolsa] (
    [Id] int  NOT NULL,
    [Nome] varchar(50)  NOT NULL,
    [Status] bit  NOT NULL
);
GO

-- Creating table 'BolsaVigencia'
CREATE TABLE [dbo].[BolsaVigencia] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Id_bolsa] int  NOT NULL,
    [inicio] datetime  NOT NULL,
    [termino] datetime  NOT NULL,
    [status] bit  NOT NULL
);
GO

-- Creating table 'Cep'
CREATE TABLE [dbo].[Cep] (
    [id_cep] int IDENTITY(1,1) NOT NULL,
    [uf] nvarchar(50)  NULL,
    [cidade] nvarchar(50)  NULL,
    [logradouro] nvarchar(70)  NULL,
    [bairro] nvarchar(72)  NULL,
    [BAI_FIM] nvarchar(72)  NULL,
    [cep1] nvarchar(9)  NULL,
    [complemento] nvarchar(100)  NULL,
    [tipoLOGRADOURO] nvarchar(20)  NULL,
    [pais] nvarchar(50)  NULL
);
GO

-- Creating table 'Coordenador'
CREATE TABLE [dbo].[Coordenador] (
    [Id_Coord] int IDENTITY(1,1) NOT NULL,
    [Cpf_Coord] varchar(14)  NULL,
    [RG_Coord] varchar(15)  NULL,
    [Nome_Coord] varchar(150)  NULL,
    [Sexo_Coord] char(1)  NULL,
    [DtNascto_Coord] datetime  NULL,
    [Classe_Coord] varchar(50)  NULL,
    [Id_Departamento] int  NULL,
    [Id_Unidade] int  NULL,
    [Id_Laboratorio] int  NULL,
    [logradouro] varchar(50)  NULL,
    [numero] varchar(10)  NULL,
    [complemento] varchar(30)  NULL,
    [bairro] varchar(30)  NULL,
    [cidade] varchar(50)  NULL,
    [uf] char(2)  NULL,
    [cep] char(9)  NULL,
    [pais] varchar(30)  NULL
);
GO

-- Creating table 'TbCoordProjs'
CREATE TABLE [dbo].[TbCoordProjs] (
    [Id_Coordenacao] int IDENTITY(1,1) NOT NULL,
    [Tipo] varchar(50)  NULL,
    [DtInicio] datetime  NULL,
    [DtTermino] datetime  NULL,
    [Obs] varchar(max)  NULL,
    [Id_coordenador] int  NULL,
    [Id_Projeto] int  NULL
);
GO

-- Creating table 'TbDepartamentoes'
CREATE TABLE [dbo].[TbDepartamentoes] (
    [id_departamento] int IDENTITY(1,1) NOT NULL,
    [id_unidade] int  NOT NULL,
    [sigla] varchar(50)  NOT NULL,
    [nome] varchar(150)  NOT NULL,
    [logradouro] varchar(50)  NULL,
    [numero] varchar(10)  NULL,
    [complemento] varchar(50)  NULL,
    [bairro] varchar(30)  NULL,
    [cidade] varchar(50)  NULL,
    [uf] char(2)  NULL,
    [cep] char(9)  NULL,
    [pais] varchar(30)  NULL
);
GO

-- Creating table 'TbFinanciadors'
CREATE TABLE [dbo].[TbFinanciadors] (
    [Id_Financiador] int IDENTITY(1,1) NOT NULL,
    [Cnpj_Financiador] varchar(18)  NULL,
    [Nome_Financiador] varchar(150)  NULL,
    [Id_natureza] int  NULL,
    [Logradouro] varchar(50)  NULL,
    [Numero] varchar(10)  NULL,
    [Complemento] varchar(50)  NULL,
    [Bairro] varchar(50)  NULL,
    [Cidade] varchar(50)  NULL,
    [uf] varchar(50)  NULL,
    [cep] char(9)  NULL,
    [pais] varchar(50)  NULL
);
GO

-- Creating table 'TbFinProjetoes'
CREATE TABLE [dbo].[TbFinProjetoes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Id_Projeto] int  NULL,
    [Id_Financiador] int  NULL,
    [obs] varchar(max)  NULL
);
GO

-- Creating table 'Laboratorio'
CREATE TABLE [dbo].[Laboratorio] (
    [id_laboratorio] int IDENTITY(1,1) NOT NULL,
    [id_departamento] int  NOT NULL,
    [sigla] varchar(15)  NOT NULL,
    [nome] varchar(150)  NOT NULL,
    [logradouro] varchar(50)  NULL,
    [numero] varchar(10)  NULL,
    [complemento] varchar(50)  NULL,
    [bairro] varchar(30)  NULL,
    [cidade] varchar(50)  NULL,
    [uf] char(2)  NULL,
    [cep] char(9)  NULL,
    [pais] varchar(30)  NULL
);
GO

-- Creating table 'Moeda'
CREATE TABLE [dbo].[Moeda] (
    [Cod_Moeda] int  NOT NULL,
    [Sigla_Moeda] varchar(10)  NOT NULL,
    [Nome_Moeda] varchar(50)  NOT NULL
);
GO

-- Creating table 'PAC_Cotacao'
CREATE TABLE [dbo].[PAC_Cotacao] (
    [id_cotacao] int  NOT NULL,
    [id_pac] int  NOT NULL,
    [arquivo] varchar(200)  NOT NULL,
    [data_inclusao] datetime  NOT NULL,
    [PACId_pac] int  NOT NULL
);
GO

-- Creating table 'PAC_PACStatus'
CREATE TABLE [dbo].[PAC_PACStatus] (
    [id_pacstatus] int  NOT NULL,
    [justificativa] varchar(500)  NULL,
    [data] datetime  NOT NULL,
    [id] int IDENTITY(1,1) NOT NULL,
    [id_pac] int  NOT NULL
);
GO

-- Creating table 'PACModalidadeCompra'
CREATE TABLE [dbo].[PACModalidadeCompra] (
    [id_modalidade_compra] int IDENTITY(1,1) NOT NULL,
    [nome] varchar(50)  NOT NULL,
    [descricao] varchar(150)  NULL,
    [status] bit  NOT NULL
);
GO

-- Creating table 'PACStatus'
CREATE TABLE [dbo].[PACStatus] (
    [id_pacstatus] int IDENTITY(1,1) NOT NULL,
    [nome] varchar(50)  NOT NULL,
    [descricao] varchar(500)  NULL,
    [ativo] bit  NOT NULL,
    [visivel] bit  NULL
);
GO

-- Creating table 'Projeto'
CREATE TABLE [dbo].[Projeto] (
    [Id_Projeto] int IDENTITY(1,1) NOT NULL,
    [DtCadastro_Projeto] datetime  NULL,
    [CodA_Projeto] int  NULL,
    [CodDef_Projeto] int  NULL,
    [Id_Unidade] int  NULL,
    [Id_Departamento] int  NULL,
    [Id_Laboratorio] int  NULL,
    [Id_Atuacao] int  NULL,
    [Id_Instrumento] int  NULL,
    [NumContrato_Projeto] varchar(250)  NULL,
    [DtAbertura_Projeto] datetime  NULL,
    [DtInicio_Projeto] datetime  NULL,
    [DtTermino_Projeto] datetime  NULL,
    [Id_Moeda] int  NULL,
    [Valor_Projeto] decimal(12,2)  NULL,
    [Sigla_Projeto] varchar(50)  NULL,
    [Titulo_Projeto] varchar(max)  NULL,
    [Objetivo_Projeto] varchar(max)  NULL,
    [Tags_Projeto] varchar(max)  NULL,
    [Cod_Classificacao] int  NULL,
    [DtRecbto_Projeto] datetime  NULL,
    [ValorRecbto_Projeto] decimal(18,2)  NULL,
    [FinanRecbto_Projeto] int  NULL,
    [dtProjDef_Projeto] datetime  NULL,
    [StEconomico] int  NULL,
    [solicitante] varchar(50)  NULL,
    [origem] varchar(50)  NULL,
    [projetoOrigem] varchar(50)  NULL,
    [nomePrograma] varchar(50)  NULL,
    [formaContratual] varchar(50)  NULL,
    [ambito] varchar(50)  NULL,
    [ambitoEspecifico] varchar(50)  NULL,
    [prestacao_contas] varchar(10)  NOT NULL
);
GO

-- Creating table 'Unidade'
CREATE TABLE [dbo].[Unidade] (
    [id_unidade] int IDENTITY(1,1) NOT NULL,
    [sigla] varchar(15)  NOT NULL,
    [nome] varchar(150)  NOT NULL,
    [logradouro] varchar(50)  NULL,
    [numero] varchar(10)  NULL,
    [complemento] varchar(50)  NULL,
    [bairro] varchar(30)  NULL,
    [cidade] varchar(50)  NULL,
    [uf] char(2)  NULL,
    [cep] char(9)  NULL,
    [pais] varchar(30)  NULL
);
GO

-- Creating table 'Grupo'
CREATE TABLE [dbo].[Grupo] (
    [Id_grupo] int  NOT NULL,
    [Sigla] varchar(10)  NOT NULL,
    [Nome] varchar(50)  NOT NULL
);
GO

-- Creating table 'Interface'
CREATE TABLE [dbo].[Interface] (
    [Id_interface] int  NOT NULL,
    [Id_Menu] int  NOT NULL,
    [Nome] varchar(50)  NOT NULL,
    [Descricao] varchar(50)  NOT NULL,
    [Url] varchar(50)  NOT NULL,
    [Tipo] varchar(50)  NULL
);
GO

-- Creating table 'Menu'
CREATE TABLE [dbo].[Menu] (
    [Id_Menu] int  NOT NULL,
    [Nome] varchar(50)  NOT NULL,
    [Descricao] varchar(50)  NOT NULL,
    [Url] varchar(50)  NULL,
    [Url_Default] varchar(50)  NOT NULL
);
GO

-- Creating table 'Usuario'
CREATE TABLE [dbo].[Usuario] (
    [Id_Usuario] int IDENTITY(1,1) NOT NULL,
    [Login] varchar(50)  NOT NULL,
    [Nome] varchar(50)  NOT NULL,
    [Senha] varchar(50)  NOT NULL,
    [Email] varchar(50)  NOT NULL,
    [Ramal] char(3)  NULL,
    [DtNascto] datetime  NULL
);
GO

-- Creating table 'MaquinaEstados'
CREATE TABLE [dbo].[MaquinaEstados] (
    [id_etapa] int IDENTITY(1,1) NOT NULL,
    [status_inicial] int  NOT NULL,
    [acao] char(1)  NOT NULL,
    [status_final] int  NOT NULL,
    [maquina] varchar(5)  NOT NULL
);
GO

-- Creating table 'Banco'
CREATE TABLE [dbo].[Banco] (
    [Cod_Banco] char(3)  NOT NULL,
    [Nome_Banco] varchar(50)  NOT NULL
);
GO

-- Creating table 'PAC'
CREATE TABLE [dbo].[PAC] (
    [id_pac] int IDENTITY(1,1) NOT NULL,
    [data] datetime  NOT NULL,
    [id_tipo_aquisicao] int  NOT NULL,
    [email_requisitante] nvarchar(100)  NOT NULL,
    [telefone_requisitante] nvarchar(20)  NOT NULL,
    [requisitante] nvarchar(100)  NOT NULL,
    [id_projeto] int  NOT NULL,
    [id_modalidade_compra] int  NULL
);
GO

-- Creating table 'PACTipo_Aquisicao'
CREATE TABLE [dbo].[PACTipo_Aquisicao] (
    [id_tipo_aquisicao] int IDENTITY(1,1) NOT NULL,
    [nome] nvarchar(50)  NOT NULL,
    [descricao] nvarchar(150)  NOT NULL,
    [status] bit  NOT NULL
);
GO

-- Creating table 'PACItem'
CREATE TABLE [dbo].[PACItem] (
    [Id_item] int IDENTITY(1,1) NOT NULL,
    [especificacao] nvarchar(200)  NOT NULL,
    [unidade] nvarchar(50)  NOT NULL,
    [quantidade] int  NOT NULL,
    [valor_unitario] decimal(18,0)  NOT NULL,
    [valor_total] decimal(18,0)  NOT NULL,
    [meta_etapa] nvarchar(50)  NOT NULL,
    [rubrica_item] nvarchar(50)  NOT NULL,
    [id_pac] int  NOT NULL
);
GO

-- Creating table 'PACVeiculos_Condutores'
CREATE TABLE [dbo].[PACVeiculos_Condutores] (
    [Id_condutor] int IDENTITY(1,1) NOT NULL,
    [nome] nvarchar(100)  NOT NULL,
    [rg] nvarchar(20)  NOT NULL,
    [cpf] nvarchar(14)  NOT NULL,
    [cnh] nvarchar(20)  NOT NULL,
    [validade_cnh] datetimeoffset  NOT NULL,
    [PACLocacaoVeiculoId_item] int  NOT NULL,
    [PACLocacaoVeiculo_Id_item] int  NOT NULL,
    [Ender_logradouro] varchar(200)  NOT NULL,
    [Ender_numero] varchar(50)  NOT NULL,
    [Ender_bairro] varchar(50)  NOT NULL,
    [Ender_complemento] varchar(100)  NULL,
    [Ender_cidade] varchar(200)  NOT NULL,
    [Ender_uf] varchar(2)  NOT NULL,
    [Ender_cep] varchar(9)  NOT NULL
);
GO

-- Creating table 'PACPassageiro'
CREATE TABLE [dbo].[PACPassageiro] (
    [Id_passageiro] int IDENTITY(1,1) NOT NULL,
    [nome] nvarchar(100)  NOT NULL,
    [rg] nvarchar(20)  NOT NULL,
    [cpf] nvarchar(14)  NOT NULL,
    [passaporte] nvarchar(20)  NOT NULL,
    [PACPassagemId_item] int  NOT NULL,
    [PACPassagem_Id_item] int  NOT NULL,
    [Ender_logradouro] varchar(200)  NOT NULL,
    [Ender_numero] varchar(50)  NOT NULL,
    [Ender_bairro] varchar(50)  NOT NULL,
    [Ender_complemento] varchar(100)  NULL,
    [Ender_cidade] varchar(200)  NOT NULL,
    [Ender_uf] varchar(2)  NOT NULL,
    [Ender_cep] varchar(9)  NOT NULL
);
GO

-- Creating table 'PACItem_PACLocacao'
CREATE TABLE [dbo].[PACItem_PACLocacao] (
    [data_inicio] datetime  NOT NULL,
    [data_termino] datetime  NOT NULL,
    [retira_locadora] bit  NOT NULL,
    [devolucao_locadora] bit  NOT NULL,
    [Ender_Retirada_logradouro] varchar(200)  NOT NULL,
    [Ender_Retirada_numero] varchar(50)  NOT NULL,
    [Ender_Retirada_bairro] varchar(50)  NOT NULL,
    [Ender_Retirada_complemento] varchar(100)  NULL,
    [Ender_Retirada_cidade] varchar(200)  NOT NULL,
    [Ender_Retirada_uf] varchar(2)  NOT NULL,
    [Ender_Retirada_cep] varchar(9)  NOT NULL,
    [Ender_Devolucao_logradouro] varchar(200)  NOT NULL,
    [Ender_Devolucao_numero] varchar(50)  NOT NULL,
    [Ender_Devolucao_bairro] varchar(50)  NOT NULL,
    [Ender_Devolucao_complemento] varchar(100)  NULL,
    [Ender_Devolucao_cidade] varchar(200)  NOT NULL,
    [Ender_Devolucao_uf] varchar(2)  NOT NULL,
    [Ender_Devolucao_cep] varchar(9)  NOT NULL,
    [Id_item] int  NOT NULL
);
GO

-- Creating table 'PACItem_PACLocacaoVeiculo'
CREATE TABLE [dbo].[PACItem_PACLocacaoVeiculo] (
    [locadora] nvarchar(100)  NOT NULL,
    [num_reserva] nvarchar(50)  NOT NULL,
    [descricao_veiculo] nvarchar(100)  NOT NULL,
    [autorizacao] nvarchar(max)  NOT NULL,
    [autorizacao_para] nvarchar(max)  NOT NULL,
    [Id_item] int  NOT NULL
);
GO

-- Creating table 'PACItem_PACPassagem'
CREATE TABLE [dbo].[PACItem_PACPassagem] (
    [internacional] bit  NOT NULL,
    [origem] nvarchar(max)  NOT NULL,
    [destino] nvarchar(max)  NOT NULL,
    [ida_e_volta] nvarchar(max)  NOT NULL,
    [periodo] int  NOT NULL,
    [Id_item] int  NOT NULL,
    [PACPassageiro_Id_passageiro] int  NOT NULL
);
GO

-- Creating table 'PACItem_PACServicosPJ'
CREATE TABLE [dbo].[PACItem_PACServicosPJ] (
    [contrato] bit  NOT NULL,
    [aditamento] bit  NOT NULL,
    [prazo] int  NOT NULL,
    [Ender_logradouro] varchar(200)  NOT NULL,
    [Ender_numero] varchar(50)  NOT NULL,
    [Ender_bairro] varchar(50)  NOT NULL,
    [Ender_complemento] varchar(100)  NULL,
    [Ender_cidade] varchar(200)  NOT NULL,
    [Ender_uf] varchar(2)  NOT NULL,
    [Ender_cep] varchar(9)  NOT NULL,
    [Id_item] int  NOT NULL
);
GO

-- Creating table 'PACItem_PACBem'
CREATE TABLE [dbo].[PACItem_PACBem] (
    [eh_importacao] bit  NOT NULL,
    [Ender_logradouro] varchar(200)  NOT NULL,
    [Ender_numero] varchar(50)  NOT NULL,
    [Ender_bairro] varchar(50)  NOT NULL,
    [Ender_complemento] varchar(100)  NULL,
    [Ender_cidade] varchar(200)  NOT NULL,
    [Ender_uf] varchar(2)  NOT NULL,
    [Ender_cep] varchar(9)  NOT NULL,
    [Id_item] int  NOT NULL
);
GO

-- Creating table 'PACItem_PACLocacaoBem'
CREATE TABLE [dbo].[PACItem_PACLocacaoBem] (
    [Id_item] int  NOT NULL
);
GO

-- Creating table 'TbGrupoUsuario'
CREATE TABLE [dbo].[TbGrupoUsuario] (
    [Grupos_Id_grupo] int  NOT NULL,
    [Usuarios_Id_Usuario] int  NOT NULL
);
GO

-- Creating table 'TbGrupoInterface'
CREATE TABLE [dbo].[TbGrupoInterface] (
    [Grupos_Id_grupo] int  NOT NULL,
    [Interfaces_Id_interface] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Bolsa'
ALTER TABLE [dbo].[Bolsa]
ADD CONSTRAINT [PK_Bolsa]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BolsaVigencia'
ALTER TABLE [dbo].[BolsaVigencia]
ADD CONSTRAINT [PK_BolsaVigencia]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [id_cep] in table 'Cep'
ALTER TABLE [dbo].[Cep]
ADD CONSTRAINT [PK_Cep]
    PRIMARY KEY CLUSTERED ([id_cep] ASC);
GO

-- Creating primary key on [Id_Coord] in table 'Coordenador'
ALTER TABLE [dbo].[Coordenador]
ADD CONSTRAINT [PK_Coordenador]
    PRIMARY KEY CLUSTERED ([Id_Coord] ASC);
GO

-- Creating primary key on [Id_Coordenacao] in table 'TbCoordProjs'
ALTER TABLE [dbo].[TbCoordProjs]
ADD CONSTRAINT [PK_TbCoordProjs]
    PRIMARY KEY CLUSTERED ([Id_Coordenacao] ASC);
GO

-- Creating primary key on [id_departamento] in table 'TbDepartamentoes'
ALTER TABLE [dbo].[TbDepartamentoes]
ADD CONSTRAINT [PK_TbDepartamentoes]
    PRIMARY KEY CLUSTERED ([id_departamento] ASC);
GO

-- Creating primary key on [Id_Financiador] in table 'TbFinanciadors'
ALTER TABLE [dbo].[TbFinanciadors]
ADD CONSTRAINT [PK_TbFinanciadors]
    PRIMARY KEY CLUSTERED ([Id_Financiador] ASC);
GO

-- Creating primary key on [Id] in table 'TbFinProjetoes'
ALTER TABLE [dbo].[TbFinProjetoes]
ADD CONSTRAINT [PK_TbFinProjetoes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [id_laboratorio] in table 'Laboratorio'
ALTER TABLE [dbo].[Laboratorio]
ADD CONSTRAINT [PK_Laboratorio]
    PRIMARY KEY CLUSTERED ([id_laboratorio] ASC);
GO

-- Creating primary key on [Cod_Moeda] in table 'Moeda'
ALTER TABLE [dbo].[Moeda]
ADD CONSTRAINT [PK_Moeda]
    PRIMARY KEY CLUSTERED ([Cod_Moeda] ASC);
GO

-- Creating primary key on [id_cotacao] in table 'PAC_Cotacao'
ALTER TABLE [dbo].[PAC_Cotacao]
ADD CONSTRAINT [PK_PAC_Cotacao]
    PRIMARY KEY CLUSTERED ([id_cotacao] ASC);
GO

-- Creating primary key on [id] in table 'PAC_PACStatus'
ALTER TABLE [dbo].[PAC_PACStatus]
ADD CONSTRAINT [PK_PAC_PACStatus]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id_modalidade_compra] in table 'PACModalidadeCompra'
ALTER TABLE [dbo].[PACModalidadeCompra]
ADD CONSTRAINT [PK_PACModalidadeCompra]
    PRIMARY KEY CLUSTERED ([id_modalidade_compra] ASC);
GO

-- Creating primary key on [id_pacstatus] in table 'PACStatus'
ALTER TABLE [dbo].[PACStatus]
ADD CONSTRAINT [PK_PACStatus]
    PRIMARY KEY CLUSTERED ([id_pacstatus] ASC);
GO

-- Creating primary key on [Id_Projeto] in table 'Projeto'
ALTER TABLE [dbo].[Projeto]
ADD CONSTRAINT [PK_Projeto]
    PRIMARY KEY CLUSTERED ([Id_Projeto] ASC);
GO

-- Creating primary key on [id_unidade] in table 'Unidade'
ALTER TABLE [dbo].[Unidade]
ADD CONSTRAINT [PK_Unidade]
    PRIMARY KEY CLUSTERED ([id_unidade] ASC);
GO

-- Creating primary key on [Id_grupo] in table 'Grupo'
ALTER TABLE [dbo].[Grupo]
ADD CONSTRAINT [PK_Grupo]
    PRIMARY KEY CLUSTERED ([Id_grupo] ASC);
GO

-- Creating primary key on [Id_interface] in table 'Interface'
ALTER TABLE [dbo].[Interface]
ADD CONSTRAINT [PK_Interface]
    PRIMARY KEY CLUSTERED ([Id_interface] ASC);
GO

-- Creating primary key on [Id_Menu] in table 'Menu'
ALTER TABLE [dbo].[Menu]
ADD CONSTRAINT [PK_Menu]
    PRIMARY KEY CLUSTERED ([Id_Menu] ASC);
GO

-- Creating primary key on [Id_Usuario] in table 'Usuario'
ALTER TABLE [dbo].[Usuario]
ADD CONSTRAINT [PK_Usuario]
    PRIMARY KEY CLUSTERED ([Id_Usuario] ASC);
GO

-- Creating primary key on [id_etapa] in table 'MaquinaEstados'
ALTER TABLE [dbo].[MaquinaEstados]
ADD CONSTRAINT [PK_MaquinaEstados]
    PRIMARY KEY CLUSTERED ([id_etapa] ASC);
GO

-- Creating primary key on [Cod_Banco] in table 'Banco'
ALTER TABLE [dbo].[Banco]
ADD CONSTRAINT [PK_Banco]
    PRIMARY KEY CLUSTERED ([Cod_Banco] ASC);
GO

-- Creating primary key on [id_pac] in table 'PAC'
ALTER TABLE [dbo].[PAC]
ADD CONSTRAINT [PK_PAC]
    PRIMARY KEY CLUSTERED ([id_pac] ASC);
GO

-- Creating primary key on [id_tipo_aquisicao] in table 'PACTipo_Aquisicao'
ALTER TABLE [dbo].[PACTipo_Aquisicao]
ADD CONSTRAINT [PK_PACTipo_Aquisicao]
    PRIMARY KEY CLUSTERED ([id_tipo_aquisicao] ASC);
GO

-- Creating primary key on [Id_item] in table 'PACItem'
ALTER TABLE [dbo].[PACItem]
ADD CONSTRAINT [PK_PACItem]
    PRIMARY KEY CLUSTERED ([Id_item] ASC);
GO

-- Creating primary key on [Id_condutor] in table 'PACVeiculos_Condutores'
ALTER TABLE [dbo].[PACVeiculos_Condutores]
ADD CONSTRAINT [PK_PACVeiculos_Condutores]
    PRIMARY KEY CLUSTERED ([Id_condutor] ASC);
GO

-- Creating primary key on [Id_passageiro] in table 'PACPassageiro'
ALTER TABLE [dbo].[PACPassageiro]
ADD CONSTRAINT [PK_PACPassageiro]
    PRIMARY KEY CLUSTERED ([Id_passageiro] ASC);
GO

-- Creating primary key on [Id_item] in table 'PACItem_PACLocacao'
ALTER TABLE [dbo].[PACItem_PACLocacao]
ADD CONSTRAINT [PK_PACItem_PACLocacao]
    PRIMARY KEY CLUSTERED ([Id_item] ASC);
GO

-- Creating primary key on [Id_item] in table 'PACItem_PACLocacaoVeiculo'
ALTER TABLE [dbo].[PACItem_PACLocacaoVeiculo]
ADD CONSTRAINT [PK_PACItem_PACLocacaoVeiculo]
    PRIMARY KEY CLUSTERED ([Id_item] ASC);
GO

-- Creating primary key on [Id_item] in table 'PACItem_PACPassagem'
ALTER TABLE [dbo].[PACItem_PACPassagem]
ADD CONSTRAINT [PK_PACItem_PACPassagem]
    PRIMARY KEY CLUSTERED ([Id_item] ASC);
GO

-- Creating primary key on [Id_item] in table 'PACItem_PACServicosPJ'
ALTER TABLE [dbo].[PACItem_PACServicosPJ]
ADD CONSTRAINT [PK_PACItem_PACServicosPJ]
    PRIMARY KEY CLUSTERED ([Id_item] ASC);
GO

-- Creating primary key on [Id_item] in table 'PACItem_PACBem'
ALTER TABLE [dbo].[PACItem_PACBem]
ADD CONSTRAINT [PK_PACItem_PACBem]
    PRIMARY KEY CLUSTERED ([Id_item] ASC);
GO

-- Creating primary key on [Id_item] in table 'PACItem_PACLocacaoBem'
ALTER TABLE [dbo].[PACItem_PACLocacaoBem]
ADD CONSTRAINT [PK_PACItem_PACLocacaoBem]
    PRIMARY KEY CLUSTERED ([Id_item] ASC);
GO

-- Creating primary key on [Grupos_Id_grupo], [Usuarios_Id_Usuario] in table 'TbGrupoUsuario'
ALTER TABLE [dbo].[TbGrupoUsuario]
ADD CONSTRAINT [PK_TbGrupoUsuario]
    PRIMARY KEY NONCLUSTERED ([Grupos_Id_grupo], [Usuarios_Id_Usuario] ASC);
GO

-- Creating primary key on [Grupos_Id_grupo], [Interfaces_Id_interface] in table 'TbGrupoInterface'
ALTER TABLE [dbo].[TbGrupoInterface]
ADD CONSTRAINT [PK_TbGrupoInterface]
    PRIMARY KEY NONCLUSTERED ([Grupos_Id_grupo], [Interfaces_Id_interface] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Id_bolsa] in table 'BolsaVigencia'
ALTER TABLE [dbo].[BolsaVigencia]
ADD CONSTRAINT [FK_BolsaVigencias_Bolsas]
    FOREIGN KEY ([Id_bolsa])
    REFERENCES [dbo].[Bolsa]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BolsaVigencias_Bolsas'
CREATE INDEX [IX_FK_BolsaVigencias_Bolsas]
ON [dbo].[BolsaVigencia]
    ([Id_bolsa]);
GO

-- Creating foreign key on [Id_Departamento] in table 'Coordenador'
ALTER TABLE [dbo].[Coordenador]
ADD CONSTRAINT [FK_TbCoord_TbDepartamento]
    FOREIGN KEY ([Id_Departamento])
    REFERENCES [dbo].[TbDepartamentoes]
        ([id_departamento])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TbCoord_TbDepartamento'
CREATE INDEX [IX_FK_TbCoord_TbDepartamento]
ON [dbo].[Coordenador]
    ([Id_Departamento]);
GO

-- Creating foreign key on [Id_Laboratorio] in table 'Coordenador'
ALTER TABLE [dbo].[Coordenador]
ADD CONSTRAINT [FK_TbCoord_TbLaboratorio]
    FOREIGN KEY ([Id_Laboratorio])
    REFERENCES [dbo].[Laboratorio]
        ([id_laboratorio])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TbCoord_TbLaboratorio'
CREATE INDEX [IX_FK_TbCoord_TbLaboratorio]
ON [dbo].[Coordenador]
    ([Id_Laboratorio]);
GO

-- Creating foreign key on [Id_coordenador] in table 'TbCoordProjs'
ALTER TABLE [dbo].[TbCoordProjs]
ADD CONSTRAINT [FK_TbCoordProj_TbCoord]
    FOREIGN KEY ([Id_coordenador])
    REFERENCES [dbo].[Coordenador]
        ([Id_Coord])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TbCoordProj_TbCoord'
CREATE INDEX [IX_FK_TbCoordProj_TbCoord]
ON [dbo].[TbCoordProjs]
    ([Id_coordenador]);
GO

-- Creating foreign key on [Id_Projeto] in table 'TbCoordProjs'
ALTER TABLE [dbo].[TbCoordProjs]
ADD CONSTRAINT [FK_TbCoordProj_TbProjeto]
    FOREIGN KEY ([Id_Projeto])
    REFERENCES [dbo].[Projeto]
        ([Id_Projeto])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TbCoordProj_TbProjeto'
CREATE INDEX [IX_FK_TbCoordProj_TbProjeto]
ON [dbo].[TbCoordProjs]
    ([Id_Projeto]);
GO

-- Creating foreign key on [id_departamento] in table 'Laboratorio'
ALTER TABLE [dbo].[Laboratorio]
ADD CONSTRAINT [FK_TbLaboratorio_TbDepartamento]
    FOREIGN KEY ([id_departamento])
    REFERENCES [dbo].[TbDepartamentoes]
        ([id_departamento])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TbLaboratorio_TbDepartamento'
CREATE INDEX [IX_FK_TbLaboratorio_TbDepartamento]
ON [dbo].[Laboratorio]
    ([id_departamento]);
GO

-- Creating foreign key on [Id_Departamento] in table 'Projeto'
ALTER TABLE [dbo].[Projeto]
ADD CONSTRAINT [FK_TbProjeto_TbDepartamento]
    FOREIGN KEY ([Id_Departamento])
    REFERENCES [dbo].[TbDepartamentoes]
        ([id_departamento])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TbProjeto_TbDepartamento'
CREATE INDEX [IX_FK_TbProjeto_TbDepartamento]
ON [dbo].[Projeto]
    ([Id_Departamento]);
GO

-- Creating foreign key on [Id_Financiador] in table 'TbFinProjetoes'
ALTER TABLE [dbo].[TbFinProjetoes]
ADD CONSTRAINT [FK_TbFinProjeto_TbFinanciador]
    FOREIGN KEY ([Id_Financiador])
    REFERENCES [dbo].[TbFinanciadors]
        ([Id_Financiador])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TbFinProjeto_TbFinanciador'
CREATE INDEX [IX_FK_TbFinProjeto_TbFinanciador]
ON [dbo].[TbFinProjetoes]
    ([Id_Financiador]);
GO

-- Creating foreign key on [Id_Projeto] in table 'TbFinProjetoes'
ALTER TABLE [dbo].[TbFinProjetoes]
ADD CONSTRAINT [FK_TbFinProjeto_TbProjeto]
    FOREIGN KEY ([Id_Projeto])
    REFERENCES [dbo].[Projeto]
        ([Id_Projeto])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TbFinProjeto_TbProjeto'
CREATE INDEX [IX_FK_TbFinProjeto_TbProjeto]
ON [dbo].[TbFinProjetoes]
    ([Id_Projeto]);
GO

-- Creating foreign key on [Id_Laboratorio] in table 'Projeto'
ALTER TABLE [dbo].[Projeto]
ADD CONSTRAINT [FK_TbProjeto_TbLaboratorio]
    FOREIGN KEY ([Id_Laboratorio])
    REFERENCES [dbo].[Laboratorio]
        ([id_laboratorio])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TbProjeto_TbLaboratorio'
CREATE INDEX [IX_FK_TbProjeto_TbLaboratorio]
ON [dbo].[Projeto]
    ([Id_Laboratorio]);
GO

-- Creating foreign key on [Id_Moeda] in table 'Projeto'
ALTER TABLE [dbo].[Projeto]
ADD CONSTRAINT [FK_TbProjeto_TbMoeda]
    FOREIGN KEY ([Id_Moeda])
    REFERENCES [dbo].[Moeda]
        ([Cod_Moeda])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TbProjeto_TbMoeda'
CREATE INDEX [IX_FK_TbProjeto_TbMoeda]
ON [dbo].[Projeto]
    ([Id_Moeda]);
GO

-- Creating foreign key on [id_pacstatus] in table 'PAC_PACStatus'
ALTER TABLE [dbo].[PAC_PACStatus]
ADD CONSTRAINT [FK_TbPAC_PACStatus_TbPACStatus]
    FOREIGN KEY ([id_pacstatus])
    REFERENCES [dbo].[PACStatus]
        ([id_pacstatus])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TbPAC_PACStatus_TbPACStatus'
CREATE INDEX [IX_FK_TbPAC_PACStatus_TbPACStatus]
ON [dbo].[PAC_PACStatus]
    ([id_pacstatus]);
GO

-- Creating foreign key on [Id_Unidade] in table 'Coordenador'
ALTER TABLE [dbo].[Coordenador]
ADD CONSTRAINT [FK_TbCoord_TbUnidade]
    FOREIGN KEY ([Id_Unidade])
    REFERENCES [dbo].[Unidade]
        ([id_unidade])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TbCoord_TbUnidade'
CREATE INDEX [IX_FK_TbCoord_TbUnidade]
ON [dbo].[Coordenador]
    ([Id_Unidade]);
GO

-- Creating foreign key on [id_unidade] in table 'TbDepartamentoes'
ALTER TABLE [dbo].[TbDepartamentoes]
ADD CONSTRAINT [FK_TbDepartamento_TbUnidade]
    FOREIGN KEY ([id_unidade])
    REFERENCES [dbo].[Unidade]
        ([id_unidade])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TbDepartamento_TbUnidade'
CREATE INDEX [IX_FK_TbDepartamento_TbUnidade]
ON [dbo].[TbDepartamentoes]
    ([id_unidade]);
GO

-- Creating foreign key on [Id_Unidade] in table 'Projeto'
ALTER TABLE [dbo].[Projeto]
ADD CONSTRAINT [FK_TbProjeto_TbUnidade]
    FOREIGN KEY ([Id_Unidade])
    REFERENCES [dbo].[Unidade]
        ([id_unidade])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TbProjeto_TbUnidade'
CREATE INDEX [IX_FK_TbProjeto_TbUnidade]
ON [dbo].[Projeto]
    ([Id_Unidade]);
GO

-- Creating foreign key on [Id_Menu] in table 'Interface'
ALTER TABLE [dbo].[Interface]
ADD CONSTRAINT [FK_TbInterface_TbMenu]
    FOREIGN KEY ([Id_Menu])
    REFERENCES [dbo].[Menu]
        ([Id_Menu])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TbInterface_TbMenu'
CREATE INDEX [IX_FK_TbInterface_TbMenu]
ON [dbo].[Interface]
    ([Id_Menu]);
GO

-- Creating foreign key on [Grupos_Id_grupo] in table 'TbGrupoUsuario'
ALTER TABLE [dbo].[TbGrupoUsuario]
ADD CONSTRAINT [FK_TbGrupoUsuario_TbGrupo]
    FOREIGN KEY ([Grupos_Id_grupo])
    REFERENCES [dbo].[Grupo]
        ([Id_grupo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Usuarios_Id_Usuario] in table 'TbGrupoUsuario'
ALTER TABLE [dbo].[TbGrupoUsuario]
ADD CONSTRAINT [FK_TbGrupoUsuario_TbUsuario]
    FOREIGN KEY ([Usuarios_Id_Usuario])
    REFERENCES [dbo].[Usuario]
        ([Id_Usuario])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TbGrupoUsuario_TbUsuario'
CREATE INDEX [IX_FK_TbGrupoUsuario_TbUsuario]
ON [dbo].[TbGrupoUsuario]
    ([Usuarios_Id_Usuario]);
GO

-- Creating foreign key on [Grupos_Id_grupo] in table 'TbGrupoInterface'
ALTER TABLE [dbo].[TbGrupoInterface]
ADD CONSTRAINT [FK_TbGrupoInterface_Grupo]
    FOREIGN KEY ([Grupos_Id_grupo])
    REFERENCES [dbo].[Grupo]
        ([Id_grupo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Interfaces_Id_interface] in table 'TbGrupoInterface'
ALTER TABLE [dbo].[TbGrupoInterface]
ADD CONSTRAINT [FK_TbGrupoInterface_Interface]
    FOREIGN KEY ([Interfaces_Id_interface])
    REFERENCES [dbo].[Interface]
        ([Id_interface])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TbGrupoInterface_Interface'
CREATE INDEX [IX_FK_TbGrupoInterface_Interface]
ON [dbo].[TbGrupoInterface]
    ([Interfaces_Id_interface]);
GO

-- Creating foreign key on [status_final] in table 'MaquinaEstados'
ALTER TABLE [dbo].[MaquinaEstados]
ADD CONSTRAINT [FK_TbMaquinaEstados_TbPACStatus_final]
    FOREIGN KEY ([status_final])
    REFERENCES [dbo].[PACStatus]
        ([id_pacstatus])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TbMaquinaEstados_TbPACStatus_final'
CREATE INDEX [IX_FK_TbMaquinaEstados_TbPACStatus_final]
ON [dbo].[MaquinaEstados]
    ([status_final]);
GO

-- Creating foreign key on [status_inicial] in table 'MaquinaEstados'
ALTER TABLE [dbo].[MaquinaEstados]
ADD CONSTRAINT [FK_TbMaquinaEstados_TbPACStatus_inicial]
    FOREIGN KEY ([status_inicial])
    REFERENCES [dbo].[PACStatus]
        ([id_pacstatus])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TbMaquinaEstados_TbPACStatus_inicial'
CREATE INDEX [IX_FK_TbMaquinaEstados_TbPACStatus_inicial]
ON [dbo].[MaquinaEstados]
    ([status_inicial]);
GO

-- Creating foreign key on [id_pac] in table 'PACItem'
ALTER TABLE [dbo].[PACItem]
ADD CONSTRAINT [FK_PACPACItem]
    FOREIGN KEY ([id_pac])
    REFERENCES [dbo].[PAC]
        ([id_pac])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PACPACItem'
CREATE INDEX [IX_FK_PACPACItem]
ON [dbo].[PACItem]
    ([id_pac]);
GO

-- Creating foreign key on [id_projeto] in table 'PAC'
ALTER TABLE [dbo].[PAC]
ADD CONSTRAINT [FK_PACProjeto]
    FOREIGN KEY ([id_projeto])
    REFERENCES [dbo].[Projeto]
        ([Id_Projeto])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PACProjeto'
CREATE INDEX [IX_FK_PACProjeto]
ON [dbo].[PAC]
    ([id_projeto]);
GO

-- Creating foreign key on [PACId_pac] in table 'PAC_Cotacao'
ALTER TABLE [dbo].[PAC_Cotacao]
ADD CONSTRAINT [FK_PAC_CotacaoPAC]
    FOREIGN KEY ([PACId_pac])
    REFERENCES [dbo].[PAC]
        ([id_pac])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PAC_CotacaoPAC'
CREATE INDEX [IX_FK_PAC_CotacaoPAC]
ON [dbo].[PAC_Cotacao]
    ([PACId_pac]);
GO

-- Creating foreign key on [id_pac] in table 'PAC_PACStatus'
ALTER TABLE [dbo].[PAC_PACStatus]
ADD CONSTRAINT [FK_PAC_PACStatusPAC]
    FOREIGN KEY ([id_pac])
    REFERENCES [dbo].[PAC]
        ([id_pac])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PAC_PACStatusPAC'
CREATE INDEX [IX_FK_PAC_PACStatusPAC]
ON [dbo].[PAC_PACStatus]
    ([id_pac]);
GO

-- Creating foreign key on [id_tipo_aquisicao] in table 'PAC'
ALTER TABLE [dbo].[PAC]
ADD CONSTRAINT [FK_PACTipo_AquisicaoPAC]
    FOREIGN KEY ([id_tipo_aquisicao])
    REFERENCES [dbo].[PACTipo_Aquisicao]
        ([id_tipo_aquisicao])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PACTipo_AquisicaoPAC'
CREATE INDEX [IX_FK_PACTipo_AquisicaoPAC]
ON [dbo].[PAC]
    ([id_tipo_aquisicao]);
GO

-- Creating foreign key on [PACLocacaoVeiculo_Id_item] in table 'PACVeiculos_Condutores'
ALTER TABLE [dbo].[PACVeiculos_Condutores]
ADD CONSTRAINT [FK_PACVeiculos_CondutoresPACLocacaoVeiculo]
    FOREIGN KEY ([PACLocacaoVeiculo_Id_item])
    REFERENCES [dbo].[PACItem_PACLocacaoVeiculo]
        ([Id_item])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PACVeiculos_CondutoresPACLocacaoVeiculo'
CREATE INDEX [IX_FK_PACVeiculos_CondutoresPACLocacaoVeiculo]
ON [dbo].[PACVeiculos_Condutores]
    ([PACLocacaoVeiculo_Id_item]);
GO

-- Creating foreign key on [id_modalidade_compra] in table 'PAC'
ALTER TABLE [dbo].[PAC]
ADD CONSTRAINT [FK_PACModalidadeCompraPAC]
    FOREIGN KEY ([id_modalidade_compra])
    REFERENCES [dbo].[PACModalidadeCompra]
        ([id_modalidade_compra])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PACModalidadeCompraPAC'
CREATE INDEX [IX_FK_PACModalidadeCompraPAC]
ON [dbo].[PAC]
    ([id_modalidade_compra]);
GO

-- Creating foreign key on [PACPassageiro_Id_passageiro] in table 'PACItem_PACPassagem'
ALTER TABLE [dbo].[PACItem_PACPassagem]
ADD CONSTRAINT [FK_PACPassagemPACPassageiro]
    FOREIGN KEY ([PACPassageiro_Id_passageiro])
    REFERENCES [dbo].[PACPassageiro]
        ([Id_passageiro])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PACPassagemPACPassageiro'
CREATE INDEX [IX_FK_PACPassagemPACPassageiro]
ON [dbo].[PACItem_PACPassagem]
    ([PACPassageiro_Id_passageiro]);
GO

-- Creating foreign key on [Id_item] in table 'PACItem_PACLocacao'
ALTER TABLE [dbo].[PACItem_PACLocacao]
ADD CONSTRAINT [FK_PACLocacao_inherits_PACItem]
    FOREIGN KEY ([Id_item])
    REFERENCES [dbo].[PACItem]
        ([Id_item])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id_item] in table 'PACItem_PACLocacaoVeiculo'
ALTER TABLE [dbo].[PACItem_PACLocacaoVeiculo]
ADD CONSTRAINT [FK_PACLocacaoVeiculo_inherits_PACLocacao]
    FOREIGN KEY ([Id_item])
    REFERENCES [dbo].[PACItem_PACLocacao]
        ([Id_item])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id_item] in table 'PACItem_PACPassagem'
ALTER TABLE [dbo].[PACItem_PACPassagem]
ADD CONSTRAINT [FK_PACPassagem_inherits_PACItem]
    FOREIGN KEY ([Id_item])
    REFERENCES [dbo].[PACItem]
        ([Id_item])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id_item] in table 'PACItem_PACServicosPJ'
ALTER TABLE [dbo].[PACItem_PACServicosPJ]
ADD CONSTRAINT [FK_PACServicosPJ_inherits_PACItem]
    FOREIGN KEY ([Id_item])
    REFERENCES [dbo].[PACItem]
        ([Id_item])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id_item] in table 'PACItem_PACBem'
ALTER TABLE [dbo].[PACItem_PACBem]
ADD CONSTRAINT [FK_PACBem_inherits_PACItem]
    FOREIGN KEY ([Id_item])
    REFERENCES [dbo].[PACItem]
        ([Id_item])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id_item] in table 'PACItem_PACLocacaoBem'
ALTER TABLE [dbo].[PACItem_PACLocacaoBem]
ADD CONSTRAINT [FK_PACLocacaoBem_inherits_PACLocacao]
    FOREIGN KEY ([Id_item])
    REFERENCES [dbo].[PACItem_PACLocacao]
        ([Id_item])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------