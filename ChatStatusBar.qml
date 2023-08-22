import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
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


            /*
            Rectangle {
                Layout.preferredHeight: 30
                Layout.preferredWidth: 30
                color: "dodgerblue"
                radius: 180
                Layout.leftMargin: 5
            }
            */
            ColumnLayout {
                Layout.alignment: Qt.AlignLeft
                spacing: 0.5
                Layout.leftMargin: 10
                Text {
                    // TODO: убрать захардкоженные значения
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
                Button {
                    Layout.alignment: Qt.AlignRight
                    anchors.right: parent.right
                    anchors.rightMargin: 16
                    checkable: false
                    checked: false
                    height: 20
                    width: 20
                    Image {
                        anchors.fill: parent
                        source: "resources/svg-icons/icons8-search.svg"
                        fillMode: Image.PreserveAspectFit
                    }
                    background: Rectangle {
                        color: "transparent"
                    }

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
