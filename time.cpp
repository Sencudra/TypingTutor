#include "time.h"



Time::Time(QObject *parent) : QObject(parent)
{
    m_timer = new QTimer();
    m_gui_time = QTime(0,0);
    m_secs = m_gui_time.toString("mm:ss");

    //emit timeChanged();

    connect(m_timer,SIGNAL(timeout()),this,SLOT(update_Timer()));
}

void Time::start_Timer(){

    m_timer->start(1000);

    //Time initialization
    m_gui_time = QTime(0,0);
    m_secs = m_gui_time.toString("mm:ss");

    emit changedTime();

    m_round_time = QTime(0,0);
    m_round_time.start();
}

void Time::stop_Timer()
{
    // Miliseconds counting
    int a = m_round_time.elapsed();

    m_gui_time = QTime(0,0);
    m_gui_time = m_gui_time.addMSecs(a);

    m_timer->stop();

    m_secs = m_gui_time.toString("mm:ss.zzz");


    emit changedTime();


}

void Time::update_Timer()
{
    m_timeElapsed = m_round_time.elapsed();
    m_gui_time = m_gui_time.addMSecs(1000);
    m_secs = m_gui_time.toString("mm:ss");


    emit changedTime();
}
