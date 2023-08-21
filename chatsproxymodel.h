#ifndef CHATSPROXYMODEL_H
#define CHATSPROXYMODEL_H

#include <QObject>
#include <QSortFilterProxyModel>
#include <chatsmodel.h>
#include <chatmodel.h>

class ChatsProxyModel : public QSortFilterProxyModel
{
    Q_OBJECT
public:
    ChatsProxyModel(QObject* parent);
    Q_INVOKABLE QVariant getChatModelByIndex(int index);
    Q_INVOKABLE void applyFilter(QString value);

    ChatModel* currentlySelectedModel;
    ChatModel* getCurrentlySelectedModel() const;
    void setCurrentlySelectedModel(ChatModel* newCurrentlySelectedModel);
signals:
    void currentlySelectedModelChanged();
private:
    Q_PROPERTY(ChatModel *currentlySelectedModel READ getCurrentlySelectedModel WRITE setCurrentlySelectedModel NOTIFY currentlySelectedModelChanged)
};

#endif // CHATSPROXYMODEL_H
