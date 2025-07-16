-- Drop existing tables to start fresh
DROP TABLE IF EXISTS Rating;
DROP TABLE IF EXISTS Recommendation;
DROP TABLE IF EXISTS Watchlist;
DROP TABLE IF EXISTS Movie;
DROP TABLE IF EXISTS User;

-- Create tables
CREATE TABLE User (
    User_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Username TEXT NOT NULL,
    Password TEXT NOT NULL
);

CREATE TABLE Movie (
    Movie_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Title TEXT NOT NULL,
    Genre TEXT,
    Director TEXT,
    Release_Year INTEGER,
    Average_Rating REAL
);

CREATE TABLE Rating (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    User_ID INTEGER,
    Movie_ID INTEGER,
    Rating REAL,
    FOREIGN KEY (User_ID) REFERENCES User(User_ID),
    FOREIGN KEY (Movie_ID) REFERENCES Movie(Movie_ID)
);

CREATE TABLE Watchlist (
    User_ID INTEGER,
    Movie_ID INTEGER,
    Added_Date TEXT,
    PRIMARY KEY (User_ID, Movie_ID),
    FOREIGN KEY (User_ID) REFERENCES User(User_ID),
    FOREIGN KEY (Movie_ID) REFERENCES Movie(Movie_ID)
);

CREATE TABLE Recommendation (
    User_ID INTEGER,
    Movie_ID INTEGER,
    Recommendation_Type TEXT,
    PRIMARY KEY (User_ID, Movie_ID),
    FOREIGN KEY (User_ID) REFERENCES User(User_ID),
    FOREIGN KEY (Movie_ID) REFERENCES Movie(Movie_ID)
);

-- Insert data into User table
INSERT INTO User (Username, Password)
VALUES
    ('movieBuff123', 'password1'),
    ('filmFanatic', 'password2'),
    ('cinemaLover', 'password3'),
    ('blockbusterKing', 'password4'),
    ('indieWatcher', 'password5');

-- Insert data into Movie table
INSERT INTO Movie (Title, Genre, Director, Release_Year)
VALUES
    ('Inception', 'Science Fiction', 'Christopher Nolan', 2010),
    ('The Matrix', 'Action', 'Lana Wachowski, Lilly Wachowski', 1999),
    ('The Shawshank Redemption', 'Drama', 'Frank Darabont', 1994),
    ('The Godfather', 'Crime', 'Francis Ford Coppola', 1972),
    ('Pulp Fiction', 'Crime', 'Quentin Tarantino', 1994),
    ('Interstellar', 'Science Fiction', 'Christopher Nolan', 2014),
    ('Parasite', 'Thriller', 'Bong Joon Ho', 2019),
    ('The Dark Knight', 'Action', 'Christopher Nolan', 2008),
    ('Forrest Gump', 'Drama', 'Robert Zemeckis', 1994),
    ('The Avengers', 'Action', 'Joss Whedon', 2012);

-- Insert data into Rating table
INSERT INTO Rating (User_ID, Movie_ID, Rating)
VALUES
    (1, 1, 4.8), -- movieBuff123 rates Inception
    (1, 2, 4.7), -- movieBuff123 rates The Matrix
    (2, 3, 5.0), -- filmFanatic rates The Shawshank Redemption
    (2, 4, 4.5), -- filmFanatic rates The Godfather
    (3, 5, 4.0), -- cinemaLover rates Pulp Fiction
    (3, 6, 4.8), -- cinemaLover rates Interstellar
    (4, 7, 5.0), -- blockbusterKing rates Parasite
    (4, 8, 4.9), -- blockbusterKing rates The Dark Knight
    (5, 9, 4.5), -- indieWatcher rates Forrest Gump
    (5, 10, 4.3); -- indieWatcher rates The Avengers

-- Insert data into Watchlist table
INSERT INTO Watchlist (User_ID, Movie_ID, Added_Date)
VALUES
    (1, 3, '2024-11-01'), -- movieBuff123 adds The Shawshank Redemption
    (1, 4, '2024-11-02'), -- movieBuff123 adds The Godfather
    (2, 6, '2024-11-03'), -- filmFanatic adds Interstellar
    (3, 7, '2024-11-04'), -- cinemaLover adds Parasite
    (4, 9, '2024-11-05'), -- blockbusterKing adds Forrest Gump
    (5, 1, '2024-11-06'); -- indieWatcher adds Inception

-- Insert data into Recommendation table
INSERT INTO Recommendation (User_ID, Movie_ID, Recommendation_Type)
VALUES
    (1, 6, 'Based on Genre'), -- movieBuff123 recommends Interstellar
    (2, 7, 'Top Rated'), -- filmFanatic recommends Parasite
    (3, 8, 'Based on Director'), -- cinemaLover recommends The Dark Knight
    (4, 2, 'Action Fans'), -- blockbusterKing recommends The Matrix
    (5, 5, 'Classic Cinema'); -- indieWatcher recommends Pulp Fiction
