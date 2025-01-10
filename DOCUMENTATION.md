**Documentation: MySQL Database Backup and Recovery Process**



### **1. Objective**
This document provides step-by-step instructions for performing database backup and recovery in MySQL using a shell script. The process ensures that database data is securely backed up and can be restored in case of data loss or corruption.

### **2. Prerequisites**
1. MySQL installed on your system.
2. Access to the MySQL database with appropriate privileges.
3. Bash shell available on the system.
4. Git installed (if pushing scripts to GitHub).

### **3. Backup Script Explanation**

#### **Script:**


#!/bin/bash
DB_NAME="your_database"
USER="root"
PASSWORD="your_password"
BACKUP_DIR="/path/to/backup"
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
BACKUP_FILE="$BACKUP_DIR/$DB_NAME-backup-$TIMESTAMP.sql"

mkdir -p "$BACKUP_DIR"
mysqldump -u "$USER" -p"$PASSWORD" "$DB_NAME" > "$BACKUP_FILE"

if [ $? -eq 0 ]; then
    echo "Backup successful: $BACKUP_FILE"
else
    echo "Backup failed!"
fi
```

#### **Steps to Configure the Script:**
1. **DB_NAME:** mer
2. **USER:** Hafsa
3. **PASSWORD:**Hafsa@03
4. **BACKUP_DIR:** /path/to/backup/home/hafsa/backups

#### **How the Script Works:**
- `TIMESTAMP=$(date +"%Y%m%d%H%M%S")`
- `mkdir -p "$BACKUP_DIR"`: /path/to/backup/home/hafsa/backups
- `mysqldump`: Dumps the MySQL database into a `.sql` file.
- `if [ $? -eq 0 ]; then ... fi`: Checks if the `mysqldump` command was successful and prints an appropriate message.

### **4. Running the Backup Script**
1. Save the script as `mysql_backup.sh`.
2. Open a terminal and navigate to the directory where the script is saved.
3. Run the following command to give execution permission:

   chmod +x mysql_backup.sh

4. Execute the script using:

   ./mysql_backup.sh

5. After successful execution, a backup file will be created in the specified backup directory with a name like:

   /path/to/backup/your_database-backup-20250110161530.sql
 

### **5. Recovery Script Explanation**

#### **Script:**

```bash
#!/bin/bash
DB_NAME="your_database"
USER="root"
PASSWORD="your_password"
BACKUP_FILE="/path/to/backup/your_database-backup-YYYYMMDDHHMMSS.sql"

mysql -u "$USER" -p"$PASSWORD" "$DB_NAME" < "$BACKUP_FILE"

if [ $? -eq 0 ]; then
    echo "Recovery successful from: $BACKUP_FILE"
else
    echo "Recovery failed!"
fi
```

#### **Steps to Configure the Script:**
1. **DB_NAME:** Replace `your_database` with the name of the database you want to restore.
2. **USER:** Replace `root` with your MySQL username.
3. **PASSWORD:** Replace `your_password` with your MySQL password.
4. **BACKUP_FILE:** Replace `/path/to/backup/your_database-backup-YYYYMMDDHHMMSS.sql` with the path to the backup file.

#### **How the Script Works:**
- `mysql -u "$USER" -p"$PASSWORD" "$DB_NAME" < "$BACKUP_FILE"`: Restores the database from the backup file.
- `if [ $? -eq 0 ]; then ... fi`: Checks if the restore command was successful and prints an appropriate message.

### **6. Running the Recovery Script**
1. Save the script as `mysql_recovery.sh`.
2. Open a terminal and navigate to the directory where the script is saved.
3. Run the following command to give execution permission:

   chmod +x mysql_recovery.sh

4. Execute the script using:
  
   ./mysql_recovery.sh

5. If successful, the database will be restored to its previous state based on the backup.

### **7. Summary**
- The **backup script** creates a timestamped `.sql` file of the specified database and stores it in the defined backup directory.
- The **recovery script** restores the database from a specified backup file.
- Proper configuration of the scripts ensures seamless backup and recovery.

### **8. GitHub Integration**
To submit the scripts and documentation to GitHub:

1. **Initialize a Git Repository:**
  
   git init
  
2. **Add the Files:**
   
   git add mysql_backup.sh mysql_recovery.sh README.md
 
3. **Commit the Changes:**

   git commit -m "Initial commit: Added backup and recovery scripts"
 
4. **Push to GitHub:**
   
   git push origin main
 


