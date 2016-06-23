-- Se agregan estos campos a la Tabla LARCA20_AuxData
ALTER TABLE [dbo].[LARCA20_AuxData] ADD TopLvl4 int NOT NULL DEFAULT(0)
ALTER TABLE [dbo].[LARCA20_AuxData] ADD CntAdjuntos int NOT NULL DEFAULT(0)

-- Se modifica este campo como no null
ALTER TABLE [dbo].[LARCA20_Level4] ALTER COLUMN Borrado bit NOT NULL