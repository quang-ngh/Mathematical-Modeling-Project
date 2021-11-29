import QtQuick 2.15
import QtQuick.Controls 2.15

Item{
    width: 906
    height: 484
    Rectangle {
        id: net2
        x: 0
        y: 0
        width: 906
        height: 486
        color: "#e0e0e0"

        Text{
            id: net2Text
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            width: 254
            height: 70
            color: "#ff9300"
            text: "Patient Petri Net"
            font.pixelSize: 40
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            anchors.verticalCenterOffset: -278
            anchors.horizontalCenterOffset: 0
        }
        NetState {
            id: wait
            x: 88
            y: 207
            stateName: "wait"
        }

        NetTrans {
            id: start
            x: 254
            y: 192
            transName: "start"
            onClicked:{
                tstart2.fire()
            }
        }

        NetState {
            id: inside
            x: 418
            y: 207
            stateName: "inside"
        }

        NetTrans {
            id: change
            x: 595
            y: 192
            transName: "change"
            onClicked:{
                tchange2.fire()
            }
        }

        NetState {
            id: done
            x: 720
            y: 207
            stateName: "done"
        }

        NetArc {
            id: netArc
            x: 54
            y: 207
            length: 92

            NetArc {
                id: netArc1
                x: 166
                y: 0
                length: 110

                NetArc {
                    id: netArc2
                    x: 176
                    y: 0
                    length: 105

                    NetArc {
                        id: netArc3
                        x: 126
                        y: 0
                        length: 70
                    }
                }
            }
        }
    }
    Connections
    {
        target: pwait2
        function onSetToken(msg) {
            wait.token = msg
        }
    }
    Connections
    {
        target: tstart2
    }
    Connections
    {
        target: pinside2
        function onSetToken(msg) {
            inside.token = msg
        }
    }
    Connections
    {
        target: tchange2
    }
    Connections
    {
        target: pdone2
        function onSetToken(msg) {
            done.token = msg
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:2}D{i:4}D{i:3}D{i:5}D{i:6}D{i:8}D{i:7}
D{i:9}D{i:13}D{i:12}D{i:11}D{i:10}D{i:14}D{i:1}
}
##^##*/
