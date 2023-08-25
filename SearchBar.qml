import QtQuick 2.15
import "color_constants.js" as Colors

Item {
    id: root
    height: childrenRect.height

    property string placeholderText: "placeholderText"
    property alias searchTextValue: textInput.text
    property real maxWidth: width
    property bool isRevealedByDefault: true
    property bool isRevealed

    signal startRevealingAnimation
    signal startDisapperingAnimation
    signal searchTextChanged(string value)

    Component.onCompleted: {
        root.isRevealed = root.isRevealedByDefault

        if (!root.isRevealedByDefault)
            root.opacity = 0

        barAnimation.stop()
        root.maxWidth = width
    }

    Connections {
        target: root
        function onStartRevealingAnimation() {
            if (barAnimation.running)
                return

            barAnimation.start()
            root.isRevealed = !root.isRevealed
        }

        function onStartDisapperingAnimation() {
            barAnimation.start()
        }
    }

    ParallelAnimation {
        id: barAnimation

        NumberAnimation {
            target: root
            property: "width"
            from: root.isRevealed ? maxWidth : 0
            to: root.isRevealed ? 0 : maxWidth
            duration: 1000
        }

        NumberAnimation {
            target: root
            property: "opacity"
            from: root.isRevealed ? 1 : 0
            to: root.isRevealed ? 0 : 1
            duration: 1000
        }
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
            text: ""
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

        Text {
            clip: true
            anchors.fill: parent
            anchors.topMargin: 4
            anchors.bottomMargin: 4
            anchors.leftMargin: 5
            anchors.rightMargin: 5
            font.pointSize: 10
            text: root.placeholderText
            color: Colors.notFocusedTextColor
            visible: !textInput.text
                     && !textInput.activeFocus
        }
    }
}
