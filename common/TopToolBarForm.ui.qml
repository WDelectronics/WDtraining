import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0

ToolBar {
    id: titleToolBar
    property alias text: titleLabel.text
    RowLayout {
        focus: false
        spacing: 6
        anchors.fill: parent
        Label {
            id: titleLabel
            text: "WD Training"
            leftPadding: 16
            Layout.fillWidth: true
            elide: Label.ElideRight
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
            color: "white"
        }
        ToolButton {
            focusPolicy: Qt.NoFocus
            Image {
                id: buttonImage
                anchors.centerIn: parent
            }

        }
    }
}
