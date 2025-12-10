USE world;

SELECT 
	COUNT(*) AS `Number of Cities`
FROM 
	`City`
WHERE 
	`CountryCode` = 'USA';

SELECT 
	`Name` AS Country, 
	`LifeExpectancy` AS `Highest Life Expectancy`
FROM 
	`Country`
WHERE 
	`LifeExpectancy` = (
    SELECT 
		MAX(`LifeExpectancy`) 
    FROM 
		`Country`);

SELECT 
	`Name`
FROM 
	`City`
WHERE 
	`Name` LIKE '%New%';

SELECT 
	`Name`, 
	`Population`
FROM 
	`City`
ORDER BY 
	`Population` DESC
LIMIT 10;

SELECT 
	`Name`, 
	`Population`
FROM 
	`City`
WHERE 
	`Population` > 2000000;

SELECT 
	`Name`
FROM 
	`City`
WHERE 
	`Name` LIKE 'Be%';

SELECT 
	`Name`, 
    `Population`
FROM 
	`City`
WHERE 
	`Population` between 500000 AND 1000000;

SELECT 
	`Name`
FROM 
	`City`
ORDER BY 
	`Name` ASC;

SELECT 
	`Name`, 
    `Population`
FROM 
	`City`
ORDER BY 
	`Population` DESC
LIMIT 1;

SELECT 
	`Name` AS `City Name`,
    COUNT(1) AS Occurence
FROM 
	`City`
GROUP BY
	`Name`
ORDER BY 
	`Name` ASC;
    
Select 
	`Name`, 
    `Population`
FROM 
	`City`
ORDER BY 
	`Population` ASC
LIMIT 1;

Select 
	`Name`, 
    `Population`
FROM 
	`Country`
ORDER BY 
	`Population` DESC
LIMIT 1;

 SELECT `city`.`Name` AS Capital,
		`Country`.`Name` AS Country
FROM
		`Country`
JOIN 
		`city` ON `Country`.`Capital` = `city`.`ID`
WHERE 
		`Country`.`Name` = 'Spain';

 SELECT `City`.`Name` AS City,
		`Country`.`Continent` AS Continent,
        `Country`.`Name` AS Country
FROM
		`Country`
JOIN 
		`City` ON `Country`.`Code` = `City`.`CountryCode`
WHERE 
		`Country`.`Continent` = 'Europe';

 SELECT `Country`.`Name` AS Country,
		AVG(`city`.`Population`) AS `Average Population`
FROM
		`Country`
JOIN 
		`city` ON `country`.`code` = `city`.`CountryCode`
GROUP BY 
		`CountryCode`;
        
SELECT `city`.`Name` AS `Capital City`,
		`city`.`Population` AS `Capital City Population`,
        `country`.`Name` AS `Country`
FROM 
		`Country`
JOIN 
		`city` ON `country`.`Capital` = `city`.`ID`
ORDER BY 
		country.Name ASC;

SELECT `Name` AS Country,
		Population,
        `SurfaceArea` AS `Surface Area`,
		(`Population` / `SurfaceArea`) AS `Population Density`
FROM 
		`Country`
ORDER BY 
		`Population Density` ASC;

SELECT 
    `city`.`Name` AS City,
	`country`.`Name` AS Country,
    `country`.`Population` AS `Population of Country`,
    (`country`.`GNP` / `country`.`Population`) AS `GDP per Capita`
FROM 
	`Country`
JOIN 
	`city` ON `Country`.`Code` = `CountryCode`
WHERE (`country`.`GNP` / `country`. `Population`) > 
	(SELECT AVG (`country`.`GNP` / `country`.`Population`) 
FROM 
    `country`
)
ORDER BY 
	`GDP per Capita` DESC;

SELECT *
FROM
	`City`
ORDER BY
	`Population` DESC
LIMIT 10 OFFSET 30;