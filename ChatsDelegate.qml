import QtQuick 2.0
import QtQuick.Controls 2.0

Item {
    id: chatDelegateItem

    signal chatClicked(int index)

    required property string chatNameRole
    required property string lastMsgTextRole
    required property date lastMsgDateRole
    required property string lastMsgAuthorRole
    required property int index

    width: listView.width
    height: childrenRect.height

    Column {
        width: parent.width
        height: childrenRect.height
        Text {
            text: '<b>chatNameRole:</b>' + chatNameRole
        }
        Text {
            text: '<b>lastMsgAuthorRole:</b>' + lastMsgAuthorRole
        }
        Text {
            text: '<b>lastMsgDateRole:' + lastMsgDateRole.toLocaleDateString(Qt.locale("ru_RU"), Locale.ShortFormat)
        }
        Text {
            text: '<b>lastMsgTextRole:' + lastMsgTextRole
        }
        Rectangle {
            color: "red"
            height: 10
            width: parent.width
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            chatClicked(index)
        }
    }
}

