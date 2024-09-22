-- Section 3: Insert Sample Data
-- Insert Sample Data into Regions
INSERT INTO Regions (RegionName, Population)
VALUES 
('North Region', 500000), 
('South Region', 300000),
('East Region', 450000),
('West Region', 550000),
('Central Region', 600000),
('Northeast Region', 350000),
('Southeast Region', 400000),
('Northwest Region', 320000),
('Southwest Region', 270000),
('Coastal Region', 500000);

-- Insert Sample Data into FoodItems
INSERT INTO FoodItems (FoodName, FoodCategory)
VALUES 
('Wheat', 'Grain'), 
('Rice', 'Grain'),
('Maize', 'Grain'),
('Beans', 'Legume'),
('Lentils', 'Legume'),
('Potatoes', 'Vegetable'),
('Tomatoes', 'Vegetable'),
('Onions', 'Vegetable'),
('Milk', 'Dairy'),
('Chicken', 'Meat'),
('Fish', 'Meat'),
('Salad', 'Oils');

-- Insert Sample Data into FoodData
INSERT INTO FoodData (RegionID, FoodItemID, DateRecorded, Availability, Consumption)
VALUES 
(1, 1, '2024-09-01', 12000, 9000), 
(2, 2, '2024-09-01', 8000, 7000),
(3, 3, '2024-09-01', 9000, 8000),
(4, 4, '2024-09-01', 3000, 2500),
(5, 5, '2024-09-01', 4000, 3200),
(6, 6, '2024-09-01', 6000, 5500),
(7, 7, '2024-09-01', 7000, 6600),
(8, 8, '2024-09-01', 5000, 4700),
(9, 9, '2024-09-01', 3500, 3000),
(10, 10, '2024-09-01', 4500, 4000);

-- Insert more to provide variety
INSERT INTO FoodData (RegionID, FoodItemID, DateRecorded, Availability, Consumption)
VALUES 
(1, 2, '2024-09-02', 10000, 8500), 
(2, 3, '2024-09-02', 6000, 5500),
(3, 4, '2024-09-02', 2500, 2200),
(4, 5, '2024-09-02', 3500, 3000),
(5, 6, '2024-09-02', 7000, 6800),
(6, 7, '2024-09-02', 8000, 7500),
(7, 8, '2024-09-02', 6000, 5800),
(8, 9, '2024-09-02', 4000, 3700),
(9, 10, '2024-09-02', 5000, 4800),
(10, 1, '2024-09-02', 1800, 1600);

-- Insert Sample Data into AidDistribution
INSERT INTO AidDistribution (RegionID, DateDistributed, FoodItemID, QuantityDistributed)
VALUES 
(1, '2024-09-10', 1, 2500), 
(2, '2024-09-11', 2, 1800),
(3, '2024-09-12', 3, 2000),
(4, '2024-09-13', 4, 1500),
(5, '2024-09-14', 5, 1600),
(6, '2024-09-15', 6, 1900),
(7, '2024-09-16', 7, 1800),
(8, '2024-09-17', 8, 1700),
(9, '2024-09-18', 9, 1600),
(10, '2024-09-19', 10, 1500);

-- Insert more to provide variety
INSERT INTO AidDistribution (RegionID, DateDistributed, FoodItemID, QuantityDistributed)
VALUES 
(1, '2024-09-20', 2, 2300), 
(2, '2024-09-21', 3, 1900),
(3, '2024-09-22', 4, 1700),
(4, '2024-09-23', 5, 1800),
(5, '2024-09-24', 6, 2100),
(6, '2024-09-25', 7, 2000),
(7, '2024-09-26', 8, 1900),
(8, '2024-09-27', 9, 1850),
(9, '2024-09-28', 10, 1750),
(10, '2024-09-29', 1, 1600);

