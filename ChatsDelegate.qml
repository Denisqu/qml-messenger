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

    height: childrenRect.height

    RowLayout {
        width: root.width

        Rectangle {
            Layout.preferredHeight: 30
            Layout.preferredWidth: 30
            color: "dodgerblue"
            radius: 180

        }

        ColumnLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Text {
                text: '<b>chatNameRole:</b>' + chatNameRole
                elide: Text.ElideRight
                Layout.fillWidth: true
            }
            Text {
                text: '<b>lastMsgAuthorRole:</b>' + lastMsgAuthorRole
                elide: Text.ElideRight
                Layout.fillWidth: true
            }
            Text {
                text: '<b>lastMsgDateRole:' + lastMsgDateRole.toLocaleDateString(
                          Qt.locale("ru_RU"), Locale.ShortFormat)
                elide: Text.ElideRight
                Layout.fillWidth: true
            }
            Text {
                text: '<b>lastMsgTextRole:' + lastMsgTextRole
                elide: Text.ElideRight
                Layout.fillWidth: true
            }
            Rectangle {
                color: "black"
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
