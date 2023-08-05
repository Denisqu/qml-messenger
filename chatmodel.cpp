#include "chatmodel.h"
#include "message.h"

ChatModel::ChatModel(const QString& chatName, QObject *parent)
    : QAbstractListModel{parent},
      mChatName(chatName),
      mMessages{}
{}

const QString &ChatModel::chatName() const
{
    return mChatName;
}

const Message &ChatModel::lastMessage() const
{
    return mMessages.constLast();
}

void ChatModel::addMessage(const Message &&msg)
{
    // TODO: правильно ли здесь всё сделано? Не будет ли утечки памяти?
    // TODO: написать позже beginInsertRows
    mMessages.push_back(msg);
    // написать позже endInsertRows
}

int ChatModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid()) {
        return 0;
    }

    return mMessages.count();
}

QVariant ChatModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid()) {
        return QVariant();
    }

    switch (role) {
    case ChatNameRole:
        return mChatName;
    case MsgAuthorRole:
        return mMessages.at(index.row()).author();
    case MsgTextRole:
        return mMessages.at(index.row()).text();
    case MsgDateRole:
        return mMessages.at(index.row()).date();
    default:
        return QVariant();
    }
}

bool ChatModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (!index.isValid()) {
        return false;
    }

    switch (role) {
    case ChatNameRole:
        mChatName = value.value<QString>();
        break;
    case MsgAuthorRole:
        mMessages[index.row()].setAuthor(value.value<QString>());
        break;
    case MsgTextRole:
        mMessages[index.row()].setText(value.value<QString>());
    case MsgDateRole:
        mMessages[index.row()].setDate(value.value<QDate>());
    default:
        return false;
    }

    emit dataChanged(index, index, QVector<int>() << role);

    return true;
}

QHash<int, QByteArray> ChatModel::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();
    roles[ChatNameRole] = "chatNameRole";
    roles[MsgAuthorRole] = "msgAuthorRole";
    roles[MsgTextRole] = "msgTextRole";
    roles[MsgDateRole] = "msgDateRole";
    return roles;
}

Qt::ItemFlags ChatModel::flags(const QModelIndex &index) const
{
    if (!index.isValid())
        return Qt::ItemIsEnabled;

    return QAbstractListModel::flags(index) | Qt::ItemIsEditable;
}
