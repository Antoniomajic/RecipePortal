USE master;

DROP DATABASE IF EXISTS RecipePortal;
GO 

CREATE DATABASE RecipePortal;
GO

USE RecipePortal;
GO

CREATE TABLE users (
    id INT PRIMARY KEY IDENTITY(1,1),
    username NVARCHAR(50) NOT NULL UNIQUE,
    email NVARCHAR(100) NOT NULL UNIQUE,
    password_hash NVARCHAR(255) NOT NULL,
    createdAt DATETIME DEFAULT GETDATE()
);


CREATE TABLE recipes (
    id INT PRIMARY KEY IDENTITY(1,1),
    title NVARCHAR(100) NOT NULL,
    summary NVARCHAR(MAX),
    instructions NVARCHAR(MAX),
    prepTime INT,         -- in minutes
    cookTime INT,         -- in minutes
    servings INT,
    userId INT NOT NULL,
    createdAt DATETIME DEFAULT GETDATE()
);

ALTER TABLE recipes ADD FOREIGN KEY (userId) REFERENCES users(id);

