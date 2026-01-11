---
system: TheYvnHub
technology: monitoring
tags: [monitoring, cpu, ram, performance]
created: 2026-01-10
description: Мониторинг нагрузки CPU и RAM на серверах
---

# Check System Performance

## Описание
Проверка нагрузки процессора и использования оперативной памяти на всех системах.

## TheYvnHub

### Текущая нагрузка
```bash
ssh grem@80.71.224.134 'htop -n 1'
```

### Краткая статистика
```bash
ssh grem@80.71.224.134 'uptime'
```

### Использование RAM
```bash
ssh grem@80.71.224.134 'free -h'
```

### Top процессов по CPU
```bash
ssh grem@80.71.224.134 'ps aux --sort=-%cpu | head -10'
```

### Top процессов по RAM
```bash
ssh grem@80.71.224.134 'ps aux --sort=-%mem | head -10'
```

## TheYvnAI

### Текущая нагрузка
```bash
ssh admin@159.195.65.72 -p 11011 'htop -n 1'
```

### Использование GPU (если есть)
```bash
ssh admin@159.195.65.72 -p 11011 'nvidia-smi'
```

### Статистика Ollama
```bash
ssh admin@159.195.65.72 -p 11011 'ps aux | grep ollama'
```

### Нагрузка от LiteLLM
```bash
ssh admin@159.195.65.72 -p 11011 'ps aux | grep litellm'
```

## WSL

### Системная нагрузка
```bash
uptime
free -h
```

### Температура (если доступно)
```bash
sensors
```

## Windows

### Использование CPU
```powershell
Get-Counter '\Processor(_Total)\% Processor Time' -SampleInterval 1 -MaxSamples 3
```

### Использование RAM
```powershell
Get-Counter '\Memory\Available MBytes'
```

### Top процессов
```powershell
Get-Process | Sort-Object CPU -Descending | Select-Object -First 10 Name, CPU, WorkingSet
```

## Мониторинг в реальном времени

### Скрипт для множественных серверов
```bash
#!/bin/bash
SERVERS=("grem@80.71.224.134" "admin@159.195.65.72 -p 11011")

while true; do
  clear
  echo "=== System Performance Monitor ==="
  echo "$(date)"
  echo ""
  
  for server in "${SERVERS[@]}"; do
    echo "[$server]"
    ssh $server "uptime | awk '{print \$10,\$11,\$12}' && free -h | grep Mem"
    echo ""
  done
  
  sleep 5
done
```

## Оповещения

### Проверка нагрузки
```bash
#!/bin/bash
CPU_THRESHOLD=80
MEM_THRESHOLD=80

check_server() {
  local server=$1
  local cpu_usage=$(ssh $server "top -bn1 | grep 'Cpu(s)' | awk '{print \$2}' | sed 's/%us,//'")
  local mem_usage=$(ssh $server "free | grep Mem | awk '{printf \"%.0f\", \$3/\$2 * 100.0}'")
  
  if (( $(echo "$cpu_usage > $CPU_THRESHOLD" | bc -l) )); then
    echo "HIGH CPU on $server: ${cpu_usage}%"
  fi
  
  if [ $mem_usage -gt $MEM_THRESHOLD ]; then
    echo "HIGH RAM on $server: ${mem_usage}%"
  fi
}

check_server "grem@80.71.224.134"
check_server "admin@159.195.65.72 -p 11011"
```

## Советы
- Используйте `htop` вместо `top` для удобства
- `iostat -x 1` для мониторинга диска
- `netstat -i` для сетевой статистики
- Настройте `prometheus-node-exporter` для продакшн мониторинга
