-- ============================================================
-- Proplytics DWH | Workflow 1 - Customer Assignment
-- Step 2: Add AssignedAgentKey column to Dim_Customer
-- ============================================================
-- Dim_Customer had no field to store the assigned agent.
-- This column is populated automatically by the Trigger + SP.
-- ============================================================

ALTER TABLE Dim_Customer
ADD AssignedAgentKey INT NULL;
