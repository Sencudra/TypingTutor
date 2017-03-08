#include <programengine.h>

// Constructor
programEngine::programEngine(QObject *parent) : QObject(parent){

    //Time
    pointerToTime = new Time();
    connect(pointerToTime,SIGNAL(changedTime()),this,SLOT(Timer()));

    //Text
    pointerToText = new Text();

    pointerToSpeed = new Speed();
    pointerToSpeed->setPointerForTime(pointerToTime);



}

int programEngine::startRound(){

    // Time initialising
    pointerToTime->start_Timer();
    emit timeChanged(); // For qml file

    // Text initialising
    pointerToText->newText();
    emit updateQmlText(); // For qml file

    pointerToSpeed->setUp();
    emit speedChanged();

    // Qml managing
    emit roundStarted(); // Qml form visual changes

    return 0;
}

void programEngine::stopRound()
{
    pointerToTime->stop_Timer();

    // For qml file
    emit timeChanged();
    emit roundEnded();


}

void programEngine::Timer()
{
    pointerToSpeed->updateSpeed();

    //For qml file
    emit timeChanged();
    emit speedChanged();
}

// Text Input / verification / signals to qml

bool programEngine::isRight(QString text)
{
    pointerToSpeed->signPressed();

    if (text == "") // true, while backspacing
        return true;
    if (text == pointerToText->getWord()){
        pointerToText->updateText();
        pointerToSpeed->rightWritten();

        // for qml file
        emit updateQmlText();
        emit clearTextInput();

       if (pointerToText->getWord() == "\0")
        {
            stopRound();
            return true;
        }
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
             pointerToSpeed->rightWritten();
            return true;
        }
    }

}




/////////////////////////////////////////////////////////////////////

// Additional functions for engine



