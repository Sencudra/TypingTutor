#include <programengine.h>

// Constructor
programEngine::programEngine(QObject *parent) : QObject(parent){

    //Time
    pointerToTime = new Time();
    connect(pointerToTime,SIGNAL(changedTime()),this,SLOT(Timer()));

    //Text
    pointerToText = new Text();
    connect(this,SIGNAL(updateText()),pointerToText,SLOT(updateText()));
    connect(this,SIGNAL(newText()),pointerToText,SLOT(newText()));

}


int programEngine::startRound(){

    emit roundStarted();
    emit newText();
    emit setNewText();

    pointerToTime->start_Timer();
    emit timeChanged();

    m_rightSigns = 0;
    m_averageSpeed = 0;
    emit speedChanged();

    return 0;
}

void programEngine::stopRound()
{

    pointerToTime->stop_Timer();
    // Miliseconds counting

    m_averageSpeed = getSpeed();

    emit timeChanged();
    emit roundEnded();


}

void programEngine::Timer()
{

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
    if (text == pointerToText->getWord()){
        emit updateText();

        if (pointerToText->getWord() == "\0")
        {
            stopRound();
            return true;
        }
        m_rightSigns++;

        return true;
    }
    else
    {
        int textLength = text.length();
        int cursor;
        QChar* pointerToTextChar = text.data();
        QChar* pointerToM_WordChar = pointerToText->getWord().data();
        for (cursor = 0; cursor < textLength && *pointerToTextChar == *pointerToM_WordChar; cursor++)
        {
            pointerToM_WordChar++;
            pointerToTextChar++;
        }
        if (cursor != textLength)
            return false;
        else{
            m_rightSigns++;
            return true;
        }
    }

}


int programEngine::getSpeed(){
//   float a = (m_round_time.elapsed())/1000.0;

//    if( a != 0){
//        float t = m_rightSigns/a;
//        qDebug() << t;
//        a = int(t*60.0);
//        return a;
//    }
//    else
//        return 0;

}

/////////////////////////////////////////////////////////////////////

// Additional functions for engine



