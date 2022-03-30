USE [SEU BANCO]

IF OBJECT_ID('dbo.Customer','U') IS NOT NULL
	DROP TABLE dbo.Customer

SELECT	  CustomerID
		, FirstName
		, MiddleName
		, Lastname
		, PersonType
		, EmailPromotion
		, Region
		, DataCadastro
INTO dbo.Customer
FROM OPENQUERY
	(
		[OUTRO SERVIDOR AQUI],'
		SELECT    c.CustomerID
				, FirstName
				, MiddleName
				, Lastname
				, CASE WHEN FirstName LIKE ''Ada%'' THEN NULL ELSE PersonType END AS PersonType
				, EmailPromotion
				, ''RJ'' AS Region
				, dateadd(d,-BusinessEntityID,getdate()) AS DataCadastro 
		FROM AdventureWorks.Person.Person p
		JOIN AdventureWorks.Sales.Customer c ON c.PersonID = p.BusinessEntityID')
GO

INSERT dbo.Customer
	(
		  [CustomerID]
		, [FirstName]
		, [MiddleName]
		, [Lastname]
		, [PersonType]
		, [EmailPromotion]
		, [Region]
		, [DataCadastro]
	)
SELECT    CustomerID
		, Lastname
		, MiddleName
		, FirstName
		, PersonType
		, EmailPromotion
		, Region
		, DataCadastro 
FROM OPENQUERY
	(
		[OUTRO SERVIDOR AQUI],'
		SELECT    c.CustomerID + 40000 AS CustomerID
				, Lastname
				, MiddleName
				, FirstName
				, CASE WHEN FirstName LIKE ''Ada%'' THEN NULL ELSE PersonType END AS PersonType
				, EmailPromotion
				, ''RJ'' AS Region
				, DATEADD(d,-BusinessEntityID, GETDATE()) AS DataCadastro 
		FROM AdventureWorks.Person.Person p
		JOIN AdventureWorks.Sales.Customer c ON c.PersonID = p.BusinessEntityID'
	)
GO

IF OBJECT_ID('dbo.SalesOrderHeader') IS NOT NULL
	DROP TABLE dbo.SalesOrderHeader

SELECT	  SalesOrderID
		, RevisionNumber
		, OrderDate
		, DueDate
		, ShipDate
		, [Status]
		, OnlineOrderFlag
		, SalesOrderNumber
		, PurchaseOrderNumber
		, AccountNumber
		, CustomerID
		, SalesPersonID
		, SubTotal
		, TaxAmt
		, Freight
		, TotalDue
		, Comment
		, ModifiedDate
INTO	dbo.SalesOrderHeader
FROM	[OUTRO SERVIDOR AQUI].AdventureWorks.Sales.SalesOrderHeader


IF OBJECT_ID('dbo.SalesOrderDetail') IS NOT NULL
	DROP TABLE dbo.SalesOrderDetail

SELECT	  SalesOrderID
		, SalesOrderDetailID
		, CarrierTrackingNumber
		, OrderQty
		, ProductID
		, SpecialOfferID
		, UnitPrice
		, UnitPriceDiscount
		, LineTotal
		, rowguid
		, ModifiedDate
INTO	dbo.SalesOrderDetail
FROM	[OUTRO SERVIDOR AQUI].AdventureWorks.Sales.SalesOrderDetail

