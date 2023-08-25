import QtQuick 2.0
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import org.denisque.Chats 1.0
import QtQml.Models 2.15
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
            Layout.preferredWidth: 25
            Layout.maximumWidth: 250

            SearchBar {
                id: searchBar
                Layout.preferredHeight: childrenRect.height
                Layout.fillWidth: true
                Layout.leftMargin: 4
                Layout.rightMargin: 4
                placeholderText: "Search"

                Connections {
                    target: searchBar
                    function onSearchTextChanged(value) {
                        ChatsProxyModelSingleton.applyFilter(value)
                    }
                }
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

            ChatStatusBar {
                id: chatStatusBar
                Layout.fillWidth: true
                height: childrenRect.height
            }
            Chat {
                id: chat
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.preferredWidth: 90
                Layout.minimumWidth: 70

                proxyModelPattern: chatStatusBar.searchTextValue
            }
            SendMessageBar {
                Layout.fillWidth: true
                height: 50
            }
        }

        Connections {
            target: chatList

            function onChatSelected(index) {
                ChatsProxyModelSingleton.currentlySelectedModel = ChatsProxyModelSingleton.getChatModelByIndex(index)
                console.log(ChatsProxyModelSingleton.currentlySelectedModel)
            }
        }
    }
}
