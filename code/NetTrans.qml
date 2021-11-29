import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    id: transbutton
    width: 50
    height: 100

    property string transName: ""
    property int textx: 0
    property int texty: 0

    property color colorDefault: "#00000000"
    property color colorMouseover: "#ffaa00"
    property color colorPressed: "#ff7800"

    QtObject{
        id: internal

        property var dynamicColor: if (transbutton.down){
                                       transbutton.down ? transbutton.colorPressed : transbutton.colorDefault
                                   } else {
                                       transbutton.hovered ? transbutton.colorMouseover : transbutton.colorDefault
                                   }
    }
    background: Rectangle {
        id: trans
        color: internal.dynamicColor
        width: 50
        height: 100
        border.color: "#ff7800"
        border.width: 2
        anchors.fill: parent
        anchors.rightMargin: 2
        anchors.leftMargin: 2
        anchors.bottomMargin: 2
        anchors.topMargin: 2
        Text{
            id: transLable
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            width: 328
            height: 54
            color: "#000000"
            text: transName
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenterOffset: -75 + transbutton.texty
            anchors.horizontalCenterOffset: 0 + transbutton.textx
        }
    }
}
