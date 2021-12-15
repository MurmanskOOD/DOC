Oracle Client необходим для запуска в Windows клиентских приложений МИС Ариадна, написанных на языке C++.
Используем 19 версию.
Для установки необходимо произвести следущие действия:

1. Инсталлятор \\fs1\inst$\ORACLE\NT_193000_client
2. Запустить инсталлятор, выбрать тип установки Custom
3. Изменить путь Oracle Base установки на C:\Oracle
4. В списке компонентов выбрать Oracle Call Interface (OCI), Oracle Net, OLEDB
5. Скопировать tnsnames.ora в папку C:\Oracle\product\19.0.0\client_1\network\admin