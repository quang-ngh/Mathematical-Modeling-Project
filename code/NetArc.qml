import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: arc
    color: "#00000000"
    width: 200
    height: 70
    property int length: 50
    Rectangle {
        id: arrowbody
        x: 142
        y: 30
        color: "#000000"
        anchors.right: parent.right
        anchors.rightMargin: 7
        width: length
        height: 10
    }
    Image {
        id: arrowhead
        source: "arrowhead.png"
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 87
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        fillMode: Image.PreserveAspectFit
        height: 70
        width: 70
    }
}
