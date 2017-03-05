#include "speed.h"


Speed::Speed(QObject *parent) : QObject(parent)
{
    m_rightSigns = 0;
    m_averageSpeed = 0;
    //emit speedChanged();
}

void Speed::updateSpeed(){

    qDebug() << "Speed updated:";
    setAverageSpeed();
    setCurrentSpeed();

}

int Speed::setCurrentSpeed(){
//   float a = (m_round_time.elapsed())/1000.0;

//    if( a != 0){
//        float t = m_rightSigns/a;
//        qDebug() << t;
//        a = int(t*60.0);
//        return a;
//    }
//    else
        return 0;
}

int Speed::setAverageSpeed(){


    return 0;
}
