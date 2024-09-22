-- Schema Title: Food_Distribution_System
-- Description: This schema tracks food supplies, distribution, and regions affected by food insecurity.

-- Section 1:Create Database
CREATE DATABASE Food_Distribution_System;
USE Food_Distribution_System;
SHOW DATABASES;

-- Section 2:Create Tables
-- Create Regions table
CREATE TABLE Regions (
    RegionID INT AUTO_INCREMENT PRIMARY KEY,
    RegionName VARCHAR(100) NOT NULL,
    Population INT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Food Items table
CREATE TABLE FoodItems (
    FoodItemID INT AUTO_INCREMENT PRIMARY KEY,
    FoodName VARCHAR(100) NOT NULL,
    FoodCategory VARCHAR(50)
);

-- Create Food Data Table
CREATE TABLE FoodData (
    FoodDataID INT AUTO_INCREMENT PRIMARY KEY,
    RegionID INT NOT NULL,
    FoodItemID INT NOT NULL,
    DateRecorded DATE NOT NULL,
    Availability INT, -- In units or kilograms
    Consumption INT, -- In units or kilograms
    FOREIGN KEY (RegionID) REFERENCES Regions(RegionID),
    FOREIGN KEY (FoodItemID) REFERENCES FoodItems(FoodItemID)
);

-- Create Aid Distribution Table
CREATE TABLE AidDistribution (
    AidID INT AUTO_INCREMENT PRIMARY KEY,
    RegionID INT NOT NULL,
    DateDistributed DATE NOT NULL,
    FoodItemID INT NOT NULL,
    QuantityDistributed INT, -- In units or kilograms
    FOREIGN KEY (RegionID) REFERENCES Regions(RegionID),
    FOREIGN KEY (FoodItemID) REFERENCES FoodItems(FoodItemID)
);
