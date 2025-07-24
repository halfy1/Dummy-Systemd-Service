## Dummy-Systemd-Service
Сервис запускает простой Bash-скрипт, который каждые 10 секунд пишет сообщение в лог-файл, симулируя работу фонового приложения.  

## Установка и запуск

### 1. Копирование скрипта и установка прав

```bash
sudo cp dummy.sh /usr/local/bin/dummy.sh
sudo chmod +x /usr/local/bin/dummy.sh
```
### 2. Копирование systemd unit-файла
```bash
sudo cp dummy.service /etc/systemd/system/dummy.service
```
### 3. Обновление конфигурации systemd
```bash
sudo systemctl daemon-reload
```
### 4. Запуск и включение автозапуска
```bash
sudo systemctl start dummy
sudo systemctl enable dummy
```
## Управление сервисом
| Действие                 | Команда                        |
| ------------------------ | ------------------------------ |
| **Запуск**               | `sudo systemctl start dummy`   |
| **Остановка**            | `sudo systemctl stop dummy`    |
| **Перезапуск**           | `sudo systemctl restart dummy` |
| **Статус**               | `sudo systemctl status dummy`  |
| **Включить автозапуск**  | `sudo systemctl enable dummy`  |
| **Отключить автозапуск** | `sudo systemctl disable dummy` |


## Логи
Все сообщения записываются в файл: /var/log/dummy-service.log
Для просмотра последних сообщений в реальном времени:

```bash
tail -f /var/log/dummy-service.log
```
Для просмотра через journalctl:

```bash
sudo journalctl -u dummy -f
```
## Удаление
Чтобы полностью удалить сервис:

```bash
sudo systemctl stop dummy
sudo systemctl disable dummy
sudo rm /etc/systemd/system/dummy.service
sudo rm /usr/local/bin/dummy.sh
sudo rm /var/log/dummy-service.log
sudo systemctl daemon-reload
```

## Пример работы
После запуска сервиса лог-файл /var/log/dummy-service.log будет содержать строки вида:
```bash
Wed Jul 24 21:40:01 UTC 2025 Dummy service is running...
Wed Jul 24 21:40:11 UTC 2025 Dummy service is running...
```