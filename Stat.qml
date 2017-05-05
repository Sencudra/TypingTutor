import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0
import QtQuick 2.0
import QtQuick.Controls 1.0
import Qt.labs.folderlistmodel 1.0

// Таблица

Rectangle {
    width: 560
    height: 300

    Connections{
        target: table
    }


    TableView {
        id: view
        anchors.fill: parent
        model: table //attention
        clip: true

        TableViewColumn {
            width: 85
            title: "Nickname"
            role: "name"
            resizable: false
            horizontalAlignment: Text.AlignHCenter

        }
        TableViewColumn {
            width: 85
            title: "Time"
            role: "time"
            resizable: false
            horizontalAlignment: Text.AlignHCenter
        }
        TableViewColumn {
            width: 85
            title: "Average Speed"
            role: "speed"
            resizable: false
            horizontalAlignment: Text.AlignHCenter
        }
        TableViewColumn {
            width: 70
            title: "Mistakes"
            role: "mistakes"
            resizable: false
            horizontalAlignment: Text.AlignHCenter
        }
        TableViewColumn {

            width: 150
            title: "Date"
            role: "date"
            resizable: false
            horizontalAlignment: Text.AlignHCenter
        }
        TableViewColumn {
            width: 90
            title: "Mode"
            role: "mode"
            resizable: false
            horizontalAlignment: Text.AlignHCenter
        }
    }
}
