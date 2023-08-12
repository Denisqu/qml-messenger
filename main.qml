import QtQuick 2.0
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import org.denisque.Chats 1.0
import "color_constants.js" as Colors

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
            Layout.preferredWidth: 30
            Layout.minimumWidth: 20

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
            Chat {
                id: chat
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.preferredWidth: 90
                Layout.minimumWidth: 70
                Layout.leftMargin: 5
            }
            SendMessageBar {
                Layout.fillWidth: true
                Layout.preferredHeight: 40
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
