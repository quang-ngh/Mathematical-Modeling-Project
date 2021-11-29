import QtQuick 2.15
import QtQuick.Controls 2.15

Item{
    width: 906
    height: 484
    Rectangle {
        id: menuPage
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
        property bool busyCheck: false
        property bool docuCheck: false
        property bool insideCheck: false
        property bool doneCheck: false
        property bool visibility: if (menuPage.specialistCheck) return true
                                  else if (menuPage.patientCheck) return true
                                  else if (menuPage.busyCheck) return true
                                  else if (menuPage.docuCheck) return true
                                  else if (menuPage.insideCheck) return true
                                  else if (menuPage.doneCheck) return true
                                  else return false

        Text{
            id: menuTitle
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            width: 254
            height: 70
            color: "#ff9300"
            text: "Home Page"
            font.pixelSize: 40
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            anchors.verticalCenterOffset: -278
            anchors.horizontalCenterOffset: 0
        }

        Text{
            id: menuText
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            width: 566
            height: 96
            color: "#53b16d"
            text: "Welcome to our Petri Net system"
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.bold: false
            anchors.verticalCenterOffset: -201
            anchors.horizontalCenterOffset: 0
        }
        Text{
            id: leftbarInstruction
            width: 566
            height: 96
            color: "#000000"
            text: "Please choose a button on the leftbar to proceed\nYou can always come back to the Home Page by tapping the Home button        "
            anchors.top: parent.top
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenterOffset: 0
            anchors.topMargin: 69
            anchors.horizontalCenter: parent.horizontalCenter
            Image {
                source: "home.png"
                anchors.verticalCenterOffset: 13
                anchors.horizontalCenterOffset: 360
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                fillMode: Image.PreserveAspectFit
                height: 20
                width: 20
            }
        }
        Text{
            id: instruction
            width: 610
            height: 56
            color: "#000000"
            text: "For more instructions, please tap the info button      on the leftbar."
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 8
            anchors.bottomMargin: 0
            Image {
                source: "info.png"
                anchors.topMargin: 18
                anchors.leftMargin: 491
                anchors.left: parent.left
                anchors.top: parent.top
                fillMode: Image.PreserveAspectFit
                height: 20
                width: 20
            }
        }

        Text{
            id: settings
            x: 55
            y: 247
            width: 100
            color: "#000000"
            text: "Settings"
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Rectangle {
            id: patientOption
            x: 178
            y: 192
            width: 550
            height: 150
            color: "#00000000"
            border.color: "#000000"
            border.width: 2

            Button {
                id: patient
                property var dynamicColor: if (patient.down) {return menuPage.colorPressed}
                                           else if (patient.hovered) return menuPage.colorMouseover
                                           else {menuPage.patientCheck ? menuPage.colorPressed : "#666666"}
                width: 275
                height: 50
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 0
                anchors.topMargin: 0
                background: Rectangle{
                    color: patient.dynamicColor
                }
                Text{
                    color: "#000000"
                    text: "Patient"
                    anchors.fill: parent
                    font.pixelSize: 30
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                onClicked: {
                    if (menuPage.patientCheck === false) menuPage.patientCheck = true
                    else menuPage.patientCheck = false
                }
            }

            Button {
                id: specialist
                property var dynamicColor: if (specialist.down) {return menuPage.colorPressed}
                                           else if (specialist.hovered) return menuPage.colorMouseover
                                           else {menuPage.specialistCheck ? menuPage.colorPressed : "#666666"}
                width: 275
                height: 50
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 0
                anchors.topMargin: 0
                background: Rectangle{
                    color: specialist.dynamicColor
                }
                Text{
                    color: "#000000"
                    text: "Specialist"
                    anchors.fill: parent
                    font.pixelSize: 30
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                onClicked: {
                    if (menuPage.specialistCheck === false) menuPage.specialistCheck = true
                    else menuPage.specialistCheck = false
                }
            }

            Button {
                id: inside
                property var dynamicColor: if (inside.down) {return "#00a0f0"}
                                           else if (inside.hovered) return menuPage.colorMouseover
                                           else {menuPage.insideCheck ? "#00a0f0" : "#666666"}
                width: 138
                height: 50
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 0
                anchors.topMargin: 50
                background: Rectangle{
                    color: inside.dynamicColor
                }
                Text{
                    color: "#000000"
                    text: "Inside"
                    anchors.fill: parent
                    font.pixelSize: 30
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                onClicked: {
                    if (menuPage.insideCheck === false) menuPage.insideCheck = true
                    else menuPage.insideCheck = false
                }
            }

            Button {
                id: done
                property var dynamicColor: if (done.down) {return "#00a0f0"}
                                           else if (done.hovered) return menuPage.colorMouseover
                                           else {menuPage.doneCheck ? "#00a0f0" : "#666666"}
                width: 137
                height: 50
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 138
                anchors.topMargin: 50
                background: Rectangle{
                    color: done.dynamicColor
                }
                Text{
                    color: "#000000"
                    text: "Done"
                    anchors.fill: parent
                    font.pixelSize: 30
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                onClicked: {
                    if (menuPage.doneCheck === false) menuPage.doneCheck = true
                    else menuPage.doneCheck = false
                }
            }

            Button {
                id: busy
                property var dynamicColor: if (busy.down) {return "#00a0f0"}
                                           else if (busy.hovered) return menuPage.colorMouseover
                                           else {menuPage.busyCheck ? "#00a0f0" : "#666666"}
                width: 138
                height: 50
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 275
                anchors.topMargin: 50
                background: Rectangle{
                    color: busy.dynamicColor
                }
                Text{
                    color: "#000000"
                    text: "Busy"
                    anchors.fill: parent
                    font.pixelSize: 30
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                onClicked: {
                    if (menuPage.busyCheck === false) menuPage.busyCheck = true
                    else menuPage.busyCheck = false
                }
            }

            Button {
                id: docu
                property var dynamicColor: if (docu.down) {return "#00a0f0"}
                                           else if (docu.hovered) return menuPage.colorMouseover
                                           else {menuPage.docuCheck ? "#00a0f0" : "#666666"}
                width: 137
                height: 50
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 413
                anchors.topMargin: 50
                background: Rectangle{
                    color: docu.dynamicColor
                }
                Text{
                    color: "#000000"
                    text: "Docu"
                    anchors.fill: parent
                    font.pixelSize: 30
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                onClicked: {
                    if (menuPage.docuCheck === false) menuPage.docuCheck = true
                    else menuPage.docuCheck = false
                }
            }

            NumberButton {
                id: numberButton
                patientCheck: menuPage.patientCheck
                specialistCheck: menuPage.specialistCheck
                insideCheck: menuPage.insideCheck
                doneCheck: menuPage.doneCheck
                busyCheck: menuPage.busyCheck
                docuCheck: menuPage.docuCheck
                visible: menuPage.visibility
            }
            NumberButton {
                id: numberButton1
                anchors.leftMargin: 50
                number: 1
                patientCheck: menuPage.patientCheck
                specialistCheck: menuPage.specialistCheck
                insideCheck: menuPage.insideCheck
                doneCheck: menuPage.doneCheck
                busyCheck: menuPage.busyCheck
                docuCheck: menuPage.docuCheck
                visible: menuPage.visibility
            }
            NumberButton {
                id: numberButton2
                anchors.leftMargin: 100
                number: 2
                patientCheck: menuPage.patientCheck
                specialistCheck: menuPage.specialistCheck
                insideCheck: menuPage.insideCheck
                doneCheck: menuPage.doneCheck
                busyCheck: menuPage.busyCheck
                docuCheck: menuPage.docuCheck
                visible: menuPage.visibility
            }
            NumberButton {
                id: numberButton3
                anchors.leftMargin: 150
                number: 3
                patientCheck: menuPage.patientCheck
                specialistCheck: menuPage.specialistCheck
                insideCheck: menuPage.insideCheck
                doneCheck: menuPage.doneCheck
                busyCheck: menuPage.busyCheck
                docuCheck: menuPage.docuCheck
                visible: menuPage.visibility
            }
            NumberButton {
                id: numberButton4
                anchors.leftMargin: 200
                number: 4
                patientCheck: menuPage.patientCheck
                specialistCheck: menuPage.specialistCheck
                insideCheck: menuPage.insideCheck
                doneCheck: menuPage.doneCheck
                busyCheck: menuPage.busyCheck
                docuCheck: menuPage.docuCheck
                visible: menuPage.visibility
            }
            NumberButton {
                id: numberButton5
                anchors.leftMargin: 250
                number: 5
                patientCheck: menuPage.patientCheck
                specialistCheck: menuPage.specialistCheck
                insideCheck: menuPage.insideCheck
                doneCheck: menuPage.doneCheck
                busyCheck: menuPage.busyCheck
                docuCheck: menuPage.docuCheck
                visible: menuPage.visibility
            }
            NumberButton {
                id: numberButton6
                anchors.leftMargin: 300
                number: 6
                patientCheck: menuPage.patientCheck
                specialistCheck: menuPage.specialistCheck
                insideCheck: menuPage.insideCheck
                doneCheck: menuPage.doneCheck
                busyCheck: menuPage.busyCheck
                docuCheck: menuPage.docuCheck
                visible: menuPage.visibility
            }
            NumberButton {
                id: numberButton7
                anchors.leftMargin: 350
                number: 7
                patientCheck: menuPage.patientCheck
                specialistCheck: menuPage.specialistCheck
                insideCheck: menuPage.insideCheck
                doneCheck: menuPage.doneCheck
                busyCheck: menuPage.busyCheck
                docuCheck: menuPage.docuCheck
                visible: menuPage.visibility
            }
            NumberButton {
                id: numberButton8
                anchors.leftMargin: 400
                number: 8
                patientCheck: menuPage.patientCheck
                specialistCheck: menuPage.specialistCheck
                insideCheck: menuPage.insideCheck
                doneCheck: menuPage.doneCheck
                busyCheck: menuPage.busyCheck
                docuCheck: menuPage.docuCheck
                visible: menuPage.visibility
            }
            NumberButton {
                id: numberButton9
                anchors.leftMargin: 450
                number: 9
                patientCheck: menuPage.patientCheck
                specialistCheck: menuPage.specialistCheck
                insideCheck: menuPage.insideCheck
                doneCheck: menuPage.doneCheck
                busyCheck: menuPage.busyCheck
                docuCheck: menuPage.docuCheck
                visible: menuPage.visibility
            }
            NumberButton {
                id: numberButton10
                anchors.leftMargin: 500
                number: 10
                patientCheck: menuPage.patientCheck
                specialistCheck: menuPage.specialistCheck
                insideCheck: menuPage.insideCheck
                doneCheck: menuPage.doneCheck
                busyCheck: menuPage.busyCheck
                docuCheck: menuPage.docuCheck
                visible: menuPage.visibility
            }

        }
    }
}


