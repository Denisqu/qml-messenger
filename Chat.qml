import QtQuick 2.0
import "color_constants.js" as Colors
import org.denisque.Chats 1.0
import SortFilterProxyModel 0.2

/*
Rectangle {
    width: 100
    height: 100
    color: "blue"
    border.color: "black"
}
*/
Item {
    id: root
    required property string proxyModelPattern

    function updateListViewModel(newModel) {
        listView.model = newModel
    }



    Rectangle {
        anchors.fill: parent

        gradient: Gradient {
            GradientStop {
                position: 0.0
                color: Colors.gradientColorFirst
            }
            GradientStop {
                position: 1.0
                color: Colors.gradientColorSecond
            }
        }

        ListView {
            id: listView
            model: chatProxyModel
            anchors.fill: parent
            delegate: ChatDelegate {}
            width: parent.width
            spacing: 10
            clip: true

            footer: Rectangle {
                color: "transparent"
                height: 20
            }

            header: Rectangle {
                color: "transparent"
                height: 10
            }
        }

        SortFilterProxyModel {
            id: chatProxyModel
            sourceModel: ChatsProxyModelSingleton.currentlySelectedModel
            filters: RegExpFilter {
                roleName: "msgTextRole"
                pattern: proxyModelPattern
                caseSensitivity: Qt.CaseInsensitive
            }
        }
    }
}
