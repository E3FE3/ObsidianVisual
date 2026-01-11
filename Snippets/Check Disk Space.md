---
system: TheYvnHub
technology: monitoring
tags: [monitoring, disk, space, storage]
created: 2026-01-10
description: Проверка дискового пространства на VPS серверах
---

# Check Disk Space

## Описание
Проверка свободного дискового пространства на VPS серверах TheYvnHub и TheYvnAI.

## TheYvnHub

```bash
ssh grem@80.71.224.134 'df -h'
```

### Детальная информация по директориям
```bash
ssh grem@80.71.224.134 'du -sh /var/* /opt/* /home/* 2>/dev/null | sort -hr | head -20'
```

### Проверка inode
```bash
ssh grem@80.71.224.134 'df -i'
```

## TheYvnAI

```bash
ssh admin@159.195.65.72 -p 11011 'df -h'
```

### Проверка использования Ollama моделей
```bash
ssh admin@159.195.65.72 -p 11011 'du -sh ~/.ollama/models/*'
```

### Размер баз данных
```bash
ssh admin@159.195.65.72 -p 11011 'sudo du -sh /var/lib/postgresql /var/lib/redis'
```

## WSL

```bash
df -h
```

### Размер Docker/Podman образов
```bash
sudo du -sh /var/lib/containers
```

## Windows

```powershell
Get-PSDrive -PSProvider FileSystem
```

### Размер крупных папок
```powershell
Get-ChildItem -Path C:\ -Directory -Force -ErrorAction SilentlyContinue | 
  ForEach-Object { 
    $size = (Get-ChildItem -Path $_.FullName -Recurse -File -ErrorAction SilentlyContinue | 
      Measure-Object -Property Length -Sum).Sum / 1GB 
    [PSCustomObject]@{Name=$_.Name; SizeGB="{0:N2}" -f $size} 
  } | Sort-Object SizeGB -Descending | Select-Object -First 10
```

## Оповещения

### Скрипт проверки (Bash)
```bash
#!/bin/bash
THRESHOLD=90
SERVERS=("grem@80.71.224.134" "admin@159.195.65.72 -p 11011")

for server in "${SERVERS[@]}"; do
  usage=$(ssh $server "df / | tail -1 | awk '{print \$5}' | sed 's/%//'")
  if [ $usage -gt $THRESHOLD ]; then
    echo "WARNING: $server disk usage is ${usage}%"
  fi
done
```

## Рекомендации
- Следите за использованием > 80%
- Очищайте логи: `sudo journalctl --vacuum-time=7d`
- Удаляйте старые модели Ollama
- Используйте `ncdu` для интерактивного анализа
