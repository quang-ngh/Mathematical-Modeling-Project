import QtQuick 2.15
import QtQuick.Controls 2.15

Item{
    width: 906
    height: 484
    Rectangle {
        id: net1
        x: 0
        y: 0
        width: 906
        height: 486
        color: "#e0e0e0"

        Text{
            id: net1Text
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            width: 254
            height: 70
            color: "#ff9300"
            text: "Specialist Petri Net"
            font.pixelSize: 40
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            anchors.verticalCenterOffset: -278
            anchors.horizontalCenterOffset: 0
        }

        NetState {
            id: free
            x: 179
            y: 115
            stateName: "free"
        }

        NetTrans {
            id: start
            x: 189
            y: 276
            transName: "start"
            texty: 150
            onClicked:{
                tstart1.fire()
            }
        }

        NetState {
            id: docu
            x: 657
            y: 115
            stateName: "docu"
        }

        NetTrans {
            id: change
            x: 667
            y: 276
            transName: "change"
            texty: 150
            onClicked:{
                tchange1.fire()
            }
        }

        NetState {
            id: busy
            x: 418
            y: 291
            stateName: "busy"
            texty: 120
        }

        NetTrans {
            id: end
            x: 428
            y: 100
            transName: "end"
            onClicked:{
                tend1.fire()
            }
        }

        NetArc {
            id: netArc
            x: 218
            y: 291
            length: 175
        }

        NetArc {
            id: netArc1
            x: 468
            y: 291
            length: 175
        }

        NetArc {
            id: netArc2
            x: 114
            y: 141
            length: 87
            rotation: 90
        }

        NetArc {
            id: netArc3
            x: 474
            y: 115
            length: 177
            rotation: 180
        }
        NetArc {
            id: netArc4
            x: 248
            y: 115
            rotation: 180
            length: 175
        }

        NetArc {
            id: netArc5
            x: 592
            y: 247
            length: 90
            rotation: 270
        }
    }
    Connections
    {
        target: pfree1
        function onSetToken(msg) {
            free.token = msg
        }
    }
    Connections
    {
        target: tstart1
    }
    Connections
    {
        target: pdocu1
        function onSetToken(msg) {
            docu.token = msg
        }
    }
    Connections
    {
        target: tchange1
    }
    Connections
    {
        target: pbusy1
        function onSetToken(msg) {
            busy.token = msg
        }
    }
    Connections
    {
        target: tend1
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:484;width:906}D{i:2}D{i:3}D{i:4}D{i:5}D{i:6}D{i:7}D{i:8}
D{i:9}D{i:10}D{i:11}D{i:12}D{i:13}D{i:14}D{i:1}D{i:15}D{i:16}D{i:17}D{i:18}D{i:19}
D{i:20}
}
##^##*/
