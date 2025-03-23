import mysql.connector
import subprocess

def download_mysql_database(host, user, password, database, output_file):
    """
    Connects to a remote MySQL database and exports it to a SQL file using mysqldump.

    :param host: The hostname or IP address of the MySQL server.
    :param user: The username to connect to the MySQL server.
    :param password: The password for the MySQL user.
    :param database: The name of the database to export.
    :param output_file: The path to the output SQL file.
    """
    try:
        # Connect to the MySQL server to verify credentials
        connection = mysql.connector.connect(
            host=host,
            user=user,
            password=password,
            database=database
        )
        print("Connected to MySQL server successfully.")
        connection.close()

        # Use mysqldump to export the database
        command = [
            'mysqldump',
            f'-h{host}',
            f'-u{user}',
            f'-p{password}',
            database,
            '--result-file', output_file
        ]

        # Run the command
        subprocess.run(command, check=True)
        print(f"Database '{database}' has been exported to '{output_file}'.")

    except mysql.connector.Error as err:
        print(f"Error connecting to MySQL: {err}")
    except subprocess.CalledProcessError as err:
        print(f"Error running mysqldump: {err}")
        
#usage
download_mysql_database(
    host="localhost",
    user="root",
    password="",
    database="transcript_management",
    output_file="backup.sql"
)