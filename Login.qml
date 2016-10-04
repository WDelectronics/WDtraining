import QtQuick 2.4

LoginForm {

    profilesComboBox.model: sqlManager.profiles
    newProfileButton.onPressed: sqlManager.addProfile(newProfileTextField.displayText)
    loadProfileButton.onPressed: sqlManager.loadProfile(profilesComboBox.currentIndex)
    setPathButton.onPressed: sqlManager.setPath(pathTextField.displayText)
}
