import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0



Window {

    property string textToWindow: "Welcome to True Typing Editor <b><s>ever</s></b> (TTT). Click start for practicing!"
    property int fontSize : mySlider.value



    onFontSizeChanged: { supertext.font.pixelSize = fontSize;}

    id: window1
    visible: true
    minimumHeight:600
    minimumWidth: 800
    maximumHeight: 600
    maximumWidth: 800
    width: 800
    height: 600
    property alias supertextFontpointSize: supertext.font.pointSize
    property alias supertextStyleColor: supertext.styleColor
    title: qsTr("True Typing Teacher (TTT)")


    Connections{
        target: engine

        //Signals, which come from class

        onRoundStarted: {
            // Actions
            // Enabled/disabled
            buttonStart.enabled = false
            buttonStop.enabled = true
            textInput.enabled = true

            //color
            rectangleStart.color = "#A0FABB"
            rectangleStop.color = "red"



        }

        onRoundEnded:{
            textInput.enabled = false
            textInput.text = ""
            buttonStart.enabled = true
            rectangleStart.color = "#00ff4d"
            rectangleStop.color = "#eb6f63"
            buttonStop.enabled = false
            textInput.enabled = false

        }

        onClearTextInput: {
            textInput.text = ""

        }
    }

    Rectangle{
        id: mainView
        x: 0
        y: 0
        anchors.margins: 10
        border.color: "black"
        width: 600
        height: 600
        color: "#ededed"
        border.width: 0


        Rectangle{
            id: rectangleText
            height: 200
            color: "white"
            radius: 5
            border.width: 1
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.top: parent.top
            anchors.topMargin: 96
            border.color: "black"

            Text{
                id: supertext
                text: engine.currentText
                textFormat: Text.AutoText
                elide: Text.ElideRight
                wrapMode: Text.WrapAnywhere
                anchors.topMargin: 5
                anchors.leftMargin: 5
                anchors.rightMargin: 5
                anchors.bottomMargin: 5


                renderType: Text.QtRendering
                verticalAlignment: Text.AlignTop
                anchors.fill:parent
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                anchors.top: parent.top

            }

        }


        Item{
            x: 25
            y: 262
            MyKeyboard{
                x: 0
                y:163

            }
        }

        Rectangle {
            id: rectangleInput
            x: 25
            y: 332
            width: 560
            height: 40
            color: "#ffffff"
            radius: 5
            border.width: 0

            TextInput {
                id: textInput
                anchors.rightMargin: 5
                anchors.leftMargin: 5
                anchors.bottomMargin: 5
                anchors.topMargin: 5
                anchors.fill: parent
                font.pixelSize: 29
                enabled: false
                onTextChanged: if (textInput.enabled == true)
                                   engine.isRight(textInput.text) ? rectangleInput.color = "white" : rectangleInput.color = "red"
            }
        }



        Rectangle{
            id: bar
            color: "#2ccb71"
            width: 200
            height: 600
            anchors.left: mainView.right

            Rectangle{
                id: rectangleStart
                height: 30
                color: "#00ff4d"
                anchors.right: parent.right
                anchors.rightMargin: 20
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.top: parent.top
                anchors.topMargin: 20

                MouseArea{
                    id: buttonStart
                    enabled: true
                    hoverEnabled: false
                    anchors.fill: parent

                    onClicked:{
                        buttonStop
                        engine.startRound()

                    }
                }

                Text {
                    id: text1
                    color: "#ffffff"
                    text: qsTr("Start")
                    font.bold: true

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter

                    anchors.rightMargin: 5
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.top: parent.top
                    anchors.leftMargin: 5
                    anchors.bottomMargin: 5
                    anchors.topMargin: 5
                    font.pixelSize: 18
                }

            }

            Text {
                text:engine.secsInfo
                font.bold: true
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WordWrap
                elide: Text.ElideRight
                font.family: "Tahoma"
                anchors.rightMargin: 20
                anchors.leftMargin: 20
                anchors.right: parent.right
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 92
                fontSizeMode: Text.Fit
                id: text2
                height: 30
                color: "#ffffff"

                font.pixelSize: 34
            }

            Rectangle{
                id: rectangleStop
                height: 30
                color: "#eb6f63"
                anchors.right: parent.right
                anchors.rightMargin: 20
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.top: parent.top
                anchors.topMargin: 56

                MouseArea{
                    id: buttonStop
                    enabled: false
                    hoverEnabled: false
                    anchors.fill: parent

                    onClicked:{
                        // Stop
                        buttonStart.enabled = true
                        rectangleStart.color = "#00ff4d"
                        rectangleStop.color = "#eb6f63"
                        buttonStop.enabled = false
                        textInput.enabled = false
                        engine.stopRound()

                    }
                }

                Text {
                    id: text3
                    color: "#ffffff"
                    text: qsTr("Stop")
                    font.bold: true
                    font.family: "Tahoma"

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter

                    anchors.rightMargin: 5
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.top: parent.top
                    anchors.leftMargin: 5
                    anchors.bottomMargin: 5
                    anchors.topMargin: 5
                    font.pixelSize: 18
                }

            }

            Text {
                id: speed
                x: -140
                y: 42
                width: 38
                height: 22
                color: "#ffffff"
                text: (engine.average_speed)
                font.bold: true
                wrapMode: Text.WrapAnywhere
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 12
            }

            Text {
                id: text5
                x: -102
                y: 42
                width: 31
                height: 22
                color: "#ffffff"
                text: qsTr("зн/сек")
                font.pixelSize: 12
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                font.bold: false
                font.family: "Tahoma"
            }

            Text {
                id: speed1
                x: 20
                y: 236
                width: 78
                height: 30
                color: "#ffffff"
                text: (engine.current_speed)
                font.bold: true
                wrapMode: Text.WrapAnywhere
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 12
                verticalAlignment: Text.AlignVCenter
            }

            Text {
                id: text6
                x: 87
                y: 236
                width: 78
                height: 30
                color: "#ffffff"
                text: qsTr("Символов/сек")
                horizontalAlignment: Text.AlignLeft
                font.bold: false
                font.family: "Tahoma"
                font.pixelSize: 12
                verticalAlignment: Text.AlignVCenter
            }

            Text {
                id: text7
                x: 20
                y: 128
                width: 160
                height: 30
                color: "#ffffff"
                text: qsTr("Средняя скорость")
                horizontalAlignment: Text.AlignHCenter
                font.bold: false
                font.family: "Tahoma"
                font.pixelSize: 12
                verticalAlignment: Text.AlignVCenter
            }

            Text {
                id: text8
                x: 20
                y: 200
                width: 160
                height: 30
                color: "#ffffff"
                text: qsTr("Текущая скорость")
                horizontalAlignment: Text.AlignHCenter
                font.bold: false
                font.family: "Tahoma"
                font.pixelSize: 12
                verticalAlignment: Text.AlignVCenter
            }

            Slider {
                id: mySlider
                x: 20
                y: 284
                width: 160
                height: 33
                stepSize: 1
                to: 64
                from: 18
                value: 18
            }
        }

    }
}


