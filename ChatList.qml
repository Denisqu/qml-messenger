import QtQuick 2.15
import QtQml.Models 2.15
import org.denisque.Chats 1.0

Item {
    id: root

    signal chatSelected(int index)

    function updateHighlight(index) {

    }

    ListView {
        id: listView
        anchors.fill: parent
        model: ChatsModelSingleton
        width: parent.width
        delegate: ChatsDelegate {
            Component.onCompleted: {
                chatClicked.connect(root.chatSelected)
                chatClicked.connect(function(index){listView.currentIndex = index})
            }
        }
        highlight: Rectangle { width: parent.width; color: "lightsteelblue"; radius: 3 }
        focus: true
    }

    ItemSelectionModel {
        id: chatListISM
        model: ChatsModelSingleton
    }
}
