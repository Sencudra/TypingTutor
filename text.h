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

    int updateText();
    void newText(){getTextFromBase();}

private:
    int getTextFromBase();
    Textqueue* updateWord(Textqueue* word);
    void updateWord();

private:
    Textqueue* m_current_word;

    QString m_textForQml;
    QString m_wordForQml; // '\0' if END
};

#endif // TEXT_H
