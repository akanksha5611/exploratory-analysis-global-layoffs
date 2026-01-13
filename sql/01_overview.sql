/* ============================================================
   EDA STEP 01: DATASET OVERVIEW
   ------------------------------------------------------------
   Objective:
   - Understand the size, structure, and time coverage
     of the cleaned layoffs dataset.
   - No data modification is performed in this step.
   ============================================================ */


-- Preview data structure (exploratory only)
-- SELECT * FROM layoffs_staging;


-- 1. Total number of layoff events
SELECT COUNT(*) AS total_events
FROM layoffs_staging;


-- 2. Date range covered by the dataset
SELECT
  MIN(`date`) AS earliest_date,
  MAX(`date`) AS latest_date
FROM layoffs_staging;


-- 3. Total layoffs recorded in the dataset
SELECT
  SUM(total_laid_off) AS total_layoffs
FROM layoffs_staging;


-- 4. Summary statistics for layoffs per event
SELECT
  AVG(total_laid_off) AS avg_layoffs,
  MIN(total_laid_off) AS min_layoffs,
  MAX(total_laid_off) AS max_layoffs
FROM layoffs_staging;


-- 5. Number of unique companies, industries, and countries
SELECT
  COUNT(DISTINCT company)  AS unique_companies,
  COUNT(DISTINCT industry) AS unique_industries,
  COUNT(DISTINCT country)  AS unique_countries
FROM layoffs_staging;
