![logo]

# Архивный пакс Orthanc для работы с S3 + PostgreSQL

Требуется реализовать:

+ минимальное колличество данных на хостовой ВМ.
+ использование s3 для основного размещения снимков
+ использование внешней базы данных
+ реализация через ci\cd

## Структура 

```
orthanc-arhive-s3
|
|__app\                             # Папка приложения
|  |_lib\                           # Библиотеки для плагинов
|  |_plugin\                        # Внешние плагины
|  |_orthanc.secret.json            # Блоки конфигурации orthanc   
|__.                                # Файлы для запуска
```

## Подготовка 

1. Собрать проект находясь в корне

```
git clone <URL>.git
docker-compose build
```
2. Запуск проекта

```
docker-compose up -d
```

### Плагин для работы с S3 AWS S3 plugin

[AWS S3 plugin](https://book.orthanc-server.com/plugins/object-storage.html#id1)

Подготовка для сборки плагина.

```bash
sudo apt-get update && sudo apt-get install -y build-essential g++
mkdir ~/aws
cd ~/aws

git clone https://github.com/aws/aws-sdk-cpp.git

mkdir -p ~/aws/builds/aws-sdk-cpp
cd ~/aws/builds/aws-sdk-cpp

cmake -DBUILD_ONLY="s3;transfer" -DCMAKE_BUILD_TYPE=Debug ~/aws/aws-sdk-cpp
make -j 4
make install
```

## Help URL
---
[Orthanc Book](https://book.orthanc-server.com/index.html)

[Docker Hub](https://hub.docker.com/r/jodogne/orthanc-plugins)

---
[logo]: https://book.orthanc-server.com/_images/orthanc.png