#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QDebug>

#include <programengine.h>
#include <table.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    QQmlContext *context = engine.rootContext();


    programEngine new_programEngine; //main class
    //For qml files understanding c++
    context->setContextProperty("engine", &new_programEngine);
    context->setContextProperty("table", new_programEngine.getTablePointer());

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}

