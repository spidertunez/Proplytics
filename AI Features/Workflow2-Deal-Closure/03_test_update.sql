-- ============================================================
-- Proplytics DWH | Workflow 2 - Deal Closure Notification
-- Step 3: Test UPDATE
-- ============================================================
-- Run this to test the workflow end-to-end.
-- After running, check:
--   1. DealStatus updated to 'Completed' in Fact_Sales
--   2. Manager receives email with deal details
-- ============================================================

-- ── Find an Active deal to test with ─────────────────────────
SELECT TOP 5
    fs.DealID,
    fs.DealStatus,
    c.FullName  AS CustomerName,
    a.FullName  AS AgentName,
    fs.TotalAmount,
    fs.CommissionAmount
FROM Fact_Sales fs
JOIN Dim_Customer c ON fs.CustomerKey = c.CustomerKey AND c.IsCurrent = 1
JOIN Dim_Agent    a ON fs.AgentKey    = a.AgentKey    AND a.IsCurrent = 1
WHERE fs.DealStatus = 'Active'
ORDER BY fs.TotalAmount DESC;

-- ── Test UPDATE (replace DealID with value from query above) ──
-- UPDATE Fact_Sales
-- SET DealStatus = 'Completed'
-- WHERE DealID = <DealID>;

-- ── Verify ────────────────────────────────────────────────────
-- SELECT DealID, DealStatus FROM Fact_Sales WHERE DealID = <DealID>;

-- ── Rollback for repeated testing ────────────────────────────
-- Step 1: revert to Active
-- UPDATE Fact_Sales SET DealStatus = 'Active' WHERE DealID = <DealID>;
-- Step 2: set to Completed again to re-trigger
-- UPDATE Fact_Sales SET DealStatus = 'Completed' WHERE DealID = <DealID>;
