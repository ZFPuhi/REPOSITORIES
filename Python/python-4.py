import subprocess
import datetime

def backup_database(database_name, output_dir):
    timestamp = datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
    backup_filename = f"{database_name}_backup_{timestamp}.sql"
    backup_path = f"{output_dir}/{backup_filename}"
    
    try:
        subprocess.run(["pg_dump", "-U", "username", "-d", database_name, "-f", backup_path])
        print("Backup completed successfully!")
    except Exception as e:
        print(f"Backup failed: {e}")

if __name__ == "__main__":
    database_name = "mydb"
    output_dir = "/backup"
    
    backup_database(database_name, output_dir)

# Script that will automate the backup of a database.