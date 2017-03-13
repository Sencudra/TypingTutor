import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4

Item {
    id:newSlider
    width: 160
    height: 33

    property alias value:
    Slider{
        width: 160
        height: 33
        topPadding: 6
        stepSize: 1
        to: 64
        from: 18
        value: 18


    }
}
