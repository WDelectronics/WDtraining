import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.0
import QtQuick.Dialogs 1.2

Dialog {
    id: dialogAddExcercise
    visible: false
    title: "Add Training"
    contentItem: Pane{
        focus: true
        implicitHeight: 300
        implicitWidth: 300

        ColumnLayout{
            anchors.fill: parent
            RowLayout{
            Label{
                text: "Excercise: "
            }
            ComboBox{
                id: typeExcercise
                Layout.fillWidth: true
                model: ["Flat Bench", "Incline", "Butterfly"]
            }
        }
            RowLayout{
                Label{
                    text: "Weight: "
                }
                TextField{
                    id: textFieldWeight
                    Layout.fillWidth: true
                    inputMethodHints: Qt.ImhDigitsOnly
                }
            }
                RowLayout{
                    Label{
                        text: "Sets: "
                    }
                    TextField{
                        id: textFieldSets
                        Layout.fillWidth: true
                        inputMethodHints: Qt.ImhDigitsOnly
                    }
                }
                RowLayout{
                    Button{
                        id: buttonFinish
                        text: "Finish"
                        Layout.fillWidth: true
                        onClicked: dialogAddExcercise.visible = false
                    }
                    Button{
                        id: buttonAddNewExcercise
                        text: "Add New"
                        Layout.fillWidth: true
                    }
                }
            }
        }

    }
