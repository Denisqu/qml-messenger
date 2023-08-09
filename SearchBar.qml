import QtQuick 2.15

Item {
    id: root
    height: childrenRect.height

    Rectangle {
        color: "white"
        border.width: 1
        border.color: "grey"
        radius: 180
        width: root.width
        height: 25

        TextInput {
            id: textInput
            text: 'Search'
            font.pointSize: 12
            cursorVisible: true
            anchors.fill: parent
            anchors.topMargin: 4
            anchors.bottomMargin: 4
            anchors.leftMargin: 5
            anchors.rightMargin: 5
            clip: true
        }
    }


}