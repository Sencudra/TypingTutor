import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0



ApplicationWindow {

    Connections{
        target: engine

        onActiveRound:{
            statTub.enabled = false
        }

        onRoundEnded:{
            statTub.enabled = true
        }
    }

    id: window1
    visible: true
    minimumHeight:768
    minimumWidth: 1024
    maximumHeight:768
    maximumWidth: 1024
    width: 1024
    height: 768
    color: "#f20000"

    title: qsTr("True Typing Teacher (TTT)")

    Rectangle{
        id: mainView
        anchors.margins: 10
        border.color: "black"
        color: "#ebebeb"
        visible: true
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        border.width: 0

        TabBar {
            id:myBar
            height: 40
            z: 1
            anchors.right: parent.right
            anchors.rightMargin: 40
            anchors.left: parent.left
            anchors.leftMargin: 40
            anchors.top: parent.top
            anchors.topMargin: 10
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
                    rectangle2.visible = true
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
                    font.family: "Helvetica"
                    font.pointSize: 16
                    font.bold: false

                    color: "white"
                    text: "Тренировка"
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
                    rectangle2.visible = false
                    pageLoad.source = "Stat.qml"


                    // Stop
                    engine.stopRound()

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
                    opacity: enabled ? 1.0 : 0.3
                    color: "#94df97"
                    text: "Статистика"
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
            z: 1
            //anchors.horizontalCenter: parent.horizontalCenter
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
                color: "#00000000"
                z: -1
                anchors.bottomMargin: 1
                anchors.fill: parent
            }
        }


        Rectangle {
            id: rectangle2
            x: 754
            y: 0
            width: 270
            visible: true
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.top: rectangle1.bottom
            anchors.topMargin: 0
            z: 0
        }

        Component{
            id: firstWindow

                MainWindow{}
        }

        Rectangle {
            id: rectangle1
            x: 0
            y: 0
            width: 1024
            height: 60
            color: "#ffffff"
        }



    }


}
