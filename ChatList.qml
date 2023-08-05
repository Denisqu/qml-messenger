import QtQuick 2.15
import QtQml.Models 2.15
/*
Rectangle {
    width: 100
    height: 100
    color: "red"
    border.color: "black"
    border.width: 5
    radius: 10
}
*/

Item {
    Component {
        id: chatDelegate

        Item {
            required property string chatNameRole
            required property string lastMsgTextRole
            required property date lastMsgDateRole
            required property string lastMsgAuthorRole
            required property int index

            width: listView.width; height: childrenRect.height

            Column {
                //anchors.fill: parent
                height: childrenRect.height
                Text { text: '<b>chatNameRole:</b>' + chatNameRole}
                Text { text: '<b>lastMsgAuthorRole:</b>' + lastMsgAuthorRole}
                Text { text: '<b>lastMsgDateRole:' + lastMsgDateRole}
                Text { text: '<b>lastMsgTextRole:' + lastMsgTextRole}
                Rectangle {
                    color: "red"
                    height: 10
                    width: parent.width
                }

            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("clicked index: " + index)
                }
            }
        }
    }

    ListView {
        id: listView

        anchors.fill: parent
        model: chatsModel
        delegate: chatDelegate
        highlight: Rectangle { width: parent.width; color: "lightsteelblue"; radius: 3 }
        focus: true
    }
}
