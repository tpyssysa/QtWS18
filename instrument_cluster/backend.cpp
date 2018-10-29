#include <QtMath>
#include "backend.h"
#include <QtDebug>

Backend::Backend(QObject *parent)
    : QObject(parent)
    , m_gear(0)
    , m_airCond(false)
{
}

int Backend::kph(qreal value) const
{
    return qFloor(value) * 1;
}
