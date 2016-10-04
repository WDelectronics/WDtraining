#ifndef SQLMANAGER_H
#define SQLMANAGER_H

#include <QObject>
#include <QSqlDatabase>
class SQLManager : public QObject
{   
    Q_PROPERTY(QStringList profiles READ profiles WRITE setProfiles NOTIFY profilesChanged)
    Q_PROPERTY(QString filePath READ filePath WRITE setFilePath NOTIFY filePathChanged)
    Q_PROPERTY(QString lastUsedProfile READ lastUsedProfile WRITE setLastUsedProfile NOTIFY lastUsedProfileChanged)

    Q_OBJECT
public:
    explicit SQLManager();
    Q_INVOKABLE void addProfile(QString name);
    Q_INVOKABLE void loadProfile(int index);
    Q_INVOKABLE void setPath(QString path);
    Q_INVOKABLE void updateProfileList();
    QStringList profiles() const;
    QString filePath() const;
    QString lastUsedProfile() const;


signals:
    void profilesChanged(QStringList profiles);
    void filePathChanged(QString filePath);
    void lastUsedProfileChanged(QString lastUsedProfile);
    void databaseLoadedSucessfully();

public slots:

    void setProfiles(QStringList profiles);

    void setFilePath(QString filePath);

    void setLastUsedProfile(QString lastUsedProfile);


private:
    void openDatabase(QString userName);

    void loadSettings();
    void saveSettings();

    QSqlDatabase sqlDatabase;
    QStringList m_profiles;
    QString m_filePath;
    QString m_lastUsedProfile;
    QString fullDatabasePath;
};

#endif // SQLMANAGER_H
