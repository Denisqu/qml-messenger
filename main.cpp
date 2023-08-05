#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "chatsmodel.h"
#include "chatmodel.h"

// 1) Добавить модель из C++ в qml:
// https://doc.qt.io/qt-5/qtquick-modelviewsdata-cppmodels.html
// https://habr.com/ru/articles/302428/
// https://scythe-studio.com/en/blog/how-to-integrate-qml-and-c-expose-object-and-register-c-class-to-qml
// 2) Добавить выбор чата через модель (selectionModel)
// 3) Добавить отображение чата

// 23.07.23: Нужно создать модель чата (+) и модель чатов (+)

// 04.08.23:
// 1) Изменить message.h, чтобы он подходил под https://doc.qt.io/qt-5/qtqml-cppintegration-topic.html

// 05.08.23:
// 0) Почитать про Qt Implicitly Sharing (https://doc.qt.io/qt-6/implicit-sharing.html) (+)
// 1) Отобразить список чатов (+)
// 2) Разобраться как в QML работать с моделями с вложенностью (-)
// https://stackoverflow.com/questions/44747723/qt-qml-model-within-a-model-and-accesible-via-qml
// 3) Отобразить сообщения из чатов в qml (-)


int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // expose C++ objects to Qml:
    ChatsModel *chatsModel = new ChatsModel(&app);
    chatsModel->fillModelWithTestData();
    engine.rootContext()->setContextProperty("chatsModel", chatsModel);
    //qmlRegisterType<ChatModel>("ChatModule", 1, 0, "Chat");
    //qmlRegisterType<Message>("ChatModule", 1, 0, "Message");

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
