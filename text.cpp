#include "text.h"
#include <QDebug>

// Text liabrary
const int dataRows = 1;
QString textDataBase[dataRows] =
{
    "И он тут же купил участок на обратном пути он заехал в Дантон Грин, договорился с подходящей четой, отозвавшейся на его объявление, и в тот же вечер ему удалось изготовить такую порцию Гераклеофорбии, что она вполне оправдывала все его решительные действия.",

 };

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

int Text::updateChar(){
    return 0;
}

//accessing text
int Text::getTextFromBase(){
    int number = rand() % dataRows;
    Textqueue* newTextQueue = generateTextQueue(textDataBase[number]);
    m_current_word = newTextQueue;
    QString newQText = writeTextForQml(newTextQueue);
    m_textForQml = newQText;
    m_wordForQml = m_current_word->word;
    m_charForQml = *(m_wordForQml.data());
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
