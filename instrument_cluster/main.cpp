#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "backend.h"

static QObject *backendProvider(QQmlEngine *engine, QJSEngine *scriptEngine)
  {
      Q_UNUSED(engine)
      Q_UNUSED(scriptEngine)

      Backend *backend = new Backend();
      return backend;
  }

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    qmlRegisterSingletonType<Backend>("Automotibe.Cluster.Backend", 72, 3, "Backend", backendProvider);

    QQmlApplicationEngine engine;
    engine.addImportPath("qrc:/ClusterTutorial/assets/");
    engine.addImportPath("qrc:/ClusterTutorial/backend/");
    engine.addImportPath("qrc:/ClusterTutorial/imports/");


    engine.load(QUrl(QStringLiteral("qrc:/ClusterTutorial/ClusterTutorial.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
