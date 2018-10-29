#include "backend_plugin_plugin.h"
#include "backendplugin.h"

#include <qqml.h>

static QObject *backendProvider(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)

    BackendPlugin *backend = new BackendPlugin();
    return backend;
}

void Backend_PluginPlugin::registerTypes(const char *uri)
{
    // @uri qt.io.qmlcomponents
    qmlRegisterSingletonType<BackendPlugin>(uri, 42, 0, "BackendPlugin", backendProvider);
}

