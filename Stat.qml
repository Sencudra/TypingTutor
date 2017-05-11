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
        width: 157
        highlightOnFocus: false
        currentRow: -1
        anchors.fill: parent
        model: table //attention
        clip: true

        TableViewColumn {
            width: 157
            title: "Имя пользователя"
            role: "name"
            resizable: false
            horizontalAlignment: Text.AlignHCenter

        }
        TableViewColumn {
            width: 157
            title: "Время"
            role: "time"
            resizable: false
            horizontalAlignment: Text.AlignHCenter
        }
        TableViewColumn {
            width: 157
            title: "Средняя скорость"
            role: "speed"
            resizable: false
            horizontalAlignment: Text.AlignHCenter
        }
        TableViewColumn {
            width: 157
            title: "Ошибки"
            role: "mistakes"
            resizable: false
            horizontalAlignment: Text.AlignHCenter
        }
        TableViewColumn {

            width: 157
            title: "Дата"
            role: "date"
            resizable: false
            horizontalAlignment: Text.AlignHCenter
        }
        TableViewColumn {
            width: 157
            title: "Режим"
            role: "mode"
            resizable: false
            horizontalAlignment: Text.AlignHCenter
        }
    }
}
