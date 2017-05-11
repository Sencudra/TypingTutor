#include "table.h"
#include <QDebug>
#include <QTime>



int partition(std::vector<Data*>& A, int p,int q)
{
    int x = A[p]->speed;
    int i=p;
    int j;

    for(j = p+1; j<q; j++)
    {
        if(A[j]->speed <= x)
        {
            i=i+1;
            Data temp = *A[i];
            *A[i] = *A[j];
            *A[j] = temp;
        }
    }

    Data temp = *A[i];
    *A[i] = *A[p];
    *A[p] = temp;

    return i;
}

void quickSort(std::vector<Data*>& A, int p,int q)
{
    int r;
    if(p<q)
    {
        r=partition(A, p,q);
        quickSort(A,p,r);
        quickSort(A,r+1,q);
    }
}


QString returnMode(int x)
{
    switch(x){
        case 0:     return "Обычный";
        case 1:     return "Хардкор";
        case 2:     return "Бесконечный";
        default:    return "Без Режима";
    }
}

Table::Table(QObject *parent):QAbstractListModel(parent)
{
    updateTable();
}

bool Table::updateTable()
{
    if(!dataBase.empty()){
        dataBase.clear();
        m_data.clear();
    }

    std::ifstream fin;
    fin.open("C:\\Users\\Vlad\\Desktop\\STATTYPINGTUTOR.txt");
    if(!fin)
        std::cout << "Cannot open file.\n";

    std::string name1;
    int time1;
    int speed1;
    int mist1;
    std::string date1;
    int mode1;

    while(fin >> name1 >> time1 >> speed1 >> mist1 >> date1 >> mode1) {
            Data* new_data = new Data();

            new_data->name = QString::fromStdString(name1);
            QTime my_time(0,0);
            my_time = my_time.addMSecs(time1);
            new_data->time = my_time.toString("mm:ss.zzz");
            new_data->speed = speed1;
            new_data->mistakes = mist1;
            new_data->date = QString::fromStdString(date1);
            new_data->mode = returnMode(mode1);
            dataBase.push_back(new_data);

            //std::cout << name1 << " "<< time1<<" " << speed1<<" " << mist1<<" "<< date1 << " " << std::endl;
    }
    fin.close();
    for(Data* x : dataBase)
        m_data.append("beatch");

    if(dataBase.size() > 0)
        quickSort(dataBase,0,dataBase.size());

    std::reverse(dataBase.begin(),dataBase.end());

    return true;
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
    case mode:
        return QVariant(dataBase[index.row()]->mode);
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
    roles[mode] = "mode";
    return roles;
}


// Unused
void Table::add()
{
    beginInsertRows(QModelIndex(), m_data.size(), m_data.size());
    m_data.append("newbeach");
    endInsertRows();

    m_data[0] = QString("Size: %1").arg(m_data.size());
    QModelIndex index = createIndex(0, 0, static_cast<void *>(0));
    emit dataChanged(index, index);
}
