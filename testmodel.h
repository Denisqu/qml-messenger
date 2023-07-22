#ifndef TESTMODEL_H
#define TESTMODEL_H

#include "qobjectdefs.h"
#include <QAbstractListModel>
#include <QStringList>

class TestModel : public QAbstractListModel
{
    Q_OBJECT

public:
    enum Roles {
        ColorRole = Qt::UserRole + 1,
        TextRole
    };

    TestModel(QObject *parent = 0);

    virtual int rowCount(const QModelIndex &parent) const override;
    virtual QVariant data(const QModelIndex &index, int role) const override;
    virtual QHash<int, QByteArray> roleNames() const override;
    virtual bool setData(const QModelIndex &index, const QVariant &value, int role) override;
    virtual Qt::ItemFlags flags(const QModelIndex &index) const override;

    Q_INVOKABLE void add();

private:
    QStringList m_data;
};


#endif // TESTMODEL_H
