import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.0

import "common"
import "Menus"
import "Dialogs"

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
        //login.pathTextField.text = sqlManager.filePath
        toast.start("Welcome to WD Training", 1000) //Toast pac!!
    }

//    Connections{
//        target: sqlManager
//        onDatabaseLoadedSucessfully:
//    }


    StackView{
        id: stackViewRoot
        anchors.fill: parent
        initialItem: componentLogin

        Component{
            id: componentLogin
            Login{
                id: logIn
                loadProfileButton.onPressed: stackViewRoot.push(startMenu)
                newProfileButton.onPressed: addWork.visible = true
            }
        }
        Component{
            id: startMenu
            StartMenu{
                buttonNewWorkout.onPressed:{
                    stackViewRoot.push(workout)

                }
            }
        }
        Component{
            id: workout
            WorkoutList{
            id: worklist


            }
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
                    stackViewRoot.push(workout)
                }
    }

    PopupToast{
        id:toast
        onAboutToHide:{
            stackViewRoot.focus = true
        }
    }

    function resetFocus() {
            stackViewRoot.focus = true
        }


        AddWorkoutDialog{
            id: addWork
            visible: false
        }


}
