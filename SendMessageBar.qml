import QtQuick 2.0

Item {
    id: root
    height: childrenRect.height

    Rectangle {
        color: "white"
        border.width: 1
        border.color: "grey"
        width: root.width
        height: root.height

        TextInput {
            id: textInput
            text: 'Write a message...'
            font.pointSize: 10
            cursorVisible: true
            anchors.fill: parent
            anchors.topMargin: 10
            anchors.bottomMargin: 0
            anchors.leftMargin: 10
            anchors.rightMargin: 5
            clip: true
            //anchors.centerIn: parent
        }
    }


}
