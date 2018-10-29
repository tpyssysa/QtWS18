#ifndef BACKENDPLUGIN_H
#define BACKENDPLUGIN_H

#include <QObject>

class BackendPlugin : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int gear MEMBER m_gear NOTIFY gearChanged)
    Q_PROPERTY(bool airCond MEMBER m_airCond NOTIFY airCondChanged)
    Q_DISABLE_COPY(BackendPlugin)

public:
    explicit BackendPlugin(QObject *parent = nullptr);

    Q_SIGNAL void gearChanged();
    Q_SIGNAL void airCondChanged();

    Q_INVOKABLE int kph(qreal value) const;

    ~BackendPlugin();

private:
    int m_gear;
    bool m_airCond;
};

#endif // BACKENDPLUGIN_H
