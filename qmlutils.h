#ifndef QMLUTILS_H
#define QMLUTILS_H

#include <QObject>
class QJSValue;

class QmlUtils : QObject
{
    Q_OBJECT

public:
    QmlUtils(QObject* parent = nullptr);
    void singleShot(int msec, QJSValue callback);
};

#endif // QMLUTILS_H
