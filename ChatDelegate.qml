import QtQuick 2.0

Item {
    required property string chatNameRole
    required property string msgAuthorRole
    required property string msgTextRole
    required property date msgDateRole
    required property int index

    width: listView.width
    height: childrenRect.height

    Column {
        height: childrenRect.height
        Text {
            text: '<b>chatNameRole:</b>' + chatNameRole
        }
        Text {
            text: '<b>msgAuthorRole:</b>' + msgAuthorRole
        }
        Text {
            text: '<b>msgDateRole:' + msgDateRole
        }
        Text {
            text: '<b>msgTextRole:' + msgTextRole
        }
        Rectangle {
            color: "red"
            height: 10
            width: parent.width
        }
    }
}
