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

    width: listView.width
    height: childrenRect.height

    RowLayout {
        id: rowLayout
        Rectangle {
            Layout.preferredHeight: 30
            Layout.preferredWidth: 30
            Layout.leftMargin: 5
            color: "dodgerblue"
            radius: 180
        }
        Rectangle {
            color: "white"
            border.width: 1
            border.color: Colors.borderColor
            radius: 15
            width: childrenRect.width + 25
            height: childrenRect.height + 20
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
                }
            }
        }
    }
}
