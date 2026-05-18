-- ============================================================
-- Proplytics DWH | Workflow 1 - Customer Assignment
-- Step 5: Test INSERT
-- ============================================================
-- Run this to test the workflow end-to-end.
-- After running, check:
--   1. AssignedAgentKey is populated in Dim_Customer
--   2. Agent receives email notification
-- ============================================================

-- ── Test INSERT ───────────────────────────────────────────────
INSERT INTO Dim_Customer (
    CustomerID, FirstName, LastName,
    Email, Phone, RegistrationDateKey, Budget,
    PreferredPropertyTypeKey, PreferredLocationKey,
    EffectiveDate, ExpiryDate, IsCurrent
)
VALUES (
    9999, 'Test', 'Customer',
    'test.customer@gmail.com', '01000000000',
    20260516, 500000,
    1, 4004,
    '2026-05-16', '9999-12-31', 1
);

-- ── Verify AssignedAgentKey was populated ─────────────────────
SELECT
    c.CustomerID,
    c.FullName        AS CustomerName,
    c.AssignedAgentKey,
    a.FullName        AS AgentName,
    a.Email           AS AgentEmail
FROM Dim_Customer c
LEFT JOIN Dim_Agent a ON c.AssignedAgentKey = a.AgentKey
WHERE c.CustomerID = 9999;

-- ── Cleanup (optional) ────────────────────────────────────────
-- DELETE FROM Dim_Customer WHERE CustomerID = 9999;
