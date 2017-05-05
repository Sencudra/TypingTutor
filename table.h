#include <QAbstractListModel>
#include <QStringList>

#include <iostream>
#include <fstream>
#include <vector>

#ifndef TABLE_H
#define TABLE_H


struct Data{
  QString name;
  QString time;
  int speed;
  int mistakes;
  QString date;
  QString mode;
};


class Table : public QAbstractListModel
{
    Q_OBJECT
public:
    enum Roles {
        name = Qt::UserRole + 1,
        time,
        speed,
        mistakes,
        date,
        mode
    };

    Table(QObject* parent = 0);
    bool updateTable();

    virtual int rowCount(const QModelIndex &parent) const;
    //virtual int columnCount(const QModelIndex& parent) const;
    virtual QVariant data(const QModelIndex &index, int role) const;

    virtual QHash<int, QByteArray> roleNames() const;

    Q_INVOKABLE void add();
public slots:
    void slot_updateTable(){updateTable();}

private:
    QStringList m_data;
    std::vector<Data*> dataBase;

};

#endif // TABLE_H
