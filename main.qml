import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0



ApplicationWindow {

    Connections{
        target: pageLoad


        onFontSizeChanged: {supertext.font.pixelSize = fontSize;}
    }
    
    property string textToWindow: "Welcome to True Typing Editor <b><s>ever</s></b> (TTT). Click start for practicing!"
    property int fontSize : mySlider.value
    
    
    id: window1
    visible: true
    minimumHeight:700
    minimumWidth: 840
    maximumHeight: 700
    maximumWidth: 840
    width: 1024
    height: 768
    //property alias supertextFontpointSize: supertext.font.pointSize
    //property alias supertextStyleColor: supertext.styleColor
    title: qsTr("True Typing Teacher (TTT)")
    
    Rectangle{
        id: mainView
        anchors.margins: 10
        border.color: "black"
        color: "#ebebeb"
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: sidebar.left
        anchors.rightMargin: 0
        border.width: 0

        TabBar {
            id:myBar
            height: 40
            anchors.right: parent.right
            anchors.rightMargin: 40
            anchors.left: parent.left
            anchors.leftMargin: 40
            anchors.top: parent.top
            anchors.topMargin: 20
            width: parent.width
            TabButton {
                id: gameTub
                text: qsTr("Game");
                antialiasing: false
                wheelEnabled: false
                checked: true
                hoverEnabled: false
                down: false
                onClicked:{
                    pageLoad.sourceComponent = firstWindow
                    rect2.color = "white"
                    text2.color = "#94df97"
                    rect1.color = "#94df97"
                    text1.color = "white"
                }

                background: Rectangle{
                    id:rect1
                    implicitWidth: 100
                    implicitHeight: 40

                    color: "#94df97"
                    border.color: "#94df97"
                    border.width: 2
                    radius: 0
                }
                contentItem: Text{
                    id: text1
                    text: gameTub.text
                    font.family: "Helvetica"
                    font.pointSize: 16
                    font.bold: false

                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }
            }
            TabButton {
                id: statTub
                text: qsTr("Statistic")
                onClicked:{
                    rect2.color = "#94df97"
                    text2.color = "white"
                    rect1.color = "white"
                    text1.color = "#94df97"
                    pageLoad.source = "Stat.qml"
                }
                background: Rectangle{
                    id: rect2
                    implicitWidth: 100
                    implicitHeight: 40

                    color: "white"
                    border.color: "#94df97"
                    border.width: 2
                    radius: 0
                }
                contentItem: Text{
                    id: text2
                    text: statTub.text
                    opacity: enabled ? 1.0 : 0.3
                    color: "#94df97"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight

                    font.family: "Helvetica"
                    font.pointSize: 16
                    font.bold: false
                }

            }
        }

        Item {
                id: item4
                height: 518
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.right: parent.right
                anchors.rightMargin: 40
                anchors.left: parent.left
                anchors.leftMargin: 40
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20
                anchors.top: myBar.bottom
                anchors.topMargin: 20

                Loader{
                    id:pageLoad
                    anchors.fill: parent
                    sourceComponent: firstWindow
                }

                Rectangle {
                    id: rectangle
                    color: "#ebebeb"
                    z: -1
                    anchors.bottomMargin: 1
                    anchors.fill: parent
                }
        }

        Component{
            id: firstWindow

            Item{
                id: item1
                width: 600
                height: 600

                Connections{
                    id: classConnection
                    target: engine

                    //Signals, which come from class

                    onRoundStarted: {
                        // Actions
                        // Enabled/disabled
                        buttonStart.enabled = false
                        buttonStop.enabled = true
                        textInput.enabled = true
                        textInput.forceActiveFocus()

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

                Item{
                    id:speedvolume
                    height: mySM.height
                    width: mySM.width
                    SMLayout{
                        id: mySM

                    }
                }

                Item{
                    id: startEnd
                    width: 100
                    height: 80
                    anchors.left: speedvolume.right
                    anchors.leftMargin: 10

                    Rectangle{
                        id: rectangleStart
                        width: startEnd.width
                        height: 30
                        color: "#00ff4d"
                        radius: 5
                        MouseArea{
                            id: buttonStart
                            enabled: true
                            hoverEnabled: false
                            anchors.fill: parent

                            onClicked:{
                                buttonStop
                                engine.prepareRound()

                            }
                        }

                        Text {
                            id: text1
                            color: "#ffffff"
                            text: qsTr("Start")
                            font.family: "Helvetica"
                            font.pointSize: 16

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

                        }

                    }

                    Rectangle{
                        id: rectangleStop
                        height: 30
                        width: startEnd.width
                        color: "#eb6f63"
                        radius: 5
                        anchors.top: rectangleStart.bottom
                        anchors.topMargin: 4

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
                            x: 500
                            y: -45
                            color: "#ffffff"
                            text: qsTr("Stop")
                            font.family: "Helvetica"
                            font.pointSize: 16

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
                }

                Text {
                    text:engine.secsInfo
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    anchors.left: startEnd.right
                    anchors.leftMargin: 20
                    font.bold: true
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    wrapMode: Text.WordWrap
                    elide: Text.ElideRight
                    font.family: "Tahoma"
                    fontSizeMode: Text.Fit
                    id: timeLabel
                    height: 30
                    color: "#000000"

                    font.pixelSize: 34
                }

                Rectangle{
                    id: rectangleText
                    height: 200
                    color: "white"
                    radius: 5
                    border.width: 0
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    anchors.top: speedvolume.bottom
                    anchors.topMargin: 10
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

                        font.pixelSize: 20

                        renderType: Text.QtRendering
                        verticalAlignment: Text.AlignTop
                        anchors.fill:parent
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.top: parent.top

                    }

                }

                Rectangle {
                    id: rectangleInput
                    width: 560
                    height: 40
                    color: "#ffffff"
                    radius: 5
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    anchors.top: rectangleText.bottom
                    anchors.topMargin: 10
                    border.width: 0

                    TextInput {
                        id: textInput
                        x: -20
                        y: -327
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

                Item{
                    id: item2
                    y: 326
                    height: 200
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    anchors.right: parent.right
                    anchors.rightMargin: 0

                    MyKeyboard{
                        //anchors.horizontalCenter: parent.horizontalCenter
                        anchors.leftMargin: 5
                        anchors.fill: parent

                    }
                }

                Item {
                    id: item3
                    x: 330
                    y: 36
                    width: 240
                    height: 29

                    Text {
                        id: text2
                        x: 0
                        y: 0
                        width: 134
                        height: 29
                        text: qsTr("Ошибки")
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 20
                    }

                    Text {
                        id: mistakesCounter
                        y: 0
                        height: 29
                        text: engine.numMistake
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.left: text2.right
                        anchors.leftMargin: 0
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                        font.pixelSize: 12 + engine.numMistake
                    }
                }
            }
        }


    }


    Rectangle{
        id: sidebar
        color: "#94df97"
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        border.width: 0
        width: 200

        Text {
            id: text8
            x: 20
            y: 49
            width: 160
            height: 30
            color: "#ffffff"
            text: qsTr("Настройки")
            horizontalAlignment: Text.AlignHCenter
            font.family: "Helvetica"
            font.pointSize: 16
            verticalAlignment: Text.AlignVCenter
        }

        Slider{
            id: mySlider
            value: 18
            x: 20
            y: 85
            width: 160
            height: 28
            topPadding: 6
            stepSize: 1
            to: 64
            from: 18

        }

    }
}




