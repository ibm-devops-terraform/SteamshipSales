USE [SteamShipSales]
GO

/****** Object:  StoredProcedure [dbo].[GetStaffSales]    Script Date: 9/18/2020 2:41:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ibrahim Mohammad>
-- Create date: <17/08/2020>
-- Description:	<Gets the staff sales and count and their managers>
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[GetStaffSales]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ROW_NUMBER() OVER (ORDER BY e.first_name, e.last_name) seq ,
SUM(SALES_AMOUNT) Sales_Amount,count(*) SALES_COUNT,
E.First_Name as Emp_First_Name,E.Last_Name Emp_Last_Name,
m.First_Name as Mgr_First_name, m.Last_name as Mgr_Last_Name  FROM employee e
--INNER JOIN EMPLOYEE E ON S.Employee_Id = E.Employee_Id
inner join employee m on m.Employee_ID = e.Manager_ID
inner join sales s on s.Employee_Id = e.Employee_ID
GROUP BY E.First_Name,E.Last_Name, m.First_Name,m.Last_Name
order by 2 desc
END
GO


