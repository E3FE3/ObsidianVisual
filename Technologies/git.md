---
system: WSL
technology: git
tags: [git, version control, repository]
created: 2026-01-10
description: Git команды для управления репозиториями
---

# Git Operations

## Описание
Основные команды Git для управления репозиториями в WSL окружении.

## Базовые операции

### Инициализация репозитория
```bash
git init
git init --bare  # для удаленного репозитория
```

### Клонирование
```bash
git clone https://github.com/user/repo.git
git clone git@github.com:user/repo.git  # по SSH
git clone -b develop https://github.com/user/repo.git  # конкретная ветка
```

### Статус и изменения
```bash
git status
git diff
git diff --staged
git diff file.txt
```

### Добавление и коммиты
```bash
git add .
git add file.txt
git add *.py
git commit -m "Описание изменений"
git commit -am "Описание изменений"  # add + commit для отслеживаемых файлов
```

## Ветки

### Работа с ветками
```bash
git branch  # список веток
git branch -r  # удаленные ветки
git branch -a  # все ветки
git branch new-feature  # создать ветку
git checkout new-feature  # переключиться
git checkout -b hotfix  # создать и переключиться
git branch -d feature  # удалить ветку
git branch -D feature  # принудительно удалить
```

### Слияние
```bash
git checkout main
git merge feature-branch
git merge --no-ff feature-branch  # без fast-forward
```

## Удаленные репозитории

### Настройка
```bash
git remote -v
git remote add origin https://github.com/user/repo.git
git remote set-url origin git@github.com:user/repo.git
```

### Push и Pull
```bash
git push origin main
git push -u origin feature-branch  # отслеживать ветку
git push origin --delete feature-branch  # удалить удаленную ветку
git pull origin main
git pull --rebase origin main  # с rebase
git fetch origin  # получить изменения без слияния
```

## История

### Просмотр истории
```bash
git log
git log --oneline
git log --graph --oneline --all
git log -p -1  # последний коммит с изменениями
git log --since="1 week ago"
git log --author="John Doe"
```

### Поиск в истории
```bash
git log --grep="fix"
git log -- file.txt  # история файла
git log -S"function"  # по коду
```

## Отмена изменений

### Отмена локальных изменений
```bash
git checkout -- file.txt  # отменить изменения в файле
git reset HEAD file.txt  # убрать из staging
git clean -fd  # удалить незакоммиченные файлы
```

### Отмена коммитов
```bash
git reset --soft HEAD~1  # отменить коммит, оставить изменения
git reset --hard HEAD~1  # отменить коммит и изменения
git revert HEAD  # создать коммит отмены
```

## Работа с тегами

### Управление тегами
```bash
git tag  # список тегов
git tag v1.0.0  # создать тег
git tag -a v1.0.0 -m "Version 1.0.0"  # аннотированный тег
git push origin v1.0.0  # отправить тег
git push origin --tags  # все теги
git tag -d v1.0.0  # удалить локальный тег
```

## stash

### Временное сохранение
```bash
git stash  # сохранить изменения
git stash save "message"  # с сообщением
git stash list  # список stash
git stash pop  # восстановить и удалить
git stash apply  # восстановить
git stash drop  # удалить
git stash clear  # все
```

## Решение проблем

### Конфликты слияния
```bash
git status  # посмотреть конфликты
# редактировать файлы с конфликтами
git add .
git commit  # завершить слияние
git merge --abort  # отменить слияние
```

### Изменить последний коммит
```bash
git commit --amend  # изменить сообщение
git commit --amend --no-edit  # добавить файлы
```

### Изменить историю (осторожно!)
```bash
git rebase -i HEAD~3  # интерактивный rebase
git filter-branch --tree-filter 'rm -f passwords.txt' -- --all  # удалить файл из истории
```

## Полезные алиасы

```bash
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.cm commit
git config --global alias.unstage 'reset HEAD --'
git config --global alias.last 'log -1 HEAD'
git config --global alias.visual '!gitk'
```

## Git hooks

### Пример pre-commit hook
```bash
#!/bin/sh
# Запускать тесты перед коммитом
npm test
if [ $? -ne 0 ]; then
    echo "Tests failed"
    exit 1
fi
```

## Git Flow

### Установка
```bash
sudo apt install git-flow
```

### Основные команды
```bash
git flow init
git flow feature start new-feature
git flow feature finish new-feature
git flow release start v1.0.0
git flow release finish v1.0.0
git flow hotfix start fix-bug
git flow hotfix finish fix-bug
```

## Советы
- Используйте `.gitignore` для исключения файлов
- Пишите осмысленные сообщения коммитов
- Делайте частые маленькие коммиты
- Используйте ветки для новой функциональности
- Регулярно делайте push для бэкапа
