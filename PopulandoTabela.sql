INSERT INTO DimFornecedor
SELECT DISTINCT
IdFornecedor, CPF_Fornecedor, CNPJ_Fornecedor, Nome, Porte, Ramo
FROM [dbo].[contratos]
go
INSERT INTO DimContrato
SELECT DISTINCT
IdContrato, CodContrato,CPF, CNPJ, Modalidade, Codigo, NumAditivos
FROM [dbo].[contratos]
go
INSERT INTO DimLocal
SELECT DISTINCT
idMunicipio, CodMunicipio, Municipio, UF
FROM [dbo].[contratos]
go	
INSERT INTO DimTempo
SELECT DISTINCT
IdTempo, Data, Mes, Ano, Dia
FROM [dbo].[contratos]
go
INSERT INTO FatoReceita
SELECT DISTINCT
IdFornecedor,IdTempo,IdContrato, idMunicipio, CAST(REPLACE(Valor, ',', '.') as float)
FROM [dbo].[contratos]