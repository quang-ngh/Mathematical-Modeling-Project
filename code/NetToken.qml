import QtQuick 2.15
import QtQuick.Controls 2.15

Image {
    id: tokens
    source: "token.png"
    anchors.verticalCenterOffset: 0
    anchors.horizontalCenterOffset: 0
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter
    fillMode: Image.PreserveAspectFit
    height: 15
    width: 15
    property int token: 0
    property int statetoken: 1
    property bool visibility:
        if (tokens.statetoken > 10) {return false}
        else if (tokens.statetoken > tokens.token) {return true}
        else {return false}
    visible: tokens.visibility
}
