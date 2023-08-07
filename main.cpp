#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "chatsmodel.h"
#include "chatmodel.h"


int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // expose C++ objects to Qml:
    ChatsModel *chatsModelSingleton = new ChatsModel(&app);
    chatsModelSingleton->fillModelWithTestData();
    qmlRegisterSingletonType<ChatsModel>("org.denisque.Chats", 1, 0, "ChatsModelSingleton",
                                         [chatsModelSingleton](QQmlEngine*, QJSEngine *) -> QObject * {
        return chatsModelSingleton;
    });
    qRegisterMetaType<ChatModel*>("ChatModel*" );
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
