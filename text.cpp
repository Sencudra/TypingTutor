#include "text.h"
#include <QDebug>

// Text liabrary
const int dataRows = 1;
QString textDataBase[dataRows] =
{
    "И он тут же купил участок на обратном пути он заехал в Дантон Грин, договорился с подходящей четой, отозвавшейся на его объявление, и в тот же вечер ему удалось изготовить такую порцию Гераклеофорбии, что она вполне оправдывала все его решительные действия.",

 };


QChar keyArray_rus[67] = {L'ё',0,'1','!','2','\"','3',L'№','4',';','5',   '%','6',':','7','?','8','*','9','(','0',   ')','-','_','=','+',
                          L'й',L'ц',L'у',L'к',L'е',   L'н',L'г',L'ш',L'щ',L'з',L'х',0,L'ъ',0,
                          L'ф',   L'ы',L'в',L'а',L'п',L'р',L'о',L'л',L'д',L'ж',0,    L'э',0,
                          L'я',L'ч',L'с',L'м',L'и',L'т',L'ь',L'б',   0,L'ю',0 ,'.',',',L' '};


//declaration
Textqueue* generateTextQueue(QString text);
QString writeTextForQml(Textqueue *first);

//Class stuff

Text::Text()
{

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
    for(int num = 0; num < 67 &&(newChar.toLower() != (keyArray_rus[num]));num++)
    {
        ourNum = num;
    };
    qDebug() << "(" << newChar << ")" <<  keyArray_rus[ourNum] << ourNum << "ОТПРАВКА";
    if (ourNum == -1 || ourNum == 66){
        qDebug() << "wrong char sign";
        m_charForQml = 0;
    }
    else{
        if (newChar == newChar.toUpper())
            m_charForQml = -(ourNum+1); // +1 cause for construction
        else
            m_charForQml = ourNum+1;
    }
}

//accessing text
int Text::getTextFromBase(){
    int number = rand() % dataRows;
    Textqueue* newTextQueue = generateTextQueue(textDataBase[number]);
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
