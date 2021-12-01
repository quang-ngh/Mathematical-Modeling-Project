import QtQuick 2.15
import QtQuick.Controls 2.15

Item{
    width: 906
    height: 484
    Rectangle {
        id: instructionPage
        x: 0
        y: 0
        width: 906
        height: 486
        color: "#e0e0e0"
        property color colorDefault: "#7f7f7f"
        property color colorMouseover: "#1f1f1f"
        property color colorPressed: "#00f070"
        property bool specialistCheck: false
        property bool patientCheck: false

        Text{
            id: instructTitle
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            width: 254
            height: 70
            color: "#ff9300"
            text: "Instruction Page"
            font.pixelSize: 40
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            anchors.verticalCenterOffset: -278
            anchors.horizontalCenterOffset: 0
        }

        Text{
            id: infoText
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            width: 566
            height: 96
            color: "#53b16d"
            text: "Simple guide on using this application"
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.bold: false
            anchors.verticalCenterOffset: -201
            anchors.horizontalCenterOffset: 0
        }
        Text{
            id: initializeInstruction
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            width: 566
            height: 96
            color: "#000000"
            text: "The settings on the Home Page allows you to change the number of tokens in places."
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenterOffset: -135
            anchors.horizontalCenterOffset: -156
        }
        Text{
            id: buttonsInstruction
            y: 141
            width: 862
            height: 101
            color: "#000000"
            text: "Firstly, tap an option, you can choose all 6 if you want.\nTap again to deselect an option.\nA key pad will then appear, choose the number of tokens you want on the chosen places.\nThere are 3 patients and 1 specialist initially."
            anchors.left: parent.left
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 14
        }
        Image {
            id: settingsimg
            source: "firing.png"
            anchors.verticalCenterOffset: 193
            anchors.horizontalCenterOffset: -8
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            fillMode: Image.PreserveAspectFit
            height: 100
            width: 400
        }
        Text{
            id: fireInstruction
            anchors.top: parent.top
            width: 566
            height: 62
            color: "#000000"
            text: "On the Petri net pages, you can tap on any rectangle (transition) to fire a token."
            anchors.left: parent.left
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 8
            anchors.topMargin: 342
        }
        Image {
            id: fireimg
            source: "settings.png"
            anchors.verticalCenterOffset: 55
            anchors.horizontalCenterOffset: -8
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            fillMode: Image.PreserveAspectFit
            height: 100
            width: 400
        }
    }
}


