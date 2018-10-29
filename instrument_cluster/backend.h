#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>

class Backend : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int gear MEMBER m_gear NOTIFY gearChanged)
    Q_PROPERTY(bool airCond MEMBER m_airCond NOTIFY airCondChanged)
    Q_PROPERTY(bool parkingBreak MEMBER m_parkingBreak NOTIFY parkingBreakChanged)
    Q_PROPERTY(bool seatbelt MEMBER m_seatbelt NOTIFY seatbeltChanged)
    Q_PROPERTY(bool lights MEMBER m_lights NOTIFY lightsChanged)
    Q_PROPERTY(bool abs MEMBER m_abs NOTIFY absChanged)

public:
    explicit Backend(QObject *parent = nullptr);

    Q_SIGNAL void gearChanged();
    Q_SIGNAL void airCondChanged();
    Q_SIGNAL void parkingBreakChanged();
    Q_SIGNAL void seatbeltChanged();
    Q_SIGNAL void lightsChanged();
    Q_SIGNAL void absChanged();

    Q_INVOKABLE int kph(qreal value) const;

private:
    int m_gear;
    bool m_airCond;
    bool m_parkingBreak;
    bool m_seatbelt;
    bool m_lights;
    bool m_abs;
};

#endif // BACKEND_H
