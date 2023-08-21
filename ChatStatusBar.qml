import QtQuick 2.0
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
                spacing: 0.5
                Layout.leftMargin: 10
                Text {
                    // TODO: убрать захардкоженные значения
                    text: ChatsProxyModelSingleton.currentlySelectedModel.chatName
                    color: Colors.focusedTextColor
                }
                Text {
                    text: "asdada"
                    color: Colors.notFocusedTextColor
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
