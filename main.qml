import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.0

import "common"

ApplicationWindow {
    id: root
    visible: true
    width: 640
    height: 480
    title: qsTr("Gym Workout Log")
    Material.theme: Material.Dark
    Material.accent: Material.Orange
    Material.primary: Material.DeepOrange
    Material.foreground: Material.Blue
    property bool isLandscape: width > height

    Component.onCompleted: {
        loginForm.pathTextField.text = sqlManager.filePath
        toast.start("Welcome to WD Training", 1000) //Toast pac!!
    }

//    Connections{
//        target: sqlManager
//        onDatabaseLoadedSucessfully:
//    }

    header: TopToolBar{

    }

    SwipeView {
        id: swipeView
        anchors.fill: parent
        //currentIndex: tabBar.currentIndex

        Login{
        id: loginForm
        }

        CalenderClass{

        }
    }

    PopupToast{
        id:toast
        onAboutToHide:{
            swipeView.focus = true
        }
    }

//    footer: TabBar {
//        id: tabBar
//        currentIndex: swipeView.currentIndex
//        TabButton {
//            text: qsTr("First")
//        }
//        TabButton {
//            text: qsTr("Second")
//        }
//    }
}
