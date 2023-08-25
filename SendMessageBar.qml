import QtQuick 2.0
import QtQuick.Layouts 1.15
import "color_constants.js" as Colors

Item {
    id: root

    property string placeholderText: "Enter text..."

    //height: childrenRect.height
    ColumnLayout {
        width: root.width
        height: root.height
        Layout.fillWidth: true
        Layout.fillHeight: true
        Rectangle {
            color: Colors.borderColor
            height: 0.5
            Layout.fillWidth: true
            //Layout.fillHeight: true
        }

        TextInput {
            id: textInput
            text: ""
            color: Colors.notFocusedTextColor
            font.pointSize: 10
            cursorVisible: false
            clip: true
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.rightMargin: 5
            Layout.leftMargin: 10
            Layout.bottomMargin: 0
            Layout.topMargin: 10

            onActiveFocusChanged: {
                if (activeFocus) {
                    textInput.color = Colors.focusedTextColor
                } else {
                    textInput.color = Colors.notFocusedTextColor
                }
            }

            Text {
                clip: true
                anchors.fill: parent
                font.pointSize: 10
                text: root.placeholderText
                color: Colors.notFocusedTextColor
                visible: !textInput.text
                         && !textInput.activeFocus
            }
        }


    }
}
