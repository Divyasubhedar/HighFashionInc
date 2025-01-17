SELECT Customer_ID, First_Name, Last_Name, City, Country 
FROM CUSTOMERS
WHERE Country='United States'
AND Customer_ID>'C1002'
ORDER BY Customer_ID DESC;

Select Manager_ID,Count(Associate_ID) AS 'Number_of_Associates'
from ASSOCIATES
Where Manager_ID BETWEEN 'AS01' and 'AS10' 
Group by Manager_ID;

SELECT M.Company_ID,Name,Country,Product_Name,Product_ID FROM PRODUCTS AS P, MANUFACTURERS AS M
WHERE P.Company_ID=M.Company_ID AND M.Country IN ('United States','Italy') AND Product_ID != 'P3'
ORDER BY Country, Name, M.Company_ID DESC;

SELECT SPS.Product_ID,Product_Name,SPS.Sale_ID, Customer_ID, SPS. Quantity, Payment_Method
FROM PRODUCTS AS P, SALES AS S, STORES_PRODUCTS_SALES AS SPS
Where P.Product_ID=SPS.Product_ID
AND SPS.Sale_ID=S.Sale_ID
ORDER BY SPS.Product_ID,Product_Name,Quantity DESC;

SELECT S.Store_Number,SS.Sale_ID,C.Customer_ID,C.First_Name,C.Last_Name,Date,S.Tax_Rate,SPS.Price * SPS.Quantity AS 'StoreIncome'
FROM STORES AS S 
INNER JOIN STORES_PRODUCTS_SALES AS SPS ON S.Store_Number=SPS.Store_Number
INNER JOIN SALES AS SS ON SPS.Sale_ID=SS.Sale_ID 
INNER JOIN CUSTOMERS AS C ON SS.Customer_ID=C.Customer_ID
WHERE  Date>'2019-5-01' OR S.Store_Number<> 2
ORDER BY  StoreIncome DESC;

Select S.Sale_ID,CPWR.Product_ID, Product_Name, WOR.[WO-Return_ID],WOR.Voucher_Number, C.Customer_ID,C.First_Name,C.Last_Name
From PRODUCTS AS P, WITHOUT_RECEIPT AS WOR,CUSTOMERS_PRODUCTS_WITHOUT_RECEIPT AS CPWR, CUSTOMERS AS C, SALES AS S
Where
P.Product_ID = CPWR.Product_ID AND
WOR.[WO-Return_ID]=CPWR.[WO-Return_ID] AND
CPWR.Customer_ID=C.Customer_ID AND
C.Customer_ID=S.Customer_ID
Order By [WO-Return_ID];


