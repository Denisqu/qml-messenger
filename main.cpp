#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "chatsproxymodel.h"
#include "chatsmodel.h"
#include "chatmodel.h"
#include "message.h"
#include "qmlutils.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication::setAttribute(Qt::AA_UseOpenGLES);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // expose C++ objects to Qml:
    QmlUtils *qmlUtils = new QmlUtils(&app);
    ChatsModel *chatsModelSingleton = new ChatsModel(&app);
    chatsModelSingleton->fillModelWithTestData();
    ChatsProxyModel *chatsProxyModelSingleton = new ChatsProxyModel(&app);
    chatsProxyModelSingleton->setSourceModel(chatsModelSingleton);
    chatsProxyModelSingleton->setFilterRole(ChatModel::Roles::ChatNameRole);


    qRegisterMetaType<ChatModel*>("ChatModel*");
    qRegisterMetaType<ChatsModel*>("ChatsModel*");
    qmlRegisterSingletonType<ChatsProxyModel>("org.denisque.Chats", 1, 0, "ChatsProxyModelSingleton",
                                         [chatsProxyModelSingleton](QQmlEngine*, QJSEngine *) -> QObject * {
        return chatsProxyModelSingleton;
    });
    qmlRegisterSingletonType<QmlUtils>("org.denisque.QmlUtils", 1, 0, "QmlUtils",
                                         [qmlUtils](QQmlEngine*, QJSEngine *) -> QObject * {
        return qmlUtils;
    });

    qmlRegisterType<ChatModel>("org.denisque.Chats", 1, 0, "ChatModel");

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
