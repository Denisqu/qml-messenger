import QtQuick 2.0
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import org.denisque.Chats 1.0

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
            Layout.preferredWidth: 20
            Layout.minimumWidth: 10
        }

        Chat {
            id: chat
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: 90
            Layout.minimumWidth: 80
        }

        Connections {
            target: chatList
            function onChatSelected(index) {
                console.log("chatSelected, index = " + index)
                chat.updateListViewModel(ChatsModelSingleton.getChatModelByIndex(index))
            }
        }
    }
}

