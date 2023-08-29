#ifndef QMLUTILS_H
#define QMLUTILS_H

#include <QObject>
#include <QJSValue>

class QmlUtils : public QObject
{
    Q_OBJECT

public:
    QmlUtils(QObject* parent = nullptr);
    Q_INVOKABLE void singleShot(int msec, QJSValue callback);
};

#endif // QMLUTILS_H
