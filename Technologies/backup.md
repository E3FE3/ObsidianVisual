---
system: TheYvnHub
technology: backup
tags: [backup, restore, archive, storage]
created: 2026-01-10
description: Резервное копирование и восстановление данных
---

# Backup and Restore

## Описание
Команды для создания резервных копий и восстановления данных на VPS серверах.

## Типы бэкапов

### 1. Файловый бэкап

#### Полный бэкап директории
```bash
ssh grem@80.71.224.134 'sudo tar -czf /backup/full-$(date +%Y%m%d).tar.gz /var/www /etc/nginx /home/grem'
```

#### Инкрементальный бэкап с rsync
```bash
ssh grem@80.71.224.134 'sudo rsync -av --delete /var/www/ /backup/daily/www/'
```

#### Бэкап с исключениями
```bash
ssh grem@80.71.224.134 'sudo tar -czf /backup/data-$(date +%Y%m%d).tar.gz --exclude=/var/www/cache --exclude=/var/www/logs /var/www'
```

### 2. Бэкап баз данных

#### PostgreSQL
```bash
ssh grem@80.71.224.134 'sudo -u postgres pg_dumpall > /backup/postgres-$(date +%Y%m%d).sql'
ssh grem@80.71.224.134 'sudo -u postgres pg_dump dbname > /backup/dbname-$(date +%Y%m%d).sql'
```

#### MySQL/MariaDB
```bash
ssh grem@80.71.224.134 'mysqldump --all-databases > /backup/mysql-$(date +%Y%m%d).sql'
```

### 3. Системный бэкап

#### Список установленных пакетов
```bash
ssh grem@80.71.224.134 'dpkg --get-selections > /backup/packages-$(date +%Y%m%d).list'
```

#### Конфигурационные файлы
```bash
ssh grem@80.71.224.134 'sudo tar -czf /backup/config-$(date +%Y%m%d).tar.gz /etc /opt/*/config'
```

## Автоматизация бэкапов

### Cron скрипт для ежедневных бэкапов
```bash
#!/bin/bash
# /usr/local/bin/daily-backup.sh

BACKUP_DIR="/backup"
DATE=$(date +%Y%m%d)
RETENTION_DAYS=30

# Создание директории
mkdir -p $BACKUP_DIR/$DATE

# Бэкап файлов
tar -czf $BACKUP_DIR/$DATE/www.tar.gz /var/www
tar -czf $BACKUP_DIR/$DATE/config.tar.gz /etc/nginx /etc/ssh

# Бэкап баз данных
sudo -u postgres pg_dumpall > $BACKUP_DIR/$DATE/postgres.sql

# Удаление старых бэкапов
find $BACKUP_DIR -type d -mtime +$RETENTION_DAYS -exec rm -rf {} \;

# Отправка уведомления
echo "Backup completed: $DATE" | mail -s "Daily Backup Report" admin@example.com
```

### Настройка cron
```bash
# Добавить в crontab
0 2 * * * /usr/local/bin/daily-backup.sh
```

## Удаленное копирование

### Копирование на другой сервер
```bash
scp grem@80.71.224.134:/backup/*.tar.gz backup@remote-server:/backups/
```

### Rsync для удаленной синхронизации
```bash
rsync -avz --delete -e ssh grem@80.71.224.134:/backup/ backup@remote-server:/backups/
```

### Бэкап в облако (rclone)
```bash
# Настройка rclone для S3/Google Drive/etc
rclone copy /backup/ remote:backups/$(date +%Y%m%d)/
```

## Восстановление

### Восстановление файлов
```bash
ssh grem@80.71.224.134 'sudo tar -xzf /backup/20260110/www.tar.gz -C /'
```

### Восстановление PostgreSQL
```bash
ssh grem@80.71.224.134 'sudo -u postgres psql < /backup/20260110/postgres.sql'
```

### Восстановление на новом сервере
```bash
# 1. Установить пакеты
sudo apt-get update
sudo apt-get install $(cat packages.list)

# 2. Восстановить конфигурацию
sudo tar -xzf config.tar.gz -C /

# 3. Перезапустить сервисы
sudo systemctl restart nginx
sudo systemctl restart postgresql
```

## Мониторинг бэкапов

### Проверка целостности
```bash
#!/bin/bash
# Проверка наличия бэкапов за последние 3 дня
for i in {1..3}; do
    DATE=$(date -d "$i days ago" +%Y%m%d)
    if [ ! -f "/backup/$DATE/www.tar.gz" ]; then
        echo "Missing backup for $DATE"
        exit 1
    fi
done
echo "All backups OK"
```

### Размер бэкапов
```bash
du -sh /backup/*/
```

## Специализированные решения

### BorgBackup (дедупликация)
```bash
# Инициализация репозитория
borg init --encryption=repokey /backup/borg

# Создание бэкапа
borg create --stats /backup/borg::$(date +%Y%m%d) /var/www /etc

# Восстановление
borg extract /backup/borg::20260110 var/www/
```

### Restic (современный бэкап)
```bash
# Инициализация
restic init --repo /backup/restic

# Бэкап
restic backup /var/www --repo /backup/restic

# Восстановление
restic restore latest --target / --repo /backup/restic
```

## Резервное копирование Docker/Podman

#### Экспорт контейнеров
```bash
podman export container-name > /backup/container-$(date +%Y%m%d).tar
```

#### Сохранение образов
```bash
podman save -o /backup/images-$(date +%Y%m%d).tar image1 image2
```

#### Бэкап volumes
```bash
podman run --rm -v volume-name:/data -v /backup:/backup ubuntu tar -czf /backup/volume-$(date +%Y%m%d).tar.gz -C /data .
```

## Лучшие практики

1. **3-2-1 правило**: 3 копии, 2 разных носителя, 1 копия удаленно
2. **Тестирование восстановления**: Регулярно проверяйте бэкапы
3. **Шифрование**: Используйте шифрование для чувствительных данных
4. **Документация**: Ведите журнал процедур восстановления
5. **Мониторинг**: Настройте оповещения о неудачных бэкапах
6. **Версионность**: Храните несколько версий бэкапов
7. **Сжатие**: Используйте сжатие для экономии места
8. **Валидация**: Проверяйте целостность бэкапов после создания
