import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0

Item{
    id: my_mainwindow
    width: 944
    height: 668
    anchors.right: sidebar.left

    property string defaultColor: nameField.background.border.color
    property alias supertextFontpointSize: supertext.font.pointSize
    property int fontSize : mySlider.value

    onFontSizeChanged: {
        console.log(fontSize)
        supertext.font.pixelSize = fontSize;
        text10.font.pixelSize = fontSize;
    }


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

            rectangleStop.color = "red"

            rectangleInput.color = "white"




        }

        onShowQmlText: {
            textMask.visible = false;

            rectangleInput.color = "#dad7d7"





        }

        onRoundEnded:{
            textMask.visible = true;
            textInput.enabled = false
            textInput.text = ""
            buttonStart.enabled = true
            rectangleStart.color = "#00ff4d"
            rectangleStop.color = "#eda09b"
            buttonStop.enabled = false
            textInput.enabled = false

            rectangleInput.color = "#dad7d7"

            nameField.enabled = true
            spinBox.enabled = true
            modeComboBox.enabled = true



        }
        onClearTextInput: {
            textInput.text = ""

        }

    }
    Item{
        id: leftpart
        width: 700

        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.rightMargin: 5

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
                        if (nameField.text == ""){
                            nameField.focus = true;
                            nameField.background.border.color = "red"
                            nameField.background.border.width = 2

                        }else{
                            nameField.focus = false;
                            nameField.background.border.color = "grey"
                            rectangleStart.color = "#A0FABB"

                            nameField.enabled = false
                            spinBox.enabled = false
                            modeComboBox.enabled = false

                            engine.changeMode(modeComboBox.currentIndex)
                            engine.changeName(nameField.text)
                            engine.changeText(spinBox.value)
                            engine.prepareRound()
                        }
                    }
                }

                Text {
                    id: text1
                    color: "#ffffff"
                    text: qsTr("Старт")
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
                color: "#eda09b"
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
                    text: qsTr("Стоп")
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
            anchors.rightMargin: 20
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

                Rectangle {
                    id: textMask
                    color: "#dad7d7"
                    anchors.fill: parent

                    Text {
                        id: text10
                        color: "#ffffff"
                        text: qsTr("Здесь появится текст. Будь готов! Не забудь настроить размер шрифта!")
                        elide: Text.ElideRight
                        styleColor: "#ffffff"
                        anchors.fill: parent
                        wrapMode: Text.WordWrap
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 40
                    }
                }

            }

        }

        Rectangle {
            id: rectangleInput
            width: 560
            height: 40
            color: "#dad7d7"
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
            width: 550
            height: 200
            anchors.horizontalCenter: parent.horizontalCenter

            MyKeyboard{
                width: 550
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

    Rectangle{
        id: sidebar
        color: "#00000000"
        anchors.left: leftpart.right
        anchors.leftMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        border.width: 0

        Text {
            id: text8
            x: 20
            width: 160
            height: 30
            color: "#000000"
            text: qsTr("Настройки")
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 10
            horizontalAlignment: Text.AlignHCenter
            font.family: "Helvetica"
            font.pointSize: 16
            verticalAlignment: Text.AlignVCenter
        }

        Slider{
            id: mySlider
            value: 18
            x: 37
            y: 269
            width: 160
            height: 28
            topPadding: 6
            stepSize: 1
            to: 64
            from: 18

        }

        Text {
            id: text9
            x: 14
            y: 7
            width: 160
            height: 30
            color: "#000000"
            text: qsTr("Текст")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: 0
            horizontalAlignment: Text.AlignHCenter
            anchors.top: parent.top
            anchors.topMargin: 213
            font.family: "Helvetica"
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 16
        }

        Text {
            id: text4
            x: 37
            y: 249
            text: qsTr("Размер шрифта")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 14
        }

        RowLayout {
            spacing: -20
            anchors.rightMargin: 10
            anchors.leftMargin: 10
            anchors.topMargin: 50
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.top: parent.top

            ColumnLayout {
                id: columnLayout
                width: 80
                Layout.fillHeight: false
                Layout.maximumHeight: 130
                Layout.maximumWidth: 110
                Layout.rowSpan: 1
                Layout.minimumHeight: 130
                Layout.minimumWidth: 110
                spacing: 0
                Layout.fillWidth: false
                Layout.preferredHeight: 130
                Layout.preferredWidth: 95

                Text {
                    id: text7
                    width: 80
                    text: qsTr("Имя")
                    Layout.preferredHeight: 30
                    Layout.preferredWidth: 90
                    horizontalAlignment: Text.AlignLeft
                    font.pixelSize: 18
                    verticalAlignment: Text.AlignVCenter
                }

                Text {
                    id: text6
                    width: 80
                    height: 30
                    text: qsTr("Режим")
                    horizontalAlignment: Text.AlignLeft
                    font.pixelSize: 18
                    verticalAlignment: Text.AlignVCenter
                }


                Text {
                    id: text5
                    y: 80
                    width: 80
                    text: qsTr("Текст №")
                    Layout.preferredHeight: 30
                    Layout.preferredWidth: 88
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: 18
                }
            }

            ColumnLayout {
                id: columnLayout1
                spacing: 5
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.preferredHeight: 100
                Layout.preferredWidth: 100

                TextField {
                    id: nameField
                    text: qsTr("")
                    Layout.preferredHeight: 30
                    Layout.preferredWidth: 140
                    focus: false
                    selectionColor: "#dcd1d1"
                    onFocusChanged: {
                        if (focus == true){
                            selectAll()
                            background.border.color = defaultColor
                        }
                    }

                }

                ComboBox {
                    id: modeComboBox
                    width: 140
                    height: 30
                    clip: false
                    currentIndex: 0
                    textRole: "text"
                    model: ListModel {
                        ListElement { text: "Обычный"; value: 0 }
                        ListElement { text: "Хардкор"; value: 1 }
                        ListElement { text: "Бесконечный"; value: 2 }
                    }
                }

                SpinBox {
                    id: spinBox
                    value: 1
                    Layout.preferredHeight: 30
                    Layout.preferredWidth: 140
                    from:0
                    to: engine.getTextNumber()

                    textFromValue: function(value) {
                        if (value === 0) return "Рандом"
                        else return value
                    }

                }


            }
        }

    }


}
