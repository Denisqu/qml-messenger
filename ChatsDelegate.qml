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
            RowLayout {
                Text {
                    text: '<b>'+chatNameRole+'<b>'
                    elide: Text.ElideRight
                    Layout.fillWidth: true
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                }
                Text {
                    text: lastMsgDateRole.toLocaleDateString(
                              Qt.locale("ru_RU"), Locale.ShortFormat)
                    Layout.fillWidth: true
                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignVCenter
                }
            }
            Text {
                text: lastMsgTextRole
                elide: Text.ElideRight
                Layout.fillWidth: true
            }
            /*
            Rectangle {
                color: "black"
                height: 10
                Layout.fillWidth: true
            }
            */
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            chatClicked(index)
        }
    }

}
