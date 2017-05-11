#include <programengine.h>

// Constructor
programEngine::programEngine(QObject *parent) : QObject(parent){

    //Time
    pointerToTime = new Time();
    connect(pointerToTime,SIGNAL(changedTime()),this,SLOT(Timer()));
    connect(pointerToTime,SIGNAL(TimeIsOut()),this,SLOT(startRound()));
    connect(pointerToTime,SIGNAL(showText()),this,SLOT(showText()));

    //Text
    pointerToText = new Text();

    //Speed
    pointerToSpeed = new Speed();
    pointerToSpeed->setPointerForTime(pointerToTime);

    //Table
    pointerToTable = new Table();

    mistakes = 0;
    emit mistakeDone(); // for gui update

    //createStat();
}

int programEngine::prepareRound()
{
    // Time initialising
    pointerToTime->pre_start_Round(15);

    activeRound();

    qDebug() << "ROUND INFO" << mode << textValue << nickname;

    pointerToText->setMode(mode);

    mistakes = 0;
    emit mistakeDone(); // for gui update
    isRightNow = true; // for isRight()

    pointerToSpeed->setUp();
    emit speedChanged();

    return 0;
}

void programEngine::showText()
{
    // Text initialising
    pointerToText->newText(textValue);

    emit updateQmlText(); // For qml file
    emit langChanged();
    emit charChanged();
    emit showQmlText();
}

int programEngine::startRound()
{
    emit roundStarted(); // Qml form visual changes

    return 0;
}

void programEngine::stopRound()
{
    pointerToTime->stop_Timer();


    // For qml file
    emit roundEnded();
    emit clearTextOutput();
    emit timeChanged();

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


    if (text == ""){ // true, while backspacing

        QChar* pointerToNextChar = pointerToText->getCharPointer();
        pointerToText->updateChar(pointerToNextChar);

        emit charChanged();

        isRightNow = true;
        return true;
    }
    if (text == pointerToText->getWord()){
        pointerToText->updateText();
        pointerToSpeed->rightWritten();

        // for qml file
        emit updateQmlText();
        emit clearTextInput();

       if (pointerToText->getWord() == "\0")
        {
            stopRound();            
            createStruct(); // saving data

            pointerToTable->updateTable();
            return true;
        }

        QChar* pointerToNextChar = pointerToText->getCharPointer();
        pointerToText->updateChar(pointerToNextChar);
        emit charChanged();

        isRightNow = true;
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
        if (cursor != textLength){

            if(isRightNow){
                mistakes++;
                emit mistakeDone(); // for gui update
                if (mode == 1){
                    stopRound();

                }
            }
            isRightNow = false;
            return false;

        }
        else{
             isRightNow = true;
             pointerToSpeed->rightWritten();
             QChar* pointerToNextChar = pointerToText->getCharPointer() + text.length();
             pointerToText->updateChar(pointerToNextChar);
             emit charChanged();
             return true;
        }
    }

}


void programEngine::createStruct(){

    statData data;
    data.name = nickname.toStdString();
    data.time = pointerToTime->getQTime();
    data.mistakes = mistakes;
    data.speed = pointerToSpeed->getAverageSpeed();
    data.mode = mode;

    data.saveStruct();
}




/////////////////////////////////////////////////////////////////////

// Additional functions for engine



