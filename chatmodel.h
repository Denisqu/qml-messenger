#ifndef CHAT_H
#define CHAT_H

#include <QObject>
#include <QAbstractListModel>

class Message;

class ChatModel : public QAbstractListModel
{
    Q_OBJECT

public:
    enum Roles {
        ChatNameRole = Qt::UserRole + 1,
        MsgAuthorRole,
        MsgTextRole,
        MsgDateRole
    };
    explicit ChatModel(const QString& chatName, QObject *parent = nullptr);

    int rowCount(const QModelIndex &parent) const override;
    QVariant data(const QModelIndex &index, int role) const override;
    bool setData(const QModelIndex &index, const QVariant &value, int role) override;
    virtual QHash<int, QByteArray> roleNames() const override;
    Qt::ItemFlags flags(const QModelIndex &index) const override;
    const QString &chatName() const;
    const Message& lastMessage() const;
    void addMessage(const Message&& msg);

private:
    QString mChatName;
    QVector<Message> mMessages;

};

#endif // CHAT_H
