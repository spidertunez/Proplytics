-- ============================================================
-- Proplytics DWH | Workflow 1 - Customer Assignment
-- Step 3: Stored Procedure - sp_AssignAgentAndNotify
-- ============================================================
-- This SP does 3 things:
--   1. Finds the agent with fewest assigned customers
--   2. Updates AssignedAgentKey in Dim_Customer
--   3. Sends customer + agent data as JSON to Make.com webhook
-- ============================================================
-- IMPORTANT: Replace @WebhookURL value with your actual Make.com URL
-- ============================================================

CREATE PROCEDURE sp_AssignAgentAndNotify
    @CustomerKey INT,
    @CustomerID  INT,
    @FullName    VARCHAR(255),
    @Email       VARCHAR(255),
    @Phone       VARCHAR(255),
    @Budget      DECIMAL(18,2),
    @WebhookURL  VARCHAR(500)
AS
BEGIN
    SET NOCOUNT ON;

    -- ── 1. Find agent with fewest assigned customers ──────────
    DECLARE @AssignedAgentKey INT;

    SELECT TOP 1 @AssignedAgentKey = da.AgentKey
    FROM Dim_Agent da
    LEFT JOIN Dim_Customer dc ON da.AgentKey = dc.AssignedAgentKey
    WHERE da.IsCurrent = 1
    GROUP BY da.AgentKey
    ORDER BY COUNT(dc.CustomerKey) ASC;

    -- ── 2. Update customer record with assigned agent ─────────
    UPDATE Dim_Customer
    SET AssignedAgentKey = @AssignedAgentKey
    WHERE CustomerKey = @CustomerKey;

    -- ── 3. Get agent details ──────────────────────────────────
    DECLARE @AgentEmail    VARCHAR(255);
    DECLARE @AgentFullName VARCHAR(255);

    SELECT
        @AgentEmail    = Email,
        @AgentFullName = FullName
    FROM Dim_Agent
    WHERE AgentKey = @AssignedAgentKey
      AND IsCurrent = 1;

    -- ── 4. Build JSON payload ─────────────────────────────────
    DECLARE @JSON NVARCHAR(MAX);
    SET @JSON = N'{' +
        N'"CustomerKey":'     + CAST(@CustomerKey AS NVARCHAR)     + N',' +
        N'"CustomerID":'      + CAST(@CustomerID AS NVARCHAR)      + N',' +
        N'"FullName":"'       + ISNULL(@FullName, '')              + N'",' +
        N'"Email":"'          + ISNULL(@Email, '')                 + N'",' +
        N'"Phone":"'          + ISNULL(@Phone, '')                 + N'",' +
        N'"Budget":'          + CAST(@Budget AS NVARCHAR)          + N',' +
        N'"AssignedAgentKey":'+ CAST(@AssignedAgentKey AS NVARCHAR)+ N',' +
        N'"AgentFullName":"'  + ISNULL(@AgentFullName, '')         + N'",' +
        N'"AgentEmail":"'     + ISNULL(@AgentEmail, '')            + N'"'  +
        N'}';

    -- ── 5. Send HTTP POST to Make.com webhook ─────────────────
    DECLARE @obj      INT;
    DECLARE @response VARCHAR(8000);

    EXEC sp_OACreate     'MSXML2.ServerXMLHTTP', @obj OUT;
    EXEC sp_OAMethod     @obj, 'open', NULL, 'POST', @WebhookURL, false;
    EXEC sp_OAMethod     @obj, 'setRequestHeader', NULL, 'Content-Type', 'application/json';
    EXEC sp_OAMethod     @obj, 'send', NULL, @JSON;
    EXEC sp_OAGetProperty @obj, 'responseText', @response OUT;
    EXEC sp_OADestroy    @obj;

    PRINT @JSON;
    PRINT @response;
END;
