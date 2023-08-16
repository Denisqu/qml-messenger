#ifndef CHATSPROXYMODEL_H
#define CHATSPROXYMODEL_H

#include <QObject>
#include <QSortFilterProxyModel>

class ChatsProxyModel : public QSortFilterProxyModel
{
    Q_OBJECT
public:
    ChatsProxyModel(QObject* parent);
    Q_INVOKABLE QVariant getChatModelByIndex(int index);
    Q_INVOKABLE void applyFilter(QString value);
};

#endif // CHATSPROXYMODEL_H
