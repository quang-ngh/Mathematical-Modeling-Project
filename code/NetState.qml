import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: states
    color: "#00000000"
    width: 70
    height: 70
    property int token: 10
    property int textx: 0
    property int texty: 0
    property bool visibility:
        if(states.token < 0) return false
        else if(states.token > 10) return true
        else return false
    Image {
        id: stateimg
        source: "state.png"
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        fillMode: Image.PreserveAspectFit
        height: 70
        width: 70
        Text{
            id: stateText
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            width: 70
            height: 70
            color: "#000000"
            text: token
            font.pixelSize: 40
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            visible: states.visibility
        }
    }
    property string stateName: ""
    Text{
        id: stateLable
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        width: 328
        height: 54
        color: "#000000"
        text: stateName
        font.pixelSize: 30
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.verticalCenterOffset: -65 + states.texty
        anchors.horizontalCenterOffset: 0 + states.textx
    }

    NetToken {
        id: netToken
        x: 572
        y: 100
        anchors.horizontalCenterOffset: -8
        statetoken: states.token
        token: 0
    }

    NetToken {
        id: netToken1
        x: 554
        y: 117
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 8
        statetoken: states.token
        token: 1
    }

    NetToken {
        id: netToken2
        x: 553
        y: 112
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: -24
        statetoken: states.token
        token: 2
    }

    NetToken {
        id: netToken3
        x: 553
        y: 112
        anchors.horizontalCenterOffset: 24
        statetoken: states.token
        token: 3
    }

    NetToken {
        id: netToken4
        x: 553
        y: 112
        anchors.verticalCenterOffset: -15
        statetoken: states.token
        token: 4
    }

    NetToken {
        id: netToken5
        x: 553
        y: 112
        anchors.horizontalCenterOffset: -16
        anchors.verticalCenterOffset: -15
        statetoken: states.token
        token: 5
    }

    NetToken {
        id: netToken6
        x: 553
        y: 112
        anchors.verticalCenterOffset: -15
        anchors.horizontalCenterOffset: 16
        statetoken: states.token
        token: 6
    }

    NetToken {
        id: netToken7
        x: 553
        y: 112
        anchors.horizontalCenterOffset: 0
        anchors.verticalCenterOffset: 15
        statetoken: states.token
        token: 7
    }

    NetToken {
        id: netToken8
        x: 553
        y: 112
        anchors.verticalCenterOffset: 15
        anchors.horizontalCenterOffset: -16
        statetoken: states.token
        token: 8
    }

    NetToken {
        id: netToken9
        x: 553
        y: 112
        anchors.verticalCenterOffset: 15
        anchors.horizontalCenterOffset: 16
        statetoken: states.token
        token: 9
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:3}D{i:2}D{i:1}D{i:3}D{i:4}D{i:5}D{i:6}D{i:7}D{i:8}D{i:9}D{i:10}
D{i:11}D{i:12}D{i:13}
}
##^##*/
