#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <programengine.h>
#include <table.h>
#include <QDebug>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    QQmlContext *context = engine.rootContext();
    //context->setContextProperty("color","red");
    programEngine new_programEngine; // Пользовательский тип
    context->setContextProperty("engine", &new_programEngine);
    Table new_table_model;
    context->setContextProperty("table", &new_table_model);
    qDebug() << "OK";



    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));





    return app.exec();
}

