#include "chat.h"

ChatModel::ChatModel(QString chatName, QObject *parent)
    : QObject{parent},
      mChatName(chatName),
      mMessages{}
{

}

const QString &ChatModel::chatName() const
{
    return mChatName;
}

void ChatModel::setChatName(const QString &newChatName)
{
    if (mChatName == newChatName)
        return;
    mChatName = newChatName;
    emit chatNameChanged();
}

const QList<Message> &ChatModel::messages() const
{
    return mMessages;
}

void ChatModel::setMessages(const QList<Message> &newMessages)
{
    if (mMessages == newMessages)
        return;
    mMessages = newMessages;
    emit messagesChanged();
}

void ChatModel::newMessage(const Message &newMessage)
{
    mMessages.append(newMessage);
}
