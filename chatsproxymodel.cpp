#include "chatsproxymodel.h"
#include <QVariant>
#include "chatsmodel.h"
#include "chatmodel.h"

ChatsProxyModel::ChatsProxyModel(QObject* parent)
    : QSortFilterProxyModel(parent)
{
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
