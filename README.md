🎥 Movie Recommendation and Rating System

This project is a SQL-based movie recommendation platform built with Python and SQLite. It allows users to search, rate, and recommend movies while also exploring personalized suggestions. Additionally, a Jupyter Notebook provides exploratory data analysis (EDA) on user ratings, genres, and recommendations.

🚀 Project Overview

The system helps users discover new movies through community-driven recommendations. It includes:

A SQLite database with normalized schema and sample data

A command-line interface (CLI) built in Python

A Jupyter Notebook for data analysis

Entity-Relationship Diagram (ERD) included for database design reference

📅 Features

User profiles with preferences and viewing history

Movie catalog searchable by title, genre, director, and actor

Ratings and real-time average score updates

Recommendations with many-to-many tracking

Watchlist functionality

Python CLI for user interaction

📊 Entity Relationship Diagram (ERD)



📓 Database Description

🔍 Purpose

This database allows users to recommend and rate movies, track preferences, and discover new content based on community feedback. The goal is to foster discovery through shared user experience.

📚 Background

With thousands of movies on streaming platforms, this project offers a focused way to get personalized recommendations through user-generated data and shared ratings.

⚖️ Application Requirements

User Profiles: Store personal preferences, past ratings.

Movie Search and Recommendations: Search by title, genre, etc., and receive custom suggestions.

Rating System: Star ratings (1-5), averaged and updated live.

Many-to-Many Relationships: Users can rate and recommend multiple movies.

Watchlist Management: Maintain a future-viewing list with reminders.

Web-based Architecture (Future Plan): Designed to be scalable to a web app.

🚧 Due Diligence

Metadata: Pulled from public sources (e.g., IMDb), no copyrighted content.

User Content: Original reviews only, no scraping from other sites.

Privacy: Compliant with GDPR; user data remains secure.

🔹 Sample Data

Sample Movie Entry

Title: Inception
Director: Christopher Nolan
Genre: Science Fiction, Thriller
Release Year: 2010
Average Rating: 4.8/5
User Recommendations:
 - User1: "Inception is a mind-bending thriller with incredible visuals."
 - User2: "Great movie! A must-watch for sci-fi fans."

Sample User Profile

Username: movieBuff123
Favorite Genres: Science Fiction, Action
Movies Rated:
 - Inception (5/5)
 - The Matrix (4.5/5)
 - Interstellar (5/5)
Watchlist:
 - The Godfather
 - Pulp Fiction

Sample Rating System

Inception Ratings:
 - User1: 5/5
 - User2: 4.5/5
 - User3: 5/5

📊 Exploratory Data Analysis

Conducted using a Jupyter Notebook (analysis.ipynb), this includes:

Average ratings per genre and director

Number of movies by genre

Most recommended movies

Bar plots visualizing user behavior

📂 Files

movies.db: SQLite database

movies.sql: SQL script for schema & data

main.py: CLI app to interact with the DB

analysis.ipynb: Data analysis notebook

ERD_and_SchemaDiagram.png: Entity Relationship Diagram

README.md: Project overview and documentation
