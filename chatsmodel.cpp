#include "chatsmodel.h"
#include "chatmodel.h"
#include "message.h"
#include <QRandomGenerator>

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
        return mChatModels.at(index.row())->chatName();
    case LastMsgAuthorRole:
        return mChatModels.at(index.row())->lastMessage().author();
    case LastMsgTextRole:
        return mChatModels.at(index.row())->lastMessage().text();
    case LastMsgDateRole:
        return mChatModels.at(index.row())->lastMessage().date();
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> ChatsModel::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();
    roles[ChatNameRole] = "chatNameRole";
    roles[LastMsgAuthorRole] = "lastMsgAuthorRole";
    roles[LastMsgTextRole] = "lastMsgTextRole";
    roles[LastMsgDateRole] = "lastMsgDateRole";

    return roles;
}

/*
void ChatsModel::add()
{
    beginInsertRows(QModelIndex(), m_data.size(), m_data.size());
    m_data.append("new");
    endInsertRows();

    m_data[0] = QString("Size: %1").arg(m_data.size());
    QModelIndex index = createIndex(0, 0, static_cast<void *>(0));
    emit dataChanged(index, index);
}

void ChatsModel::addChat(const ChatModel&& chat)
{
    beginInsertRows(QModelIndex(), mChatModels.size(), mChatModels.size());
    mChatModels.append(chat);
    endInsertRows();
}
*/

bool ChatsModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (!index.isValid()) {
        return false;
    }

    switch (role) {
    case ChatNameRole:
        return false;
    case LastMsgAuthorRole:
        return false;
    case LastMsgTextRole:
        return false;
    case LastMsgDateRole:
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

void ChatsModel::fillModelWithTestData()
{
    beginInsertRows(QModelIndex(), mChatModels.size(), mChatModels.size() + 2);
    for (int i = 1; i < 10; ++i) {

        auto testModel = new ChatModel(QString("testChatModel#%1").arg(i), this);
        for (int j = 0; j < 10; ++j) {
            auto message = tr("Hey! Look at this cool number: %1").arg(QRandomGenerator(i * j).generate());
            testModel->addMessage(Message("Author", message, QDate(2023, i, 18)));
        }
        mChatModels.push_back(testModel);
    }
    endInsertRows();
}

QVariant ChatsModel::getChatModelByIndex(int index)
{
    return QVariant::fromValue(mChatModels[index]);
}
