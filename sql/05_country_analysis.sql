/* ============================================================
   EDA STEP 05: COUNTRY-LEVEL ANALYSIS
   ------------------------------------------------------------
   Objective:
   - Identify countries most impacted by layoffs.
   - Compare layoff volume, frequency, and severity by country.
   ============================================================ */


-- 1. Total layoffs by country
SELECT
  country,
  SUM(total_laid_off) AS total_layoffs
FROM layoffs_staging
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total_layoffs DESC;


-- 2. Number of layoff events by country
SELECT
  country,
  COUNT(*) AS layoff_events
FROM layoffs_staging
WHERE country IS NOT NULL
GROUP BY country
ORDER BY layoff_events DESC;


-- 3. Average layoffs per event by country
SELECT
  country,
  ROUND(AVG(total_laid_off), 2) AS avg_layoffs_per_event
FROM layoffs_staging
WHERE country IS NOT NULL
GROUP BY country
ORDER BY avg_layoffs_per_event DESC;


-- 4. Countries with significant activity (minimum 5 events)
SELECT
  country,
  COUNT(*) AS event_count,
  SUM(total_laid_off) AS total_layoffs
FROM layoffs_staging
WHERE country IS NOT NULL
GROUP BY country
HAVING COUNT(*) >= 5
ORDER BY total_layoffs DESC;
