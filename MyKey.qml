import QtQuick 2.0

Rectangle {
    property alias text: txt.text
    property alias textcolor: txt.color
    color: "red"
    border.color: "black"
    border.width: 1
    radius: 5
    height: 28
    width: 32

    Text{
        id: txt
        text: "G"
        font.pointSize: 8
        font.family: "Arial"
        color: "black"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.fill:parent
    }
}


