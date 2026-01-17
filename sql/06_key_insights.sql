/* ============================================================
   EDA STEP 06: KEY INSIGHTS & MAJOR CONTRIBUTORS
   ------------------------------------------------------------
   Objective:
   - Identify the main drivers of layoffs across companies,
     industries, countries, time, and company stage.
   ============================================================ */


-- 1. Top 10 companies by total layoffs (company-wise contribution)
SELECT
  company,
  SUM(total_laid_off) AS company_layoffs,
  ROUND(
    SUM(total_laid_off) * 100.0 /
    (SELECT SUM(total_laid_off) FROM layoffs_staging),
    2
  ) AS pct_of_total_layoffs
FROM layoffs_staging
WHERE total_laid_off IS NOT NULL
GROUP BY company
ORDER BY company_layoffs DESC
LIMIT 10;


-- 2. Top 10 industries by total layoffs
SELECT
  industry,
  SUM(total_laid_off) AS total_layoffs
FROM layoffs_staging
WHERE industry IS NOT NULL
GROUP BY industry
ORDER BY total_layoffs DESC
LIMIT 10;


-- 3. Top 10 countries by total layoffs
SELECT
  country,
  SUM(total_laid_off) AS total_layoffs
FROM layoffs_staging
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total_layoffs DESC
LIMIT 10;


-- 4. Years with highest layoffs
SELECT
  YEAR(`date`) AS year,
  SUM(total_laid_off) AS total_layoffs
FROM layoffs_staging
WHERE `date` IS NOT NULL
GROUP BY YEAR(`date`)
ORDER BY total_layoffs DESC
LIMIT 10;


-- 5. Layoffs by company stage
SELECT
  stage,
  SUM(total_laid_off) AS total_layoffs
FROM layoffs_staging
WHERE stage IS NOT NULL
GROUP BY stage
ORDER BY total_layoffs DESC;
