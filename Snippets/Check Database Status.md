---
system: TheYvnAI
technology: database
tags: [postgresql, redis, database, status]
created: 2026-01-10
description: Проверка статуса баз данных на TheYvnAI
---

# Check Database Status

## Описание
Проверка статуса и базовая диагностика баз данных PostgreSQL и Redis на TheYvnAI сервере.

## PostgreSQL

### Проверка статуса сервиса
```bash
ssh admin@159.195.65.72 -p 11011 'sudo systemctl status postgresql'
```

### Активные подключения
```bash
ssh admin@159.195.65.72 -p 11011 'sudo -u postgres psql -c "SELECT * FROM pg_stat_activity;"'
```

### Размеры баз данных
```bash
ssh admin@159.195.65.72 -p 11011 'sudo -u postgres psql -c "\l+" | grep -E "(Name|Size)"'
```

### Статистика
```bash
ssh admin@159.195.65.72 -p 11011 'sudo -u postgres psql -c "SELECT datname, numbackends, xact_commit, xact_rollback FROM pg_stat_database;"'
```

## Redis

### Проверка статуса
```bash
ssh admin@159.195.65.72 -p 11011 'sudo systemctl status redis'
```

### Информация о сервере
```bash
ssh admin@159.195.65.72 -p 11011 'redis-cli info'
```

### Использование памяти
```bash
ssh admin@159.195.65.72 -p 11011 'redis-cli info memory | grep used_memory_human'
```

### Количество подключений
```bash
ssh admin@159.195.65.72 -p 11011 'redis-cli info clients'
```

### Тест подключения
```bash
ssh admin@159.195.65.72 -p 11011 'redis-cli ping'
```

## Проверка логов

### PostgreSQL логи
```bash
ssh admin@159.195.65.72 -p 11011 'sudo tail -f /var/log/postgresql/postgresql-*.log'
```

### Redis логи
```bash
ssh admin@159.195.65.72 -p 11011 'sudo tail -f /var/log/redis/redis-server.log'
```

## Резервное копирование

### PostgreSQL backup
```bash
ssh admin@159.195.65.72 -p 11011 'sudo -u postgres pg_dumpall > /backup/postgres-$(date +%Y%m%d).sql'
```

### Redis backup
```bash
ssh admin@159.195.65.72 -p 11011 'redis-cli BGSAVE'
```

## Восстановление

### PostgreSQL restore
```bash
ssh admin@159.195.65.72 -p 11011 'sudo -u postgres psql < /backup/postgres-20260110.sql'
```

### Redis restore
```bash
ssh admin@159.195.65.72 -p 11011 'redis-cli FLUSHALL'
ssh admin@159.195.65.72 -p 11011 'redis-cli --rdb /backup/dump-$(date +%Y%m%d).rdb'
```

## Мониторинг производительности

### PostgreSQL slow queries
```bash
ssh admin@159.195.65.72 -p 11011 'sudo -u postgres psql -c "SELECT query, mean_time, calls FROM pg_stat_statements ORDER BY mean_time DESC LIMIT 10;"'
```

### Redis performance
```bash
ssh admin@159.195.65.72 -p 11011 'redis-cli info stats | grep -E "(instantaneous|total)"
```

## Обслуживание

### Очистка PostgreSQL
```bash
ssh admin@159.195.65.72 -p 11011 'sudo -u postgres vacuumdb --all --analyze'
```

### Очистка Redis
```bash
ssh admin@159.195.65.72 -p 11011 'redis-cli MEMORY PURGE'
```

## Конфигурация

### PostgreSQL config
```bash
ssh admin@159.195.65.72 -p 11011 'sudo cat /etc/postgresql/*/main/postgresql.conf | grep -E "(memory|connection)"'
```

### Redis config
```bash
ssh admin@159.195.65.72 -p 11011 'sudo cat /etc/redis/redis.conf | grep -E "(maxmemory|save)"'
```

## Диагностика проблем

### Проверка блокировок PostgreSQL
```bash
ssh admin@159.195.65.72 -p 11011 'sudo -u postgres psql -c "SELECT blocked_locks.pid AS blocked_pid, blocked_activity.usename AS blocked_user, blocking_locks.pid AS blocking_pid, blocking_activity.usename AS blocking_user, blocked_activity.query AS blocked_statement FROM pg_catalog.pg_locks blocked_locks JOIN pg_catalog.pg_stat_activity blocked_activity ON blocked_activity.pid = blocked_locks.pid JOIN pg_catalog.pg_locks blocking_locks ON blocking_locks.locktype = blocked_locks.locktype JOIN pg_catalog.pg_stat_activity blocking_activity ON blocking_activity.pid = blocking_locks.pid WHERE NOT blocked_locks.granted;"'
```

### Проверка памяти Redis
```bash
ssh admin@159.195.65.72 -p 11011 'redis-cli --bigkeys'
```
