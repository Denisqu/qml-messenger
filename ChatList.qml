import QtQuick 2.15
import QtQml.Models 2.15
import org.denisque.Chats 1.0

Item {
    Component {
        id: chatDelegate
        Item {
            id: chatDelegateItem

            signal chatClicked(int index)

            property var modelData: model
            required property string chatNameRole
            required property string lastMsgTextRole
            required property date lastMsgDateRole
            required property string lastMsgAuthorRole
            required property int index

            width: listView.width; height: childrenRect.height

            Column {
                height: childrenRect.height
                Text { text: '<b>chatNameRole:</b>' + chatNameRole}
                Text { text: '<b>lastMsgAuthorRole:</b>' + lastMsgAuthorRole}
                Text { text: '<b>lastMsgDateRole:' + lastMsgDateRole}
                Text { text: '<b>lastMsgTextRole:' + lastMsgTextRole}
                Rectangle {
                    color: "red"
                    height: 10
                    width: parent.width
                }

            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    // TODO: Понять как здесь вызывать сигнал chatClicked(int index)
                    //chatDelegate.onChatClicked(index)
                    console.log(model)
                    chatListISM.select(item.modelData.index(index, 0), ItemSelectionModel.SelectCurrent)
                    console.log(chatListISM.hasSelection)
                }
            }

            Component.onCompleted: {
                chatDelegateItem.chatClicked.connect(clicked)
            }
        }
    }

    ListView {
        id: listView

        anchors.fill: parent
        model: ChatsModelSingleton
        delegate: chatDelegate
        highlight: Rectangle { width: parent.width; color: "lightsteelblue"; radius: 3 }
        focus: true

        Component.onCompleted: {
            chatDelegateItem.chatClicked.connect(test)
        }

        function test(index) {
            console.log("test log" + index)
        }
    }

    Connections {
        target: chatDelegate
        onChatClicked: console.log("OnChatClicked" + index)
    }


    ItemSelectionModel {
        id: chatListISM
        model: ChatsModelSingleton
    }
}
