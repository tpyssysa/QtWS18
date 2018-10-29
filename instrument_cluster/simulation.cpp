#include <QtMath>
#include "simulation.h"

Simulation::Simulation(QObject *parent) : QObject(parent)
{

}

int Simulation::kph(qreal value) const
{
    return qFloor(value) * 1;
}
