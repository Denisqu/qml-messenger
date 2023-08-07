import QtQuick 2.0

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

    ListView {
        id: listView
        anchors.fill: parent
        delegate: ChatDelegate {}
        width: parent.width
        highlight: Rectangle { width: listView.parent.width; color: "lightsteelblue"; radius: 3 }
        focus: false
    }
}
