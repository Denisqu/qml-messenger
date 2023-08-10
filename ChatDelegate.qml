import QtQuick 2.0
import QtQuick.Layouts 1.15

Item {
    id: root
    required property string chatNameRole
    required property string msgAuthorRole
    required property string msgTextRole
    required property date msgDateRole
    required property int index

    width: listView.width
    height: childrenRect.height

    RowLayout {
        id: rowLayout
        Rectangle {
            Layout.preferredHeight: 30
            Layout.preferredWidth: 30
            color: "dodgerblue"
            radius: 180
        }
        Rectangle {
            color: "white"
            border.width: 1
            border.color: "black"
            radius: 15
            width: childrenRect.width + 25
            height: childrenRect.height + 20
            ColumnLayout {
                id: columnLayout
                anchors.centerIn: parent
                Text {
                    text: '<b>chatNameRole:</b>' + chatNameRole
                }
                Text {
                    text: '<b>msgAuthorRole:</b>' + msgAuthorRole
                }
                Text {
                    text: '<b>msgDateRole:' + msgDateRole
                }
                Text {
                    text: '<b>msgTextRole:' + msgTextRole
                }
            }
        }
    }
}
