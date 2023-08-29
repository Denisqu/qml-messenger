import QtQuick 2.15
import QtQml.Models 2.15
import org.denisque.Chats 1.0

Item {
    id: root

    signal chatSelected(int index)

    ListView {
        id: listView
        anchors.fill: parent
        model: ChatsProxyModelSingleton
        width: parent.width
        focus: false
        spacing: 25
        clip: true
        footer: Rectangle {
            color: "transparent"
            height: 25
        }
        header: Rectangle {
            color: "transparent"
            height: 5
        }
        highlight: Rectangle { width: listView.parent.width; color: "lightsteelblue"; radius: 3 }
        delegate: ChatsDelegate {
            width: listView.parent.width
            Component.onCompleted: {
                chatClicked.connect(root.chatSelected)
                chatClicked.connect((index) => {
                                        listView.currentIndex = index
                                        listView.focus = true
                                    })
            }
        }
    }

    ItemSelectionModel {
        id: chatListISM
        model: ChatsProxyModelSingleton
    }
}
