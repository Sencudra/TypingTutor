#ifndef PROGRAMENGINE_H
#define PROGRAMENGINE_H

#include <QObject>
#include <QDebug>
#include <QTime>
#include <QTimer>

#include "time.h"
#include "text.h"


class programEngine : public QObject  // engine`s class
{
    Q_OBJECT

    Q_PROPERTY(QString secsInfo READ getTime NOTIFY timeChanged)   // time management
    Q_PROPERTY(QString currentText READ getText NOTIFY updateText)  // text update
    Q_PROPERTY(QString currentText READ getText NOTIFY setNewText)
    Q_PROPERTY(int speed READ getSpeed NOTIFY speedChanged) // speedChanged

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
    // Text
    void timeChanged();

    // Connected with TEXT
    void updateText();
    void newText();
    void setNewText();


    void clearTextInput();

    // Time
    void roundStarted();
    void roundEnded();

    void speedChanged();




private:
    // m - member

    int m_averageSpeed;
    int m_rightSigns;
    int m_allSigns;

    Text* pointerToText;
    Time* pointerToTime;

};

#endif // PROGRAMENGINE_H
