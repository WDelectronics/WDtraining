import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.0
import QtQuick.Dialogs 1.2

Popup {
    id: dialogAddExcercise
    visible: false
    x: (parent.width - width) / 2
    y: (parent.height - height) / 2
    implicitHeight: 150
    implicitWidth: 300

    contentItem: Pane{
        focus: true

        ColumnLayout{
            anchors.fill: parent
            RowLayout{
                Label{
                    text: qsTr("Muscle groupe: ")
                }
                ComboBox{
                    id: comboBoxMuscleGroup
                    Layout.fillWidth: true
                    model: ["Chest", "Back", "Legs"]
                }
            }

            Button{
                id: buttonOk
                text: qsTr("OK")
                Layout.fillWidth: true
            }
        }

   }
}
