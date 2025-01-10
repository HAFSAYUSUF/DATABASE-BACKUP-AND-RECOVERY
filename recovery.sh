
DB_NAME="mer"
USER="Hafsa"
PASSWORD="Hafsa@03"
BACKUP_FILE="/path/to/backup/home/hafsa/backups"

mysql -u "$USER" -p"$PASSWORD" "$DB_NAME" < "$BACKUP_FILE"

if [ $? -eq 0 ]; then
    echo "Restore successful!"
else
    echo "Restore failed!"
fi
