import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    id: buttonMenu

    property color colorDefault: "#7f7f7f"
    property color colorMouseover: "#1f1f1f"
    property color colorPressed: "#00f070"
    property string standbyText: "Menu"

    QtObject{
        id: internal

        property var dynamicColor: if (buttonMenu.down){
                                       buttonMenu.down ? colorPressed : colorDefault
                                   } else {
                                       buttonMenu.hovered ? colorMouseover : colorDefault
                                   }
    }

    width: 70
    height: 70

    background: Rectangle{
        id: rectangle
        color: internal.dynamicColor
        Image {
            id: menuimg
            source: "home.png"
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
        pages.push(Qt.resolvedUrl("MenuPage.qml"))
    }
}
