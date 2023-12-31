#include "message.h"

Message::Message(QString author, QString text, QDate date) :
      mAuthor(author),
      mText(text),
      mDate(date)
{

}

const QString &Message::author() const
{
    return mAuthor;
}

void Message::setAuthor(const QString &newAuthor)
{
    if (mAuthor == newAuthor)
        return;
    mAuthor = newAuthor;
}

const QString &Message::text() const
{
    return mText;
}

void Message::setText(const QString &newText)
{
    if (mText == newText)
        return;
    mText = newText;
}

const QDate &Message::date() const
{
    return mDate;
}

void Message::setDate(const QDate &newDate)
{
    if (mDate == newDate)
        return;
    mDate = newDate;
}

