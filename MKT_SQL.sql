CREATE TABLE `MKT_CP` (
  `ID` int DEFAULT NULL,
  `Year_Birth` int DEFAULT NULL,
  `Education` text,
  `Marital_Status` text,
  `Income` int DEFAULT NULL,
  `Kidhome` int DEFAULT NULL,
  `Teenhome` int DEFAULT NULL,
  `Dt_Customer` text,
  `Recency` int DEFAULT NULL,
  `MntWines` int DEFAULT NULL,
  `MntFruits` int DEFAULT NULL,
  `MntMeatProducts` int DEFAULT NULL,
  `MntFishProducts` int DEFAULT NULL,
  `MntSweetProducts` int DEFAULT NULL,
  `MntGoldProds` int DEFAULT NULL,
  `NumDealsPurchases` int DEFAULT NULL,
  `NumWebPurchases` int DEFAULT NULL,
  `NumCatalogPurchases` int DEFAULT NULL,
  `NumStorePurchases` int DEFAULT NULL,
  `NumWebVisitsMonth` int DEFAULT NULL,
  `AcceptedCmp3` int DEFAULT NULL,
  `AcceptedCmp4` int DEFAULT NULL,
  `AcceptedCmp5` int DEFAULT NULL,
  `AcceptedCmp1` int DEFAULT NULL,
  `AcceptedCmp2` int DEFAULT NULL,
  `Complain` int DEFAULT NULL,
  `Z_CostContact` int DEFAULT NULL,
  `Z_Revenue` int DEFAULT NULL,
  `Response` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into mkt_cp (select * from mkt_splc.marketing_campaign);

select * from mkt_cp;

select * into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/mkt_splc.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM marketing_campaign;

INSERT INTO `mkt_splc`.`marketing_campaign`
(ID,
Year_Birth,
Education,
Marital_Status,
Income,
Kidhome,
Teenhome,
Dt_Customer,
Recency,
MntWines,
MntFruits,
MntMeatProducts,
MntFishProducts,
MntSweetProducts,
MntGoldProds,
NumDealsPurchases,
NumWebPurchases,
NumCatalogPurchases,
NumStorePurchases,
NumWebVisitsMonth,
AcceptedCmp3,
AcceptedCmp4,
AcceptedCmp5,
AcceptedCmp1,
AcceptedCmp2,
Complain,
Z_CostContact,
Z_Revenue,
Response)
VALUES
("ID",
Year_Birth",
"Education","Marital_Status",
"Kidhome","Teenhome",
"Dt_Customer","Recency",
"MntWines","MntFruits","MntMeatProducts","MntFishProducts",
"MntSweetProducts","MntGoldProds",
"NumDealsPurchases","NumWebPurchases",
"NumCatalogPurchases","NumStorePurchases",
"NumWebVisitsMonth","AcceptedCmp3",
"AcceptedCmp4","AcceptedCmp5","AcceptedCmp1","AcceptedCmp2","Complain","Z_CostContact","Z_Revenue","Response";




create table marketing_cleaned as
select * from marketing_campaign 
where Transaction_ID = "Transaction_ID"
union ALL
select * from railway_copy
where Transaction_ID != "Transaction_ID"; 
 
