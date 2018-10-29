#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>

class Backend : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int gear MEMBER m_gear NOTIFY gearChanged)
    Q_PROPERTY(bool airCond MEMBER m_airCond NOTIFY airCondChanged)

public:
    explicit Backend(QObject *parent = nullptr);

    Q_SIGNAL void gearChanged();
    Q_SIGNAL void airCondChanged();

    Q_INVOKABLE int kph(qreal value) const;

private:
    int m_gear;
    bool m_airCond;
};

#endif // BACKEND_H
