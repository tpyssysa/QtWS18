#include <QtMath>
#include "backendplugin.h"

BackendPlugin::BackendPlugin(QObject *parent)
    : QObject(parent)
    , m_gear(0)
    , m_airCond(false)
{
}

BackendPlugin::~BackendPlugin()
{
}

int BackendPlugin::kph(qreal value) const
{
    return qFloor(value) * 1;
}




