import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15
import "color_constants.js" as Colors
import org.denisque.Chats 1.0

Item {
    id: root
    //property string chatName
    //property date lastMsgDate
    //property ChatModel chatModel: ChatsProxyModelSingleton.currentlySelectedModel

    // TODO: что здесь писать???
    function updateChatStatusBarModel(newModel) {
        model = newModel
    }

    ColumnLayout {
        width: root.width
        spacing: 0
        RowLayout {
            width: parent.width

            ColumnLayout {
                Layout.alignment: Qt.AlignLeft
                spacing: 2
                Layout.leftMargin: 10
                Layout.topMargin: 5
                Layout.bottomMargin: 5
                Text {
                    text: ChatsProxyModelSingleton.currentlySelectedModel.chatName
                    color: Colors.focusedTextColor
                }
                Text {
                    text: ChatsProxyModelSingleton.currentlySelectedModel.chatOwnerLastTimeOnline.toLocaleString(
                              Qt.locale("ru_RU"), Locale.ShortFormat)
                    color: Colors.notFocusedTextColor
                }
            }

            Item {
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignRight
                Layout.preferredHeight: childrenRect.height
                IconButton {
                    Layout.alignment: Qt.AlignRight
                    anchors.right: parent.right
                    anchors.rightMargin: 16
                    pathToSvgImage: "resources/svg-icons/icons8-search.svg"
                    notHoveredColor: Colors.notFocusedTextColor
                    hoveredColor: Colors.focusedTextColor
                }
            }
        }

        Rectangle {
            height: 0.5
            Layout.fillWidth: true
            color: Colors.borderColor
        }
    }
}
