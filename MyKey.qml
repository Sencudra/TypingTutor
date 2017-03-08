import QtQuick 2.0

Rectangle {
    color: "red"
    border.color: "black"
    border.width: 1
    radius: 5
    height: 28
    width: 32

    Text{
        text: "G"
        font.pointSize: 8
        font.family: "Arial"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.fill:parent
    }
}


