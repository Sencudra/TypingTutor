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
    QString getChar(){return m_charForQml;}

    int updateChar();
    int updateText();                   // Update text for qml file during the round
    void newText(){getTextFromBase();}  // New Text generator

private:
    int getTextFromBase(); // +100 karma
    Textqueue* updateWord(Textqueue* word);
    void updateWord();

private:
    Textqueue* m_current_word;

    QString m_charForQml;
    QString m_textForQml;
    QString m_wordForQml; // '\0' if END
};

#endif // TEXT_H
