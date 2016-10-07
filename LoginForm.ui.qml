import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.0


Flickable{
    property alias profilesComboBox: profilesComboBox
    property alias loadProfileButton: loadProfileButton
    property alias pathTextField: pathTextField
    property alias newProfileTextField: newProfileTextField
    property alias newProfileButton: newProfileButton
    property alias setPathButton: setPathButton
    contentHeight: loginPane.implicitHeight

    Pane{
        id: loginPane
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.fill: parent

        ColumnLayout {
            anchors.fill: parent

            Image {
                id: imageWelcome
                fillMode: Image.PreserveAspectFit
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.preferredHeight: 191
                Layout.preferredWidth: 348
                source: "qrc:/welcome/Resources/Welcome pic.jpeg"
            }

            Label {
                id: label1
                text: qsTr("Login")
                font.strikeout: false
                font.pointSize: 20
                font.bold: true
                font.family: "Arial"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.preferredHeight: 38
                Layout.preferredWidth: 349
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            RowLayout {
                Layout.preferredHeight: 50
                Layout.preferredWidth: 349
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                ComboBox {
                    id: profilesComboBox
                    Layout.preferredHeight: 40
                    Layout.preferredWidth: 185
                }

                Button {
                    id: loadProfileButton
                    text: qsTr("Load Profile")
                    Layout.preferredHeight: 50
                    Layout.preferredWidth: 147
                }
            }

            RowLayout {
                Layout.preferredWidth: 349
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                TextField {
                    id: newProfileTextField
                    text: qsTr("Text Field")
                    Layout.preferredHeight: 40
                    Layout.preferredWidth: 185
                }

                Button {
                    id: newProfileButton
                    text: qsTr("New Profile")
                    Layout.preferredHeight: 50
                    Layout.preferredWidth: 147
                }
            }

            RowLayout {
                Layout.preferredWidth: 349
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                TextField {
                    id: pathTextField
                    text: qsTr("Text Field")
                    Layout.preferredHeight: 40
                    Layout.preferredWidth: 185
                }

                Button {
                    id: setPathButton
                    text: qsTr("Set Path")
                    Layout.preferredHeight: 50
                    Layout.preferredWidth: 147
                }
            }
        }

    }
}
