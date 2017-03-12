#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <programengine.h>
#include <QDebug>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    QQmlContext *context = engine.rootContext();
    context->setContextProperty("color","red");
    programEngine new_programEngine; // Пользовательский тип
    context->setContextProperty("engine", &new_programEngine);
    qDebug() << "OK";


    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));


    return app.exec();
}

