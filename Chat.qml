import QtQuick 2.0
import "color_constants.js" as Colors

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
    }
}
