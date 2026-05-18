-- ============================================================
-- Proplytics DWH | Workflow 2 - Deal Closure Notification
-- Step 1: Stored Procedure - sp_NotifyDealClosure
-- ============================================================
-- This SP does 2 things:
--   1. Fetches deal details (customer, agent, amounts) via JOIN
--   2. Sends data as JSON to Make.com webhook → Manager email
-- ============================================================
-- IMPORTANT: Replace @WebhookURL value with your Make.com URL
-- ============================================================

CREATE PROCEDURE sp_NotifyDealClosure
    @DealID     INT,
    @WebhookURL VARCHAR(500)
AS
BEGIN
    SET NOCOUNT ON;

    -- ── 1. Fetch deal, customer, and agent details ────────────
    DECLARE @CustomerName    VARCHAR(255);
    DECLARE @AgentName       VARCHAR(255);
    DECLARE @TotalAmount     DECIMAL(18,2);
    DECLARE @CommissionAmount NUMERIC(18,2);

    SELECT
        @CustomerName     = c.FullName,
        @AgentName        = a.FullName,
        @TotalAmount      = fs.TotalAmount,
        @CommissionAmount = fs.CommissionAmount
    FROM Fact_Sales fs
    JOIN Dim_Customer c ON fs.CustomerKey = c.CustomerKey AND c.IsCurrent = 1
    JOIN Dim_Agent    a ON fs.AgentKey    = a.AgentKey    AND a.IsCurrent = 1
    WHERE fs.DealID     = @DealID
      AND fs.DealStatus = 'Completed';

    -- ── 2. Build JSON payload ─────────────────────────────────
    DECLARE @JSON NVARCHAR(MAX);
    SET @JSON = N'{' +
        N'"DealID":'           + CAST(@DealID AS NVARCHAR)           + N',' +
        N'"CustomerName":"'    + ISNULL(@CustomerName, '')           + N'",' +
        N'"AgentName":"'       + ISNULL(@AgentName, '')              + N'",' +
        N'"TotalAmount":'      + CAST(@TotalAmount AS NVARCHAR)      + N',' +
        N'"CommissionAmount":' + CAST(@CommissionAmount AS NVARCHAR) +
        N'}';

    -- ── 3. Send HTTP POST to Make.com webhook ─────────────────
    DECLARE @obj      INT;
    DECLARE @response VARCHAR(8000);

    EXEC sp_OACreate      'MSXML2.ServerXMLHTTP', @obj OUT;
    EXEC sp_OAMethod      @obj, 'open', NULL, 'POST', @WebhookURL, false;
    EXEC sp_OAMethod      @obj, 'setRequestHeader', NULL, 'Content-Type', 'application/json';
    EXEC sp_OAMethod      @obj, 'send', NULL, @JSON;
    EXEC sp_OAGetProperty @obj, 'responseText', @response OUT;
    EXEC sp_OADestroy     @obj;

    PRINT @JSON;
    PRINT @response;
END;
