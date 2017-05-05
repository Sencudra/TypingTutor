#ifndef TIME_H
#define TIME_H

#include <QTime>
#include <QTimer>
#include <QDebug>

class Time : public QObject
{
    Q_OBJECT
public:
    explicit Time(QObject *parent = 0);

    void start_Timer();
    void stop_Timer();
    void pre_start_Round(int secs);

    int getTimeElapsed(){return m_timeElapsed;}

    QString getTime(){return m_secs;}
    int getQTime(){return m_int_time;}


private slots:
    void update_Timer();  // For timer
    void update_Pre_Timer();

signals:
    void changedTime();
    void TimeIsOut();
    void showText();

private:
    int m_timeElapsed;

    QString m_secs;    //Qml string

    QTimer* m_timer;   //Timer
    QTimer* m_pre_timer;   //PreTimer

    int m_int_time;
    QTime m_gui_time;      // For gui
    QTime m_round_time;     // Main data

};



#endif // TIME_H
