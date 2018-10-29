#ifndef SIMULATION_H
#define SIMULATION_H

#include <QObject>

class Simulation : public QObject
{
    Q_OBJECT
public:
    explicit Simulation(QObject *parent = nullptr);

    Q_INVOKABLE int kph(qreal value) const;
};

#endif // SIMULATION_H
