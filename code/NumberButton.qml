import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    id: patient
    x: 0
    y: 50
    property color colorDefault: "#7f7f7f"
    property color colorMouseover: "#1f1f1f"
    property color colorPressed: "#00f070"
    property bool specialistCheck: false
    property bool patientCheck: false
    property bool busyCheck: false
    property bool docuCheck: false
    property bool insideCheck: false
    property bool doneCheck: false
    property int number: 0

    QtObject{
        id: internal

        property var dynamicColor: if (patient.down) {patient.down ? colorPressed : colorDefault}
                                   else {patient.hovered ? colorMouseover : colorDefault}
    }
    width: 50
    height: 50
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    anchors.bottomMargin: 0
    background: Rectangle{
        id: background
        color: internal.dynamicColor
    }
    Text{
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        width: 35
        height: 35
        color: "#000000"
        text: patient.number
        font.pixelSize: 30
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 0
    }
    onClicked: {
        if (patient.patientCheck === true) {pwait.reset(patient.number); pwait2.reset(patient.number)}
        if (patient.specialistCheck === true) {pfree.reset(patient.number); pfree1.reset(patient.number)}
        if (patient.insideCheck === true) {pinside.reset(patient.number); pinside2.reset(patient.number)}
        if (patient.doneCheck === true) {pdone.reset(patient.number); pdone2.reset(patient.number)}
        if (patient.busyCheck === true) {pbusy.reset(patient.number); pbusy1.reset(patient.number)}
        if (patient.docuCheck === true) {pdocu.reset(patient.number); pdocu1.reset(patient.number)}
    }
    Connections
    {
        target: pwait2
    }
    Connections
    {
        target: pinside2
    }
    Connections
    {
        target: pdone2
    }
    Connections
    {
        target: pfree1
    }
    Connections
    {
        target: pbusy1
    }
    Connections
    {
        target: pdocu1
    }
    Connections
    {
        target: pwait
    }
    Connections
    {
        target: pfree
    }
    Connections
    {
        target: pinside
    }
    Connections
    {
        target: pdone
    }
    Connections
    {
        target: pbusy
    }
    Connections
    {
        target: pdocu
    }
}
