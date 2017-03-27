import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0
import QtQuick 2.0
import QtQuick.Controls 1.0
import Qt.labs.folderlistmodel 1.0


Rectangle {

    Connections{
    target: engine
    }
    width: 600
    height: 300


//    ListModel {
//        id: dataModel
//        model: d

//    }

    TableView {
        id: view

        anchors.margins: 10
        anchors.fill: parent
        model: engine.myModel //attention
        clip: true

        TableViewColumn {
            width: 50
            title: "Nickname"
            role: "name"
        }
        TableViewColumn {
            width: 100
            title: "Time"
            role: "time"
        }
        TableViewColumn {
            width: 100
            title: "Average Speed"
            role: "speed"
        }
        TableViewColumn {
            width: 100
            title: "Mistakes"
            role: "mistakes"
        }

        itemDelegate: Item {
            Text {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                renderType: Text.NativeRendering
                text: styleData.value
            }
        }
    }
}
