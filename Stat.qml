import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0
import QtQuick 2.0
import QtQuick.Controls 1.0
import Qt.labs.folderlistmodel 1.0

// Таблица

Rectangle {

    Connections{
        target: table
    }
    width: 600
    height: 300

    TableView {
        id: view
        anchors.margins: 10
        anchors.fill: parent
        model: table //attention
        clip: true

        TableViewColumn {
            width: 100
            title: "Nickname"
            role: "name"

        }
        TableViewColumn {
            width: 50
            title: "Time"
            role: "time"
        }
        TableViewColumn {
            width: 50
            title: "Average Speed"
            role: "speed"
        }
        TableViewColumn {
            width: 50
            title: "Mistakes"
            role: "mistakes"
        }
        TableViewColumn {
            width: 50
            title: "Date"
            role: "date"
        }

//        itemDelegate: Item {
//            Text {
//                anchors.left: parent.left
//                anchors.verticalCenter: parent.verticalCenter
//                renderType: Text.NativeRendering
//                text: table.data(0,name)

//            }
//        }
    }
}
