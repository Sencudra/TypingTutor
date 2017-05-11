#include "time.h"



Time::Time(QObject *parent) : QObject(parent)
{
    m_timer = new QTimer();
    m_pre_timer = new QTimer();
    m_gui_time = QTime(0,0);
    m_secs = m_gui_time.toString("mm:ss");

    //emit timeChanged();

    connect(m_timer,SIGNAL(timeout()),this,SLOT(update_Timer()));
    connect(m_pre_timer,SIGNAL(timeout()),this,SLOT(update_Pre_Timer()));
}

void Time::pre_start_Round(int secs)
{
    m_pre_timer->start(1000);

    //Time initialization
    m_gui_time = QTime(0,0,secs);
    m_secs = m_gui_time.toString("-mm:ss");

    emit changedTime();
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
    m_int_time = a;
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

void Time::update_Pre_Timer()
{
    if (QTime(0,0,1) == m_gui_time)
    {
        m_pre_timer->stop();
        this->start_Timer();
        emit TimeIsOut();
    }
    else
    {
        if(QTime(0,0,6) == m_gui_time)
        {
            emit showText();
        }
        m_gui_time = m_gui_time.addMSecs(-1000);
        m_secs = m_gui_time.toString("-mm:ss");
        emit changedTime();
    }
}


