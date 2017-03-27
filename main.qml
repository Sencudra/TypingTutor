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
    minimumHeight:600
    minimumWidth: 800
    maximumHeight: 600
    maximumWidth: 800
    width: 800
    height: 600
    //property alias supertextFontpointSize: supertext.font.pointSize
    //property alias supertextStyleColor: supertext.styleColor
    title: qsTr("True Typing Teacher (TTT)")
    
    



    Rectangle{
        id: mainView
        x: 0
        y: 0
        anchors.margins: 10
        border.color: "black"
        width: 600
        height: 600
        color: "#ebebeb"
        border.width: 0

        TabBar {
            id:myBar
            height: 40
            width: parent.width
            TabButton { text: qsTr("Game")
               onClicked: pageLoad.sourceComponent = firstWindow
                }
            TabButton { text: qsTr("Statistic")
               onClicked: pageLoad.source = "Stat.qml"}
        }
        Loader{
            id:pageLoad
            y:50

            sourceComponent: firstWindow
        }

        Component{
            id: firstWindow





        Item{

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
            id: item1
            width: 600
            height: 600

//            anchors.bottomMargin: 10
//            anchors.topMargin: 10
//            anchors.leftMargin: 15
//            anchors.right: mainView.right
//            anchors.bottom: mainView.bottom
//            anchors.left: mainView.left
//            anchors.top: myBar.bottom
//            anchors.rightMargin: 15
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
                        anchors.leftMargin: 10
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
            id: bar
            color: "#2ccb71"
            width: 200
            height: 600
            anchors.left: mainView.right
            
            Text {
                id: text8
                x: 20
                y: 49
                width: 160
                height: 30
                color: "#ffffff"
                text: qsTr("Настройки")
                horizontalAlignment: Text.AlignHCenter
                font.bold: false
                font.family: "Tahoma"
                font.pixelSize: 12
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
    



