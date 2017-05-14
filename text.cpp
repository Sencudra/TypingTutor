#include "text.h"
#include <QDebug>
#include <QTime>
#include <fstream>
#include <iostream>


// dictiary
QChar keyArray_rus[2][67] = {
                         {L'ё', 0, '1', '!', '2', '\"', '3', L'№', '4', ';', '5', '%', '6', ':', '7', '?', '8', '*', '9', '(', '0', ')', '-', '_', '=', '+', //26
                          L'й', L'ц', L'у', L'к', L'е', L'н', L'г', L'ш', L'щ', L'з', L'х', 0, L'ъ', 0, //14
                          L'ф', L'ы', L'в', L'а', L'п', L'р', L'о', L'л', L'д', L'ж', 0, L'э', 0, //13
                          L'я', L'ч', L'с', L'м', L'и', L'т', L'ь', L'б', 0, L'ю', 0 , '.', ',', L' ' }, //14

                         {L'`', '~', '1', '!', '2', '@', '3', L'#', '4', '$', '5', '%', '6', '^', '7', '&', '8', '*', '9', '(', '0', ')', '-', '_', '=', '+', //26
                          L'q', L'w', L'e', L'r', L't', L'y', L'u', L'i', L'o', L'p', L'[', '{', L']', '}', //14
                          L'a', L's', L'd', L'f', L'g', L'h', L'j', L'k', L'l', L';', ':', L'\'', '\"', //13
                          L'z', L'x', L'c', L'v', L'b', L'n', L'm', L',', '<', L'.', '>', '/', '?', L' ' } //14
};


//prototypes
//Textqueue* generateTextQueue(QString text);
QString writeTextForQml(Textqueue *first);

//Class stuff

Text::Text()
{
    loadBase();
}

//return next word
void Text::updateWord()
{
    if (m_current_word->next != NULL)
    {
        Textqueue* del = m_current_word;
        m_current_word = m_current_word->next;
        wordNumber--;
        delete(del);
        m_wordForQml = m_current_word->word;
    }
    else
        m_wordForQml = "\0"; //End of the text;
}

/* Char input [0,66] */
void Text::updateChar(QChar* nextchar){
    QChar newChar =( *nextchar);
    int ourNum = -1;
    for(int num = 0; num < 67 &&(newChar.toLower() != (keyArray_rus[m_language][num]));num++)
    {
        ourNum = num;
    };
    ourNum++; // цикл вылетает раньше последнего присваивания

    if (ourNum >= 67){
        qDebug() << "wrong char sign";
        m_charForQml = 0;
    }
    else{
        // Caps
        if (newChar == newChar.toUpper()){
            switch(ourNum){
                case 66:case 2:case 4:case 6:case 8: // Пробел,
                case 10:case 12:case 14:case 16:
                case 18:case 20:case 22:case 24:case 64:
                    m_charForQml = ourNum;
                    return;
            }

            //For dot and comma in different languages
            if (ourNum == 65 && ourNum == 64 && m_language == 1)
                m_charForQml = ourNum;
            else
                m_charForQml = -ourNum;
        }
        else
            m_charForQml = ourNum;
    }
}


// Fecking Russian
std::wstring StringToWString(const std::string& s)
{
    std::wstring temp(s.length(),L' ');
    std::copy(s.begin(), s.end(), temp.begin());
    return temp;
}

void Text::loadBase(){

    std::ifstream fin;
    fin.open("C:\\Users\\Vlad\\Desktop\\TextBase.txt");//FILENAME
    if(!fin)
        std::cout << "Cannot open file.\n";

    int langId;

    while(!fin.eof())
    {

        std::string txt = "";
        std::string inSign;

        fin >> langId;

        fin >> inSign;
        if(inSign == "{"){
            do
            {
                fin >> inSign;
                if (inSign != "}")
                    txt = txt + inSign + " ";
            } while(inSign != "}");
        }
        txt[txt.length()-1] = '\0';

        TextStruct* new_data = new TextStruct();

            //std::wstring qtext = StringToWString(txt);

            new_data->text = QString::fromStdString(txt);
            new_data->langId = langId;

            textDataBase.push_back(new_data);

            //std::cout << txt << " " << langId << std::endl;
    }


    qDebug()<< "LOADING PASSED";
    fin.close();
    textNumber = textDataBase.size();
}

//accessing text
int Text::getTextFromBase(int x){

    int number;
    wordNumber = 0;
    if (x == 0){
        QTime game = game.currentTime();
        srand(game.msec());
        number = rand() % textDataBase.size();
    }else
    {
        number = x-1;
    }
    Textqueue* newTextQueue = generateTextQueue(textDataBase[number]->text);

    m_language = textDataBase[number]->langId;
    addText(); // add text up to 150 words

    m_current_word = newTextQueue;

    QString newQText = writeTextForQml(newTextQueue);
    m_textForQml = newQText;
    m_wordForQml = m_current_word->word;
    updateChar(m_wordForQml.data());

    return 0;
}



//return full text, except written
int Text::updateText()
{
    updateWord();
    addText();
    QString text = writeTextForQml(m_current_word);
    m_textForQml = text;
    return 0;
}


/////////////////////////////////////////////////////////

void Text::addText()
{
    int number;
    if (mode == 2)
    {
        while(wordNumber < 150){
            do{
                number = rand() % textDataBase.size();
                qDebug() << "AddText: Language Verified";
            } while(textDataBase[number]->langId != m_language);

            QString text = textDataBase[number]->text;
            QChar* pointer = text.data();
            QString buffer;

            Textqueue* current = m_last_word;
            m_last_word->word += " ";
            m_last_word->next = new Textqueue;
            current = m_last_word->next;

           current->word = "\0";

            while(*pointer != 0)
            {
                buffer = "";

                while((*pointer != ' ') && (*pointer != 0))
                {
                    buffer += *pointer;
                    pointer++;
                }
                if (*pointer != 0)
                        buffer += *pointer;

                while ((*pointer == ' ') && (*pointer != 0))
                    pointer++;


                if (current->word == "\0")
                {
                    wordNumber++;
                    current->word = buffer;
                }
                else
                {
                    wordNumber++;
                    Textqueue* newCell = new Textqueue;
                    current->next = newCell;
                    newCell->word = buffer;
                    current = newCell;
                }
            }
            m_last_word = current;
            current->next = NULL;
        }
    }
}


Textqueue* Text::generateTextQueue(QString text){

    // Put text in queue
    QChar* pointer = text.data();
    QString buffer;
    Textqueue* first = new Textqueue;;
    Textqueue* current = first;

    first->word = "\0";

    while(*pointer != 0)
    {
        buffer = "";

        while((*pointer != ' ') && (*pointer != 0))
        {
            buffer += *pointer;
            pointer++;
        }
        if (*pointer != 0)
                buffer += *pointer;

        while ((*pointer == ' ') && (*pointer != 0))
            pointer++;


        if (first->word == "\0")
        {
            wordNumber++;
            first->word = buffer;
            current = first;
        }
        else
        {
            wordNumber++;
            Textqueue* newCell = new Textqueue;
            current->next = newCell;
            newCell->word = buffer;
            current = newCell;
        }
    }
    m_last_word = current;
    current->next = NULL;
    return first;
}

QString writeTextForQml(Textqueue* first)
{
    QString buffer;
    Textqueue* pointer = first;
    while(pointer->next != NULL)
    {
        buffer += pointer->word;
        pointer = pointer->next;
    }
    buffer += pointer->word;
    return buffer;
}
