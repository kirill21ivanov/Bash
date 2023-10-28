#!/bin/bash

    echo -e "\033[32mВведите путь до файла:\033[0m"
    read pyt
    if [[ -e $pyt ]] 
    then 
    echo -e "\033[32mФайл прошел проверку!\033[0m"
    else
    echo -e "\033[31mНевозможно найти файл! Файл $pyt несуществует.\033[0m"
    exit 0;
    fi

    w=$(ls -l $pyt | awk '{print $5}')
    m=$(date '+%Y-%m-%d %H:%M')
    l=$(shasum -a 256 $pyt| awk '{print $1}')
    
    echo -e "\033[32mВведите строку для поиска:\033[0m"
    read search

    if grep -q $search $pyt; then
    echo -e "\033[33mЭта строка есть в файле\033[0m"
    else
    echo -e "\033[32m Этой строки нет в файле. Ты хотел меня обмануть??? \033[0m"
    exit 0;
    fi 

    echo -e "\033[33mВведите строку для изменения:\033[0m"
    read replace
    
    sed -i -e "s/$search/$replace/g" $pyt | awk '{print $1}'
    echo " src/"$pyt " - " $w " - " $m  " - " $l "- sha256" | tee -a files.log
    
    echo -e "\033[32mУСПЕШНО!\033[0m Данные были обновлены!"
    
#
#    echo -e "\033[41m\033[30m - чёрный;\033[0m\n\033[0m\033[31m - красный;\n\033[32m - зелёный;\n\033[33m - желтый;\n\033[34m - синий;\n\033[35m - фиолетовый;\n\033[36m - голубой;\n\033[37m - серый\n"
