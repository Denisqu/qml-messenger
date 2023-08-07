import QtQuick 2.0
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15


Window {
    visible: true
    height: 600
    width: 900

    RowLayout {
        anchors.fill: parent
        spacing: 0

        ChatList {
            id: chatList
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredWidth: 30
            Layout.minimumWidth: 20
        }

        Chat {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        Connections {
            target: chatList
            function onChatSelected(index) {
                console.log("chatSelected, index = " + index)
            }
        }
    }
}

