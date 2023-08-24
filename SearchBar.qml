import QtQuick 2.15
import "color_constants.js" as Colors

Item {
    id: root
    height: childrenRect.height

    property alias searchTextValue: textInput.text
    property real maxWidth: 0

    signal startRevealingAnimation()
    signal startDisapperingAnimation()
    signal searchTextChanged(string value)

    Component.onCompleted: {
        barAnimation.stop()
        maxWidth = root.width
    }

    Connections {
        target: root
        function onStartRevealingAnimation() {
            barAnimation.resume()
            barAnimation.running = true
        }

        function onStartDisapperingAnimation() {
            barAnimation.start()
        }
    }

    NumberAnimation on opacity {
        id: barAnimation
        from: 1
        to: 0
        duration: 1000
    }

    Rectangle {
        color: "white"
        border.width: 1
        border.color: Colors.borderColor
        radius: 180
        width: root.width
        height: 25

        TextInput {
            id: textInput
            text: 'Search'
            color: Colors.notFocusedTextColor
            font.pointSize: 12
            cursorVisible: false
            clip: true
            anchors.fill: parent
            anchors.topMargin: 4
            anchors.bottomMargin: 4
            anchors.leftMargin: 5
            anchors.rightMargin: 5

            onActiveFocusChanged: {
                if (activeFocus) {
                    textInput.color = Colors.focusedTextColor
                } else {
                    textInput.color = Colors.notFocusedTextColor
                }
            }

            onTextEdited: root.searchTextChanged(textInput.text)
        }
    }
}
