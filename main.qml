import QtQuick 2.0
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import org.denisque.Chats 1.0
import "color_constants.js" as Colors

/* DebugRect:

                Rectangle {
                    color: "transparent"
                    border.color: "red"
                    anchors.fill: parent
                }

*/

Window {
    visible: true
    height: 600
    width: 900
    minimumHeight: 600
    minimumWidth: 900

    RowLayout {
        anchors.fill: parent
        spacing: 0

        ColumnLayout {
            Layout.topMargin: 10
            Layout.preferredWidth: 25
            Layout.maximumWidth: 250

            SearchBar {
                Layout.preferredHeight: childrenRect.height
                Layout.fillWidth: true
                Layout.leftMargin: 4
                Layout.rightMargin: 4
            }

            ChatList {
                id: chatList
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.preferredHeight: 99
            }
        }

        Rectangle {
            Layout.fillHeight: true
            width: 0.5
            color: Colors.borderColor
        }

        ColumnLayout {
            spacing: 0
            Chat {
                id: chat
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.preferredWidth: 90
                Layout.minimumWidth: 70
            }
            SendMessageBar {
                Layout.fillWidth: true
                height: 50
            }
        }

        Connections {
            target: chatList
            function onChatSelected(index) {
                console.log("chatSelected, index = " + index)
                chat.updateListViewModel(
                            ChatsModelSingleton.getChatModelByIndex(index))
            }
        }
    }
}
