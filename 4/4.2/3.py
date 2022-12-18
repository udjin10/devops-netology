#!/usr/bin/env python3

import os
import sys

if len(sys.argv) > 1:
    pathtodir = sys.argv[1]
else:
    pathtodir = os.getcwd()

if os.path.isdir(pathtodir):
    bash_command = ["cd " + pathtodir, "git status 2>&1"]
    result_os = os.popen(' && '.join(bash_command)).read()

    for result in result_os.split('\n'):
        if result.find('fatal') != -1:
            print(pathtodir + "- не являтся git-репозиторием")
            break
        if result.find('изменено') != -1:
            prepare_result = result.replace('\tизменено:      ', '')
            print(str(pathtodir).rstrip('\r\n') + "/" + prepare_result)
else:
    print("Нет такой директории.")
