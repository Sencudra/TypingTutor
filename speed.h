#ifndef SPEED_H
#define SPEED_H

#include <QObject>
#include "time.h"

class Speed : public QObject
{
    Q_OBJECT
public:
    explicit Speed(QObject *parent = 0);

    void setPointerForTime(Time* pointer){pointerToTime = pointer;}

    void updateSpeed();

    int getCurrentSpeed(){return m_currentSpeed;}
    int getAverageSpeed(){return m_averageSpeed;}

private:
    int setCurrentSpeed();
    int setAverageSpeed();

private:
    Time* pointerToTime;

    int m_currentSpeed;
    int m_averageSpeed;
    int m_rightSigns;
    int m_allSigns;
};

#endif // SPEED_H
