#ifndef MESSAGE_H
#define MESSAGE_H

#include <QObject>
#include <QDate>

/*
 * TODO: Понять должен ли Message быть QObject'ом или нет
 */

class Message
{
public:
    explicit Message(QString author, QString text, QDate date);
    explicit Message() = default;
    ~Message() = default;
    Message(const Message &) = default;
    Message &operator=(const Message &) = default;

    const QString &author() const;
    const QString &text() const;
    const QDate &date() const;

    /*
    void setAuthor(const QString &newAuthor);
    void setText(const QString &newText);
    void setDate(const QDate &newDate);
    */


private:
    QString mAuthor;
    QString mText;
    QDate mDate;

/*
signals:
    void authorChanged();
    void textChanged();
    void dateChanged();
*/
};

Q_DECLARE_METATYPE(Message);

#endif // MESSAGE_H
