#ifndef CHAT_H
#define CHAT_H

#include <QObject>
#include <QDate>
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
    explicit ChatModel(const QString& chatName = "", QObject *parent = nullptr);
    //explicit ChatModel(const QString& chatName = "", QObject *parent = nullptr);

    int rowCount(const QModelIndex &parent) const override;
    QVariant data(const QModelIndex &index, int role) const override;
    bool setData(const QModelIndex &index, const QVariant &value, int role) override;
    virtual QHash<int, QByteArray> roleNames() const override;
    Qt::ItemFlags flags(const QModelIndex &index) const override;
    const QString &chatName() const;
    const Message& lastMessage() const;
    void addMessage(const Message&& msg);

    const QDate &chatOwnerLastTimeOnline() const;
    void setChatOwnerLastTimeOnline(const QDate &newChatOwnerLastTimeOnline);

    void setChatName(const QString &newChatName);

signals:
    void chatOwnerLastTimeOnlineChanged();

    void chatNameChanged();

private:
    QString mChatName;
    QDate mChatOwnerLastTimeOnline;
    QVector<Message> mMessages;


    Q_PROPERTY(QDate chatOwnerLastTimeOnline READ chatOwnerLastTimeOnline WRITE setChatOwnerLastTimeOnline NOTIFY chatOwnerLastTimeOnlineChanged)
    Q_PROPERTY(QString chatName READ chatName WRITE setChatName NOTIFY chatNameChanged)
};

//Q_DECLARE_METATYPE(ChatModel);

#endif // CHAT_H
