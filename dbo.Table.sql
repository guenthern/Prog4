CREATE TABLE [dbo].[Product]
(
	[ProductID] NCHAR(4) NOT NULL PRIMARY KEY, 
    [ProductName] NVARCHAR(50) NULL, 
    [UnitPrice] SMALLMONEY NULL, 
    [Description] NVARCHAR(MAX) NULL
)
