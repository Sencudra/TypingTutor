#ifndef PROGRAMENGINE_H
#define PROGRAMENGINE_H

#include <QObject>
#include <QDebug>
#include <QTime>
#include <QTimer>

#include "time.h"


struct Textqueue  // queue
{
    QString word;
    Textqueue* next;
};

class programEngine : public QObject  // engine`s class
{
    Q_OBJECT

    Q_PROPERTY(QString secsInfo READ getTime NOTIFY timeChanged)   // time management
    Q_PROPERTY(QString startText READ getTextFromBase NOTIFY textChanged)   //first assigment of the text
    Q_PROPERTY(QString currentText READ updateText NOTIFY wordChanged)  // text update
    Q_PROPERTY(int speed READ getSpeed NOTIFY speedChanged) // speedChanged

public:
    explicit programEngine(QObject *parent = 0);

    Q_INVOKABLE int startRound();
    Q_INVOKABLE void stopRound();

    Q_INVOKABLE bool isRight(QString text); // Input text verifying

private:
    //Text
    QString getTextFromBase(); //On the start

    Textqueue* updateWord(Textqueue *word);
    QString updateText();
    int getSpeed();

    QString getTime(){
        return pointerToTime->getTime();
    }

public slots:
    // Time

    void Timer();


signals:

    // Text
    void timeChanged();
    void textChanged();
    void wordChanged();
    void clearTextInput();

    // Time
    void roundStarted();
    void roundEnded();

    void speedChanged();




private:
    // m - member
    // Text
    Textqueue* m_current_word;

    //QTime
    QString m_secs;    //Qml string
    QTimer* m_timer;   //Timer

    QTime m_gui_time;      // For gui
    QTime m_round_time;     // Main data

    int m_averageSpeed;
    int m_rightSigns;
    int m_allSigns;

    Time* pointerToTime;

};







#endif // PROGRAMENGINE_H
