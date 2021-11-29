import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    id: buttonNet1

    property color colorDefault: "#7f7f7f"
    property color colorMouseover: "#1f1f1f"
    property color colorPressed: "#00f070"

    QtObject{
        id: internal

        property var dynamicColor: if (buttonNet1.down){
                                       buttonNet1.down ? colorPressed : colorDefault
                                   } else {
                                       buttonNet1.hovered ? colorMouseover : colorDefault
                                   }
    }

    width: 70
    height: 70

    background: Rectangle{
        id: rectangle
        color: internal.dynamicColor
        Image {
            id: img
            source: "doctor.png"
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            fillMode: Image.PreserveAspectFit
            height: 40
            width: 40
        }
    }

    onClicked: {
        pages.push(Qt.resolvedUrl("PetriNet1.qml"))
    }

    /*contentItem: Item{
        width: 70
        height: 70
        Text{
            id: buttonHomeText
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            width: 70
            height: 70
            color: "#e5ff00"
            text: "Home"
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }*/
}
