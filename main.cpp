#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickStyle>
#include "sqlmanager.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    QQuickStyle::setStyle("Material");
    QQmlApplicationEngine engine;

    SQLManager sqlManager;

    engine.rootContext()->setContextProperty("sqlManager",&sqlManager);
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
}
