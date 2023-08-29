#include "qmlutils.h"
#include <QTimer>
#include <QJSValue>

QmlUtils::QmlUtils(QObject* parent) : QObject(parent)
{

}

void QmlUtils::singleShot(int msec, QJSValue callback)
{
    QTimer::singleShot(msec, this, [callback] () mutable {
        if (callback.isCallable())
            callback.call();
    });
}
