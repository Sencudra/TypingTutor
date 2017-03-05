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

    int getTimeElapsed(){return m_timeElapsed;}

    QString getTime(){return m_secs;}


private slots:
    void update_Timer();  // For timer

signals:
    void changedTime();


private:
    int m_timeElapsed;

    QString m_secs;    //Qml string
    QTimer* m_timer;   //Timer

    QTime m_gui_time;      // For gui
    QTime m_round_time;     // Main data

};



#endif // TIME_H
