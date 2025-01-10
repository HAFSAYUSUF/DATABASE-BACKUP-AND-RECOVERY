#!/bin/bash
DB_NAME="mer"
USER="Hafsa"
PASSWORD="Hafsa@03"
BACKUP_DIR="/home/hafsa/backups"
TIMESTAMP=$("20250110161530
")
BACKUP_FILE="$BACKUP_DIR/$DB_NAME-backup-$TIMESTAMP.sql"

mkdir -p "$BACKUP_DIR"
mysqldump -u "$USER" -p"$PASSWORD" "$DB_NAME" > "$BACKUP_FILE"

if [ $? -eq 0 ]; then
    echo "Backup successful: $BACKUP_FILE"
else
    echo "Backup failed!"
fi
