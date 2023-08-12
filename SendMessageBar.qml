import QtQuick 2.0
import "color_constants.js" as Colors

Item {
    id: root
    height: childrenRect.height

    Rectangle {
        color: "white"
        border.width: 0.5
        border.color: Colors.borderColor
        opacity: 1
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
            opacity: 1
        }
    }


}
