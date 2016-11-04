CREATE DATABASE DWReceitas
GO
use DWReceitas
GO
Create table [DimContrato] (
[IdContrato] Integer NOT NULL,
[CodContrato] Varchar(255) null,
[CPF] Varchar(255) NULL,
[CNPJ] Varchar(255) NULL,
[Modalidade] Varchar(255) null,
[Codigo] Varchar(255) null,
[NumAditivos] Integer null,
Primary Key ([IdContrato])
)
go
Create table [DimFornecedor] (
[IdFornecedor] Integer NOT NULL,
[CPF] Varchar(255) NULL,
[CNPJ] Varchar(255) NULL,
[Nome] Varchar(255) null,
[Porte] Varchar(255) null,
[Ramo] Varchar(255) null,
Primary Key ([IdFornecedor])
)
go
Create table [FatoReceita] (
[IdFornecedor] Integer NOT NULL,
[IdTempo] Integer NOT NULL,
[IdContrato] Integer NOT NULL,
[IdLocal] Integer NOT NULL,
[Valor] Decimal(15,2) NULL
)
go
Create table [DimTempo] (
[IdTempo] Integer NOT NULL,
[Data] DateTime NULL,
[Mes] Integer NULL,
[Ano] Integer NULL,
[Dia] Integer NULL,
Primary Key ([IdTempo])
)
go
Create table [DimLocal] (
[IdLocal] Integer NOT NULL,
[CodLocal] Varchar(255) NULL,
[Municipio] Varchar(255) NULL,
[Estado] Varchar(255) NULL,
Primary Key ([IdLocal])
)
go
Alter table [FatoReceita] add foreign key([IdTempo]) references [DimTempo] ([IdTempo]) on
update no action on delete no action
go
Alter table [FatoReceita] add foreign key([IdLocal]) references [DimLocal] ([IdLocal]) on
update no action on delete no action
go
Alter table [FatoReceita] add foreign key([IdFornecedor]) references [DimFornecedor] ([IdFornecedor]) on
update no action on delete no action
go
Alter table [FatoReceita] add foreign key([IdContrato]) references [DimContrato] ([IdContrato]) on
update no action on delete no action
Go