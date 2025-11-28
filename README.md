# DBT_project
Add VsCode.
Обновить индекс пакетов и установить зависимости: 
sudo apt update
sudo apt install software-properties-common apt-transport-https wget

Импортировать ключ Microsoft GPG: 
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -

Включить репозиторий VS Code: 
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

Установить пакет VS Code: 
sudo apt install code

Команда для создания виртуального окружения
sudo apt install python3.12-venv
sudo apt install python3-virtualenv
virtualenv venv
source venv/bin/activate

После того как активировали виртуальное окружение,
нужно установить необходимые зависимости для DBT
pip install dbt-core dbt-postgres - Эта команда установит
сразу пакет dbt а также адаптер для postgresql
Как установлены все пакеты можно запускать настройку
вашего dbt проекта командой dbt init

Нужно сохранить файлы csv в папку seeds
Загрузить файлы в БД:
dbt seed

Выйти из виртуального окружения
deactivate

Postgresql server

Обновить ОС до актуальной версии: 
sudo apt update && sudo apt upgrade -y. 

Лучше удалить старые версии СУБД, чтобы не было конфликта при установке.
Установить PostgreSQL в официальном репозитории: 
sudo apt install postgresql postgresql-contrib. 

Пакет postgresql содержит саму систему управления, а postgresql-contrib — дополнительные модули и утилиты, которые расширяют функции PostgreSQL.
После установки проверить статус службы: 
sudo systemctl status postgresql. 

Если СУБД не запустилась автоматически, сделать это вручную: 
sudo systemctl start postgresql.

Включить автоматический запуск при старте системы: 
sudo systemctl enable postgresql.
