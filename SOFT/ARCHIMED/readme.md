Архимед - сервер медицинских изображений, РИС-система. 

Сервер не в домене по причине используемой редакции WindowsServer.

Включает в себя PACS-сервер для приема изображений, СУБД FireBird, Сервер управления, сервис интеграции с МИС Ариадна.
Также настроена отправка принятых исследования в областной ПАКС.

#### Известные ошибки

Массово не доходят исследования в областной ПАКС - проверить сеть, посоветоваться с Владимиром из МОКБ.
Не приходят в Архимед назначения с Ариадны - проверить сервисы интеграции. Убедиться, что в Аридне правильно формлено напрвлении, и что лаборант отправляет необходимое направление (если вручную)


#### Монитринг

Для мониторинга написан [pacs_exporter] (https://github.com/yashamayurov/pacs_exporter), который сравнивает за сутки

#### Прием и пересылка изображений

Для приема изображений задачей Windows запускается приложение vtPACSServer в нескольких экземплярах, расположенные в папках на диске E.

Список задач:

Экземпляры PACS-сервера:
- vt107
- vt105
- vt108
- vt109
- vtPACSServer
- 106
- vt110

Сервер управления:
- amControlServer

Сервис интеграции с МИС:
- ArchimedIntegr


#### Интеграция с МИС "Ариадна"
РИС "Архимед" имеет интеграцию с МИС "Ариадна" - передача назначений из МИС, отправка описания и заключения из Архимед в Ариадну. Из списка назначений формируется WorkList забираемый диагностическими аппаратами.

##### Отправки направлений 
По умолчанию отправка назначений осуществлется в диагностическим модулем при помощи кнопки "Подтвердить", Денис написал Job для автоматического подтверждения раз в 5 минут.

#### WorkList
WorkList разделяется на аппараты при помощи AET.

#### Интеграция со стороны Ариадна
За интеграцию со стороны Ариадны отвечает сервис PandoraBox. 

#### Сетевые интерфейсы сервера
Подключен физически двумя сетевыми портами объединенными в NIC, на котром создано два виртуальных интерфейса: 1 - Смотрит в подсеть Dicom, 2 - смотрит в сеть МОКБ.
