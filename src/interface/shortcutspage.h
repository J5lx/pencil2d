#ifndef SHORTCUTSPAGE_H
#define SHORTCUTSPAGE_H

#include <QWidget>
#include <QModelIndex>
#include <QKeySequence>

class QTreeView;
class QStandardItem;
class QStandardItemModel;
class QLabel;
class QLineEdit;


namespace Ui
{
    class ShortcutsPage;
}

class ShortcutsPage : public QWidget
{
    Q_OBJECT
public:
    explicit ShortcutsPage(QWidget* parent = 0);

signals:

public slots:
    void tableItemClicked(const QModelIndex&);
    void keyCapLineEditTextChanged(QKeySequence);

protected:

private:
    void loadShortcutsFromSetting();

    QStandardItemModel* m_treeModel;
    QStandardItem* m_currentActionItem;
    QStandardItem* m_currentKeySeqItem;

    Ui::ShortcutsPage* ui;
};

#endif // SHORTCUTSPAGE_H
