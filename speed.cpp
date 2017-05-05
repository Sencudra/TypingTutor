#include "speed.h"


Speed::Speed(QObject *parent) : QObject(parent)
{
    setUp();
    //emit speedChanged();
}

void Speed::setUp(){
    m_rightSigns = 0;
    m_averageSpeed = 0;
    m_currentSpeed = 0;
    m_bufferedSigns = 0;
    m_allSigns = 0;

}

void Speed::updateSpeed(){

    //qDebug() << "Speed updated:";
    setAverageSpeed();
    setCurrentSpeed();

}

int Speed::setCurrentSpeed(){
    m_currentSpeed = ((m_bufferedSigns + m_allSigns*60)/2);
    m_bufferedSigns = m_currentSpeed;
    m_allSigns = 0;
        return 0;
}

int Speed::setAverageSpeed(){

    float a = (pointerToTime->getTimeElapsed())/1000.0;

    if( a != 0){
        float t = m_rightSigns/a;  // BAG: if a<1 then t multiplied
            //qDebug() << t;
            a = int(t*60.0);
            m_averageSpeed = a;
        }


    return 0;
}
