import QtQuick 2.0
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import QtQuick.Layouts 1.15

Button {
    required property string pathToSvgImage
    required property string notHoveredColor
    required property string hoveredColor

    id: root
    checkable: false
    checked: false
    height: 20
    width: 20
    Image {
        anchors.fill: parent
        id: btnImage
        source: pathToSvgImage
        fillMode: Image.PreserveAspectFit
        visible: false
    }
    ColorOverlay {
        anchors.fill: btnImage
        source: btnImage
        color: root.hovered ? hoveredColor : notHoveredColor
        antialiasing: true
    }
    background: Rectangle {
        color: "transparent"
    }
}
