---
system: TheYvnHub
technology: nginx
tags: [nginx, web server, reverse proxy, ssl]
created: 2026-01-10
description: Управление Nginx на VPS сервере TheYvnHub
---

# Nginx Management

## Описание
Nginx - веб-сервер и обратный прокси на TheYvnHub для обслуживания веб-приложений.

## Основные команды

### Управление сервисом
```bash
ssh grem@80.71.224.134 'sudo systemctl status nginx'
ssh grem@80.71.224.134 'sudo systemctl restart nginx'
ssh grem@80.71.224.134 'sudo systemctl reload nginx'
```

### Проверка конфигурации
```bash
ssh grem@80.71.224.134 'sudo nginx -t'
```

## Конфигурация

### Основной конфиг
```bash
ssh grem@80.71.224.134 'sudo cat /etc/nginx/nginx.conf'
```

### Сайты
```bash
ssh grem@80.71.224.134 'ls -la /etc/nginx/sites-available/'
ssh grem@80.71.224.134 'ls -la /etc/nginx/sites-enabled/'
```

### Логи
```bash
ssh grem@80.71.224.134 'sudo tail -f /var/log/nginx/access.log'
ssh grem@80.71.224.134 'sudo tail -f /var/log/nginx/error.log'
```

## SSL сертификаты

### Проверка сертификатов
```bash
ssh grem@80.71.224.134 'sudo certbot certificates'
```

### Обновление сертификатов
```bash
ssh grem@80.71.224.134 'sudo certbot renew'
```

### Тест автоматического обновления
```bash
ssh grem@80.71.224.134 'sudo certbot renew --dry-run'
```

## Статистика

### Активные соединения
```bash
ssh grem@80.71.224.134 'curl http://localhost/nginx_status'
```

### Анализ логов
```bash
# Top IP адресов
ssh grem@80.71.224.134 'sudo awk "{print \$1}" /var/log/nginx/access.log | sort | uniq -c | sort -nr | head -10'

# Top страниц
ssh grem@80.71.224.134 'sudo awk "{print \$7}" /var/log/nginx/access.log | sort | uniq -c | sort -nr | head -10'

# Коды ответа
ssh grem@80.71.224.134 'sudo awk "{print \$9}" /var/log/nginx/access.log | sort | uniq -c | sort -nr'
```

## Создание нового сайта

### Шаблон конфигурации
```nginx
server {
    listen 80;
    server_name example.com www.example.com;
    
    # Redirect to HTTPS
    return 301 https://$server_name$request_uri;
}

server {
    listen 443 ssl http2;
    server_name example.com www.example.com;
    
    # SSL certificates
    ssl_certificate /etc/letsencrypt/live/example.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/example.com/privkey.pem;
    
    # SSL hardening
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers ECDHE-RSA-AES256-GCM-SHA512:DHE-RSA-AES256-GCM-SHA512;
    
    # Proxy to application
    location / {
        proxy_pass http://localhost:3000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
    
    # Static files
    location /static/ {
        alias /var/www/example.com/static/;
        expires 1y;
        add_header Cache-Control "public, immutable";
    }
}
```

## Оптимизация

### Настройка кеширования
```nginx
location ~* \.(jpg|jpeg|png|gif|ico|css|js)$ {
    expires 1y;
    add_header Cache-Control "public, immutable";
}
```

### Gzip сжатие
```nginx
gzip on;
gzip_vary on;
gzip_min_length 1024;
gzip_types text/plain text/css application/json application/javascript text/xml application/xml;
```

## Безопасность

### Скрытие версии
```nginx
server_tokens off;
```

### Ограничение запросов
```nginx
limit_req_zone $binary_remote_addr zone=api:10m rate=10r/s;
limit_req zone=api burst=20 nodelay;
```

### Защита от DDoS
```bash
# Блокировка IP по количеству запросов
ssh grem@80.71.224.134 'sudo awk "{print \$1}" /var/log/nginx/access.log | sort | uniq -c | sort -nr | awk "\$1 > 1000 {print \$2}" | sudo xargs -I {} iptables -A INPUT -s {} -j DROP'
```

## Тестирование

### Load test с Apache Bench
```bash
ab -n 1000 -c 10 https://example.com/
```

### Проверка скорости
```bash
curl -w "@curl-format.txt" -o /dev/null -s https://example.com/
```

## Полезные ссылки
- [Официальная документация Nginx](https://nginx.org/en/docs/)
- [Let's Encrypt](https://letsencrypt.org/)
- [SSL Labs Test](https://www.ssllabs.com/ssltest/)
