# POS C# .NET 8

### Overview

This database schema is designed to support a sales system that manages customers, products, sales transactions, and related information. It includes various tables to store data about customers, products, sales invoices, and more. Additionally, stored procedures are provided to generate sales reports and manage sequences for invoice numbers.

### Stored Procedures

1. **sp_Dashboard**
    - Generates various sales reports for the dashboard.
    - Input: `@SaleInvoiceDate` (Date of the sales invoice).
    - Logic:
      - Creates temporary tables for weekly, daily, monthly, and yearly sales reports.
      - Populates these tables with data based on the input date.
      - Retrieves and returns data for:
        - Top 10 best-selling products.
        - Daily sales report.
        - Weekly sales report.
        - Monthly sales report.
        - Yearly sales report.
      - Cleans up temporary tables after use.

2. **Sp_GenerateSaleInvoiceNo**
    - Generates a new sale invoice number.
    - Logic:
      - Retrieves the current sequence value for sales invoices.
      - Increments the sequence.
      - Updates the sequence in the `Tbl_Sequence` table.
      - Returns the new sales invoice number formatted with leading zeros.


Staff Token
```js
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJZCI6IjAiLCJTdGFmZk5hbWUiOiJTdSBTdSIsIlN0YWZmQ29kZSI6IlUwMDAwMSIsIlRva2VuRXhwaXJlZCI6IjIwMjQtMDQtMjJUMTY6MzY6NDMuNjE1MTc1NFoiLCJuYmYiOjE3MTM4MDI5MDMsImV4cCI6MTcxMzgwMzgwMywiaWF0IjoxNzEzODAyOTAzfQ.IA6JMyYx1yaM2K9ch38sS1Fr2eukLKjOOhh-u5oPTI4
```

```bash
Scaffold-DbContext "Server=.;Database=Pos;Integrated Security=True;TrustServerCertificate=True;" Microsoft.EntityFrameworkCore.SqlServer -OutputDir Models -Context AppDbContext -f
Scaffold-DbContext "Server=.;Database=Pos;User ID=sa;Password=sasa@123;TrustServerCertificate=True;" Microsoft.EntityFrameworkCore.SqlServer -OutputDir Models -Context AppDbContext

dotnet tool install --global dotnet-ef 7.0.17
dotnet ef dbcontext scaffold "Server=.;Database=Pos;User ID=sa;Password=sasa@123;TrustServerCertificate=True;" Microsoft.EntityFrameworkCore.SqlServer -o Models -c AppDbContext -f
```
