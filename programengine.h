#ifndef PROGRAMENGINE_H
#define PROGRAMENGINE_H

#include <QObject>
#include <QDebug>
#include <QTime>
#include <QTimer>


#include <fstream> //File saving
#include <iostream>
#include <vector>

#include "time.h"
#include "time.h"
#include "text.h"
#include "speed.h"
#include "table.h"

using namespace std;

struct statData{
    //режим
    string name;
    //текст
    int time;
    int speed;
    int mistakes;
    int mode;

void saveStruct(){
        ofstream fout;

        fout.open("C:\\Users\\Vlad\\Desktop\\STATTYPINGTUTOR.txt",ios::app);
        if (!fout)
            cout << "Cannot open file.\n";

        QDateTime dateTime = QDateTime::currentDateTime();

        QString str1 = dateTime.toString("hh:mm:ss|dd.MM.yyyy");

        fout << name << " " <<  time << " " << speed << " " << mistakes << " " << str1.toStdString() << " " << mode << " ";
        fout.close();

        qDebug() << str1 << "Data saved!";
        //Reading of the table in table.cpp/.h
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
    Q_PROPERTY(int currLang READ getCurrentLanguage NOTIFY langChanged) //language


public:
    explicit programEngine(QObject *parent = 0);

    Q_INVOKABLE int prepareRound();
    Q_INVOKABLE int startRound();
    Q_INVOKABLE void stopRound();
    Q_INVOKABLE bool isRight(QString text); // Input text verifying

    Q_INVOKABLE void changeMode(int x){ mode = x;}
    Q_INVOKABLE void changeName(QString x){ nickname = x;}
    Q_INVOKABLE void changeText(int x){ textValue = x;}

    Q_INVOKABLE int getTextNumber(){qDebug() << pointerToText->getTextNumber();return pointerToText->getTextNumber();}


    void setTextNumber(int x){textNum = x;}

    Table* getTablePointer(){return pointerToTable;}

private:
    int getAverageSpeed(){return pointerToSpeed->getAverageSpeed();}
    int getCurrentSpeed(){return pointerToSpeed->getCurrentSpeed();}


    //new
    QString getTime(){return pointerToTime->getTime();}
    QString getText(){return pointerToText->getText();}

    int getChar(){return pointerToText->getChar();}
    int getCurrentLanguage(){return pointerToText->getLang();}


    void createStruct();

public slots:
    void Timer(); // 1-second signal coming from Time
    void showText();

signals:
    // Time
    void timeChanged();

    // Connected with TEXT
    void updateQmlText(); //Qml
    void showQmlText();

    void updateText(); //Text
    void newText();

    // Round control
    void roundStarted();
    void roundEnded();

    // Gui control
    void speedChanged();
    void charChanged();
    void clearTextInput();
    void clearTextOutput();
    void mistakeDone();

    void modelChanged();
    void langChanged();

    void activeRound();

private:
    // m - member
    Text* pointerToText;
    Time* pointerToTime;
    Speed* pointerToSpeed;
    Table* pointerToTable;

    int mistakes;
    bool isRightNow;


    int mode;
    QString nickname;
    int textValue;
    int textNum;

};

#endif // PROGRAMENGINE_H
