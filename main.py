import sqlite3

# Connect to the database
def connect_db():
    try:
        conn = sqlite3.connect('movies.db')
        return conn
    except sqlite3.Error as e:
        print(f"Error connecting to database: {e}")
        return None

# Validate numeric input
def get_valid_number(prompt):
    while True:
        try:
            value = int(input(prompt))
            return value
        except ValueError:
            print("Invalid input. Please enter a valid number.")

# Display all movies
def display_movies(conn):
    cursor = conn.cursor()
    cursor.execute("SELECT Movie_ID, Title, Genre, Director, Release_Year FROM Movie")
    rows = cursor.fetchall()
    if rows:
        print("\nAvailable Movies:")
        for row in rows:
            print(f"{row[0]}. {row[1]} ({row[4]}), Genre: {row[2]}, Director: {row[3]}")
    else:
        print("\nNo movies found in the database.")
    print()

# Search for movies by title
def search_movies(conn):
    title = input("Enter a movie title or part of it: ").strip()
    cursor = conn.cursor()
    cursor.execute("SELECT Movie_ID, Title, Genre, Director, Release_Year FROM Movie WHERE Title LIKE ?", (f"%{title}%",))
    rows = cursor.fetchall()
    if rows:
        print(f"\nSearch Results for '{title}':")
        for row in rows:
            print(f"{row[0]}. {row[1]} ({row[4]}), Genre: {row[2]}, Director: {row[3]}")
    else:
        print(f"No movies found matching your search for '{title}'.")
    print()

# View all ratings by a user
def view_user_ratings(conn):
    user_id = get_valid_number("Enter User ID to view their ratings: ")
    cursor = conn.cursor()
    cursor.execute("""
        SELECT Movie.Title, Rating.Rating
        FROM Rating
        JOIN Movie ON Rating.Movie_ID = Movie.Movie_ID
        WHERE Rating.User_ID = ?
    """, (user_id,))
    rows = cursor.fetchall()
    if rows:
        print(f"\nRatings by User ID {user_id}:")
        for row in rows:
            print(f"{row[0]} - {row[1]} stars")
    else:
        print(f"No ratings found for User ID {user_id}.")
    print()

# Rate a movie
def rate_movie(conn):
    user_id = get_valid_number("Enter your User ID: ")
    movie_id = get_valid_number("Enter the Movie ID to rate: ")
    rating = get_valid_float("Enter your rating (1-5): ")

    if rating < 1 or rating > 5:
        print("Rating must be between 1 and 5.")
        return

    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Rating WHERE User_ID = ? AND Movie_ID = ?", (user_id, movie_id))
    if cursor.fetchone():
        print("You have already rated this movie. Use another option to update the rating.")
    else:
        try:
            cursor.execute("INSERT INTO Rating (User_ID, Movie_ID, Rating) VALUES (?, ?, ?)", (user_id, movie_id, rating))
            conn.commit()
            print("Rating added successfully!")
        except sqlite3.Error as e:
            print(f"Error adding rating: {e}")

# Validate floating-point input
def get_valid_float(prompt):
    while True:
        try:
            value = float(input(prompt))
            return value
        except ValueError:
            print("Invalid input. Please enter a valid number.")

# View all movies in a user's watchlist
def view_user_watchlist(conn):
    user_id = get_valid_number("Enter User ID to view their watchlist: ")
    cursor = conn.cursor()
    try:
        cursor.execute("""
            SELECT Movie.Title, Movie.Genre, Movie.Director, Movie.Release_Year
            FROM Watchlist
            JOIN Movie ON Watchlist.Movie_ID = Movie.Movie_ID
            WHERE Watchlist.User_ID = ?
        """, (user_id,))
        rows = cursor.fetchall()
        if rows:
            print(f"\nWatchlist for User ID {user_id}:")
            for row in rows:
                print(f"{row[0]} ({row[3]}), Genre: {row[1]}, Director: {row[2]}")
        else:
            print(f"No movies found in the watchlist for User ID {user_id}.")
    except sqlite3.Error as e:
        print(f"Error retrieving watchlist: {e}")
    print()

# Main menu
def main():
    conn = connect_db()
    if conn is None:
        print("Failed to connect to the database. Exiting.")
        return

    while True:
        print("\n--- Movie Recommendation System ---")
        print("1. Display All Movies")
        print("2. Search for a Movie by Title")
        print("3. View User Ratings")
        print("4. Rate a Movie")
        print("5. View User Watchlist") 
        print("6. Exit")
        
        choice = input("Enter your choice: ").strip()
        if choice == '1':
            display_movies(conn)
        elif choice == '2':
            search_movies(conn)
        elif choice == '3':
            view_user_ratings(conn)
        elif choice == '4':
            rate_movie(conn)
        elif choice == '5':  
            view_user_watchlist(conn)
        elif choice == '6':
            print("Goodbye!")
            break
        else:
            print("Invalid choice. Please try again.")

    conn.close()

if __name__ == "__main__":
    main()
