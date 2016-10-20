import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.0


Flickable {
    id: flickStartMenu
    property alias buttonNewWorkout: buttonNewWorkout
    property alias buttonPastWorkout: buttonPastWorkout
    property alias buttonSettings: buttonSettings
    contentHeight: paneStartMenu.implicitHeight

    Pane{
        id: paneStartMenu
        anchors.fill: parent

        ColumnLayout {
            anchors.rightMargin: 10
            anchors.leftMargin: 10
            anchors.fill: parent

            Button {
                id: buttonNewWorkout
                text: qsTr("New Workout")
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.preferredHeight: 65

            }

            Button {
                id: buttonPastWorkout
                text: qsTr("Past Workout")
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.preferredHeight: 65

            }

            Button {
                id: buttonSettings
                text: qsTr("Settings")
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.preferredHeight: 65

            }
        }

    }
}
