import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.15

Item {
    id: root

    signal chatClicked(int index)

    required property string chatNameRole
    required property string lastMsgTextRole
    required property date lastMsgDateRole
    required property string lastMsgAuthorRole
    required property int index

    width: listView.width
    height: childrenRect.height

    RowLayout {
        width: root.width

        Rectangle {
            Layout.preferredWidth: 30
            Layout.preferredHeight: 30
            color: "dodgerblue"
            radius: 180

        }

        ColumnLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Text {
                text: '<b>chatNameRole:</b>' + chatNameRole
            }
            Text {
                text: '<b>lastMsgAuthorRole:</b>' + lastMsgAuthorRole
            }
            Text {
                text: '<b>lastMsgDateRole:' + lastMsgDateRole.toLocaleDateString(
                          Qt.locale("ru_RU"), Locale.ShortFormat)
            }
            Text {
                text: '<b>lastMsgTextRole:' + lastMsgTextRole
            }
            Rectangle {
                color: "red"
                height: 10
                Layout.fillWidth: true
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            chatClicked(index)
        }
    }
}
