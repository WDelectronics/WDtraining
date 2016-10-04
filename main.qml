import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Gym Workout Log")

    Component.onCompleted: {
        loginForm.pathTextField.text = sqlManager.filePath
    }

//    Connections{
//        target: sqlManager
//        onDatabaseLoadedSucessfully:
//    }

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Login{
        id: loginForm
        }

        CalenderClass{

        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        TabButton {
            text: qsTr("First")
        }
        TabButton {
            text: qsTr("Second")
        }
    }
}
