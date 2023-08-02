#include "chatsmodel.h"
#include "chatmodel.h"

ChatsModel::ChatsModel(QObject *parent):
    QAbstractListModel(parent),
    m_data()
{
    m_data.append("size");
    this->add();
    this->add();
}

int ChatsModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid()) {
        return 0;
    }

    return m_data.size();
}

QVariant ChatsModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid()) {
        return QVariant();
    }

    switch (role) {
    case NameRole:
        return mChats.at(index.row());
    case LastMsgRole:
        return mChats.at(index.row()).messages();
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> ChatsModel::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();
    roles[MessagesRole] = "messagesRole";
    roles[LastMsgRole] = "lastMsgRole";
    roles[NameRole] = "nameRole";

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

void ChatsModel::addChat(ChatModel chat)
{
    beginInsertRows(QModelIndex(), mChats.size(), mChats.size());

}

bool ChatsModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (!index.isValid()) {
        return false;
    }

    switch (role) {
    case NameRole:
        return false;   // This property can not be set
    case LastMsgRole:
        m_data[index.row()] = value.toString();
        break;
    case MessagesRole:

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
