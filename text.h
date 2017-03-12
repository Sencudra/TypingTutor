#ifndef TEXT_H
#define TEXT_H

#include <QObject>

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
    QChar* getCharPointer(){return m_charPointer;}
    int getChar(){return m_charForQml;}

    void updateChar(QChar* nextchar);
    int updateText();                   // Update text for qml file during the round
    void newText(){getTextFromBase();}  // New Text generator

private:
    int getTextFromBase(); // +100 karma
    Textqueue* updateWord(Textqueue* word);
    void updateWord();
    int getINTforQml();

private:
    Textqueue* m_current_word;

    int m_charForQml;
    QString m_textForQml;
    QChar* m_charPointer;
    QString m_wordForQml; // '\0' if END
};

#endif // TEXT_H
