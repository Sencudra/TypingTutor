import QtQuick 2.0
import QtQuick.Layouts 1.0

// Speed



    Rectangle {

        id: rectangle
        width: 200
        height: 65
        color: "#ffffff"
        radius: 4
        anchors.rightMargin: -96



        Text {
            id: speed1
            x: 112
            y: 8

            color: "#000000"
            text: (engine.current_speed)
            elide: Text.ElideLeft
            clip: false
            font.bold: true
            wrapMode: Text.NoWrap
            horizontalAlignment: Text.AlignRight
            font.pixelSize: 12
            verticalAlignment: Text.AlignVCenter
            width: 35
            height: 20
        }

        Text {
            id: text6
            x: 153
            y: 8
            color: "#000000"
            text: qsTr("зн/сек")
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            font.bold: false
            font.family: "Tahoma"
            font.pixelSize: 12

            width: 39
            height: 20
        }

        Text {
            id: speed
            x: 112
            y: 37
            color: "#000000"
            text: (engine.average_speed)
            elide: Text.ElideLeft
            wrapMode: Text.NoWrap
            clip: false


            font.bold: true

            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 12

            width: 35
            height: 20
        }

        Text {
            id: text5
            x: 153
            y: 37
            color: "#000000"
            text: qsTr("зн/сек")

            font.pixelSize: 12
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.bold: false
            font.family: "Tahoma"
            width: 39
            height: 20
        }

        Text {
            id: text1
            x: 8
            y: 8
            width: 92
            height: 20
            text: qsTr("Текущая скорость")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 12
        }

        Text {
            id: text2
            x: 8
            y: 37
            width: 92
            height: 20
            text: qsTr("Средняя скорость")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 12
        }
    }

