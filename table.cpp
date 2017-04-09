#include "table.h"

Table::Table(QObject *parent):QAbstractListModel(parent)
{
            std::ifstream fin;
            fin.open("C:\\Users\\Vlad\\Desktop\\STATTYPINGTUTOR.txt");
            if(!fin)
                std::cout << "Cannot open file.\n";

            std::string name1;
            int time1;
            int speed1;
            int mist1;
            std::string date1;

            while(fin >> name1 >> time1 >> speed1 >> mist1 >> date1) {
                    Data* new_data = new Data();

                    new_data->name = QString::fromStdString(name1);
                    new_data->time = time1;
                    new_data->speed = speed1;
                    new_data->mistakes = mist1;
                    new_data->date = QString::fromStdString(date1);
                    dataBase.push_back(new_data);

                    std::cout << name1 << " "<< time1<<" " << speed1<<" " << mist1<<" "<< date1 << " " << std::endl;
            }
            fin.close();


            for(Data* x : dataBase)
                m_data.append("beatch");



}

int Table::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid()) {
        return 0;
    }

    return m_data.size();
}

QVariant Table::data(const QModelIndex &index, int role) const
{
    if (!index.isValid()) {
        return QVariant();
    }

    switch (role) {
    case name:
        return QVariant(dataBase[index.row()]->name);
    case time:
        return QVariant(dataBase[index.row()]->time);
    case mistakes:
        return QVariant(dataBase[index.row()]->mistakes);
    case speed:
        return QVariant(dataBase[index.row()]->speed);
    case date:
        return QVariant(dataBase[index.row()]->date);
    default:
        return QVariant("error");
    }
}

QHash<int, QByteArray> Table::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();
    roles[name] = "name";
    roles[time] = "time";
    roles[speed] = "speed";
    roles[mistakes] = "mistakes";
    roles[date] = "date";

    return roles;
}

void Table::add()
{
    beginInsertRows(QModelIndex(), m_data.size(), m_data.size());
    m_data.append("new");
    endInsertRows();

    m_data[0] = QString("Size: %1").arg(m_data.size());
    QModelIndex index = createIndex(0, 0, static_cast<void *>(0));
    emit dataChanged(index, index);
}
