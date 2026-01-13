/* ============================================================
   EDA STEP 02: TIME-BASED ANALYSIS
   ------------------------------------------------------------
   Objective:
   - Analyze how layoffs changed over time.
   - Identify yearly and monthly trends.
   - Detect periods of spikes or declines.
   ============================================================ */
   
   
SELECT * FROM layoffs_staging;

SELECT 
	YEAR(`date`) AS Years , 
    SUM(total_laid_off) AS total_layoff
FROM layoffs_staging
WHERE YEAR(`date`) IS NOT NULL
GROUP BY YEAR(`date`)
ORDER BY Years DESC;

SELECT 
	YEAR(`date`) AS Years , 
    COUNT(total_laid_off) AS total_layoff
FROM layoffs_staging
WHERE YEAR(`date`) IS NOT NULL
GROUP BY YEAR(`date`)
ORDER BY Years DESC;

SELECT 
	MONTH(`date`) AS Months, 
    COUNT(total_laid_off) AS total_layoff
FROM layoffs_staging
WHERE `date` IS NOT NULL
GROUP BY MONTH(`date`)
ORDER BY Months DESC;

SELECT 
	YEAR(`date`) AS YEAR, 
    AVG(total_laid_off) AS total_layoff
FROM layoffs_staging
WHERE `date` IS NOT NULL
GROUP BY YEAR(`date`)
ORDER BY YEAR(`date`) DESC;
