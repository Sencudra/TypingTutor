#include "text.h"
#include <QDebug>
#include <QTime>
#include <fstream>
#include <iostream>


// dictiary
QChar keyArray_rus[2][67] = {
                         {L'ё',0,'1','!','2','\"','3',L'№','4',';','5','%','6',':','7','?','8','*','9','(','0',')','-','_','=','+',
                          L'й',L'ц',L'у',L'к',L'е',   L'н',L'г',L'ш',L'щ',L'з',L'х',0,L'ъ',0,
                          L'ф',   L'ы',L'в',L'а',L'п',L'р',L'о',L'л',L'д',L'ж',0,    L'э',0,
                          L'я',L'ч',L'с',L'м',L'и',L'т',L'ь',L'б',   0,L'ю',0 ,'.',',',L' '},
                         {L'`','~','1','!','2','@','3',L'#','4','$','5','%','6','^','7','&','8','*','9','(','0',')','-','_','=','+',
                          L'q',L'w',L'e',L'r',L't',   L'y',L'u',L'i',L'o',L'p',L'[','{',L']','}',
                          L'a',   L's',L'd',L'f',L'g',L'h',L'j',L'k',L'l',L';',':',    L'\'','\"',
                          L'z',L'x',L'c',L'v',L'b',L'n',L'm',L',',   '<',L'.','>' ,'/','?',L' '}};


//prototypes
Textqueue* generateTextQueue(QString text);
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
        m_current_word = m_current_word->next;
        m_wordForQml = m_current_word->word;
    }
    else
        m_wordForQml = "\0"; //End of the text;
}


void Text::updateChar(QChar* nextchar){
    QChar newChar =( *nextchar);
    int ourNum = -1;
    for(int num = 0; num < 67 &&(newChar.toLower() != (keyArray_rus[m_language][num]));num++)
    {
        ourNum = num;
    };
    if (ourNum == -1 || ourNum == 66){
        qDebug() << "wrong char sign";
        m_charForQml = 0;
    }
    else{
        if (newChar == newChar.toUpper()){
            switch(ourNum+1){
                case 66:case 2:case 4:case 6:case 8:
                case 10:case 12:case 14:case 16:
                case 18:case 20:case 22:case 24:case 64:
                    m_charForQml = ourNum+1;
                    return;
            }
            m_charForQml = -(ourNum+1); // +1 cause for construction
        }
        else
            m_charForQml = ourNum+1;
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

            std::cout << txt << " " << langId << std::endl;
    }
    qDebug()<< "LOADINF PASSED";
    fin.close();
}

//accessing text
int Text::getTextFromBase(){
    QTime game = game.currentTime();
    srand(game.msec());
    int number = rand() % textDataBase.size();
    Textqueue* newTextQueue = generateTextQueue(textDataBase[number]->text);
    m_language = textDataBase[number]->langId;
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
    QString text = writeTextForQml(m_current_word);
    m_textForQml = text;
    return 0;
}


/////////////////////////////////////////////////////////

Textqueue* generateTextQueue(QString text){

    // Put text in queue
    QChar* pointer = text.data();
    QString buffer;

    Textqueue* first = new Textqueue;
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
            first->word = buffer;
            current = first;
        }
        else
        {
            Textqueue* newCell = new Textqueue;
            current->next = newCell;
            newCell->word = buffer;
            current = newCell;


        }
    }
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
