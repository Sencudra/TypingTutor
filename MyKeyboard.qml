import QtQuick 2.0
import QtQuick.Layouts 1.0


Rectangle{
    id: keyboard
    width: 550
    height: 200
    color: "#ededed"

    Lang{
        id: myLang
    }

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
    property string myWhite:    "#ffffff"

    property int customRadius: 5
    property int customBorder: 1

    property bool isRus: true

    property int newChar: engine.currentChar

    function deactivise(){
        f_a1.visible = false;
        f_a2.visible = false;
        f_a3.visible = false;
        f_a4.visible = false;
        f_a5.visible = false;
        f_a6.visible = false;
        f_a7.visible = false;
        f_a8.visible = false;
        f_a9.visible = false;
        f_a10.visible = false;
        f_a11.visible = false;
        f_a12.visible = false;
        f_a13.visible = false;
        f_a14.visible = false;
        f_a15.visible = false;
        f_a16.visible = false;
        f_a17.visible = false;
        f_a18.visible = false;
        f_a19.visible = false;
        f_a20.visible = false;
        f_a21.visible = false;
        f_a22.visible = false;
        f_a23.visible = false;
        f_a24.visible = false;
        f_a25.visible = false;
        f_a26.visible = false;
        f_a27.visible = false;
        f_a28.visible = false;
        f_a29.visible = false;
        f_a30.visible = false;
        f_a31.visible = false;
        f_a32.visible = false;
        f_a33.visible = false;
        f_dot.visible = false;
        f_num1.visible = false;
        f_num2.visible = false;
        f_num3.visible = false;
        f_num4.visible = false;
        f_num5.visible = false;
        f_num6.visible = false;
        f_num7.visible = false;
        f_num8.visible = false;
        f_num9.visible = false;
        f_num0.visible = false;
        f_sign1.visible = false;
        f_sign2.visible = false;
        f_shift_left.visible = false;
        f_shift_right.visible = false;
        f_space.visible = false;
    }

    Connections{
        target: engine


        onRoundEnded:{
            deactivise()

            }

        onCharChanged:{
            deactivise()
            var newChar = engine.currentChar

            if(newChar < 0)
            {
                f_shift_left.visible = true
                f_shift_right.visible = true
                newChar*=-1;
            }


            // DISCLAIMER :: DONT OPEN - DANGEROUS FOR YOUR EYES
            // DISCLAIMER :: DONT OPEN - DANGEROUS FOR YOUR EYES
            // DISCLAIMER :: DONT OPEN - DANGEROUS FOR YOUR EYES
            switch(newChar){
                case 0:case 1:      f_a1.visible = true;    break;
                case 2:case 3:      f_num1.visible = true;  break;
                case 4:case 5:      f_num2.visible = true;  break;
                case 6:case 7:      f_num3.visible = true;  break;
                case 8:case 9:      f_num4.visible = true;  break;
                case 10:case 11:    f_num5.visible = true; break;
                case 12:case 13:    f_num6.visible = true; break;
                case 14:case 15:    f_num7.visible = true; break;
                case 16:case 17:    f_num8.visible = true; break;
                case 18:case 19:    f_num9.visible = true; break;
                case 20:case 21:    f_num0.visible = true; break;
                case 22:case 23:    f_sign1.visible = true;break;
                case 24:case 25:    f_sign2.visible = true;break;

                case 26:            f_a2.visible = true;    break;
                case 27:            f_a3.visible = true;    break;
                case 28:            f_a4.visible = true;    break;
                case 29:            f_a5.visible = true;    break;
                case 30:            f_a6.visible = true;    break;
                case 31:            f_a7.visible = true;    break;
                case 32:            f_a8.visible = true;    break;
                case 33:            f_a9.visible = true;    break;
                case 34:            f_a10.visible = true;   break;
                case 35:            f_a11.visible = true;   break;
                case 36:case 37:    f_a12.visible = true;   break;
                case 38:case 39:    f_a13.visible = true;   break;

                case 40:            f_a14.visible = true;   break;
                case 41:            f_a15.visible = true;   break;
                case 42:            f_a16.visible = true;   break;
                case 43:            f_a17.visible = true;   break;
                case 44:            f_a18.visible = true;   break;
                case 45:            f_a19.visible = true;   break;
                case 46:            f_a20.visible = true;   break;
                case 47:            f_a21.visible = true;   break;
                case 48:            f_a22.visible = true;   break;
                case 49:case 50:    f_a23.visible = true;   break;
                case 51:case 52:    f_a24.visible = true;   break;

                case 53:            f_a25.visible = true;   break;
                case 54:            f_a26.visible = true;   break;
                case 55:            f_a27.visible = true;   break;
                case 56:            f_a28.visible = true;   break;
                case 57:            f_a29.visible = true;   break;
                case 58:            f_a30.visible = true;   break;
                case 59:            f_a31.visible = true;   break;
                case 60:case 61:    f_a32.visible = true;   break;
                case 62:case 63:    f_a33.visible = true;   break;
                case 64:case 65:    f_dot.visible = true;   break;
                        case 66:    f_space.visible = true; break;

            }
        }
    }
    //backGround panel
    // DISCLAIMER :: DONT OPEN - DANGEROUS FOR YOUR EYES
    // DISCLAIMER :: DONT OPEN - DANGEROUS FOR YOUR EYES
    // DISCLAIMER :: DONT OPEN - DANGEROUS FOR YOUR EYES

    Item{
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
            text: myLang.l_f_a1
        }

        MyKey {
            id: num1
            color: myRed
            border.color: darkRed
            text: myLang.l_f_num1
        }

        MyKey {
            id: num2
            color: myRed
            border.color: darkRed
            text: myLang.l_f_num2
        }

        MyKey {
            id: num3
            color: myYellow
            border.color: darkYellow
            text: myLang.l_f_num3
        }

        MyKey {
            id: num4
            color: myGreen
            border.color: darkGreen
            text: myLang.l_f_num4
        }

        MyKey {
            id: num5
            color: myBlue
            border.color: darkBlue
            text: myLang.l_f_num5
        }

        MyKey {
            id: num6
            color: myBlue
            border.color: darkBlue
            text: myLang.l_f_num6
        }

        MyKey {
            id: num7
            color: myPink
            border.color: darkPink
            text: myLang.l_f_num7

        }

        MyKey {
            id: num8
            color: myGreen
            border.color: darkGreen
            text: myLang.l_f_num8

        }

        MyKey {
            id: num9
            color: myYellow
            border.color: darkYellow
            text: myLang.l_f_num9

        }

        MyKey {
            id: num0
            color: myRed
            border.color: darkRed
            text: myLang.l_f_num0

        }

        MyKey {
            id: sign1
            color: myRed
            border.color: darkRed
            text: myLang.l_f_sign1

        }

        MyKey {
            id: sign2
            color: myRed
            border.color: darkRed
            text: myLang.l_f_sign2

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
            text: myLang.l_f_a2
        }

        MyKey {
            id: a3
            color: myYellow
            border.color: darkYellow
            text: myLang.l_f_a3
        }

        MyKey {
            id: a4
            color: myGreen
            border.color: darkGreen
            text: myLang.l_f_a4
        }

        MyKey {
            id: a5
            color: myBlue
            border.color: darkBlue
            text: myLang.l_f_a5
        }

        MyKey {
            id: a6
            color: myBlue
            border.color: darkBlue
            text: myLang.l_f_a6
        }

        MyKey {
            id: a7
            color: myPink
            border.color: darkPink
            text: myLang.l_f_a7
        }

        MyKey {
            id: a8
            color: myPink
            border.color: darkPink
            text: myLang.l_f_a8
        }

        MyKey {
            id: a9
            color: myGreen
            border.color: darkGreen
            text: myLang.l_f_a9
        }

        MyKey {
            id: a10
            color: myYellow
            border.color: darkYellow
            text: myLang.l_f_a10
        }

        MyKey {
            id: a11
            color: myRed
            border.color: darkRed
            text: myLang.l_f_a11
        }

        MyKey {
            id: a12
            color: myRed
            border.color: darkRed
            text: myLang.l_f_a12
        }

        MyKey {
            id: a13
            color: myRed
            border.color: darkRed
            text: myLang.l_f_a13
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
            text: myLang.l_f_a14
        }

        MyKey {
            id: a15
            color: myYellow
            border.color: darkYellow
            text: myLang.l_f_a15
        }

        MyKey {
            id: a16
            color: myGreen
            border.color: darkGreen
            text: myLang.l_f_a16
        }

        MyKey {
            id: a17
            color: myBlue
            border.color: darkBlue
            text: myLang.l_f_a17
        }

        MyKey {
            id: a18
            color: myBlue
            border.color: darkBlue
            text: myLang.l_f_a18
        }

        MyKey {
            id: a19
            color: myPink
            border.color: darkPink
            text: myLang.l_f_a19
        }

        MyKey {
            id: a20
            color: myPink
            border.color: darkPink
            text: myLang.l_f_a20
        }

        MyKey {
            id: a21
            color: myGreen
            border.color: darkGreen
            text: myLang.l_f_a21
        }

        MyKey {
            id: a22
            color: myYellow
            border.color: darkYellow
            text: myLang.l_f_a22
        }

        MyKey {
            id: a23
            color: myRed
            border.color: darkRed
            text: myLang.l_f_a23
        }

        MyKey {
            id: a24
            color: myRed
            border.color: darkRed
            text: myLang.l_f_a24
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
            text: myLang.l_f_a25
        }

        //  X Ч
        MyKey {
            id: a26
            color: myYellow
            border.color: darkYellow
            text: myLang.l_f_a26

        }

        //  C С
        MyKey {
            id: a27
            color: myGreen
            border.color: darkGreen
            text: myLang.l_f_a27

        }

        //  V М
        MyKey {
            id: a28
            color: myBlue
            border.color: darkBlue
            text: myLang.l_f_a28

        }

        //  B И
        MyKey {
            id: a29
            color: myBlue
            border.color: darkBlue
            text: myLang.l_f_a29


        }

        //  N Т
        MyKey {
            id: a30
            color: myPink
            border.color: darkPink
            text: myLang.l_f_a30

        }

        //  M Ь
        MyKey {
            id: a31
            color: myPink
            border.color: darkPink
            text: myLang.l_f_a31
        }

        //  , Б
        MyKey {
            id: a32
            color: myGreen
            border.color: darkGreen
            text: myLang.l_f_a32
        }

        //  . Ю
        MyKey {
            id: a33
            color: myYellow
            border.color: darkYellow
            text: myLang.l_f_a33
        }

        // / ,
        MyKey{
            id: dot
            color: myRed
            border.color: darkRed
            text: myLang.l_f_dot
        }
        spacing: 3.2
    }

        MyKey {
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
        text: myLang.l_f_shift

    }

        MyKey {
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
        text: myLang.l_f_shift
    }

        MyKey {
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
        text: myLang.l_f_space
    }
    }

    //Forefround
    // DISCLAIMER :: DONT OPEN - DANGEROUS FOR YOUR EYES
    // DISCLAIMER :: DONT OPEN - DANGEROUS FOR YOUR EYES
    // DISCLAIMER :: DONT OPEN - DANGEROUS FOR YOUR EYES

    Item{


        MyKey {
            id: f_a1
            x: 11
            y: 11
            color: f_a1.border.color
            border.color: darkRed
            visible: false

            text: myLang.l_f_a1
            textcolor: myWhite
        }

        MyKey {
            id: f_num1
            x: 46
            y: 11

            color: f_num1.border.color
            border.color: darkRed
            visible: false

            text: myLang.l_f_num1
            textcolor: myWhite
        }

        MyKey {
            id: f_num2
            x: 81
            y: 11

            color: f_num2.border.color
            border.color: darkRed
            visible: false

            text: myLang.l_f_num2
            textcolor: myWhite
        }

        MyKey {
            id: f_num3
            x: 117
            y: 11

            color: f_num3.border.color
            border.color: darkYellow
            visible: false

            text: myLang.l_f_num3
            textcolor: myWhite
        }

        MyKey {
            id: f_num4
            x: 152
            y: 11
            color: f_num4.border.color
            border.color: darkGreen
            visible: false

            text: myLang.l_f_num4
            textcolor: myWhite
        }

        MyKey {
            id: f_num5
            x: 187
            y: 11
            color: f_num5.border.color
            border.color: darkBlue
            visible: false

            text: myLang.l_f_num5
            textcolor: myWhite
        }

        MyKey {
            id: f_num6
            x: 222
            y: 11
            color: f_num6.border.color
            border.color: darkBlue
            visible: false


            text: myLang.l_f_num6
            textcolor: myWhite
        }

        MyKey {
            id: f_num7
            x: 257
            y: 11
            color: f_num7.border.color
            border.color: darkPink
            visible: false
            text: myLang.l_f_num7
            textcolor: myWhite

        }

        MyKey {
            id: f_num8
            x: 293
            y: 11
            color: f_num8.border.color
            border.color: darkGreen
            visible: false
            text: myLang.l_f_num8
            textcolor: myWhite

        }

        MyKey {
            id: f_num9
            x: 328
            y: 11
            color: f_num9.border.color
            border.color: darkYellow
            visible: false
            text: myLang.l_f_num9
            textcolor: myWhite

        }

        MyKey {
            id: f_num0
            x: 363
            y: 11
            color: f_num0.border.color
            border.color: darkRed
            visible: false
            text: myLang.l_f_num0
            textcolor: myWhite

        }

        MyKey {
            id: f_sign1
            x: 398
            y: 11
            color: f_sign1.border.color
            border.color: darkRed
            visible: false
            text: myLang.l_f_sign1
            textcolor: myWhite

        }

        MyKey {
            id: f_sign2
            x: 433
            y: 11
            color: f_sign2.border.color
            border.color: darkRed
            visible: false
            text: myLang.l_f_sign2
            textcolor: myWhite

        }

        MyKey {
            id: f_a2
            x: 64
            y: 41
            color: f_a2.border.color
            border.color: darkRed
            visible: false
            text: myLang.l_f_a2
            textcolor: myWhite
        }

        MyKey {
            id: f_a3
            x: 99
            y: 41
            color: f_a3.border.color
            border.color: darkYellow
            visible: false
            text: myLang.l_f_a3
            textcolor: myWhite
        }

        MyKey {
            id: f_a4
            x: 134
            y: 41
            color: f_a4.border.color
            border.color: darkGreen
            visible: false
            text: myLang.l_f_a4
            textcolor: myWhite
        }

        MyKey {
            id: f_a5
            x: 170
            y: 41
            color: f_a5.border.color
            border.color: darkBlue
            visible: false
            text: myLang.l_f_a5
            textcolor: myWhite
        }

        MyKey {
            id: f_a6
            x: 205
            y: 41
            color: f_a6.border.color
            border.color: darkBlue
            visible: false
            text: myLang.l_f_a6
            textcolor: myWhite
        }

        MyKey {
            id: f_a7
            x: 240
            y: 41
            color: f_a7.border.color
            border.color: darkPink
            visible: false
            text: myLang.l_f_a7
            textcolor: myWhite
        }

        MyKey {
            id: f_a8
            x: 275
            y: 41
            color: f_a8.border.color
            border.color: darkPink
            visible: false
            text: myLang.l_f_a8
            textcolor: myWhite
        }

        MyKey {
            id: f_a9
            x: 310
            y: 41
            color: f_a9.border.color
            border.color: darkGreen
            visible: false
            text: myLang.l_f_a9
            textcolor: myWhite
        }

        MyKey {
            id: f_a10
            x: 346
            y: 41
            color: f_a10.border.color
            border.color: darkYellow
            visible: false
            text: myLang.l_f_a10
            textcolor: myWhite
        }

        MyKey {
            id: f_a11
            x: 381
            y: 41
            color: f_a11.border.color
            border.color: darkRed
            visible: false
            text: myLang.l_f_a11
            textcolor: myWhite
        }

        MyKey {
            id: f_a12
            x: 416
            y: 41
            color: f_a12.border.color
            border.color: darkRed
            visible: false
            text: myLang.l_f_a12
            textcolor: myWhite
        }

        MyKey {
            id: f_a13
            x: 451
            y: 41
            color: f_a13.border.color
            border.color: darkRed
            visible: false
            text: myLang.l_f_a13
            textcolor: myWhite
        }




        MyKey {
            id: f_a14
            x: 77
            y: 72
            color: f_a14.border.color
            border.color: darkRed
            visible: false
            text: myLang.l_f_a14
            textcolor: myWhite
        }

        MyKey {
            id: f_a15
            x: 112
            y: 72
            color: f_a15.border.color
            border.color: darkYellow
            visible: false
            text: myLang.l_f_a15
            textcolor: myWhite
        }

        MyKey {
            id: f_a16
            x: 147
            y: 72
            color: f_a16.border.color
            border.color: darkGreen
            visible: false
            text: myLang.l_f_a16
            textcolor: myWhite
        }

        MyKey {
            id: f_a17
            x: 183
            y: 72
            color: f_a17.border.color
            border.color: darkBlue
            visible: false
            text: myLang.l_f_a17
            textcolor: myWhite
        }

        MyKey {
            id: f_a18
            x: 218
            y: 72
            color: f_a18.border.color
            border.color: darkBlue
            visible: false
            text: myLang.l_f_a18
            textcolor: myWhite
        }

        MyKey {
            id: f_a19
            x: 253
            y: 72
            color: f_a19.border.color
            border.color: darkPink
            visible: false
            text: myLang.l_f_a19
            textcolor: myWhite
        }

        MyKey {
            id: f_a20
            x: 288
            y: 72
            color: f_a20.border.color
            border.color: darkPink
            visible: false
            text: myLang.l_f_a20
            textcolor: myWhite
        }

        MyKey {
            id: f_a21
            x: 323
            y: 72
            color: f_a21.border.color
            border.color: darkGreen
            visible: false
            text: myLang.l_f_a21
            textcolor: myWhite
        }

        MyKey {
            id: f_a22
            x: 359
            y: 72
            color: f_a22.border.color
            border.color: darkYellow
            visible: false
            text: myLang.l_f_a22
            textcolor: myWhite
        }

        MyKey {
            id: f_a23
            x: 394
            y: 72
            color: f_a23.border.color
            border.color: darkRed
            visible: false
            text: myLang.l_f_a23
            textcolor: myWhite
        }

        MyKey {
            id: f_a24
            x: 429
            y: 72
            color: f_a24.border.color
            border.color: darkRed
            visible: false
            text: myLang.l_f_a24
            textcolor: myWhite
        }





        //  Z Я
        MyKey {
            id: f_a25
            x: 94
            y: 103
            color: f_a25.border.color
            border.color: darkRed
            visible: false
            text: myLang.l_f_a25
            textcolor: myWhite
        }

        //  X Ч
        MyKey {
            id: f_a26
            x: 129
            y: 103
            color: f_a26.border.color
            border.color: darkYellow
            visible: false
            text: myLang.l_f_a26
            textcolor: myWhite

        }

        //  C С
        MyKey {
            id: f_a27
            x: 164
            y: 103
            color: f_a27.border.color
            border.color: darkGreen
            visible: false
            text: myLang.l_f_a27
            textcolor: myWhite

        }

        //  V М
        MyKey {
            id: f_a28
            x: 200
            y: 103
            color: f_a28.border.color
            border.color: darkBlue
            visible: false
            text: myLang.l_f_a28
            textcolor: myWhite

        }

        //  B И
        MyKey {
            id: f_a29
            x: 235
            y: 103
            color: f_a29.border.color
            border.color: darkBlue
            visible: false
            text: myLang.l_f_a29
            textcolor: myWhite

        }

        //  N Т
        MyKey {
            id: f_a30
            x: 270
            y: 103
            color: f_a30.border.color
            border.color: darkPink
            visible: false
            text: myLang.l_f_a30
            textcolor: myWhite

        }

        //  M Ь
        MyKey {
            id: f_a31
            x: 305
            y: 103
            color: f_a31.border.color
            border.color: darkPink
            visible: false
            text: myLang.l_f_a31
            textcolor: myWhite
        }

        //  , Б
        MyKey {
            id: f_a32
            x: 340
            y: 103
            color: f_a32.border.color
            border.color: darkGreen
            visible: false
            text: myLang.l_f_a32
            textcolor: myWhite
        }

        //  . Ю
        MyKey {
            id: f_a33
            x: 376
            y: 103
            color: f_a33.border.color
            border.color: darkYellow
            visible: false
            text: myLang.l_f_a33
            textcolor: myWhite
        }

        // / ,
        MyKey{
            id: f_dot
            x: 411
            y: 103
            color: f_dot.border.color
            border.color: darkRed
            visible: false
            text: myLang.l_f_dot
            textcolor: myWhite
        }



        MyKey {
        id: f_shift_left
        x: 11
        y: 103
        width: 80
        height: 28
        color: f_shift_left.border.color
        border.color: darkRed
        border.width: 1
        radius: customRadius
        Layout.preferredHeight: 28
        Layout.preferredWidth: 32
        visible: false

        text: myLang.l_f_shift
        textcolor: myWhite
    }

        MyKey {
        id: f_shift_right
        x: 448
        y: 103
        width: 90
        height: 28
        color: f_shift_right.border.color
        border.color: darkRed
        border.width: 1
        radius: customRadius
        Layout.preferredHeight: 28
        Layout.preferredWidth: 32
        visible: false
        text: myLang.l_f_shift
        textcolor: myWhite

    }

        MyKey {
        id: f_space
        x: 134
        y: 133
        width: 241
        height: 28
        color: f_space.border.color
        border.color: darkSpace
        border.width: 1
        radius: customRadius
        Layout.preferredHeight: 28
        Layout.preferredWidth: 32
        visible: false
        text: myLang.l_f_space
        textcolor: myWhite
        }
     }
}
