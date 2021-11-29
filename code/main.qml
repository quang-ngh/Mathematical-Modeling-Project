import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id: mainWindow
    width: 1000
    height: 580
    visible: true
    color: "#00000000"
    title: qsTr("Petri Net")

    Rectangle {
        id: backg
        color: "#272828"
        border.width: 0
        anchors.fill: parent
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.bottomMargin: 10
        anchors.topMargin: 10

        Rectangle {
            id: appContainer
            color: "#00000000"
            border.color: "#fff700"
            border.width: 2
            anchors.fill: parent

            Rectangle {
                id: leftBar
                width: 70
                color: "#3f3f3f"
                border.width: 0
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 2
                anchors.bottomMargin: 2
                anchors.topMargin: 2

                MenuButton {
                    id: menuButton
                    x: 0
                    y: 0
                }

                Net1Button {
                    id: net1Button
                    x: 0
                    y: 70
                }

                Net2Button {
                    id: net2Button
                    x: 0
                    y: 139
                }

                Net3Button {
                    id: net3Button
                    x: 0
                    y: 209
                }

                InfoButton {
                    id: infoButton
                    x: 0
                    y: 279
                }
            }

            Item {
                id: screenDisplay
                x: 72
                y: 2
                width: 906
                height: 556
                clip: true


                Rectangle {
                    id: topBar
                    x: -70
                    y: 0
                    height: 70
                    color: "#5f5f5f"
                    border.width: 0
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: 2
                    anchors.leftMargin: 2
                    anchors.topMargin: 2
                }
                StackView {
                    id: pages
                    x: 0
                    y: 70
                    width: 906
                    height: 484
                    initialItem: Qt.resolvedUrl("MenuPage.qml")
                }
            }
        }
    }
}





/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}D{i:4}D{i:5}D{i:6}D{i:7}D{i:8}D{i:3}D{i:10}D{i:11}D{i:9}
D{i:2}D{i:1}
}
##^##*/
