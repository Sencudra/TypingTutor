#ifndef PROGRAMENGINE_H
#define PROGRAMENGINE_H

#include <QObject>
#include <QDebug>
#include <QTime>
#include <QTimer>

#include "time.h"
#include "text.h"
#include "speed.h"


class programEngine : public QObject  // engine`s class
{
    Q_OBJECT

    Q_PROPERTY(QString secsInfo READ getTime NOTIFY timeChanged)   // time management
    Q_PROPERTY(QString currentText READ getText NOTIFY updateQmlText)  // text update
    //Q_PROPERTY(int speed READ getSpeed NOTIFY speedChanged) // speedChanged

public:
    explicit programEngine(QObject *parent = 0);

    Q_INVOKABLE int startRound();
    Q_INVOKABLE void stopRound();

    Q_INVOKABLE bool isRight(QString text); // Input text verifying

private:
    int getSpeed();

    //new
    QString getTime(){return pointerToTime->getTime();}
    QString getText(){return pointerToText->getText();}


public slots:
    void Timer(); // 1-second signal coming from Time

signals:
    // Time
    void timeChanged();

    // Connected with TEXT
    void updateQmlText(); //Qml

    void updateText(); //Text
    void newText();

    void clearTextInput();


    void roundStarted();
    void roundEnded();

    void speedChanged();




private:
    // m - member
    Text* pointerToText;
    Time* pointerToTime;
    Speed* pointerToSpeed;

};

#endif // PROGRAMENGINE_H
