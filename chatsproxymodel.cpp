#include "chatsproxymodel.h"
#include <QVariant>
#include "chatsmodel.h"
#include "chatmodel.h"

ChatsProxyModel::ChatsProxyModel(QObject* parent)
    : QSortFilterProxyModel(parent)
{
    //this->setCurrentlySelectedModel(new ChatModel("no_name", this));
    this->setCurrentlySelectedModel(nullptr);
}

QVariant ChatsProxyModel::getChatModelByIndex(int index)
{
    auto proxyIndex = this->index(index, 0);
    auto indexToSource = mapToSource(proxyIndex).row();
    auto chatsModel = static_cast<ChatsModel*>(this->sourceModel());
    return QVariant::fromValue(chatsModel->mChatModels[indexToSource]);
}

void ChatsProxyModel::applyFilter(QString value)
{
    this->setFilterRegExp(QRegExp(value, Qt::CaseInsensitive,
                                  QRegExp::FixedString));
}

ChatModel* ChatsProxyModel::getCurrentlySelectedModel() const
{
    //return QVariant::fromValue(currentlySelectedModel);
    return currentlySelectedModel;
}

void ChatsProxyModel::setCurrentlySelectedModel(ChatModel *newCurrentlySelectedModel)
{
    if (currentlySelectedModel == newCurrentlySelectedModel)
        return;
    currentlySelectedModel = newCurrentlySelectedModel;
    emit currentlySelectedModelChanged();
}

/*
void ChatsProxyModel::setCurrentlySelectedModel(ChatModel* newCurrentlySelectedModel)
{
    /*auto castedNewCurrentlySelectedModel = newCurrentlySelectedModel.value<ChatModel*>();
    if (currentlySelectedModel == castedNewCurrentlySelectedModel)
        return;
    currentlySelectedModel = castedNewCurrentlySelectedModel;
    emit currentlySelectedModelChanged(); */
//}



