-- ============================================================
-- Proplytics DWH | Workflow 1 - Customer Assignment
-- Step 4: Trigger - trg_CustomerInsert
-- ============================================================
-- Fires automatically after every INSERT on Dim_Customer.
-- Reads new customer data from the virtual 'inserted' table
-- and calls sp_AssignAgentAndNotify.
-- ============================================================
-- IMPORTANT: Replace @WebhookURL value with your Make.com URL
-- ============================================================

CREATE TRIGGER trg_CustomerInsert
ON Dim_Customer
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @WebhookURL VARCHAR(500) = 'https://hook.us2.make.com/wi117nelewzuw28puqhnu7ra2j9bbpid';
    -- ↑ Replace with your actual Make.com Webhook URL

    DECLARE @CustomerKey INT;
    DECLARE @CustomerID  INT;
    DECLARE @FullName    VARCHAR(255);
    DECLARE @Email       VARCHAR(255);
    DECLARE @Phone       VARCHAR(255);
    DECLARE @Budget      DECIMAL(18,2);

    -- Read the newly inserted row from the virtual 'inserted' table
    SELECT
        @CustomerKey = CustomerKey,
        @CustomerID  = CustomerID,
        @FullName    = FullName,
        @Email       = Email,
        @Phone       = Phone,
        @Budget      = Budget
    FROM inserted;

    -- Call the Stored Procedure
    EXEC sp_AssignAgentAndNotify
        @CustomerKey = @CustomerKey,
        @CustomerID  = @CustomerID,
        @FullName    = @FullName,
        @Email       = @Email,
        @Phone       = @Phone,
        @Budget      = @Budget,
        @WebhookURL  = @WebhookURL;
END;
