import QtQuick 2.0
Item{
    id: language
    Connections{
        target: engine

        onRoundStarted:{
            klav(engine.currLang);
        }
    }



    property string l_f_a1 : "Ё"
    property string l_f_a2 : "Й"
    property string l_f_a3 : "Ц"
    property string l_f_a4 : "У"
    property string l_f_a5 : "К"
    property string l_f_a6 : "Е"
    property string l_f_a7 : "Н"
    property string l_f_a8 : "Г"
    property string l_f_a9 : "Ш"
    property string l_f_a10 : "Щ"
    property string l_f_a11 : "З"
    property string l_f_a12 : "Х"
    property string l_f_a13 : "Ъ"
    property string l_f_a14 : "Ф"
    property string l_f_a15 : "Ы"
    property string l_f_a16 : "В"
    property string l_f_a17 : "А"
    property string l_f_a18 : "П"
    property string l_f_a19 : "Р"
    property string l_f_a20 : "О"
    property string l_f_a21 : "Л"
    property string l_f_a22 : "Д"
    property string l_f_a23 : "Ж"
    property string l_f_a24 : "Э"
    property string l_f_a25 : "Я"
    property string l_f_a26 : "Ч"
    property string l_f_a27 : "С"
    property string l_f_a28 : "М"
    property string l_f_a29 : "И"
    property string l_f_a30 : "Т"
    property string l_f_a31 : "Ь"
    property string l_f_a32 : "Б"
    property string l_f_a33 : "Ю"
    property string l_f_dot : "."
    property string l_f_num1 : "1"
    property string l_f_num2 : "2"
    property string l_f_num3 : "3"
    property string l_f_num4 : "4"
    property string l_f_num5 : "5"
    property string l_f_num6 : "6"
    property string l_f_num7 : "7"
    property string l_f_num8 : "8"
    property string l_f_num9 : "9"
    property string l_f_num0 : "0"
    property string l_f_sign1 : "-"
    property string l_f_sign2 : "="
    property string l_f_shift : "SHIFT"
    property string l_f_space : "ПРОБЕЛ"

    function klav(k){

        //id: rus
    if(k === 1){

        l_f_a1 = "`"
        l_f_a2 = "Q"
        l_f_a3 = "W"
        l_f_a4 = "E"
        l_f_a5 = "R"
        l_f_a6 = "T"
        l_f_a7 = "Y"
        l_f_a8 = "U"
        l_f_a9 = "I"
        l_f_a10 = "O"
        l_f_a11 = "P"
        l_f_a12 = "["
        l_f_a13 = "]"
        l_f_a14 = "A"
        l_f_a15 = "S"
        l_f_a16 = "D"
        l_f_a17 = "F"
        l_f_a18 = "G"
        l_f_a19 = "H"
        l_f_a20 = "J"
        l_f_a21 = "K"
        l_f_a22 = "L"
        l_f_a23 = ";"
        l_f_a24 = "'"
        l_f_a25 = "Z"
        l_f_a26 = "X"
        l_f_a27 = "C"
        l_f_a28 = "V"
        l_f_a29 = "B"
        l_f_a30 = "N"
        l_f_a31 = "M"
        l_f_a32 = ","
        l_f_a33 = "."
        l_f_dot = "/"
        l_f_num1 = "1"
        l_f_num2 = "2"
        l_f_num3 = "3"
        l_f_num4 = "4"
        l_f_num5 = "5"
        l_f_num6 = "6"
        l_f_num7 = "7"
        l_f_num8 = "8"
        l_f_num9 = "9"
        l_f_num0 = "0"
        l_f_sign1 = "-"
        l_f_sign2 = "="
        l_f_shift = "SHIFT"
        l_f_space = "SPACE"

        }
    }
}
