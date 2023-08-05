#ifndef CHATSMODEL_H
#define CHATSMODEL_H

#include "qobjectdefs.h"
#include <QAbstractListModel>
#include <QStringList>

class ChatModel;

class ChatsModel : public QAbstractListModel
{
    Q_OBJECT

public:
    // TODO: реализовать недостающие роли
    enum Roles {
        ChatNameRole = Qt::UserRole + 1,
        LastMsgAuthorRole,
        LastMsgTextRole,
        LastMsgDateRole
    };

    ChatsModel(QObject *parent = 0);

    virtual int rowCount(const QModelIndex &parent) const override;
    virtual QVariant data(const QModelIndex &index, int role) const override;
    virtual QHash<int, QByteArray> roleNames() const override;
    virtual bool setData(const QModelIndex &index, const QVariant &value, int role) override;
    virtual Qt::ItemFlags flags(const QModelIndex &index) const override;

    void fillModelWithTestData();

    // Q_INVOKABLE void add();
    // Q_INVOKABLE void addChat(const ChatModel&& chat);

private:
    // TODO: Здесь хранить лист моделей или сделать как-то по-другому???
    QVector<ChatModel*> mChatModels;
};


#endif // CHATSMODEL_H
