import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.0

import "../Dialogs"

Pane {
    id: swipeViewWorkout
    property double sizeMultiplier: width/380

 ListView{
     id: listView
     y: 0
     height: 160
     anchors.fill: parent

     delegate:
         Button{
         width: parent.width-10
         x: 5
         height: 50 * sizeMultiplier
         anchors.margins: 10
         contentItem: Text {
                text: title + "\n" + subtitle
                opacity: enabled ? 1.0 : 0.3
                color: Material.color(Material.Blue)
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
         onClicked: console.log("Add data or remove")
        }
     model: ListModel{
         id: listModelMenu
         ListElement{
             title: "Create Training"
             subtitle: "You have to start?"
         }
         ListElement{
             title: "Progress"
             subtitle: "Maybe you where a mean machine?"
         }
         ListElement{
             title: "Beast Mode"
             subtitle: "Let me make you a training routing, based on past progress?"
         }
         ListElement{
             title: "Settings!"
             subtitle: "Maybe you fucked up?"
         }
     }
}

 SelectExcerciseDialog{
     id: selectExcercise
     visible: false
     //Component.onCompleted: visible = true
     //buttonOk.onPressed:
 }


}
