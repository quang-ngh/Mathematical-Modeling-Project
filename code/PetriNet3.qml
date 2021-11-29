import QtQuick 2.15
import QtQuick.Controls 2.15

Item{
    width: 906
    height: 484
    Rectangle {
        id: net3
        x: 0
        y: 0
        width: 906
        height: 486
        color: "#e0e0e0"

        Text{
            id: net3Text
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            width: 254
            height: 70
            color: "#ff9300"
            text: "System Petri Net"
            font.pixelSize: 40
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            anchors.verticalCenterOffset: -278
            anchors.horizontalCenterOffset: 0
        }
    }
    NetState {
        id: wait
        x: 88
        y: 228
        stateName: "wait"
    }

    NetTrans {
        id: start
        x: 254
        y: 213
        texty: 150
        onClicked: {
            tstart.fire()
        }
        transName: "start"
    }

    NetState {
        id: inside
        x: 418
        y: 228
        stateName: "inside"
    }

    NetTrans {
        id: change
        x: 595
        y: 213
        texty: 150
        onClicked: {
            tchange.fire()
        }
        transName: "change"
    }

    NetState {
        id: done
        x: 719
        y: 228
        stateName: "done"
    }

    NetState {
        id: free
        x: 244
        y: 68
        stateName: "free"
    }

    NetState {
        id: docu
        x: 585
        y: 68
        stateName: "docu"
    }

    NetState {
        id: busy
        x: 418
        y: 356
        stateName: "busy"
        texty: 120
    }

    NetTrans {
        id: end
        x: 428
        y: 53
        transName: "end"
        onClicked:{
            tend.fire()
        }
    }


    NetArc {
        id: netArc
        x: 55
        y: 228
        NetArc {
            id: netArc1
            x: 166
            y: 0
            NetArc {
                id: netArc2
                x: 176
                y: 0
                NetArc {
                    id: netArc3
                    x: 126
                    y: 0
                    length: 73
                }
                length: 105
            }
            length: 112
        }

        NetArc {
            id: netArc8
            x: 182
            y: 65
            opacity: 0.978
            length: 135
            rotation: 30
        }
        length: 92
    }
    NetArc {
        id: netArc4
        x: 313
        y: 68
        rotation: 180
        length: 112
    }

    NetArc {
        id: netArc5
        x: 479
        y: 68
        rotation: 180
        length: 105
    }


    NetArc {
        id: netArc6
        x: 179
        y: 82
        length: 75
        rotation: 90
    }
    NetArc {
        id: netArc7
        x: 411
        y: 321
        length: 130
        rotation: 330
    }

    NetArc {
        id: netArc9
        x: 520
        y: 199
        length: 75
        rotation: 270
    }

    Connections
    {
        target: pfree
        function onSetToken(msg) {
            free.token = msg
        }
    }
    Connections
    {
        target: pdocu
        function onSetToken(msg) {
            docu.token = msg
        }
    }
    Connections
    {
        target: pbusy
        function onSetToken(msg) {
            busy.token = msg
        }
    }
    Connections
    {
        target: pwait
        function onSetToken(msg) {
            wait.token = msg
        }
    }
    Connections
    {
        target: pinside
        function onSetToken(msg) {
            inside.token = msg
        }
    }
    Connections
    {
        target: pdone
        function onSetToken(msg) {
            done.token = msg
        }
    }
    Connections
    {
        target: tstart
    }
    Connections
    {
        target: tchange
    }
    Connections
    {
        target: tend
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:486;width:906}D{i:2}D{i:1}D{i:3}D{i:4}D{i:5}D{i:6}D{i:7}
D{i:8}D{i:9}D{i:10}D{i:11}D{i:15}D{i:14}D{i:13}D{i:16}D{i:12}D{i:17}D{i:18}D{i:19}
D{i:20}D{i:21}D{i:22}D{i:23}D{i:24}D{i:25}D{i:26}D{i:27}D{i:28}D{i:29}D{i:30}
}
##^##*/
