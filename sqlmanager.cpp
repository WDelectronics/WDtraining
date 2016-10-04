#include <QDir>
#include "sqlmanager.h"
#include <QDebug>
#include <QSettings>

SQLManager::SQLManager()
{
    loadSettings();
    updateProfileList();
}

void SQLManager::addProfile(QString name)
{
    if (!QDir(m_filePath).exists())
    {
        QDir().mkpath(m_filePath);
    }
    openDatabase(name);
}

void SQLManager::loadProfile(int index)
{
    if ((index < 0) || (m_profiles.length() < index))
    {
        return;
    }
    openDatabase(m_profiles.at(index));
}

void SQLManager::setPath(QString path)
{
    setFilePath(path);
    updateProfileList();
}

void SQLManager::openDatabase(QString userName)
{
    fullDatabasePath = m_filePath + "\\" + userName;
    sqlDatabase = QSqlDatabase::addDatabase("QSQLITE");
    sqlDatabase.setDatabaseName(fullDatabasePath);
    if (sqlDatabase.open())
    {
        emit databaseLoadedSucessfully();
        qDebug() << "Sucess opening database from " << fullDatabasePath;
    }
    sqlDatabase.close();
}

void SQLManager::updateProfileList()
{
    QStringList filter("*.db3");
    QDir directory(m_filePath);
    QStringList profiles = directory.entryList(filter,QDir::Files);
    setProfiles(profiles);
}

void SQLManager::loadSettings()
{
    QString file;
    QString lastUsed;
    QSettings settings("WD Electronics", "WDtraining");
    settings.beginGroup("Profiles");
    file = settings.value("filePath").toString();
    lastUsed = settings.value("lastUsedProfile").toString();
    settings.endGroup();

    if (file.isEmpty())
    {
        setFilePath(QDir::currentPath());
    }
    else
    {
        setFilePath(file);
    }
}

void SQLManager::saveSettings()
{

}

QStringList SQLManager::profiles() const
{
    return m_profiles;
}

QString SQLManager::filePath() const
{
    return m_filePath;
}

QString SQLManager::lastUsedProfile() const
{
    return m_lastUsedProfile;
}

void SQLManager::setProfiles(QStringList profiles)
{
    if (m_profiles == profiles)
        return;

    m_profiles = profiles;
    emit profilesChanged(profiles);
}

void SQLManager::setFilePath(QString filePath)
{
    if (m_filePath == filePath)
        return;

    m_filePath = filePath;
    emit filePathChanged(filePath);
    updateProfileList();
}

void SQLManager::setLastUsedProfile(QString lastUsedProfile)
{
    if (m_lastUsedProfile == lastUsedProfile)
        return;

    m_lastUsedProfile = lastUsedProfile;
    emit lastUsedProfileChanged(lastUsedProfile);
}
