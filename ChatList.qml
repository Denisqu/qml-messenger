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
        required property string name

        Item {
            width: listView.width; height: 40
            Column {
                anchors.fill: parent
                Text { text: '<b>Name:</b> ' + name }
                Text { text: '<b----</b>' }
                Rectangle {
                    color: "red"
                    height: 10
                    width: parent.width
                }
            }
        }
    }

    ListView {
        id: listView

        anchors.fill: parent
        model: ChatsModel {}
        delegate: chatDelegate
        highlight: Rectangle { width: parent.width; color: "lightsteelblue"; radius: 3 }
        focus: true
    }
}
