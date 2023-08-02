#ifndef MESSAGE_H
#define MESSAGE_H

#include <QObject>
#include <QDate>

class Message : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString author READ author WRITE setAuthor NOTIFY authorChanged)
    Q_PROPERTY(QString text READ text WRITE setText NOTIFY textChanged)
    Q_PROPERTY(QDate date READ date WRITE setDate NOTIFY dateChanged)

public:
    explicit Message(QString author, QString text, QDate date, QObject *parent = nullptr);
    const QString &author() const;
    void setAuthor(const QString &newAuthor);
    const QString &text() const;
    void setText(const QString &newText);
    const QDate &date() const;
    void setDate(const QDate &newDate);

private:
    QString mAuthor;
    QString mText;
    QDate mDate;

signals:
    void authorChanged();
    void textChanged();
    void dateChanged();
};

#endif // MESSAGE_H
