#include <programengine.h>



const int dataRows = 1;
QString textDataBase[dataRows] =
{
 "ВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВВ"
 };

Textqueue* generateTextQueue(QString text);
QString writeTextForQml(Textqueue *first);


////////////////////////////////////////////

//Textqueue Class methods

// Constructor
programEngine::programEngine(QObject *parent) : QObject(parent){

    pointerToTime = new Time();
    connect(pointerToTime,SIGNAL(changedTime()),this,SLOT(changedTime()));

    m_timer = new QTimer();
    m_gui_time = QTime(0,0);

    m_secs = m_gui_time.toString("mm:ss");
    emit timeChanged();

    connect(m_timer,SIGNAL(timeout()),this,SLOT(updateTime()));

}


int programEngine::startRound(){

    emit textChanged();
    emit roundStarted();

    pointerToTime->start_Timer();

    m_timer->start(1000);

    //Time initialization
    m_gui_time = QTime(0,0);
    m_secs = m_gui_time.toString("mm:ss");
    emit timeChanged();

    m_round_time = QTime(0,0);
    m_round_time.start();

    m_rightSigns = 0;
    m_averageSpeed = 0;
    emit speedChanged();

    return 0;
}

void programEngine::stopRound()
{

    pointerToTime->stop_Timer();
    // Miliseconds counting
    int a = m_round_time.elapsed();

    m_gui_time = QTime(0,0);
    m_gui_time = m_gui_time.addMSecs(a);

    m_timer->stop();

    m_secs = m_gui_time.toString("mm:ss.zzz");

    m_averageSpeed = getSpeed();

    emit timeChanged();
    emit roundEnded();


}

void programEngine::updateTime()
{
    m_gui_time = m_gui_time.addMSecs(1000);
    m_secs = m_gui_time.toString("mm:ss");

    m_allSigns = 0; // Мгновеная скорость

    emit timeChanged();
    emit speedChanged();
}

// Text Input / verification / signals to qml

bool programEngine::isRight(QString text)
{
    m_allSigns++;
    if (text == "") // true, while backspacing
        return true;
    if (text == m_current_word->word){
        m_current_word = updateWord(m_current_word);

        if (m_current_word == NULL)
        {
            stopRound();
            return true;
        }
        emit wordChanged();

        m_rightSigns++;

        return true;
    }
    else
    {
        int textLength = text.length();
        int cursor;
        QChar* pointerToText = text.data();
        QChar* pointerToM_Word = m_current_word->word.data();
        for (cursor = 0; cursor < textLength && *pointerToText == *pointerToM_Word; cursor++)
        {
            pointerToM_Word++;
            pointerToText++;
        }
        if (cursor != textLength)
            return false;
        else{
            m_rightSigns++;
            return true;
        }
    }

}

QString programEngine::updateText()
{
    QString text = writeTextForQml(m_current_word);
    emit clearTextInput();
    return text;
}

Textqueue* programEngine::updateWord(Textqueue *word)
{
    if (word->next != NULL)
    {
        return m_current_word->next;
    }
    else
        return NULL; // Конец текста
}

QString programEngine::getTextFromBase(){
    int number = rand() % dataRows;
    Textqueue* newTextQueue = generateTextQueue(textDataBase[number]);
    m_current_word = newTextQueue;
    QString newQText = writeTextForQml(newTextQueue);
    return  newQText;
}

int programEngine::getSpeed()
{
    float a = (m_round_time.elapsed())/1000.0;

    if( a != 0){
        float t = m_rightSigns/a;
        qDebug() << t;
        a = int(t*60.0);
        return a;
    }
    else
        return 0;

}

/////////////////////////////////////////////////////////////////////

// Additional functions for engine



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
