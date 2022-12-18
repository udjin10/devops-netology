#!/usr/bin/env python3

import os

bash_command = ["cd ~/Документы/Обучение/pycharm", "git status"]
result_os = os.popen(' && '.join(bash_command)).read()
pathtodir = os.popen(' && '.join([bash_command[0], "pwd"])).read()

#is_change = False #Не используется.
for result in result_os.split('\n'):
    if result.find('изменено') != -1:
        prepare_result = result.replace('\tизменено:      ', '')
        #Добавлен полный путь каталога
        print(str(pathtodir).rstrip('\r\n') + "/" + prepare_result)
        #break #Исправлена ошибка вывода всех файлов.