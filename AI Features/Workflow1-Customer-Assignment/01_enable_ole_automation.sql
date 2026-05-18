-- ============================================================
-- Proplytics DWH | Workflow 1 - Customer Assignment
-- Step 1: Enable Ole Automation Procedures
-- ============================================================
-- Required to allow SQL Server to make HTTP requests to Make.com
-- Run this once on the SQL Server instance.
-- ============================================================

EXEC sp_configure 'show advanced options', 1;
RECONFIGURE;

EXEC sp_configure 'Ole Automation Procedures', 1;
RECONFIGURE;
