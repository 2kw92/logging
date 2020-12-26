# logging
Дз отус по теме сбор и анализ Логов

В ходе дз было раpвернуто 2 машины log и web.       
На сервере web был развернут nginx. Настроен его конфиг для хранения логов      
как локально так и на удаленном сервере.
```
    access_log syslog:server=192.168.50.1:514,tag=nginx_access main;
    error_log syslog:server=192.168.50.1:514,tag=nginx_error notice;
    access_log  /var/log/nginx/access.log  main;
    error_log /var/log/nginx/error.log crit;
```       
Для того чтобы логи с сервера web уходили на удаленный сервер log       
был так же настроен rsyslog. А именно в конфиг была добавлена строка:       
```*.* @@192.168.50.1:514```       

Так же на сервере web был настроен аудит на изменние файлов конфигурации      
nginx. для этого было создано правило audit.rules       

Чтобы лог аудита шел на сервер log установлена утилита audispd-plugins.      
Для нее та же прописаны конфиги.

На серевере log, настроен rsyslog для приема удаленных логов.       
Все файлы конфигов лежат в директории congig_file.        

Для проерки дз необходимо выполнить команду

it clone https://github.com/2kw92/logging && cd logging && vagrant up      
Заходим на сервер log      
```vagrant ssh log``` 
И там выполняем:       
```
ll /var/log/rsyslog/
ll /var/log/rsyslog/web
```      
Вывод на фото:       

![alt text](https://github.com/2kw92/logging/blob/main/1.PNG)      

![alt text](https://github.com/2kw92/logging/blob/main/2.PNG)     

Видим что на сервере log сохраняются как локальные так и логи с удаленного
серевера web.       

Далее зайдем на сервер web      
```vagrant ssh web```       
Там любым удобным способо изменим конфиг nginx и проверим:        
```ausearch -ts today -i | grep nginx```      
Вывод на фото:     
![alt text](https://github.com/2kw92/logging/blob/main/3.PNG)       

Переходим на сервер log и там выполняем:    

```ausearch -ts today -i | grep nginx```       

Вывод:          
![alt text](https://github.com/2kw92/logging/blob/main/4.PNG)      
