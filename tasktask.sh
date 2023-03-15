#!/bin/bash
# Определяем путь до корневой папки
read -p "Введите путь до корневой директории (например, /var/www): " root_dir
# Создаем папки для всех пользователей системы
for user in $(awk -F':' '{if ( $3>=500 ) print $1 }' /etc/passwd)
do
         user_dir="$root_dir/$user"
         if [ ! -d "$user_dir" ]; then
                 mkdir "$user_dir"
                 chown $user:$user "$user_dir"
                 chmod 755 "$user_dir"
                 echo "Папка $user_dir создана и настроены права доступа" | tee -a output.log
         else
                 echo "Папка $user_dir уже существует" | tee -a output.log
         fi
done
echo "Скрипт выполнен успешно" | tee -a output.log
exit 0
