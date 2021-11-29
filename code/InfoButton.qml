import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    id: buttonInfo

    property color colorDefault: "#7f7f7f"
    property color colorMouseover: "#1f1f1f"
    property color colorPressed: "#00f070"
    property string standbyText: "Menu"

    QtObject{
        id: internal

        property var dynamicColor: if (buttonInfo.down){
                                       buttonInfo.down ? colorPressed : colorDefault
                                   } else {
                                       buttonInfo.hovered ? colorMouseover : colorDefault
                                   }
    }

    width: 70
    height: 70

    background: Rectangle{
        id: rectangle
        color: internal.dynamicColor
        Image {
            id: menuimg
            source: "info.png"
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
        pages.push(Qt.resolvedUrl("InstructionPage.qml"))
    }
}
