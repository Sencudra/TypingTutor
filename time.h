#ifndef TIME_H
#define TIME_H

#include <QTime>
#include <QTimer>
#include <QDebug>

class Time : public QObject
{
    Q_OBJECT
public:
    Time();
    void start_Timer();
    void stop_Timer();

    QString getTime(){return m_secs;}


public slots:
    void update_Timer();  // For timer

signals:
    void changedTime();


private:

    QString m_secs;    //Qml string
    QTimer* m_timer;   //Timer

    QTime m_gui_time;      // For gui
    QTime m_round_time;     // Main data

};



#endif // TIME_H
