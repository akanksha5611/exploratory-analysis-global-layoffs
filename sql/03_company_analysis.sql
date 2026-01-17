/* ============================================================
   EDA STEP 03: COMPANY-LEVEL ANALYSIS
   ------------------------------------------------------------
   Objective:
   - Identify companies with the highest layoffs.
   - Understand concentration of layoffs across companies.
   ============================================================ */


-- 1. Top companies by total layoffs
SELECT
  company,
  SUM(total_laid_off) AS total_layoffs
FROM layoffs_staging
GROUP BY company
ORDER BY total_layoffs DESC
LIMIT 10;


-- 2. Companies with the highest number of layoff events
SELECT
  company,
  COUNT(*) AS layoff_events
FROM layoffs_staging
GROUP BY company
ORDER BY layoff_events DESC
LIMIT 10;


-- 3. Largest single layoff events
SELECT
  company,
  total_laid_off,
  `date`
FROM layoffs_staging
WHERE total_laid_off IS NOT NULL
ORDER BY total_laid_off DESC
LIMIT 10;


-- 4. Average layoffs per event by company (min 5 events)
SELECT
  company,
  AVG(total_laid_off) AS avg_layoffs_per_event,
  COUNT(*) AS event_count
FROM layoffs_staging
GROUP BY company
HAVING COUNT(*) >= 5
ORDER BY avg_layoffs_per_event DESC
LIMIT 10;
