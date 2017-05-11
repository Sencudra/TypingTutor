#ifndef TEXT_H
#define TEXT_H

#include <QObject>

struct TextStruct{
  QString text;
  int langId;

};


struct Textqueue  // queue
{
    QString word;
    Textqueue* next;
};


class Text
{

public:
    explicit Text();

    QString getText(){return m_textForQml;}
    QString getWord(){return m_wordForQml;}
    QChar* getCharPointer(){return m_wordForQml.data();}
    Textqueue* generateTextQueue(QString text);
    void addText();
    int getChar(){return m_charForQml;}
    int getLang(){return m_language;}
    int getTextNumber(){return textNumber;}
    void setMode(int x){ mode = x;}

    void updateChar(QChar* nextchar);
    int updateText();                   // Update text for qml file during the round
    void newText(int x){getTextFromBase(x);}  // New Text generator

private:
    int getTextFromBase(int x); // +100 karma
    Textqueue* updateWord(Textqueue* word);
    void updateWord();
    int getINTforQml();
    void loadBase(); // Loading texts from file

private:
    Textqueue* m_current_word;
    Textqueue* m_last_word;
    int wordNumber;
    int textNumber;

    std::vector<TextStruct*> textDataBase;

    int m_language;
    int mode;

    int m_charForQml;
    QString m_textForQml;
    QString m_wordForQml; // '\0' if END
};

#endif // TEXT_H
