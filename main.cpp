#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "sqlmanager.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    SQLManager sqlManager;

    engine.rootContext()->setContextProperty("sqlManager",&sqlManager);
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
}
