import QtQuick 2.0
import QtQuick.Layouts 1.15
import "color_constants.js" as Colors

Item {
    id: root
    required property string chatNameRole
    required property string msgAuthorRole
    required property string msgTextRole
    required property date msgDateRole
    required property int index

    height: rowLayout.height
    DebugRect {}

    RowLayout {
        id: rowLayout
        width: root.width
        spacing: 0

        Rectangle {
            Layout.preferredHeight: 30
            Layout.preferredWidth: 30
            Layout.leftMargin: 5
            color: "dodgerblue"
            radius: 180
            DebugRect {}
        }
        Rectangle {
            Layout.preferredHeight: 30
            Layout.preferredWidth: 30
            Layout.leftMargin: 5
            color: "dodgerblue"
            radius: 180
            DebugRect {}
        }
        Rectangle {
            Layout.preferredHeight: 30
            Layout.preferredWidth: 30
            Layout.leftMargin: 5
            color: "dodgerblue"
            radius: 180
            DebugRect {}
        }
        Rectangle {
            Layout.preferredHeight: 30
            Layout.preferredWidth: 30
            Layout.leftMargin: 5
            color: "dodgerblue"
            radius: 180
            DebugRect {}
        }
        Rectangle {
            id: rectangle
            color: "white"
            border.width: 1
            border.color: Colors.borderColor
            radius: 15
            Layout.preferredWidth: columnLayout.width + 25
            Layout.preferredHeight: columnLayout.height + 20
            Layout.alignment: Qt.AlignLeft
            DebugRect {}

            ColumnLayout {
                id: columnLayout
                anchors.centerIn: parent

                RowLayout {
                    Text {
                        text: '<b>' + msgAuthorRole + '</b>'
                    }
                    Text {
                        text: msgDateRole.toLocaleString(
                                  Qt.locale("ru_RU"), Locale.ShortFormat)
                    }
                }
                Text {
                    text: msgTextRole
                    wrapMode: Text.WordWrap
                    Layout.maximumWidth: root.width / 2
                }
            }
        }
    }
}
