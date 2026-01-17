/* ============================================================
   EDA STEP 04: INDUSTRY-LEVEL ANALYSIS
   ------------------------------------------------------------
   Objective:
   - Identify industries most impacted by layoffs
   - Compare volume, frequency, and severity across industries
   ============================================================ */


-- 1. Total layoffs by industry
SELECT
  industry,
  SUM(total_laid_off) AS total_layoffs
FROM layoffs_staging
WHERE industry IS NOT NULL
GROUP BY industry
ORDER BY total_layoffs DESC;


-- 2. Number of layoff events by industry
SELECT
  industry,
  COUNT(*) AS layoff_events
FROM layoffs_staging
WHERE industry IS NOT NULL
GROUP BY industry
ORDER BY layoff_events DESC;


-- 3. Average layoffs per event by industry
SELECT
  industry,
  ROUND(AVG(total_laid_off), 2) AS avg_layoffs_per_event
FROM layoffs_staging
WHERE industry IS NOT NULL
GROUP BY industry
ORDER BY avg_layoffs_per_event DESC;


-- 4. Industries with significant activity (minimum 5 events)
SELECT
  industry,
  COUNT(*) AS event_count,
  SUM(total_laid_off) AS total_layoffs
FROM layoffs_staging
WHERE industry IS NOT NULL
GROUP BY industry
HAVING COUNT(*) >= 5
ORDER BY total_layoffs DESC;
