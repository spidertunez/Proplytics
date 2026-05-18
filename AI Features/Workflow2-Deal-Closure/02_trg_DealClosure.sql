-- ============================================================
-- Proplytics DWH | Workflow 2 - Deal Closure Notification
-- Step 2: Trigger - trg_DealClosure
-- ============================================================
-- Fires automatically after every UPDATE on Fact_Sales.
-- Compares 'inserted' (new values) vs 'deleted' (old values)
-- to detect when DealStatus changes TO 'Completed'.
-- Only fires on actual status change, not on repeated updates.
-- ============================================================
-- IMPORTANT: Replace @WebhookURL value with your Make.com URL
-- ============================================================

CREATE TRIGGER trg_DealClosure
ON Fact_Sales
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @WebhookURL VARCHAR(500) = 'https://hook.us2.make.com/wxvf9rpebpo5k83ucs2jjebceq98ghxs';
    -- ↑ Replace with your actual Make.com Webhook URL

    -- Only proceed if DealStatus changed TO 'Completed'
    -- 'inserted' = new values after UPDATE
    -- 'deleted'  = old values before UPDATE
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN deleted d ON i.SalesFactKey = d.SalesFactKey
        WHERE i.DealStatus = 'Completed'
          AND d.DealStatus != 'Completed'
    )
    BEGIN
        DECLARE @DealID INT;

        SELECT @DealID = DealID
        FROM inserted
        WHERE DealStatus = 'Completed';

        EXEC sp_NotifyDealClosure
            @DealID     = @DealID,
            @WebhookURL = @WebhookURL;
    END;
END;
