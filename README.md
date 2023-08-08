# Лог задач

22.07.23:
1. Добавить модель из C++ в qml:
https://doc.qt.io/qt-5/qtquick-modelviewsdata-cppmodels.html
https://habr.com/ru/articles/302428/
https://scythe-studio.com/en/blog/how-to-integrate-qml-and-c-expose-object-and-register-c-class-to-qml


23.07.23:
1. Нужно создать модель чата (+) и модель чатов (+)

04.08.23:
1. Изменить message.h, чтобы он подходил под https://doc.qt.io/qt-5/qtqml-cppintegration-topic.html (+)

05.08.23:
1. Почитать про Qt Implicitly Sharing (https://doc.qt.io/qt-6/implicit-sharing.html) (+)
2. Отобразить список чатов (+)


06.08.23
1. Изменить "setContextProperty" на singleton (+)
https://raymii.org/s/articles/Qt_QML_Integrate_Cpp_with_QML_and_why_ContextProperties_are_bad.html
https://github.com/Furkanzmc/QML-Coding-Guide#ci-2-use-singleton-for-common-api-access
2. Добавить readme.md в этот проект (+)
3. Создать selectionModel на QML (+):
 http://doc.crossplatform.ru/qt/4.3.5/model-view-selection.html, https://stackoverflow.com/questions/41566115/purpose-and-usage-of-itemselectionmodel-in-qml 
4. Разобраться как работь с сигналами-слотами в QML (+)
https://het.as.utexas.edu/HET/Software/html/qmlevents.html


07.08.23:
1. Написать делегат ChatDelegate.qml (+)
2. Написать Chat.qml компонент (+)
3. Разобраться как в QML работать с моделями с вложенностью (+)
https://stackoverflow.com/questions/44747723/qt-qml-model-within-a-model-and-accesible-via-qml
https://stackoverflow.com/questions/51439714/qt-nested-model-views
4. Отобразить сообщения из чатов в qml (+)
5. Исправить ошибки в выводе программы (+)

08.08.23:
1. Пофиксить сломанный UI после ресайза окна. Сделать так чтобы highlight совпадал с подсвечиваемым предметом (+)
2. Ошибка read-access-violation когда прыгаю по разным чатам (+)
https://embeddeduse.com/2018/04/02/qml-engine-deletes-c-objects-still-in-use/
3. Добавить компонент с поиском по чатам как в Telegram (-)
4. Добавить компонент с отправкой сообщений как в Telegram (-)
