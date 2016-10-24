import QtQuick 2.7
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQml.Models 2.2


Page{
    id: paneAddSet


    ColumnLayout{
        id:columLayout
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.bottomMargin: 25
      RowLayout{
          Label{
              id:labelExcerices
              text: qsTr("Muscle Groupe:")
          }
          ComboBox{
              id: comboBoxMuscleGroupe
              Layout.fillWidth: true
              model: ["Bench", "Incline", "Cables"]
          }
      }
      RowLayout{

          Button{
              id: buttonSave
              text: qsTr("Save")
              Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
              Layout.preferredHeight: 65
              Layout.fillWidth: true


          }
          Button{
              id: buttonClear
              text: qsTr("Clear")
              Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
              Layout.preferredHeight: 65
              Layout.fillWidth: true

          }
      }
     }

      ListView{
          id: listviewAdd
          anchors {top: columLayout.bottom; bottom: parent.bottom; right: parent.right; left: parent.left }
          anchors.topMargin: 30
          anchors.leftMargin: 10

          clip: true

          model: trainingModel

          delegate: delegateRepSet

          section.property: "muscleGroup"
          section.delegate: headerDelegate

      }

      Component{
          id: delegateRepSet

          Pane{

              RowLayout{
                  Label{
                      text: rep + " Reps  X"
                      Layout.fillWidth: true
                      Layout.alignment: Qt.AlignHCenter
                  }
                  Label{
                      text: weight + "kg"
                      Layout.fillWidth: true
                      Layout.alignment: Qt.AlignHCenter
                  }
              }
          }
      }

      Component{
          id: headerDelegate
          Label{
              height: 20
              font.pixelSize: 25
              text: section

          }
      }

      ListModel{
          id: trainingModel

          ListElement{ rep: "10"; weight: "100"; muscleGroup: "Flatt Chest"}
          ListElement{ rep: "20"; weight: "100"; muscleGroup: "Incline Chest"}
          ListElement{ rep: "10"; weight: "100"; muscleGroup: "Chest"}
          ListElement{ rep: "20"; weight: "100"; muscleGroup: "Chest"}
          ListElement{ rep: "20"; weight: "100"; muscleGroup: "Back"}
          ListElement{ rep: "10"; weight: "100"; muscleGroup: "Back"}
          ListElement{ rep: "20"; weight: "100"; muscleGroup: "Back"}
          ListElement{ rep: "20"; weight: "100"; muscleGroup: "Leg"}
          ListElement{ rep: "20"; weight: "100"; muscleGroup: "Leg"}
          ListElement{ rep: "10"; weight: "100"; muscleGroup: "Leg"}
          ListElement{ rep: "20"; weight: "100"; muscleGroup: "Leg"}



      }



}
