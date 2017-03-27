#ifndef PROGRAMENGINE_H
#define PROGRAMENGINE_H

#include <QObject>
#include <QDebug>
#include <QTime>
#include <QTimer>


//File saving
#include <fstream>
#include <iostream>

#include <vector>

#include "time.h"
#include "text.h"
#include "speed.h"

using namespace std;

struct statData{
    //режим
    string name;
    //текст
    int time;
    int speed;
    int mistakes;



    void saveStruct(){
        ofstream fout;
        if (!fout)
            cout << "Cannot open file.\n";
        fout.open("STAT1.txt",ios::app);
        fout << name << " " <<  time << " " << speed << " " << mistakes << " ";
        fout.close();
    }

};






class programEngine : public QObject  // engine`s class
{
    Q_OBJECT

    Q_PROPERTY(QString secsInfo READ getTime NOTIFY timeChanged)   // time management
    Q_PROPERTY(QString currentText READ getText NOTIFY updateQmlText)  // text update
    Q_PROPERTY(int average_speed READ getAverageSpeed NOTIFY speedChanged) // speedChanged
    Q_PROPERTY(int current_speed READ getCurrentSpeed NOTIFY speedChanged) // speedChanged
    Q_PROPERTY(int currentChar READ getChar NOTIFY charChanged) //charChanged
    Q_PROPERTY(int numMistake MEMBER mistakes NOTIFY mistakeDone) // mistake done
    Q_PROPERTY(QList<statData*> myModel MEMBER m_myModel NOTIFY modelChanged) // modell

public:
    explicit programEngine(QObject *parent = 0);

    Q_INVOKABLE int startRound();
    Q_INVOKABLE void stopRound();
    Q_INVOKABLE bool isRight(QString text); // Input text verifying

private:
    int getAverageSpeed(){return pointerToSpeed->getAverageSpeed();}
    int getCurrentSpeed(){return pointerToSpeed->getCurrentSpeed();}

    //new
    QString getTime(){return pointerToTime->getTime();}
    QString getText(){return pointerToText->getText();}
    int getChar(){return pointerToText->getChar();}
    void createStruct();
    QList<statData *> createStat();




public slots:
    void Timer(); // 1-second signal coming from Time

signals:
    // Time
    void timeChanged();

    // Connected with TEXT
    void updateQmlText(); //Qml

    void updateText(); //Text
    void newText();



    // Round control
    void roundStarted();
    void roundEnded();

    // Gui control
    void speedChanged();
    void charChanged();
    void clearTextInput();
    void mistakeDone();


    void modelChanged();




private:
    // m - member
    Text* pointerToText;
    Time* pointerToTime;
    Speed* pointerToSpeed;
    QList<statData*> m_myModel;

    int mistakes;
    bool isRightNow;

};





#endif // PROGRAMENGINE_H
