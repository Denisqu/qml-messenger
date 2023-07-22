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
            required property string textRole
            required property string colorRole
            required property int index

            width: listView.width; height: 40

            Column {
                anchors.fill: parent
                Text { text: '<b>Name:</b>' + textRole}
                Text { text: '<b>Last msg:</b>' + colorRole}
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
        model: testModel
        delegate: chatDelegate
        highlight: Rectangle { width: parent.width; color: "lightsteelblue"; radius: 3 }
        focus: true
    }
}
