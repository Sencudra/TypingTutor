import QtQuick 2.0
import QtQuick.Layouts 1.0




Rectangle{
    id: keyboard

    property string darkRed:    "#c56868"
    property string myRed:      "#f1cfcf"

    property string darkYellow: "#c6bd67"
    property string myYellow:   "#f1efcf"

    property string darkGreen:  "#77c667"
    property string myGreen:    "#d5f1cf"

    property string darkBlue:   "#67bdc6"
    property string myBlue:     "#cfeef1"

    property string darkPink:   "#c667c6"
    property string myPink:     "#f1cff1"

    property string darkSpace:  "#8c67c6"
    property string mySpace:    "#dccff1"

    property int customRadius: 5
    property int customBorder: 1

    property bool isRus: true

    property string char: ""

    width: 550
    height: 200
    color: "#ededed"

    Connections{
        target: engine

        onRoundStarted:{
            switch


            console.log("WORKS!")}
    }

    Image {
        id: backgroundImage
        x: 0
        y: -47
        width: 550
        height: 300
        fillMode: Image.PreserveAspectFit
        source: "/files/back_keyboard.gif"
    }

    RowLayout {
        id: firstLine
        x: 11
        y: 11
        spacing: 3.2

        MyKey {
            id: a1
            color: myRed
            border.color: darkRed            
        }

        MyKey {
            id: num1
            color: myRed
            border.color: darkRed         
        }

        MyKey {
            id: num2
            color: myRed
            border.color: darkRed            
        }

        MyKey {
            id: num3
            color: myYellow
            border.color: darkYellow            
        }

        MyKey {
            id: num4
            color: myGreen
            border.color: darkGreen            
        }

        MyKey {
            id: num5
            color: myBlue
            border.color: darkBlue            
        }

        MyKey {
            id: num6
            color: myBlue
            border.color: darkBlue            
        }

        MyKey {
            id: num7
            color: myPink
            border.color: darkPink

        }

        MyKey {
            id: num8
            color: myGreen
            border.color: darkGreen

        }

        MyKey {
            id: num9
            color: myYellow
            border.color: darkYellow

        }

        MyKey {
            id: num0
            color: myRed
            border.color: darkRed

        }

        MyKey {
            id: sign1
            color: myRed
            border.color: darkRed

        }

        MyKey {
            id: sign2
            color: myRed
            border.color: darkRed

        }
    }

    RowLayout {
        id: secondLine
        x: 64
        y: 41
        MyKey {
            id: a2
            color: myRed
            border.color: darkRed           
        }

        MyKey {
            id: a3
            color: myYellow
            border.color: darkYellow            
        }

        MyKey {
            id: a4
            color: myGreen
            border.color: darkGreen            
        }

        MyKey {
            id: a5
            color: myBlue
            border.color: darkBlue            
        }

        MyKey {
            id: a6
            color: myBlue
            border.color: darkBlue           
        }

        MyKey {
            id: a7
            color: myPink
            border.color: darkPink            
        }

        MyKey {
            id: a8
            color: myPink
            border.color: darkPink           
        }

        MyKey {
            id: a9
            color: myGreen
            border.color: darkGreen            
        }

        MyKey {
            id: a10
            color: myYellow
            border.color: darkYellow           
        }

        MyKey {
            id: a11
            color: myRed
            border.color: darkRed            
        }

        MyKey {
            id: a12
            color: myRed
            border.color: darkRed           
        }

        MyKey {
            id: a13
            color: myRed
            border.color: darkRed            
        }
        spacing: 3.2
    }

    RowLayout {
        id: thirdline
        x: 77
        y: 72
        MyKey {
            id: a14
            color: myRed
            border.color: darkRed            
        }

        MyKey {
            id: a15
            color: myYellow
            border.color: darkYellow           
        }

        MyKey {
            id: a16
            color: myGreen
            border.color: darkGreen          
        }

        MyKey {
            id: a17
            color: myBlue
            border.color: darkBlue            
        }

        MyKey {
            id: a18
            color: myBlue
            border.color: darkBlue            
        }

        MyKey {
            id: a19
            color: myPink
            border.color: darkPink            
        }

        MyKey {
            id: a20
            color: myPink
            border.color: darkPink          
        }

        MyKey {
            id: a21
            color: myGreen
            border.color: darkGreen            
        }

        MyKey {
            id: a22
            color: myYellow
            border.color: darkYellow           
        }

        MyKey {
            id: a23
            color: myRed
            border.color: darkRed            
        }

        MyKey {
            id: a24
            color: myRed
            border.color: darkRed            
        }
        spacing: 3.2
    }

    // Line 4
    RowLayout {
        id: forthline
        x: 94
        y: 103
        //  Z Я
        MyKey {
            id: a25
            color: myRed
            border.color: darkRed
        }

        //  X Ч
        MyKey {
            id: a26
            color: myYellow
            border.color: darkYellow

        }

        //  C С
        MyKey {
            id: s27
            color: myGreen
            border.color: darkGreen

        }

        //  V М
        MyKey {
            id: a28
            color: myBlue
            border.color: darkBlue

        }

        //  B И
        MyKey {
            id: a29
            color: myBlue
            border.color: darkBlue

        }

        //  N Т
        MyKey {
            id: a30
            color: myPink
            border.color: darkPink

        }

        //  M Ь
        MyKey {
            id: a31
            color: myPink
            border.color: darkPink
        }

        //  , Б
        MyKey {
            id: a32
            color: myGreen
            border.color: darkGreen           
        }

        //  . Ю
        MyKey {
            id: a33
            color: myYellow
            border.color: darkYellow
        }

        // / ,
        MyKey{
            id: dot
            color: myRed
            border.color: darkRed
        }
        spacing: 3.2
    }

    Rectangle {
        id: shift_left
        x: 11
        y: 103
        width: 80
        height: 28
        color: myRed
        border.color: darkRed
        border.width: 1
        radius: customRadius
        Layout.preferredHeight: 28
        Layout.preferredWidth: 32
    }

    Rectangle {
        id: shift_right
        x: 448
        y: 103
        width: 90
        height: 28
        color: myRed
        border.color: darkRed
        border.width: 1
        radius: customRadius
        Layout.preferredHeight: 28
        Layout.preferredWidth: 32
    }

    Rectangle {
        id: space
        x: 134
        y: 133
        width: 241
        height: 28
        color: mySpace
        border.color: darkSpace
        border.width: 1
        radius: customRadius
        Layout.preferredHeight: 28
        Layout.preferredWidth: 32
    }
}
