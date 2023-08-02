#include "chatsmodel.h"
#include "chatmodel.h"

ChatsModel::ChatsModel(QObject *parent):
    QAbstractListModel(parent),
    mChatModels()
{}

int ChatsModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid()) {
        return 0;
    }

    return mChatModels.size();
}

QVariant ChatsModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid()) {
        return QVariant();
    }

    switch (role) {
    case ChatNameRole:
        return mChatModels.at(index.row()).chatName();
    case LastMsgRole:
        return mChatModels.at(index.row()).lastMessage();
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> ChatsModel::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();
    roles[ChatNameRole] = "chatNameRole";
    roles[LastMsgRole] = "lastMsgRole";

    return roles;
}

void ChatsModel::add()
{
    /*
    beginInsertRows(QModelIndex(), m_data.size(), m_data.size());
    m_data.append("new");
    endInsertRows();

    m_data[0] = QString("Size: %1").arg(m_data.size());
    QModelIndex index = createIndex(0, 0, static_cast<void *>(0));
    emit dataChanged(index, index);
    */
}

void ChatsModel::addChat(const ChatModel&& chat)
{
    beginInsertRows(QModelIndex(), mChatModels.size(), mChatModels.size());
    mChatModels.append(chat);
    endInsertRows();
}

bool ChatsModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (!index.isValid()) {
        return false;
    }

    switch (role) {
    case ChatNameRole:
        return false;
    case LastMsgRole:
        return false;
    default:
        return false;
    }

    emit dataChanged(index, index, QVector<int>() << role);
    return true;
}

Qt::ItemFlags ChatsModel::flags(const QModelIndex &index) const
{
    if (!index.isValid())
        return Qt::ItemIsEnabled;

    return QAbstractListModel::flags(index) | Qt::ItemIsEditable;
}
