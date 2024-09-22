-- Retrieve All Regions
SELECT * FROM Regions;

-- Retrieve All Food Items
SELECT * FROM FoodItems;

-- Retrieve All Food Data Records
SELECT * FROM FoodData;

-- Retrieve All Aid Distribution Records
SELECT * FROM AidDistribution;

-- Find Regions with a Population Greater Than 400,000
SELECT RegionName, Population 
FROM Regions 
WHERE Population > 400000;

-- Find Food Items in the 'Grain' Category
SELECT FoodName 
FROM FoodItems 
WHERE FoodCategory = 'Grain';

-- Find Aid Distribution Records in September 2024
SELECT * 
FROM AidDistribution 
WHERE DateDistributed BETWEEN '2024-09-01' AND '2024-09-30';

-- Retrieve Food Availability and Consumption by Region
SELECT r.RegionName, fi.FoodName, fd.DateRecorded, fd.Availability, fd.Consumption 
FROM FoodData fd
JOIN Regions r ON fd.RegionID = r.RegionID
JOIN FoodItems fi ON fd.FoodItemID = fi.FoodItemID;

-- Retrieve Aid Distribution Details with Region and Food Names
SELECT r.RegionName, fi.FoodName, ad.DateDistributed, ad.QuantityDistributed 
FROM AidDistribution ad
JOIN Regions r ON ad.RegionID = r.RegionID
JOIN FoodItems fi ON ad.FoodItemID = fi.FoodItemID;

-- Total Food Availability by Region
SELECT r.RegionName, SUM(fd.Availability) AS TotalAvailability 
FROM FoodData fd
JOIN Regions r ON fd.RegionID = r.RegionID
GROUP BY r.RegionName;

-- Average Food Consumption by Food Category
SELECT fi.FoodCategory, AVG(fd.Consumption) AS AverageConsumption 
FROM FoodData fd
JOIN FoodItems fi ON fd.FoodItemID = fi.FoodItemID
GROUP BY fi.FoodCategory;

-- Total Quantity of Aid Distributed by Region
SELECT r.RegionName, SUM(ad.QuantityDistributed) AS TotalAidDistributed 
FROM AidDistribution ad
JOIN Regions r ON ad.RegionID = r.RegionID
GROUP BY r.RegionName;

-- Top 3 Regions with the Highest Food Consumption
SELECT r.RegionName, SUM(fd.Consumption) AS TotalConsumption 
FROM FoodData fd
JOIN Regions r ON fd.RegionID = r.RegionID
GROUP BY r.RegionName
ORDER BY TotalConsumption DESC
LIMIT 3;

-- Find Regions with Food Consumption Higher Than Aid Distributed
SELECT r.RegionName, SUM(fd.Consumption) AS TotalConsumption, SUM(ad.QuantityDistributed) AS TotalAidDistributed 
FROM FoodData fd
JOIN AidDistribution ad ON fd.RegionID = ad.RegionID AND fd.FoodItemID = ad.FoodItemID
JOIN Regions r ON fd.RegionID = r.RegionID
GROUP BY r.RegionName
HAVING SUM(fd.Consumption) > SUM(ad.QuantityDistributed);

-- Monthly Food Availability Trends (Aggregated)
SELECT DATE_FORMAT(fd.DateRecorded, '%Y-%m') AS Month, fi.FoodCategory, SUM(fd.Availability) AS TotalAvailability 
FROM FoodData fd
JOIN FoodItems fi ON fd.FoodItemID = fi.FoodItemID
GROUP BY Month, fi.FoodCategory
ORDER BY Month;

-- Average Food Availability and Consumption by Region
SELECT r.RegionName, AVG(fd.Availability) AS AvgAvailability, AVG(fd.Consumption) AS AvgConsumption 
FROM FoodData fd
JOIN Regions r ON fd.RegionID = r.RegionID
GROUP BY r.RegionName;

-- Percentage of Total Aid Distributed by Food Category
SELECT fi.FoodCategory, 
       SUM(ad.QuantityDistributed) AS TotalDistributed,
       (SUM(ad.QuantityDistributed) / (SELECT SUM(QuantityDistributed) FROM AidDistribution) * 100) AS Percentage
FROM AidDistribution ad
JOIN FoodItems fi ON ad.FoodItemID = fi.FoodItemID
GROUP BY fi.FoodCategory;

-- Find Regions with Availability Below Average
SELECT r.RegionName, fd.Availability 
FROM FoodData fd
JOIN Regions r ON fd.RegionID = r.RegionID
WHERE fd.Availability < (SELECT AVG(Availability) FROM FoodData);
