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

09.08.23:
1. Пофиксить наезжание ChatList на ScrollBar (+)
https://forum.qt.io/topic/86744/content-going-above-of-my-listview-while-scrolling
2. Добавить компонент с поиском по чатам как в Telegram (+)

10.08.23
1. Добавить геометрическую фигуру на фоне сообщения в чате как в Telegram (+)


13.08.23
1. Добавить окантовку списку сообщений (+)
2. Пофиксить окантовку компонента отправки сообщений (+)
3. Добавить компонент с отправкой сообщений как в Telegram (+)
4. Добавить фон в сообщения чата в виде градиента (+)
5. Сделать инпут текста серым, если инпут сейчас не в фокусе (+)
6. Добавить инвизибл футер, хэдер в ChatList, Chat (+)

15.08.23
1. Сделать сообщения чата такими же, как в Postlink (+)

16.08.23
1. Добавить сброс фокуса с инпутов, если тыкнуть в любом месте (+)
2. Разнообразить тестовые данные для сообщений в чате путём чтения текстового файла (+)
3. Добавить многостроковый текст в сообщения чата (+)
3. Добавить поиск по имени чатов, написать прокси-модель QSortFilterProxyModel https://doc.qt.io/qt-5/qsortfilterproxymodel.html (+)

21.08.23
1. Изучить пример MVC-архитектуры от Felgo: https://felgo.com/doc/felgo-appdemos-basicapp-example/, https://github.com/FelgoSDK/BasicApp-Example (+)
2. Добавить поле currentlySelectedChat с байндингом в chatsproxymodel.cpp (+)

22.08.23
1. Доделать ChatStatusBar.qml и chatmodel.cpp (+)
1. Добавить набор svg иконок в приложение https://icons8.com/icon/set/interface-search/material-outlined (+)
1. Добавить иконку-кнопку для статус бара с поиском (+)

23.08.23
1. Сделать высоту ChatStatusBar побольше, центрировать дочерние элементы (+)
1. Добавить простые hover (+)
1. Выделить кнопку-иконку в отдельный generic компонент (+)  
1. Добавить в проект https://github.com/oKcerG/SortFilterProxyModel (+)

24.04.23
1. Добавить всплывающий SearchBar для чата (-)
1. Добавить поиск по загруженным локально сообщениям, написать прокси-модель (-)
1. Убрать мелкие недостатки в UI (-)
2. Убрать все binding-loop'ы (-)
3. Отрефакторить qml файлы (-)
4. Отрефакторить C++ файлы (-)
5. Посмотреть видео на темы: дизайн api для мессенджера, микросервисная архитектура (-)
6. Начать разрабатывать API для мессенджера на FastAPI, используя протоколы из SS.L3, SS.RDMP? (ЗДЕСЬ БУДЕТ СПИСОК ПРОТОКОЛОВ) (-)
