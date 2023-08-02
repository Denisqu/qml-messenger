#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "chatsmodel.h"
#include "chat.h"
#include "message.h"

// 1) Добавить модель из C++ в qml:
// https://doc.qt.io/qt-5/qtquick-modelviewsdata-cppmodels.html
// https://habr.com/ru/articles/302428/
// https://scythe-studio.com/en/blog/how-to-integrate-qml-and-c-expose-object-and-register-c-class-to-qml
// 2) Добавить выбор чата через модель (selectionModel)
// 3) Добавить отображение чата
// 23.07.23: Нужно создать модель чата (-) и модель чатов (-)

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // expose C++ objects to Qml:
    ChatsModel *testModel = new ChatsModel(&app);
    engine.rootContext()->setContextProperty("testModel", testModel);
    qmlRegisterType<ChatModel>("ChatModule", 1, 0, "Chat");
    qmlRegisterType<Message>("ChatModule", 1, 0, "Message");

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
