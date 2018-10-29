#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "simulation.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.addImportPath("qrc:/ClusterTutorial/assets/");
    engine.addImportPath("qrc:/ClusterTutorial/backend/");
    engine.addImportPath("qrc:/ClusterTutorial/imports/");
    Simulation simulation;
    engine.rootContext()->setContextProperty("simulation", &simulation);

    engine.load(QUrl(QStringLiteral("qrc:/ClusterTutorial/ClusterTutorial.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
