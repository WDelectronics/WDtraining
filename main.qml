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

    property bool tabBarIsFixed: false
//    header: TopTabBar{


//    }
    header:  titleBar

    Loader {
            id: titleBar
            //visible: !isLandscape
            //active: !isLandscape
            source: "qrc:/common/TopTabBar.qml"
            onLoaded: {
                if(item) {
                    item.currentIndex = swipeView.currentIndex
                    item.text = qsTr("HowTo move from A to B")
                }
            }
        }

    property var tabButtonModel: [{"name": "Login"},
                                 {"name": "Get Ready"},
                                 {"name": "Training"},
                                 {"name": "Lift O´Clock!"},
                                 {"name": "Progress"}]

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: 0
        focus: true

        anchors.topMargin: isLandscape? 6 : 0
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        onCurrentIndexChanged: {
            titleBar.item.currentIndex = currentIndex
        }

        Loader{
            id: login
            active: true
            source: "qrc:/Login.qml"
           onLoaded: item.init()
        }

        Loader{
            id:calender
            active: true
            source: "qrc:/CalenderClass.qml"
            onLoaded: item.init()
        }
    }





    FloatingActionButton{
        id: fab
        z: 1
        visible: true
        anchors.margins: 16
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        imageSource: "qrc:/icon/Resources/android/drawable-mdpi/ic_fitness_center_black_24dp.png"
        backgroundColor: "blue"

        onClicked: {
                    toast.start("Take the 130 on a ride mathafacka!!", 2000)
                }
    }

    PopupToast{
        id:toast
        onAboutToHide:{
            swipeView.focus = true
        }
    }


}
